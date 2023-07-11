import 'package:flutter/material.dart';

import 'color.dart';

typedef FW = FontWeight;

typedef VTS = VNMTextStyle;

class VNMTextStyle extends TextStyle {
  VNMTextStyle(
      {super.color,
      super.fontSize,
      super.fontWeight,
      super.height,
      super.letterSpacing,
      super.decoration});

  factory VNMTextStyle._root() =>
      VNMTextStyle(color: VNMColor.text(), fontSize: 14, fontWeight: FW.w400);

  //normal
  factory VNMTextStyle._s() => VTS._root();

  factory VNMTextStyle.s10() => VTS._s()._copy(size: 10);

  factory VNMTextStyle.s12() => VTS._s()._copy(size: 12);

  factory VNMTextStyle.s14() => VTS._s();

  factory VNMTextStyle.s16() => VTS._s()._copy(size: 16);

  factory VNMTextStyle.s18() => VTS._s()._copy(size: 18);

  factory VNMTextStyle.s20() => VTS._s()._copy(size: 20);

  //medium
  factory VNMTextStyle._sMedium() => VTS._s()._copy(weight: FW.w500);

  factory VNMTextStyle.sMedium12() => VTS._sMedium()._copy(size: 12);

  factory VNMTextStyle.sMedium14() => VTS._sMedium();

  factory VNMTextStyle.sMedium16() => VTS._sMedium()._copy(size: 16);

  //bold
  factory VNMTextStyle._sBold() => VTS._s()._copy(weight: FW.w600);

  factory VNMTextStyle.sBold12() => VTS._sBold()._copy(size: 12);

  factory VNMTextStyle.sBold14() => VTS._sBold();

  factory VNMTextStyle.sBold16() => VTS._sBold()._copy(size: 16);

  factory VNMTextStyle.sBold18() => VTS._sBold()._copy(size: 18);

  factory VNMTextStyle.sBold36() => VTS._sBold()._copy(size: 36);

  factory VNMTextStyle.sBold20() => VTS._sBold()._copy(size: 20);

  factory VNMTextStyle.sBold22() => VTS._sBold()._copy(size: 22);

  factory VNMTextStyle.sBold24() => VTS._sBold()._copy(size: 24);

  factory VNMTextStyle.sBold26() => VTS._sBold()._copy(size: 26);

  //button
  factory VNMTextStyle._b() => VTS._root()._copy(size: 16, weight: FW.w600);

  factory VNMTextStyle.btnPrimary() =>
      VTS._b()._copy(color: VNMColor.primary());

  factory VNMTextStyle.btnWhite() => VTS._b()._copy(color: VNMColor.white());

  factory VNMTextStyle.btnDisable() => VTS._b()._copy(color: VNMColor.hint());

  factory VNMTextStyle.btnInteractive() =>
      VTS._b()._copy(color: VNMColor.white());

  //primary
  factory VNMTextStyle._pr() => VTS._root()._copy(color: VNMColor.primary());

  factory VNMTextStyle.primary14() => VTS._pr();

  factory VNMTextStyle.primary16() => VTS._pr()._copy(size: 16);

  factory VNMTextStyle.primary18() => VTS._pr()._copy(size: 18);

  factory VNMTextStyle.primary34() => VTS._pr()._copy(size: 34);

  factory VNMTextStyle._pryMedium() => VTS._pr()._copy(weight: FW.w500);

  factory VNMTextStyle.primaryMedium14() => VTS._pryMedium();

  factory VNMTextStyle.primaryMedium16() => VTS._pryMedium()._copy(size: 16);

  factory VNMTextStyle._pryBold() => VTS._pr()._copy(weight: FW.w600);

  factory VNMTextStyle.primaryBold12() => VTS._pryBold()._copy(size: 12);

  factory VNMTextStyle.primaryBold14() => VTS._pryBold();

  factory VNMTextStyle.primaryBold16() => VTS._pryBold()._copy(size: 16);

  factory VNMTextStyle.primaryBold18() => VTS._pryBold()._copy(size: 18);

  factory VNMTextStyle.primaryBold24() => VTS._pryBold()._copy(size: 24);

  factory VNMTextStyle.primaryBold34() => VTS._pryBold()._copy(size: 34);

  //hint
  factory VNMTextStyle._ht() => VTS._root()._copy(color: VNMColor.hint());

  factory VNMTextStyle.hint12() => VTS._ht()._copy(size: 12);

  factory VNMTextStyle.hint14() => VTS._ht();

  factory VNMTextStyle.hint16() => VTS._ht()._copy(size: 16);

  factory VNMTextStyle.hintLineThrough16() =>
      VTS.hint16()._copy(decoration: TextDecoration.lineThrough);

  factory VNMTextStyle._htBold() => VTS._ht()._copy(weight: FW.w600);

  factory VNMTextStyle.hintBold12() => VTS._htBold()._copy(size: 12);

  factory VNMTextStyle.hintBold14() => VTS._htBold();

  //note
  factory VNMTextStyle._note() => VTS._root()._copy(color: VNMColor.note());

  factory VNMTextStyle.note12() => VTS._note()._copy(size: 12);

  //message
  factory VNMTextStyle._msg() => VTS._root()._copy(color: VNMColor.message());

  factory VNMTextStyle.message() => VTS._msg();

  factory VNMTextStyle.message16() => VTS._msg()._copy(size: 16);

  //background
  factory VNMTextStyle._bg() => VTS._root()._copy(color: VNMColor.background());

  factory VNMTextStyle.background14() => VTS._bg();

  factory VNMTextStyle.background16() => VTS._bg()._copy(size: 16);

  factory VNMTextStyle.background34() => VTS._bg()._copy(size: 34);

  //white
  factory VNMTextStyle._wh() => VTS._root()._copy(color: VNMColor.white());

  factory VNMTextStyle.white12() => VTS._wh()._copy(size: 12);

  factory VNMTextStyle.white14() => VTS._wh();

  factory VNMTextStyle.white18() => VTS._wh()._copy(size: 18);

  factory VNMTextStyle._whBold() => VTS._wh()._copy(weight: FW.w600);

  factory VNMTextStyle.whiteBold11() => VTS._whBold()._copy(size: 11);

  factory VNMTextStyle.whiteBold14() => VTS._whBold();

  factory VNMTextStyle.whiteBold16() => VTS._whBold()._copy(size: 16);

  factory VNMTextStyle.whiteBold18() => VTS._whBold()._copy(size: 18);

  factory VNMTextStyle.whiteBold20() => VTS._whBold()._copy(size: 20);

  factory VNMTextStyle.whiteBold22() => VTS._whBold()._copy(size: 22);

  factory VNMTextStyle.whiteBold24() => VTS._whBold()._copy(size: 24);

  //disable
  factory VNMTextStyle._disable() => VTS._s()._copy(color: VNMColor.disable());

  factory VNMTextStyle.disable14() => VTS._disable();

  //error
  factory VNMTextStyle._error() => VTS._root()._copy(color: VNMColor.error());

  factory VNMTextStyle.error14() => VTS._error();

  factory VNMTextStyle.error16() => VTS._error()._copy(size: 16);

  factory VNMTextStyle.error17() => VTS._error()._copy(size: 17);

  //subtitle
  factory VNMTextStyle._stl() => VTS._s()._copy(color: VNMColor.subTitle());

  factory VNMTextStyle.subTitle12() => VTS._stl()._copy(size: 12);

  factory VNMTextStyle.subTitle14() => VTS._stl();

  factory VNMTextStyle.subTitle16() => VTS._stl()._copy(size: 16);

  factory VNMTextStyle.subTitle17() => VTS._stl()._copy(size: 17);

  factory VNMTextStyle._stlBold() => VNMTextStyle._stl()._copy(weight: FW.w600);

  factory VNMTextStyle.subTitleBold12() => VTS._stlBold()._copy(size: 12);

  factory VNMTextStyle.subTitleBold14() => VTS._stlBold();

  //interactive
  factory VNMTextStyle._itr() => VTS._s()._copy(color: VNMColor.interactive());

  factory VNMTextStyle.interactive12() => VTS._itr()._copy(size: 12);

  factory VNMTextStyle.interactive() => VTS._itr()._copy(size: 14);

  factory VNMTextStyle._itrBold() => VTS._itr()._copy(weight: FW.w600);

  factory VNMTextStyle.interactiveBold() => VTS._itrBold();

  factory VNMTextStyle.interactiveBold12() => VTS._itrBold()._copy(size: 12);

  factory VNMTextStyle.interactiveBold16() => VTS._itrBold()._copy(size: 16);

  //success
  factory VNMTextStyle._scs() => VTS._s()._copy(color: VNMColor.success());

  factory VNMTextStyle.success() => VTS._scs()._copy(size: 14);

  //customize
  factory VNMTextStyle.title() => VTS._s()._copy(size: 16, weight: FW.w600);

  factory VNMTextStyle.cancel() => VTS._s()._copy(
      size: 14, weight: FW.w500, color: VNMColor.text().withOpacity(0.8));

  factory VNMTextStyle.pinkBold18() =>
      VTS._s()._copy(size: 18, weight: FW.w600, color: VNMColor.pink());

  factory VNMTextStyle.titleListTile() => VTS
      ._s()
      ._copy(size: 14, weight: FW.w600, height: 20 / 14, letterSpacing: 0.1);

  factory VNMTextStyle.subTitleListTile() => VTS
      ._s()
      ._copy(size: 14, weight: FW.w400, height: 20 / 14, letterSpacing: 0.1);

  VNMTextStyle _copy({
    Color? color,
    double? size,
    FontWeight? weight,
    double? height,
    TextDecoration? decoration,
    double? letterSpacing,
  }) {
    return VNMTextStyle(
      color: color ?? this.color,
      fontSize: size ?? this.fontSize,
      fontWeight: weight ?? this.fontWeight,
      height: height ?? this.height,
      decoration: decoration ?? this.decoration,
      letterSpacing: letterSpacing ?? this.letterSpacing,
    );
  }
}

extension TextStyleTypo on TextStyle {
  TextStyle get title =>
      copyWith(height: 1.5, fontWeight: FontWeight.w600, letterSpacing: 0.15);

  TextStyle get body =>
      copyWith(height: 1.3, fontWeight: FontWeight.w400, letterSpacing: 0.2);
}
