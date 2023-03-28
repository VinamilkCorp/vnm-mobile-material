import 'package:flutter/material.dart';

typedef C = VNMColor;

class VNMColor extends Color {
  VNMColor(super.value);

  factory VNMColor.primary() => C(0xFF15215D);

  factory VNMColor.accent() => C(0xFF15215D);

  factory VNMColor.background() => C(0xffF5F5F5);

  factory VNMColor.canvas() => C(0xFFFFFFFF);

  factory VNMColor.error() => C(0xffFF3B30);

  factory VNMColor.hint() => C(0xff8E8E93);

  factory VNMColor.note() => C(0xff525B86);

  factory VNMColor.disable() => C(Colors.grey.shade300.value);

  factory VNMColor.warning() => C(Colors.orange.value);

  factory VNMColor.white() => C(0xFFFFFFFF);

  factory VNMColor.orange() => C(0xffEB7553);

  factory VNMColor.splash() => C(Colors.white10.value);

  factory VNMColor.text() => C(0XFF1C1C1E);

  factory VNMColor.unselected() => C(0xff8D918D);

  factory VNMColor.transparent() => C(Colors.transparent.value);

  factory VNMColor.divide() => C(0xffF2F2F7);

  factory VNMColor.fortuneBackground() => C(0xff1E2540);

  factory VNMColor.placeholder() => C(0xffF3F9FD);

  factory VNMColor.subTitle() => C(0xff636366);

  factory VNMColor.message() => C(0xff667085);

  factory VNMColor.fortuneWheelBorder() => C(0xff2A304E);

  factory VNMColor.fortuneShadow() => C(C(0xff1E2540).withOpacity(0.12).value);

  factory VNMColor.fortuneWheelArrow() => C(0xffD8E473);

  factory VNMColor.interactive() => C(0xff007AFF);

  factory VNMColor.barrierDialog() => C(C(0xff000000).withOpacity(0.75).value);

  factory VNMColor.shadow() => C(C(0x1F1C1C14).value);

  MaterialColor get material => MaterialColor(VNMColor.primary().value, {
        50: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .1),
        100: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .2),
        200: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .3),
        300: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .4),
        400: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .5),
        500: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .6),
        600: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .7),
        700: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .8),
        800: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, .9),
        900: Color.fromRGBO(VNMColor.primary().red, VNMColor.primary().green,
            VNMColor.primary().blue, 1),
      });
}
