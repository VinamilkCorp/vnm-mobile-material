import 'package:flutter/material.dart';
import 'package:vinamilk_sfa/vnm/material/styles/color.dart';
import 'package:vinamilk_sfa/vnm/material/widgets/text_view.dart';

class VNMBottomDialog extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? height;

  static Future<T?> show<T>(BuildContext context,
      {String? title, Widget? child, bool? isDismissible, double? height}) {
    return showModalBottomSheet<T>(
        backgroundColor: Colors.transparent,
        isDismissible: isDismissible ?? true,
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return VNMBottomDialog(
              title: title, height: height ?? 400, child: child);
        });
  }

  const VNMBottomDialog({super.key, this.title, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: VNMColor.white(),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: VNMText.sBold16(title),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CloseButton(),
              )
            ],
          ),
          Divider(
            color: VNMColor.border(),
            height: 1,
          ),
          if (child != null) child!
        ],
      ),
    );
  }
}
