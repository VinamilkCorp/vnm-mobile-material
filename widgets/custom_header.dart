import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinamilk_b2b/vnm/core/notifiers.dart';
import 'package:vinamilk_b2b/vnm/extension/change_notifier.dart';
import 'package:vinamilk_b2b/vnm/material/styles/color.dart';
import 'package:vinamilk_b2b/vnm/material/widgets/scaffold.dart';

class CustomHeaderView extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final List<Widget> Function() childrenBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  const CustomHeaderView(
      {super.key,
      this.appBar,
      required this.childrenBuilder,
      this.separatorBuilder});

  @override
  State<StatefulWidget> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeaderView> {
  final TickNotifier _tick = TickNotifier();
  final DoubleNotifier _bounce = DoubleNotifier();
  final ScrollController scroller = ScrollController();
  Offset offsetSticky = Offset(58.9, 115.0);
  Size sizeSticky = Size(393.0, 93.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bounce.value = 0;
    scroller.addListener(() {
      if (mounted) _bounce.setValue(-scroller.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        _tick.create<TickNotifier>(),
        _bounce.create<DoubleNotifier>(),
      ],
      builder: (context, child) {
        return Container(
          color: VNMColor.background(),
          child: Stack(
            children: [
              Consumer<DoubleNotifier>(builder: (context, bounce, _) {
                return CustomPaint(
                  size: Size(double.infinity, double.infinity),
                  painter: _HeaderCustomPainter(
                      offset: offsetSticky,
                      boxSize: sizeSticky,
                      bounce: bounce.value),
                );
              }),
              VNMScaffold(
                  backgroundColor: Colors.transparent,
                  appBar: widget.appBar,
                  body: LayoutBuilder(builder: (context, box) {
                    return RefreshIndicator(
                        child: Container(
                          height: box.maxHeight,
                          child: Consumer<TickNotifier>(
                            builder: (context, tick, _) {
                              List<Widget> children = widget.childrenBuilder();
                              return SingleChildScrollView(
                                controller: scroller,
                                padding: EdgeInsets.only(bottom: 20),
                                physics: AlwaysScrollableScrollPhysics(),
                                child: ListView.separated(
                                  primary: false,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: children.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) => children[index],
                                  separatorBuilder: (context, index) =>
                                      widget.separatorBuilder == null
                                          ? SizedBox()
                                          : widget.separatorBuilder!(
                                              context, index),
                                ),
                              );
                            },
                          ),
                        ),
                        onRefresh: _onRefresh);
                  })),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onRefresh() async {
    _tick.change();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scroller.dispose();
    super.dispose();
  }
}

class _HeaderCustomPainter extends CustomPainter {
  final Offset offset;
  final Size boxSize;
  final double? bounce;

  _HeaderCustomPainter(
      {required this.offset, required this.boxSize, required this.bounce});

  double get _bounce => this.bounce ?? 0;

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = offset.dy + boxSize.height / 2.0;
    double bounce = height;
    double padding = 0;
    if (_bounce >= 0) {
      bounce = height + _bounce;
      padding = _bounce * 0.2;
    } else {
      height = max(0, height + _bounce);
      bounce = height;
    }

    Path path = Path();
    path.lineTo(width, 0);
    path.lineTo(width + padding, height);
    path.conicTo(width / 2, bounce, -padding, height, 0.5);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = VNMColor.primary()
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant _HeaderCustomPainter oldDelegate) =>
      oldDelegate.offset != offset ||
      oldDelegate.boxSize != boxSize ||
      oldDelegate.bounce != bounce;
}
