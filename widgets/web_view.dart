import 'package:flutter/material.dart';
import 'package:vinamilk_b2b/vnm/core/global/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VNMWebView extends StatelessWidget {
  final String htmlString;
  final EdgeInsets? padding;
  final Function(String url)? onPageStarted;
  final Function(String url)? onPageFinished;

  const VNMWebView(
      {super.key,
      required this.htmlString,
      this.padding,
      this.onPageStarted,
      this.onPageFinished});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: WebViewWidget(
            controller: WebViewController()
              ..loadHtmlString(htmlString)
              ..setNavigationDelegate(NavigationDelegate(
                  onWebResourceError: (WebResourceError error) {
                    VNMLogger().error(error.description);
                  },
                  onPageStarted: onPageStarted,
                  onPageFinished: onPageFinished))));
  }
}
