import 'package:flutter/material.dart';

import '../styles/color.dart';
import 'button/gesture_button.dart';
import 'text_view.dart';

class VNMTabPagerView extends StatefulWidget {
  final List<String> tabs;
  final Widget Function(BuildContext context, int index) pageBuilder;
  final Function(int index)? onTabChanged;

  const VNMTabPagerView(
      {super.key,
      required this.tabs,
      required this.pageBuilder,
      this.onTabChanged});

  @override
  State<StatefulWidget> createState() => _VNMTabPagerViewState();
}

class _VNMTabPagerViewState extends State<VNMTabPagerView>
    with TickerProviderStateMixin {
  int selected = 0;
  int preSelected = -1;
  late final AnimationController controller;
  late final Animation animation;
  late final PageController pageController;

  Curve get curve => Curves.ease;

  Duration get duration => Duration(milliseconds: 300);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    controller = AnimationController(vsync: this, duration: duration);
    animation = CurvedAnimation(parent: controller, curve: curve);
    controller.value = 1;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: VNMColor.white(),
          child: Row(
            children: List.generate(widget.tabs.length, _buildTabItem),
          ),
        ),
        AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              double padding = 16;
              double device = MediaQuery.of(context).size.width;
              double tabWith = device / widget.tabs.length;
              double lineWith = tabWith - padding * 2;
              double x = tabWith * preSelected;
              x += (selected - preSelected) * animation.value * tabWith;
              x += padding;
              return CustomPaint(
                size: Size.fromHeight(2),
                painter: _TabLinePainter(x: x, width: lineWith, height: 2),
              );
            }),
        Expanded(
            child: PageView.builder(
                controller: pageController,
                itemCount: widget.tabs.length,
                itemBuilder: widget.pageBuilder))
      ],
    );
  }

  Widget _buildTabItem(int index) {
    return Expanded(
        child: VNMGestureButton(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double primary = 0;
          double secondary = 1;
          if (index == preSelected) {
            primary = 1.0 - animation.value;
            secondary = animation.value;
          } else if (index == selected) {
            primary = animation.value;
            secondary = 1.0 - animation.value;
          }
          return Container(
            alignment: Alignment.center,
            height: 48,
            child: Stack(
              children: [
                Opacity(
                  opacity: secondary,
                  child: VNMText.subTitle(widget.tabs[index]),
                ),
                Opacity(
                  opacity: primary,
                  child: VNMText.sBold14(widget.tabs[index]),
                )
              ],
            ),
          );
        },
      ),
      onPressed: () {
        if (controller.isAnimating) return;
        if (index == selected) return;
        preSelected = selected;
        selected = index;
        controller.forward(from: 0);
        pageController.animateToPage(selected,
            duration: duration, curve: curve);
        if (widget.onTabChanged != null) widget.onTabChanged!(selected);
      },
    ));
  }
}

class _TabLinePainter extends CustomPainter {
  final double x;
  final double width;
  final double height;

  _TabLinePainter({required this.x, required this.width, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = VNMColor.primary()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = height;
    final Path path = Path();
    path.moveTo(x, height / 2.0);
    path.lineTo(x + width, height / 2.0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TabLinePainter oldDelegate) {
    return x != oldDelegate.x;
  }
}
