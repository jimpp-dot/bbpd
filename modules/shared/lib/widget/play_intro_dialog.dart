import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../shared.dart';

/// 玩法\规则说明
///
class PlayIntroDialog extends StatefulWidget {
  final String title;
  final String url;

  const PlayIntroDialog(this.title, this.url, {super.key});

  static show(BuildContext context, String title, String url) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            final ThemeData theme = Theme.of(context);
            final pageChild = PlayIntroDialog(title, url);
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: child,
        );
      },
      useRootNavigator: true,
      routeSettings: null,
    );
  }

  @override
  _PlayIntroDialogState createState() => _PlayIntroDialogState();
}

class _PlayIntroDialogState extends State<PlayIntroDialog> {
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  _onCloseTaped() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 440,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12, top: 24, right: 12),
                    child: WebView(
                      initialUrl: widget.url,
                      onWebViewCreated: (WebViewController webViewController) {
                        _webViewController = webViewController;
                      },
                      navigationDelegate: (NavigationRequest request) {
                        return NavigationDecision.navigate;
                      },
                    ),
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              top: 2,
              end: 6,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _onCloseTaped,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: R.img(
                    'close_icon.svg',
                    width: 16,
                    height: 16,
                    color: Colors.black,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
