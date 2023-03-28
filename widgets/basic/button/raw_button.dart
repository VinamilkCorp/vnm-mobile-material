import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../styles/styles.dart';
import '../text_view.dart';

enum ColorButton { primary, warning, transparent, white, join, spin, spinAll }

extension _ColorButton on ColorButton {
  TextStyle get textStyle => [
        VNMTextStyle.btnWhite(),
        VNMTextStyle.btnWhite(),
        VNMTextStyle.btnPrimary(),
        VNMTextStyle.btnPrimary(),
        VNMTextStyle.btnWhite(),
        VNMTextStyle.btnPrimary(),
        VNMTextStyle.btnWhite(),
      ][index];

  ButtonStyle get buttonStyle => [
        VNMButtonStyle.primary(),
        VNMButtonStyle.warning(),
        VNMButtonStyle.transparent(),
        VNMButtonStyle.white(),
        VNMButtonStyle.join(),
        VNMButtonStyle.spin(),
        VNMButtonStyle.spinTransparent(),
      ][index];
}

class VNMButton extends ButtonTracking {
  final bool inBottom;
  final ColorButton type;
  final bool rounded;
  final String subLabel;
  final EdgeInsets? margin;

  const VNMButton(
      {required super.label,
      required super.onPressed,
      super.key,
      ColorButton? type,
      String? subLabel,
      this.margin,
      bool? rounded,
      bool? inBottom})
      : this.type = type ?? ColorButton.primary,
        this.inBottom = inBottom ?? false,
        this.rounded = rounded ?? false,
        this.subLabel = subLabel ?? '';

  factory VNMButton.bottom(String label, {Function()? onPressed}) {
    return VNMButton(label: label, onPressed: onPressed, inBottom: true);
  }

  factory VNMButton.bottomWarning(String label, {Function()? onPressed}) {
    return VNMButton(
        label: label,
        type: ColorButton.warning,
        onPressed: onPressed,
        inBottom: true);
  }

  factory VNMButton.bottomTransparent(String label, {Function()? onPressed}) {
    return VNMButton(
        label: label,
        type: ColorButton.transparent,
        onPressed: onPressed,
        inBottom: true);
  }

  factory VNMButton.bottomWhite(String label, {Function()? onPressed}) {
    return VNMButton(
        label: label,
        type: ColorButton.white,
        onPressed: onPressed,
        inBottom: true);
  }

  factory VNMButton.primary(String label,
      {Function()? onPressed,
      bool? rounded,
      bool? inBottom,
      EdgeInsets? margin}) {
    return VNMButton(
        label: label,
        type: ColorButton.primary,
        onPressed: onPressed,
        inBottom: inBottom,
        margin: margin,
        rounded: rounded);
  }

  factory VNMButton.warning(String label, {Function()? onPressed}) {
    return VNMButton(
        label: label, type: ColorButton.warning, onPressed: onPressed);
  }

  factory VNMButton.transparent(String label, {Function()? onPressed}) {
    return VNMButton(
        label: label, type: ColorButton.transparent, onPressed: onPressed);
  }

  factory VNMButton.white(String label, {Function()? onPressed}) {
    return VNMButton(
        label: label, type: ColorButton.white, onPressed: onPressed);
  }

  factory VNMButton.join(String label, {Function()? onPressed}) {
    return VNMButton(
        label: label, type: ColorButton.join, onPressed: onPressed);
  }

  factory VNMButton.spin(String label,
      {Function()? onPressed, String? subLabel}) {
    return VNMButton(
      label: label,
      margin: EdgeInsets.zero,
      type: ColorButton.spin,
      onPressed: onPressed,
      subLabel: subLabel,
    );
  }

  factory VNMButton.spinTransparent(String label, {Function()? onPressed}) {
    return VNMButton(
      label: label,
      margin: EdgeInsets.zero,
      type: ColorButton.spinAll,
      onPressed: onPressed,
    );
  }

  bool get _flex => this.type == ColorButton.join;

  @override
  Widget build(BuildContext context) {
    var style = onPressed == null ? VNMButtonStyle.disable() : type.buttonStyle;
    if (rounded)
      style = style.copyWith(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
    return SafeArea(
        bottom: inBottom && rounded,
        top: false,
        child: Padding(
          padding: margin == null ? EdgeInsets.all(rounded ? 16 : 0) : margin!,
          child: TextButton(
              onPressed: onPressed == null ? null : onPressedWithTracking,
              style: style,
              child: SafeArea(
                  bottom: inBottom && !rounded,
                  top: false,
                  child: _buildButton())),
        ));
  }

  _buildButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _flex
            ? Flexible(
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: _buildContent(),
              ))
            : Expanded(child: _buildContent())
      ],
    );
  }

  _buildContent() {
    var style = onPressed == null ? VNMTextStyle.btnWhite() : type.textStyle;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VNMText(
          label,
          style: style,
          textAlign: TextAlign.center,
        ),
        if (subLabel.isNotEmpty) ...[
          SizedBox(height: 2),
          VNMText(
            subLabel,
            style: style.copyWith(fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          )
        ]
      ],
    );
  }
}

abstract class ButtonTracking extends StatelessWidget {
  final Function()? onPressed;
  final String? label;

  const ButtonTracking({super.key, this.onPressed, this.label});

  void onPressedWithTracking() {
    //route
    if (onPressed == null) return;
    if (label != null) Analytics().logButton(label!);
    onPressed!();
  }
}
