import 'package:flutter/material.dart';

import '../../../extension/widget.dart';
import 'future_refresh_view.dart';

class FutureRefreshListView<T> extends StatelessWidget {
  final String? emptyText;
  final String? emptyTitle;
  final Future<List<T>?> Function() future;
  final List<T>? loadingItems;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Widget Function(BuildContext context, int index, T data) itemBuilder;
  final Widget Function(BuildContext context)? headerBuilder;
  final Widget Function(BuildContext context, int index, T data)?
      separatorBuilder;
  final EdgeInsets? padding;
  final EdgeInsets? listViewPadding;
  final bool? primary;
  final bool? shrinkWrap;

  const FutureRefreshListView(
      {super.key,
      required this.future,
      required this.itemBuilder,
      this.emptyText,
      this.emptyTitle,
      this.backgroundColor,
      this.indicatorColor,
      this.headerBuilder,
      this.separatorBuilder,
      this.loadingItems,
      this.padding,
      this.listViewPadding,
      this.primary,
      this.shrinkWrap});

  @override
  Widget build(BuildContext context) {
    return FutureRefreshView<List<T>>(
      emptyTitle: emptyTitle,
      emptyText: emptyText,
      future: future,
      builder: (context, data) {
        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: ListView.separated(
              padding: listViewPadding,
              primary: primary ?? true,
              shrinkWrap: shrinkWrap ?? false,
              itemBuilder: (context, index) =>
                  itemBuilder(context, index, data[index]),
              separatorBuilder: (context, index) => separatorBuilder == null
                  ? SizedBox()
                  : separatorBuilder!(context, index, data[index]),
              itemCount: data.length),
        );
      },
      loadingBuilder: loadingItems == null
          ? null
          : (context) {
              return Padding(
                padding: padding ?? EdgeInsets.zero,
                child: ListView.separated(
                    primary: primary ?? true,
                    shrinkWrap: shrinkWrap ?? false,
                    itemBuilder: (context, index) =>
                        itemBuilder(context, index, loadingItems![index])
                            .withShimmer(),
                    separatorBuilder: (context, index) =>
                        separatorBuilder == null
                            ? SizedBox()
                            : separatorBuilder!(
                                context, index, loadingItems![index]),
                    itemCount: loadingItems!.length),
              );
            },
    );
  }
}
