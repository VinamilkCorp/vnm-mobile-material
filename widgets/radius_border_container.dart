import 'package:flutter/material.dart';

class RadiusBorderContainer extends Container {
  late final EdgeInsetsGeometry _padding;

  RadiusBorderContainer({super.child, EdgeInsets? padding})
      : this._padding = padding ?? EdgeInsets.only(top: 12);

  @override
  EdgeInsetsGeometry? get margin => EdgeInsets.only(top: 16);

  @override
  EdgeInsetsGeometry? get padding => _padding;

  @override
  Decoration? get decoration => BoxDecoration(
          color: Color(0xffF1F1F1),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(blurRadius: 60, color: Color(0x10273E).withOpacity(0.2))
          ]);
}
