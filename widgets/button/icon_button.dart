import 'package:flutter/material.dart';

import '../../styles/color.dart';
import '../image.dart';
import 'button.dart';

class VNMIconButton extends ButtonTracking {
  final IconData? icon;
  final String? asset;
  final Color color;

  VNMIconButton({
    super.key,
    required super.label,
    this.icon,
    this.asset,
    required this.color,
    super.onPressed,
  });

  factory VNMIconButton.primary({
    required String label,
    required IconData icon,
    Function()? onPressed,
  }) =>
      VNMIconButton(
        label: label,
        icon: icon,
        color: VNMColor.primary(),
        onPressed: onPressed,
      );

  factory VNMIconButton.white({
    required String label,
    required IconData icon,
    Function()? onPressed,
  }) =>
      VNMIconButton(
        label: label,
        icon: icon,
        color: VNMColor.white(),
        onPressed: onPressed,
      );

  factory VNMIconButton.asset({
    required String label,
    required String asset,
    Function()? onPressed,
    Color? color,
  }) =>
      VNMIconButton(
        label: label,
        asset: asset,
        color: color ?? VNMColor.white(),
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox();
    if (icon != null)
      child = Icon(icon, color: color);
    else if (asset != null) {
      child = VNMImage(asset!, color: color);
    }
    return IconButton(
        onPressed: onPressed == null ? null : onPressedWithTracking,
        icon: child);
  }
}
