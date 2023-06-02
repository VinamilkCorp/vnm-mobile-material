import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/notifiers.dart';
import '../../extension/change_notifier.dart';
import '../styles/color.dart';
import '../styles/text_style.dart';
import 'button/gesture_button.dart';
import 'text_view.dart';

class VNMTaberView extends StatefulWidget {
  final List<String> tabs;
  final Function(int index) onTabChanged;

  const VNMTaberView(
      {super.key, required this.tabs, required this.onTabChanged});

  @override
  State<StatefulWidget> createState() => _VNMTaberViewState();
}

class _VNMTaberViewState extends State<VNMTaberView> {
  List<GlobalKey> tabs = [];
  final IntNotifier tab = IntNotifier();
  final ScrollController tabsController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tab.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [tab.create<IntNotifier>()],
      builder: (context, child) {
        return Consumer<IntNotifier>(builder: (context, tab, _) {
          return SingleChildScrollView(
            controller: tabsController,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            child: _buildWrap(),
          );
        });
      },
    );
  }

  _buildWrap() {
    this.tabs = List.generate(widget.tabs.length, (_) => GlobalKey());

    return Wrap(
      children: widget.tabs.mapIndexed((index, text) {
        Color background =
            index == tab.value ? VNMColor.primary() : VNMColor.white();
        TextStyle style =
            index == tab.value ? VNMTextStyle.white14() : VNMTextStyle.s14();
        return Padding(
          key: this.tabs[index],
          padding: EdgeInsets.only(
              left: index == 0 ? 16 : 4,
              right: index == tabs.length - 1 ? 16 : 4),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: VNMColor.border()),
                color: background,
                borderRadius: BorderRadius.circular(8)),
            child: VNMGestureButton(
                onPressed: () => _onTabChanged(index),
                border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: VNMText(text, style: style),
                )),
          ),
        );
      }).toList(),
    );
  }

  _onTabChanged(int selected) {
    if (selected == tab.value) return;

    double totalWidth = 0;
    tabs.forEachIndexed((index, element) {
      if (index < selected) {
        totalWidth += element.currentContext?.size?.width ?? 0;
      }
    });
    totalWidth += (tabs[selected].currentContext?.size?.width ?? 0) * 0.5;
    double offset =
        max(totalWidth - MediaQuery.of(context).size.width / 2.0, 0);
    offset = min(offset, tabsController.position.maxScrollExtent);
    tabsController.animateTo(offset,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
    tab.setValue(selected);
    widget.onTabChanged(selected);
  }
}
