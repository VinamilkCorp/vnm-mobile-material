import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class VNMScaffold extends Scaffold {
  VNMScaffold(
      {super.key,
      super.body,
      super.backgroundColor,
      super.bottomNavigationBar,
      super.floatingActionButton,
      super.floatingActionButtonLocation,
      super.appBar});

  factory VNMScaffold.primary(
      {Widget? body,
      Widget? bottomNavigationBar,
      PreferredSizeWidget? appBar}) {
    return VNMScaffold(
      backgroundColor: VNMColor.primary(),
      body: body,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  factory VNMScaffold.white(
      {Widget? body,
      Widget? bottomNavigationBar,
      PreferredSizeWidget? appBar}) {
    return VNMScaffold(
      backgroundColor: VNMColor.white(),
      body: body,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  factory VNMScaffold.fortune(
      {Widget? body,
      Widget? bottomNavigationBar,
      PreferredSizeWidget? appBar,
      Widget? floatingActionButton,
      FloatingActionButtonLocation? floatingActionButtonLocation}) {
    return VNMScaffold(
      backgroundColor: VNMColor.fortuneBackground(),
      body: body,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
