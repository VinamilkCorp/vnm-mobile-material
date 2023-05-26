import 'package:flutter/material.dart';

import '../../../core/global/tracking.dart';
import '../../styles/button.dart';
import '../../styles/text_style.dart';
import '../text_view.dart';

enum ColorButton {
  primary,
  warning,
  transparent,
  white,
  join,
  spin,
  spinAll,
  disable
}

extension _ColorButton on ColorButton {
  TextStyle get textStyle => [
        VNMTextStyle.btnWhite(),
        VNMTextStyle.btnWhite(),
        VNMTextStyle.btnPrimary(),
        VNMTextStyle.btnPrimary(),
        VNMTextStyle.btnWhite(),
        VNMTextStyle.btnPrimary(),
        VNMTextStyle.btnWhite(),
        VNMTextStyle.btnDisable(),
      ][index];

  ButtonStyle get buttonStyle => [
        VNMButtonStyle.primary(),
        VNMButtonStyle.warning(),
        VNMButtonStyle.transparent(),
        VNMButtonStyle.white(),
        VNMButtonStyle.join(),
        VNMButtonStyle.spin(),
        VNMButtonStyle.spinTransparent(),
        VNMButtonStyle.disable(),
      ][index];
}

class VNMButton extends ButtonTracking {
  final bool inBottom;
  final ColorButton type;
  final bool rounded;
  final String subLabel;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const VNMButton(
      {required super.label,
      required super.onPressed,
      super.key,
      ColorButton? type,
      String? subLabel,
      this.margin,
      this.padding,
      bool? rounded,
      bool? inBottom})
      : this.type = type ?? ColorButton.primary,
        this.inBottom = inBottom ?? false,
        this.rounded = rounded ?? false,
        this.subLabel = subLabel ?? '';

  factory VNMButton.bottom(String label,
      {Function()? onPressed, bool? rounded, EdgeInsets? margin}) {
    return VNMButton(
        label: label,
        onPressed: onPressed,
        rounded: rounded,
        margin: margin,
        inBottom: true);
  }

  factory VNMButton.bottomWarning(String label, {Function()? onPressed}) {
    return VNMButton(
        label: label,
        type: ColorButton.warning,
        onPressed: onPressed,
        inBottom: true);
  }

  factory VNMButton.bottomDisable(String label,
      {Function()? onPressed, bool? rounded, EdgeInsets? margin}) {
    return VNMButton(
        label: label,
        rounded: rounded,
        type: ColorButton.disable,
        onPressed: onPressed,
        margin: margin,
        inBottom: true);
  }

  factory VNMButton.bottomTransparent(String label,
      {Function()? onPressed, bool? rounded}) {
    return VNMButton(
        label: label,
        rounded: rounded,
        type: ColorButton.transparent,
        onPressed: onPressed,
        inBottom: true);
  }

  factory VNMButton.bottomWhite(String label,
      {Function()? onPressed, bool? rounded}) {
    return VNMButton(
        label: label,
        rounded: rounded,
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
      {Function()? onPressed, String? subLabel, EdgeInsets? padding}) {
    return VNMButton(
      label: label,
      margin: EdgeInsets.zero,
      padding: padding,
      type: ColorButton.spin,
      onPressed: onPressed,
      subLabel: subLabel,
    );
  }

  factory VNMButton.spinTransparent(String label,
      {EdgeInsets? padding, Function()? onPressed}) {
    return VNMButton(
      label: label,
      margin: EdgeInsets.zero,
      type: ColorButton.spinAll,
      onPressed: onPressed,
      padding: padding,
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
    var viewInsets = EdgeInsets.zero;
    if (inBottom)
      viewInsets +=
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom);
    return Padding(
      padding: viewInsets,
      child: SafeArea(
          bottom: inBottom && rounded,
          top: false,
          child: Padding(
            padding:
                margin == null ? EdgeInsets.all(rounded ? 16 : 0) : margin!,
            child: TextButton(
                onPressed: onPressed == null ? null : onPressedWithTracking,
                style: style,
                child: SafeArea(
                    bottom: inBottom && !rounded,
                    top: false,
                    child: _buildButton(context))),
          )),
    );
  }

  _buildButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _flex
            ? Flexible(
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: _buildContent(context),
              ))
            : Expanded(child: _buildContent(context))
      ],
    );
  }

  _buildContent(BuildContext context) {
    var style = onPressed == null ? VNMTextStyle.btnWhite() : type.textStyle;
    var padding = EdgeInsets.zero;
    if (this.padding != null) padding += this.padding!;
    return Padding(
      padding: padding,
      child: Column(
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
              style: style.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            )
          ]
        ],
      ),
    );
  }
}

abstract class ButtonTracking extends StatelessWidget {
  final Function()? onPressed;
  final String? label;

  const ButtonTracking({super.key, this.onPressed, this.label});

  void onPressedWithTracking() {
    //route
    FocusManager.instance.primaryFocus?.unfocus();
    if (onPressed == null) return;
    if (label != null && VNMTrackingConfig().logButton != null)
      VNMTrackingConfig().logButton!(label!);
    onPressed!();
  }
}
