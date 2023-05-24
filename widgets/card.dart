import 'package:flutter/cupertino.dart';
import 'package:vinamilk_b2b/vnm/material/styles/color.dart';

class VNMCardView extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const VNMCardView(
      {super.key, required this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin ?? EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: child,
      ),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: VNMColor.shadow(), blurRadius: 20)]),
    );
  }
}
