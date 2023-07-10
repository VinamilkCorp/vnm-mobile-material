import 'package:flutter/material.dart';

import '../../style/color.dart';

class BottomView extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;

  const BottomView({super.key, this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(color: VNMColor.white(), boxShadow: [
        BoxShadow(
            color: const Color(0x1F1C1C14).withOpacity(0.08),
            blurRadius: 20,
            offset: Offset.zero)
      ]),
      child: child,
    );
  }
}
