import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../styles/color.dart';

class LoadingView extends StatelessWidget {
  final Color? indicatorColor;

  const LoadingView({super.key, this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    Color color = indicatorColor ?? VNMColor.primary();
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: SpinKitFadingCircle(
        size: 50,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: index.isEven ? color : color.withOpacity(0.5),
            ),
          );
        },
      ),
    );
  }
}
