import 'package:flutter/material.dart';

import '../../styles/color.dart';
import 'button.dart';

class VNMIconButton extends ButtonTracking {
  final IconData icon;
  final Color color;

  VNMIconButton({
    super.key,
    required super.label,
    required this.icon,
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

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed == null ? null : onPressedWithTracking,
        icon: Icon(icon, color: color));
  }
}
