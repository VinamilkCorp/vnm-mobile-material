import 'package:flutter/material.dart';

import 'color.dart';
import 'icon_theme_data.dart';
import 'text_style.dart';

class VNMAppBarTheme extends AppBarTheme {
  VNMAppBarTheme({super.color, super.titleTextStyle, super.iconTheme});

  factory VNMAppBarTheme.primary() {
    return VNMAppBarTheme(
        color: VNMColor.primary(),
        titleTextStyle: VNMTextStyle.whiteBold18(),
        iconTheme: VNMIconThemeData.white());
  }

  factory VNMAppBarTheme.transparent() {
    return VNMAppBarTheme(
        color: VNMColor.transparent(),
        titleTextStyle: VNMTextStyle.primaryBold18(),
        iconTheme: VNMIconThemeData.primary());
  }
}
