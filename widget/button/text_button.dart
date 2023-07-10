import 'package:flutter/material.dart';

import '../../style/button.dart';
import '../../style/text_style.dart';
import '../basic/text_view.dart';
import 'button.dart';

enum VNMTextButtonType { _default, hint, white, primary, cancel, interactive }

extension _VNMTextButtonType on VNMTextButtonType {
  TextStyle get style => [
        VNMTextStyle.sBold14(),
        VNMTextStyle.hintBold14(),
        VNMTextStyle.whiteBold14(),
        VNMTextStyle.primaryBold14(),
        VNMTextStyle.cancel(),
        VNMTextStyle.interactive(),
      ][index];
}

class VNMTextButton extends ButtonTracking {
  final VNMTextButtonType type;

  const VNMTextButton(
      {super.key,
      super.onPressed,
      required super.label,
      VNMTextButtonType? type})
      : this.type = type ?? VNMTextButtonType._default;

  factory VNMTextButton.hint(String label, {void Function()? onPressed}) {
    return VNMTextButton(
        label: label, onPressed: onPressed, type: VNMTextButtonType.hint);
  }

  factory VNMTextButton.white(String label, {void Function()? onPressed}) {
    return VNMTextButton(
        label: label, onPressed: onPressed, type: VNMTextButtonType.white);
  }

  factory VNMTextButton.primary(String label, {void Function()? onPressed}) {
    return VNMTextButton(
        label: label, onPressed: onPressed, type: VNMTextButtonType.primary);
  }

  factory VNMTextButton.interactive(String label,
      {void Function()? onPressed}) {
    return VNMTextButton(
        label: label,
        onPressed: onPressed,
        type: VNMTextButtonType.interactive);
  }

  factory VNMTextButton.cancel(String label, {void Function()? onPressed}) {
    return VNMTextButton(
        label: label, onPressed: onPressed, type: VNMTextButtonType.cancel);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed == null ? null : onPressedWithTracking,
        style: VNMButtonStyle.text(),
        child: VNMText(label,
            style: onPressed == null ? VNMTextStyle.subTitle14() : type.style));
  }
}
