import 'package:flutter/material.dart';

import 'button.dart';

class VNMGestureButton extends ButtonTracking {
  final Widget child;
  final ShapeBorder? border;
  final bool enableSplash;

  VNMGestureButton(
      {required this.child,
      super.onPressed,
      String? label,
      this.border,
      bool? enableSplash})
      : enableSplash = enableSplash ?? true,
        super(label: label);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          customBorder: border,
          child: child,
          highlightColor: enableSplash ? null : Colors.transparent,
          splashColor: enableSplash ? null : Colors.transparent,
          onTap: onPressed == null ? null : onPressedWithTracking),
    );
  }
}
