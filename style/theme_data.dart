import 'package:flutter/material.dart';

import 'app_bar_theme.dart';
import 'button.dart';
import 'color.dart';
import 'text_style.dart';

class VNMThemeData {
  static VNMThemeData _i = VNMThemeData._();

  VNMThemeData._();

  factory VNMThemeData() => _i;

  /*
  displayLarge = displayLarge ?? headline1,
  displayMedium = displayMedium ?? headline2,
  displaySmall = displaySmall ?? headline3,
  headlineMedium = headlineMedium ?? headline4,
  headlineSmall = headlineSmall ?? headline5,
  titleLarge = titleLarge ?? headline6,
  titleMedium = titleMedium ?? subtitle1,
  titleSmall = titleSmall ?? subtitle2,
  bodyLarge = bodyLarge ?? bodyText1,
  bodyMedium = bodyMedium ?? bodyText2,
  bodySmall = bodySmall ?? caption,
  labelLarge = labelLarge ?? button,
  labelSmall = labelSmall ?? overline;
  */

  ThemeData get root {
    return ThemeData(
        primarySwatch: VNMColor.primary().material,
        primaryColor: VNMColor.primary(),
        secondaryHeaderColor: VNMColor.text(),
        scaffoldBackgroundColor: VNMColor.background(),
        dividerColor: VNMColor.divide(),
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: VNMColor.primary().material,
            errorColor: VNMColor.error(),
            backgroundColor: VNMColor.background()),
        canvasColor: VNMColor.canvas(),
        fontFamily: 'Roboto',
        appBarTheme: VNMAppBarTheme.primary(),
        iconTheme: IconThemeData(color: VNMColor.primary()),
        dialogTheme: DialogTheme(
            titleTextStyle: VNMTextStyle.sBold16(),
            contentTextStyle: VNMTextStyle.s14()),
        textTheme: TextTheme(
          displayLarge: VNMTextStyle.sBold26(),
          displayMedium: VNMTextStyle.sBold24(),
          displaySmall: VNMTextStyle.sBold20(),
          headlineLarge: VNMTextStyle.sBold20(),
          headlineMedium: VNMTextStyle.sBold18(),
          headlineSmall: VNMTextStyle.sBold16(),
          titleLarge: VNMTextStyle.sMedium16(),
          titleMedium: VNMTextStyle.sMedium14(),
          titleSmall: VNMTextStyle.sMedium12(),
          bodyLarge: VNMTextStyle.s16(),
          bodyMedium: VNMTextStyle.s14(),
          bodySmall: VNMTextStyle.s12(),
          labelLarge: VNMTextStyle.s14(),
          labelMedium: VNMTextStyle.s12(),
          labelSmall: VNMTextStyle.s10(),
        ),
        textButtonTheme: TextButtonThemeData(style: VNMButtonStyle.primary()),
        primaryIconTheme: IconThemeData(color: VNMColor.primary()),
        dropdownMenuTheme: DropdownMenuThemeData(),
        buttonTheme: ButtonThemeData());
  }
}
