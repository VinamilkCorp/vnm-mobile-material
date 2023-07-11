import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vinamilk_sfa/core/notifiers.dart';
import 'package:vinamilk_sfa/extension/change_notifier.dart';
import 'package:vinamilk_sfa/material/style/color.dart';

import '../../../core/env.dart';
import '../../../extension/state.dart';
import '../basic/text_view.dart';

class PhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;

  PhoneNumberInput({Key? key, required this.controller, this.enabled = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput>
    with TickerProviderStateMixin {
  final RegExp validRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{9,10}$)');
  final FocusNode focusNode = FocusNode();
  late final AnimationController animation;
  final BoolNotifier _focus = BoolNotifier();

  Duration get duration => const Duration(milliseconds: 300);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.text = VNPhoneFormatter().format(widget.controller.text);
    animation = AnimationController(vsync: this, duration: duration);
    focusNode.addListener(() {
      _focus.setValue(focusNode.hasFocus);
    });
    if (widget.enabled == true) {
      focusNode.requestFocus();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        animation.forward();
      });
    } else {
      animation.value = 1;
    }
  }

  @override
  void dispose() {
    animation.dispose();
    widget.controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [_focus.create<BoolNotifier>()],
      builder: (context, child) {
        return ScaleTransition(
          scale: CurvedAnimation(curve: Curves.ease, parent: animation),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VNMText(locale.phone_number),
              const SizedBox(height: 8),
              Consumer<BoolNotifier>(
                builder: (context, focus, child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: focus.value == true
                                  ? VNMColor.textFieldBorder()
                                  : Colors.transparent)),
                      color: VNMColor.border(),
                    ),
                    child: child,
                  );
                },
                child: _buildTextField(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: TextInputType.phone,
      autofocus: false,
      enabled: widget.enabled,
      validator: _validate,
      controller: widget.controller,
      inputFormatters: [VNPhoneFormatter()],
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
            Image.asset('icons/flags/png/vn.png',
                package: 'country_icons', height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: VNMText('+${Env().VN_COUNTRY_CODE}'))
          ])),
    );
  }

  String? _validate(String? value) {
    if (!widget.enabled) return null;
    var unformatted = (value ?? '').replaceAll(" ", "");
    if (unformatted.isEmpty) return locale.validate_required_field;
    if (!validRegExp.hasMatch(unformatted)) {
      return locale.phone_number_invalid;
    }
    return null;
    // return  Localization().locale.phone_number_invalid;
  }
}

class VNPhoneFormatter extends TextInputFormatter {
  bool? allowFirstZero;

  VNPhoneFormatter({this.allowFirstZero});

  String format(String value) {
    bool allowFirstZero = this.allowFirstZero ?? false;
    List<String> nums =
        value.replaceFirst("+84", "").replaceAll(RegExp(r'[\D]'), '').split("");
    if (nums.isEmpty) return nums.join("");
    if (nums.first != "0" && allowFirstZero) nums.insert(0, "0");
    if (nums.first == "0" && !allowFirstZero) nums.removeAt(0);

    if (nums.isEmpty) return nums.join("");

    if (allowFirstZero) {
      if (nums.length > 4 && nums[4] != " ") {
        nums.insert(4, " ");
      }
      if (nums.length > 8 && nums[8] != " ") {
        nums.insert(8, " ");
      }
    } else {
      if (nums.length > 3 && nums[3] != " ") {
        nums.insert(3, " ");
      }
      if (nums.length > 7 && nums[7] != " ") {
        nums.insert(7, " ");
      }
    }

    return allowFirstZero
        ? nums.getRange(0, min(nums.length, 12)).join("")
        : nums.getRange(0, min(nums.length, 11)).join("");
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
