import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/core.dart';
import 'basic/basic.dart';

class PhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;

  PhoneNumberInput({Key? key, required this.controller, this.enabled = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final RegExp validRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{9,10}$)');
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.text = VNPhoneFormatter().format(widget.controller.text);
  }

  String get VN_COUNTRY_CODE => "84";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VNMText(locale.phoneNumberInputLabel),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            TextFormField(
              focusNode: focusNode,
              keyboardType: TextInputType.phone,
              autofocus: false,
              enabled: widget.enabled,
              validator: _validate,
              controller: widget.controller,
              inputFormatters: [VNPhoneFormatter()],
              decoration: InputDecoration(
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 0, minHeight: 0),
                  prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                    Image.asset('icons/flags/png/vn.png',
                        package: 'country_icons', height: 20),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: VNMText('+$VN_COUNTRY_CODE'))
                  ])),
            ),
          ],
        ),
      ],
    );
  }

  String? _validate(String? value) {
    if (!widget.enabled) return null;
    var unformatted = (value ?? '').replaceAll(" ", "");
    if (unformatted.isEmpty) return locale.common_validate_required_field;
    if (!validRegExp.hasMatch(unformatted)) {
      return locale.requireValidPhoneInput;
    }
    return null;
    // return LocalizationUtil.getAppLocalizations().requireValidPhoneInput;
  }
}

class VNPhoneFormatter extends TextInputFormatter {
  String format(String value) {
    List<String> nums =
        value.replaceFirst("+84", "").replaceAll(RegExp(r'[\D]'), '').split("");
    if (nums.isEmpty) return nums.join("");
    if (nums.first == "0") nums.removeAt(0);

    if (nums.isEmpty) return nums.join("");
    if (nums.length > 3 && nums[3] != " ") {
      nums.insert(3, " ");
    }
    if (nums.length > 7 && nums[7] != " ") {
      nums.insert(7, " ");
    }
    return nums
        .getRange(0, min(nums.length, 12 - (nums.first == "9" ? 1 : 0)))
        .join("");
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
        text: format(text),
        selection: new TextSelection.collapsed(offset: format(text).length));
  }
}
