import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class VNMText extends Text {
  VNMText(String? data,
      {super.style, super.textAlign, super.maxLines, super.overflow})
      : super(data ?? "");

  factory VNMText.error(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.error14());

  factory VNMText.error16(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.error16());

  factory VNMText.pageTitle(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.primaryBold34());

  factory VNMText.title(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.title());

  factory VNMText.subTitle12(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.subTitle12());

  factory VNMText.subTitle(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.subTitle14());

  factory VNMText.subTitleBold(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.subTitleBold14());

  factory VNMText.subTitleBackground(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.background16());

  factory VNMText.textBackground(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.background14());

  factory VNMText.pageTitleBackground(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.background34());

  factory VNMText.s12(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.s12());

  factory VNMText.s14(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.s14());

  factory VNMText.s16(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.s16());

  factory VNMText.sBold14(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.sBold14());

  factory VNMText.sBold16(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.sBold16());

  factory VNMText.sBold18(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.sBold18());

  factory VNMText.sBold24(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.sBold24());

  factory VNMText.interactiveBold12(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.interactiveBold12());

  factory VNMText.interactiveBold16(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.interactiveBold16());

  factory VNMText.primaryBold12(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.primaryBold12());

  factory VNMText.primaryBold14(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.primaryBold14());

  factory VNMText.whiteBold14(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.whiteBold14());

  factory VNMText.whiteBold22(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.whiteBold22());

  factory VNMText.whiteBold24(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.whiteBold24());

  factory VNMText.white12(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.white12());

  factory VNMText.whiteBold11(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.whiteBold11());

  factory VNMText.message16(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.message16());

  factory VNMText.dropdown(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.s14());

  factory VNMText.selected(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.primaryMedium16());

  factory VNMText.hint14(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.hint14());

  factory VNMText.hint16(String? data,
          {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) =>
      VNMText(data ?? "",
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: VNMTextStyle.hint16());
}
