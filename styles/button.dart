import 'package:flutter/material.dart';

import 'color.dart';

class VNMButtonStyle extends ButtonStyle {
  VNMButtonStyle(
      {super.shape, super.overlayColor, super.backgroundColor, super.padding});

  factory VNMButtonStyle._square() {
    return VNMButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(14)),
      overlayColor: MaterialStateProperty.all(VNMColor.splash()),
    );
  }

  factory VNMButtonStyle._stadium() {
    return VNMButtonStyle(
      shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
      overlayColor: MaterialStateProperty.all(VNMColor.splash()),
      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
    );
  }

  factory VNMButtonStyle.disable() {
    return VNMButtonStyle._square()._copy(
      color: VNMColor.disable(),
    );
  }

  factory VNMButtonStyle.interactive() {
    return VNMButtonStyle._square()._copy(
      color: VNMColor.interactive(),
    );
  }

  factory VNMButtonStyle.primary() {
    return VNMButtonStyle._square()._copy(
      color: VNMColor.primary(),
    );
  }

  factory VNMButtonStyle.transparent() {
    return VNMButtonStyle._square()._copy(
      color: Colors.transparent,
      overlay: Colors.grey.shade100,
    );
  }

  factory VNMButtonStyle.white() {
    return VNMButtonStyle._square()._copy(color: VNMColor.white());
  }

  factory VNMButtonStyle.join() {
    return VNMButtonStyle._stadium()._copy(color: VNMColor.orange());
  }

  factory VNMButtonStyle.spin() {
    return VNMButtonStyle._stadium()
        ._copy(color: VNMColor.fortuneWheelArrow(), padding: EdgeInsets.all(6));
  }

  factory VNMButtonStyle.spinTransparent() {
    return VNMButtonStyle._stadium()._copy(
        color: VNMColor.transparent(),
        shape: StadiumBorder(side: BorderSide(color: VNMColor.white())),
        padding: EdgeInsets.all(16));
  }

  factory VNMButtonStyle.warning() {
    return VNMButtonStyle._square()._copy(color: VNMColor.warning());
  }

  factory VNMButtonStyle.text() {
    return VNMButtonStyle.transparent()._copy(padding: EdgeInsets.zero);
  }

  VNMButtonStyle _copy({
    OutlinedBorder? shape,
    EdgeInsets? padding,
    Color? color,
    Color? overlay,
  }) =>
      VNMButtonStyle(
        backgroundColor: color == null
            ? this.backgroundColor
            : MaterialStateProperty.all(color),
        overlayColor: overlay == null
            ? this.overlayColor
            : MaterialStateProperty.all(overlay),
        padding: padding == null
            ? this.padding
            : MaterialStateProperty.all<EdgeInsets>(padding),
        shape: shape == null
            ? this.shape
            : MaterialStateProperty.all<OutlinedBorder>(shape),
      );
}
