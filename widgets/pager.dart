import 'package:flutter/material.dart';

class VNMPagerView extends StatefulWidget {
  final Widget? preChild;
  final Widget child;
  final Widget? nextChild;

  const VNMPagerView(
      {super.key, this.preChild, this.nextChild, required this.child});

  @override
  State<StatefulWidget> createState() => _VVNMPagerViewState();
}

class _VVNMPagerViewState extends State<VNMPagerView>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final CurvedAnimation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: _duration);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.forward();
    });
  }

  Duration get _duration => Duration(milliseconds: 300);

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double width = MediaQuery.of(context).size.width;
          double dx = animation.value * width;
          return Stack(
            children: [
              if (widget.preChild != null) ...[
                if (animation.value < 0.9)
                  Transform.translate(
                      // offset: Offset(0, 0) + Offset(dx, dx),
                      offset: Offset(0, 0) + Offset(dx, 0),
                      child: widget.preChild),
                Transform.translate(
                    offset: Offset(-width, 0) + Offset(dx, 0),
                    child: widget.child)
              ] else if (widget.nextChild != null) ...[
                if (animation.value < 0.9)
                  Transform.translate(
                      // offset: Offset(0, 0) - Offset(dx, -dx),
                      offset: Offset(0, 0) - Offset(dx, 0),
                      child: widget.nextChild),
                Transform.translate(
                    offset: Offset(width, 0) - Offset(dx, 0),
                    child: widget.child)
              ] else ...[
                widget.child
              ]
            ],
          );
        });
  }
}
