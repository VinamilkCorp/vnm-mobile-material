import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color? indicatorColor;

  const LoadingView({super.key, this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12.withOpacity(0.1),
      alignment: Alignment.center,
      child: CircularProgressIndicator(color: indicatorColor),
    );
  }
}
