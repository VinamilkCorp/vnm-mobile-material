import 'package:flutter/material.dart';

import 'color.dart';

class VNMIconThemeData extends IconThemeData {
  VNMIconThemeData({super.color});

  factory VNMIconThemeData.primary() =>
      VNMIconThemeData(color: VNMColor.primary());

  factory VNMIconThemeData.white() => VNMIconThemeData(color: VNMColor.white());
}
