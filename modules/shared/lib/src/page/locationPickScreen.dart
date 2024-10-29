import 'dart:async';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 位置选择
class LocationPickScreen extends StatefulWidget {
  final String url;
  final String? title;

  static Future openLocationPickScreen(BuildContext context, String url,
      {String? title}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LocationPickScreen(
          url: url,
          title: title,
        ),
        settings: const RouteSettings(name: '/location'),
      ),
    );
  }

  const LocationPickScreen({Key? key, required this.url, this.title})
      : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<LocationPickScreen> {
  bool _loading = true;
//  int _timer = 0;
  late String _url;
  late String _title;
//  final flutterWebviewPlugin = FlutterWebviewPlugin();
//  StreamSubscription<String> _onUrlChanged;
//  StreamSubscription<WebViewStateChanged> _onStateChanged;
  WebViewController? _webViewController;

  @override
  void initState() {
    _url = widget.url;
    _title = widget.title ?? R.string('order_address');

//    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
//      this._url = url;
//
//      if (Platform.isAndroid && url.startsWith('react-js-navigation')) {
//        Uri uri = Uri.parse(url);
//        if (uri.host == 'postmessage') {
//          String query = Uri.decodeComponent(uri.query);
//          Map result;
//          try {
//            if (query != null && query.isNotEmpty) {
//              result = json.decode(query);
//            }
//          } catch (e) {}
//
//          Navigator.of(context).pop(result);
//        }
//      }
//    });
//    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
//      if (state.type == WebViewState.finishLoad) {
//        String js = "window.originalPostMessage = window.postMessage;" +
//            "window.postMessage = function(data){ " +
//            "window.location = 'react-js-navigation://postMessage?' + encodeURIComponent(String(JSON.stringify(data))); }" +
//            "";
//        flutterWebviewPlugin.evalJavascript(js);
//      }
//
//      if (Platform.isIOS) {
//        Uri uri = Uri.parse(state.url);
//        if (state.type == WebViewState.shouldStart && uri.host == 'postmessage') {
//          String query = Uri.decodeComponent(uri.query);
//          Map result;
//          try {
//            if (query != null && query.isNotEmpty) {
//              result = json.decode(query);
//            }
//          } catch (e) {}
//
//          Navigator.of(context).pop(result);
//        }
//        Log.d("${state.type}, ${state.navigationType}, ${state.url}");
//      }
//    });
    super.initState();
  }

  @override
  void dispose() {
//    _onUrlChanged.cancel();
//    _onStateChanged.cancel();
//    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  Widget _buildLoading(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(_title),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(_title),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Offstage(
                offstage: _loading,
                child: WebView(
                  initialUrl: _url,
                  debuggingEnabled: true,
                  onWebViewCreated: _onWebViewCreated,
                  onPageFinished: _onPageFinished,
                  javascriptChannels: {_handleJsData()},
                )),
            Offstage(
                offstage: !_loading,
                child: const Center(
                  child: CircularProgressIndicator(),
                ))
          ],
        ));

//    return WebviewScaffold(
//      url: this._url,
//      withJavascript: true,
//      enableAppScheme: false,
//      withZoom: true,
//      appBar: BaseAppBar(_title),
//    );
  }

  void _onWebViewCreated(WebViewController controller) {
    _webViewController = controller;
  }

  void _onPageFinished(String url) {
    setState(() {
      _loading = false;
    });
  }

  JavascriptChannel _handleJsData() {
    return JavascriptChannel.BRIDGE((jsMsg) {
      Log.d("LocationPickScreen == JsMsg ==>${jsMsg.message}");
      Map? result;
      try {
        if (jsMsg.message.isNotEmpty) {
          result = json.decode(jsMsg.message);
        }
      } catch (e) {}
      Navigator.of(context).pop(result);
    });
  }
}
