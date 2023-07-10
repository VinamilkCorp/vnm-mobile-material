import 'package:flutter/cupertino.dart';

import '../../style/color.dart';

class VNMCardView extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const VNMCardView(
      {super.key,
      required this.child,
      this.margin,
      this.padding,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: child,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor ?? VNMColor.white(),
          boxShadow: [BoxShadow(color: VNMColor.shadow(), blurRadius: 20)]),
    );
  }
}
