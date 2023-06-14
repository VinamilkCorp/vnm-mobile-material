import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/notifiers.dart';
import '../../../extension/change_notifier.dart';
import '../../styles/color.dart';
import '../empty_data_view.dart';
import '../loading.dart';

class StreamRefreshView<T> extends StatefulWidget {
  final String? emptyText;
  final String? emptyTitle;
  final Stream<T?> Function() stream;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Widget Function(BuildContext context, T? data)? headerBuilder;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context)? loadingBuilder;

  const StreamRefreshView(
      {super.key,
      required this.stream,
      required this.builder,
      this.headerBuilder,
      this.loadingBuilder,
      this.emptyText,
      this.emptyTitle,
      this.backgroundColor,
      this.indicatorColor});

  @override
  _StreamRefreshViewState<T> createState() => _StreamRefreshViewState<T>();
}

class _StreamRefreshViewState<T> extends State<StreamRefreshView<T>> {
  final TickNotifier refresher = TickNotifier();

  String get _emptyTitle => widget.emptyTitle ?? "";

  String get _emptyText => widget.emptyText ?? "";

  Color? get _backgroundColor => widget.backgroundColor;

  Color get _indicatorColor => widget.indicatorColor ?? VNMColor.primary();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: MultiProvider(
        providers: [refresher.create<TickNotifier>()],
        builder: (context, child) {
          return Consumer<TickNotifier>(
            builder: (context, notifier, _) {
              var valueKey = notifier.value;
              return StreamBuilder<T?>(
                  key: ValueKey(valueKey),
                  stream: widget.stream(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      if (widget.loadingBuilder != null)
                        return widget.loadingBuilder!(context);
                      return _buildLoading();
                    }
                    return _buildCompletedData(snap.data);
                  });
            },
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return SafeArea(child: LoadingView(indicatorColor: _indicatorColor));
  }

  Widget _buildEmpty() {
    return LayoutBuilder(builder: (context, box) {
      return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: box.maxHeight,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: EmptyDataView(emptyTitle: _emptyTitle, emptyText: _emptyText),
        ),
      );
    });
  }

  Widget _buildCompletedData(T? data) {
    Widget child = SizedBox();
    if (data == null || (data is List && data.isEmpty))
      child = _buildEmpty();
    else
      child = widget.builder(context, data);

    return Column(
      children: [
        if (widget.headerBuilder != null) widget.headerBuilder!(context, data),
        Expanded(
            child: RefreshIndicator(
          onRefresh: () async => refresher.change(),
          child: child,
        )),
      ],
    );
  }
}
