import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rank/rank.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> with ReloadStateMixin {
  final GlobalKey _mainPageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: SafeArea(
        child: MainPageV4(key: _mainPageKey),
      ),
    );
  }

  @override
  void reload({bool force = true, animated = true}) {
    if (_mainPageKey.currentState != null) {
      (_mainPageKey.currentState as ReloadStateMixin).reload(force: force);
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    (_mainPageKey.currentState as ReloadStateMixin).scrollToTop();
  }
}
