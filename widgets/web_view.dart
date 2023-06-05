import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VNMWebView extends StatelessWidget {
  final String htmlString;
  final EdgeInsets? padding;

  const VNMWebView({super.key, required this.htmlString, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: WebViewWidget(
            controller: WebViewController()..loadHtmlString(htmlString)));
  }
}
