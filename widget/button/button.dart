import 'package:flutter/material.dart';

import '../../../core/global/tracking.dart';
import '../../../extension/if_null.dart';
import '../../style/button.dart';
import '../../style/text_style.dart';
import '../basic/text_view.dart';

extension VNMButtonStyleEx on VNMButton {
  VNMButton get primary => copyWith(
      buttonStyle: VNMButtonStyle.primary(),
      textStyle: VNMTextStyle.btnWhite());

  VNMButton get warning => copyWith(
      buttonStyle: VNMButtonStyle.warning(),
      textStyle: VNMTextStyle.btnWhite());

  VNMButton get transparent => copyWith(
      buttonStyle: VNMButtonStyle.transparent(),
      textStyle: VNMTextStyle.btnPrimary());

  VNMButton get white => copyWith(
      buttonStyle: VNMButtonStyle.white(),
      textStyle: VNMTextStyle.btnPrimary());

  VNMButton get spin => copyWith(
      buttonStyle: VNMButtonStyle.spin(), textStyle: VNMTextStyle.btnPrimary());

  VNMButton get spinTransparent => copyWith(
      buttonStyle: VNMButtonStyle.spinTransparent(),
      textStyle: VNMTextStyle.btnWhite());

  VNMButton get disable => copyWith(
      buttonStyle: VNMButtonStyle.disable(),
      textStyle: VNMTextStyle.btnDisable());

  VNMButton get interactive => copyWith(
      buttonStyle: VNMButtonStyle.interactive(),
      textStyle: VNMTextStyle.btnInteractive());
}

extension BottomButtonEx on VNMButton {
  VNMButton get bottoming => copyWith(inBottom: true);
}

extension RoundButtonEx on VNMButton {
  VNMButton get rounder => copyWith(rounded: true);
}

extension FlexButtonEx on VNMButton {
  VNMButton get flexing => copyWith(flex: true);
}

extension TextSizeButtonEx on VNMButton {
  VNMButton get mediumText =>
      copyWith(textStyle: textStyle?.copyWith(fontSize: 14));

  VNMButton get smallText =>
      copyWith(textStyle: textStyle?.copyWith(fontSize: 12));
}

class VNMButton extends ButtonTracking {
  final String? subLabel;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderSide? side;
  final bool? inBottom;
  final bool? flex;
  final bool? rounded;

  const VNMButton(
      {required super.label,
      required super.onPressed,
      super.key,
      this.buttonStyle,
      this.textStyle,
      this.margin,
      this.padding,
      this.side,
      this.subLabel,
      this.inBottom,
      this.flex,
      this.rounded});

  VNMButton copyWith({
    String? label,
    Function()? onPressed,
    Key? key,
    bool? inBottom,
    bool? flex,
    TextStyle? textStyle,
    ButtonStyle? buttonStyle,
    bool? rounded,
    String? subLabel,
    EdgeInsets? margin,
    EdgeInsets? padding,
    BorderSide? side,
  }) {
    return VNMButton(
      label: label ?? this.label,
      onPressed: onPressed ?? this.onPressed,
      key: key ?? this.key,
      inBottom: inBottom ?? this.inBottom,
      flex: flex ?? this.flex,
      textStyle: textStyle ?? this.textStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      rounded: rounded ?? this.rounded,
      subLabel: subLabel ?? this.subLabel,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      side: side ?? this.side,
    );
  }

  factory VNMButton.primary(String label,
      {Key? key,
      Function()? onPressed,
      String? subLabel,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BorderSide? side}) {
    return VNMButton(
      key: key,
      label: label,
      onPressed: onPressed,
      subLabel: subLabel,
      margin: margin,
      padding: padding,
      side: side,
    ).primary;
  }

  factory VNMButton.warning(String label,
      {Key? key,
      Function()? onPressed,
      String? subLabel,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BorderSide? side}) {
    return VNMButton(
      key: key,
      label: label,
      onPressed: onPressed,
      subLabel: subLabel,
      margin: margin,
      padding: padding,
      side: side,
    ).warning;
  }

  factory VNMButton.transparent(String label,
      {Key? key,
      Function()? onPressed,
      String? subLabel,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BorderSide? side}) {
    return VNMButton(
      key: key,
      label: label,
      onPressed: onPressed,
      subLabel: subLabel,
      margin: margin,
      padding: padding,
      side: side,
    ).transparent;
  }

  factory VNMButton.white(String label,
      {Key? key,
      Function()? onPressed,
      String? subLabel,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BorderSide? side}) {
    return VNMButton(
      key: key,
      label: label,
      onPressed: onPressed,
      subLabel: subLabel,
      margin: margin,
      padding: padding,
      side: side,
    ).white;
  }

  factory VNMButton.spin(String label,
      {Key? key,
      Function()? onPressed,
      String? subLabel,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BorderSide? side}) {
    return VNMButton(
      key: key,
      label: label,
      onPressed: onPressed,
      subLabel: subLabel,
      margin: margin,
      padding: padding,
      side: side,
    ).spin;
  }

  factory VNMButton.spinTransparent(String label,
      {Key? key,
      Function()? onPressed,
      String? subLabel,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BorderSide? side}) {
    return VNMButton(
      key: key,
      label: label,
      onPressed: onPressed,
      subLabel: subLabel,
      margin: margin,
      padding: padding,
      side: side,
    ).spinTransparent;
  }

  factory VNMButton.disable(String label,
      {Key? key,
      Function()? onPressed,
      String? subLabel,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BorderSide? side}) {
    return VNMButton(
      key: key,
      label: label,
      onPressed: onPressed,
      subLabel: subLabel,
      margin: margin,
      padding: padding,
      side: side,
    ).disable;
  }

  factory VNMButton.interactive(String label,
      {Key? key,
      Function()? onPressed,
      String? subLabel,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BorderSide? side}) {
    return VNMButton(
      key: key,
      label: label,
      onPressed: onPressed,
      subLabel: subLabel,
      margin: margin,
      padding: padding,
      side: side,
    ).interactive;
  }

  ButtonStyle? get _buttonStyle {
    ButtonStyle? style =
        onPressed == null ? VNMButtonStyle.disable() : buttonStyle;
    if (rounded == true) {
      style = style?.copyWith(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
    }
    if (side != null) {
      style =
          style?.copyWith(side: MaterialStatePropertyAll<BorderSide?>(side));
    }
    if (padding != null) {
      style = style?.copyWith(
          padding: MaterialStatePropertyAll<EdgeInsetsGeometry?>(padding));
    }
    return style;
  }

  TextStyle? get _textStyle {
    TextStyle? style;
    style = onPressed == null ? VNMTextStyle.btnWhite() : textStyle;

    return style;
  }

  EdgeInsets _viewInsets(BuildContext context) {
    EdgeInsets viewInsets = EdgeInsets.zero;
    if (inBottom == true) {
      viewInsets +=
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom);
    }
    return viewInsets;
  }

  bool get _bottomSafeArea => ![inBottom, rounded].any((it) => it != true);

  bool get _bottomInnerSafeArea => inBottom == true && rounded != true;

  EdgeInsets get _margin {
    return margin == null ? EdgeInsets.all(rounded == true ? 16 : 0) : margin!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _viewInsets(context),
      child: SafeArea(
          bottom: _bottomSafeArea,
          top: false,
          child: Container(
            margin: _margin,
            child: TextButton(
                onPressed: onPressed == null ? null : onPressedWithTracking,
                style: _buttonStyle,
                child: SafeArea(
                    bottom: _bottomInnerSafeArea,
                    top: false,
                    child: _buildButton(context))),
          )),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        flex == true
            ? Flexible(child: _buildContent(context))
            : Expanded(child: _buildContent(context))
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VNMText(
          label,
          style: _textStyle,
          textAlign: TextAlign.center,
        ),
        if (subLabel.ifNull().isNotEmpty) ...[
          SizedBox(height: 2),
          VNMText(
            subLabel,
            style: _textStyle?.copyWith(fontWeight: FontWeight.w400),
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
    FocusManager.instance.primaryFocus?.unfocus();
    if (onPressed == null) return;
    if (label != null && VNMTrackingConfig().logButton != null)
      VNMTrackingConfig().logButton!(label!);
    onPressed!();
  }
}
