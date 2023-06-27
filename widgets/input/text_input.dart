import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vinamilk_sfa/vnm/core/notifiers.dart';
import 'package:vinamilk_sfa/vnm/extension/change_notifier.dart';

import '../../styles/color.dart';
import '../../styles/text_style.dart';
import '../text_view.dart';

class TextInputValid {
  final bool Function(String text) onValid;
  final String message;

  TextInputValid({required this.onValid, required this.message});
}

class VNMTextInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final List<TextInputValid>? valid;

  const VNMTextInput(
      {super.key,
      this.labelText,
      this.hintText,
      this.controller,
      this.focusNode,
      this.textInputType,
      this.inputFormatters,
      this.valid});

  @override
  State<StatefulWidget> createState() => _VNMTextInputState();
}

class _VNMTextInputState extends State<VNMTextInput> {
  late final FocusNode focusNode;
  final BoolNotifier focus = BoolNotifier();
  final StringNotifier invalid = StringNotifier();
  late final TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();

    focus.value = false;
    focusNode.addListener(() {
      focus.setValue(focusNode.hasFocus);
      String? message;
      if (!focusNode.hasFocus) {
        String text = controller.text;
        message = widget.valid
            ?.firstWhereOrNull((t) => t.onValid(text) == false)
            ?.message;
      }
      invalid.setValue(message);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        focus.create<BoolNotifier>(),
        invalid.create<StringNotifier>(),
      ],
      builder: (context, child) {
        return Consumer<StringNotifier>(builder: (context, invalid, _) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              label: Consumer<BoolNotifier>(
                builder: (context, focus, _) {
                  return focus.isTrue || controller.text.isNotEmpty
                      ? (invalid.value == null
                          ? VNMText.subTitle17(widget.labelText)
                          : VNMText.error17(widget.labelText))
                      : (invalid.value == null
                          ? VNMText.hint14(widget.hintText ?? widget.labelText)
                          : VNMText.error(widget.labelText));
                },
              ),
              errorText: invalid.value,
              hintText: widget.hintText,
              hintStyle: VNMTextStyle.hint14(),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: VNMColor.textFieldBorder())),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: VNMColor.textFieldBorder())),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: VNMColor.primary())),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: VNMColor.error())),
            ),
          );
        });
      },
    );
  }
}
