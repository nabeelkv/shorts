import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shorts/provider/extensions.dart';
import 'package:webview_flutter/webview_flutter.dart';

AppExtensions extensions = AppExtensions();

class ExternalWebView extends StatefulWidget {
  final String url;
  const ExternalWebView({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<ExternalWebView> createState() => _ExternalWebViewState();
}

class _ExternalWebViewState extends State<ExternalWebView> {
  int position = 1;
  final key = UniqueKey();
  late WebViewController _controller;
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  _showPopupMenu() {
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(25.0, 0.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        const PopupMenuItem<String>(value: '1', child: Text('Refresh')),
        const PopupMenuItem<String>(value: '2', child: Text('Copy link')),
        const PopupMenuItem<String>(value: '3', child: Text('Open in browser')),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;
      if (itemSelected == "1") {
        _controller.reload();
      } else if (itemSelected == "2") {
        extensions.copyLink(widget.url, context);
      } else if (itemSelected == "3") {
        extensions.openExternalURL(widget.url, context);
      }
    });
  }

  String getHostName(str) {
    Uri newURI = Uri.parse(str);
    return newURI.host;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getHostName(widget.url.toString()),
          style: const TextStyle(fontSize: 13.0),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _showPopupMenu(),
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
        elevation: 1,
      ),
      body: IndexedStack(index: position, children: <Widget>[
        WebView(
          key: key,
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          zoomEnabled: false,
          onPageFinished: doneLoading,
          onPageStarted: startLoading,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _controllerCompleter.future.then((value) => _controller = value);
            _controllerCompleter.complete(webViewController);
          },
        ),
        const LinearProgressIndicator(),
      ]),
    );
  }
}
