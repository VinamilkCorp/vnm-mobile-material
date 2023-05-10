import 'package:flutter/material.dart';

import '../styles/app_bar_theme.dart';
import '../styles/color.dart';
import 'text_view.dart';

class VNMAppBar extends AppBar {
  VNMAppBar(
      {String? text,
      super.backgroundColor,
      super.titleTextStyle,
      super.iconTheme,
      super.leading,
      super.actions,
      super.elevation})
      : super(
          title: text == null ? null : VNMText(text),
        );

  factory VNMAppBar.primary(String? text,
          {List<Widget>? actions, double? elevation}) =>
      VNMAppBar(
        text: text,
        backgroundColor: VNMAppBarTheme.primary().backgroundColor,
        titleTextStyle: VNMAppBarTheme.primary().titleTextStyle,
        iconTheme: VNMAppBarTheme.primary().iconTheme,
        actions: actions,
        elevation: elevation,
      );

  factory VNMAppBar.transparent(String? text, {VNMColor? textColor}) =>
      VNMAppBar(
        text: text,
        backgroundColor: VNMAppBarTheme.transparent().backgroundColor,
        titleTextStyle: VNMAppBarTheme.transparent()
            .titleTextStyle
            ?.copyWith(color: textColor),
        iconTheme: VNMAppBarTheme.transparent().iconTheme,
        elevation: 0,
      );

  factory VNMAppBar.close(
          {String? text, VNMColor? backgroundColor, VNMColor? color}) =>
      VNMAppBar(
        text: text,
        backgroundColor:
            backgroundColor ?? VNMAppBarTheme.transparent().backgroundColor,
        iconTheme: VNMAppBarTheme.primary().iconTheme?.copyWith(color: color),
        titleTextStyle:
            VNMAppBarTheme.primary().titleTextStyle?.copyWith(color: color),
        elevation: 0,
        leading: CloseButton(color: color),
      );

  factory VNMAppBar.empty({Widget? leading}) => VNMAppBar(
        text: null,
        backgroundColor: VNMAppBarTheme.transparent().backgroundColor,
        titleTextStyle: VNMAppBarTheme.transparent().titleTextStyle,
        iconTheme: VNMAppBarTheme.transparent().iconTheme,
        elevation: 0,
        leading: leading,
      );
}
