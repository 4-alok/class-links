import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DocumentWebView extends StatefulWidget {
  final String url;
  const DocumentWebView({required this.url, Key? key}) : super(key: key);

  @override
  State<DocumentWebView> createState() => _DocumentWebViewState();
}

class _DocumentWebViewState extends State<DocumentWebView> {
  late final WebViewController controller;
  final webProgress = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const FaIcon(FontAwesomeIcons.times)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: ValueListenableBuilder<double>(
              valueListenable: webProgress,
              builder: (context, value, child) => LinearProgressIndicator(
                value: value,
                minHeight:
                    (webProgress.value == 1 || webProgress.value == 0) ? .1 : 4,
                backgroundColor: Colors.transparent,
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
        body: WebView(
          initialUrl: widget.url,
          onWebViewCreated: (controller) => this.controller = controller,
          onProgress: (progress) => webProgress.value = progress / 100,
          navigationDelegate: (NavigationRequest request) =>
              NavigationDecision.navigate,
          javascriptMode: JavascriptMode.unrestricted,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      );
}
