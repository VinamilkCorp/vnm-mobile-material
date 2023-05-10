import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'text_view.dart';

class EmptyDataView extends StatelessWidget {
  final String? emptyTitle;
  final String? emptyText;

  const EmptyDataView({super.key, this.emptyTitle, this.emptyText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          "assets/images/no_content_backup.svg",
          height: 300,
        ),
        if (emptyTitle != null)
          VNMText.sBold24(
            emptyTitle,
            textAlign: TextAlign.center,
          ),
        SizedBox(height: 6),
        if (emptyText != null)
          VNMText.message16(
            emptyText,
            textAlign: TextAlign.center,
          ),
        SizedBox(height: 20),
      ],
    );
  }
}
