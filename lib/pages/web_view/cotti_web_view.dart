import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/12 8:30 PM
class CottiWebView extends StatefulWidget {
  final String url;

  const CottiWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<CottiWebView> createState() => _CottiWebViewState();
}

class _CottiWebViewState extends State<CottiWebView> {
  late final WebViewController _webViewController;
  String? title;

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: title,
      child: _buildWebView(),
    );
  }

  Widget _buildWebView() {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: onWebViewCreated,
      onPageFinished: onPageFinished,
      gestureNavigationEnabled: true,
      javascriptChannels: createJavascriptChannels(),
    );
  }

  void onWebViewCreated(WebViewController webViewController) async {
    _webViewController = webViewController;
  }

  onPageFinished(url) async {
    title = await _webViewController.getTitle();
    setState(() {});
  }

  Set<JavascriptChannel> createJavascriptChannels() {
    List<JavascriptChannel> list = <JavascriptChannel>[];
    return list.toSet();
  }
}
