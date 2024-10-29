import 'package:shared/shared.dart';
import 'package:shared/src/page/box/global_app_anim_banner_widget.dart';
import 'package:shared/src/page/box/global_app_anim_full_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GlobalAppAnimWidget extends StatefulWidget {
  const GlobalAppAnimWidget({Key? key}) : super(key: key);

  @override
  _GlobalAppAnimWidgetState createState() => _GlobalAppAnimWidgetState();
}

class _GlobalAppAnimWidgetState extends State<GlobalAppAnimWidget> {
  final List<Map> _list = []; //全房间通知
  Map? _currentItem;

  @override
  void initState() {
    super.initState();
    eventCenter.addListeners([EventConstant.EventAppAnim], _onAppAnimNotify);
  }

  @override
  void dispose() {
    eventCenter.removeListeners([EventConstant.EventAppAnim], _onAppAnimNotify);
    super.dispose();
  }

  void _onAppAnimNotify(String type, dynamic data) {
    // Log.d('app.anim _onAllRoomNotify data = ${data.toString()} ');
    if (_list.isEmpty || Util.appState != AppLifecycleState.resumed) return;

    if (data == null) return;

    if (data is! List) return;

    try {
      List newItems = data;
      for (int i = 0; i < newItems.length; i++) {
        Map item = newItems[i];
        if ('app.anim.banner' == item['type'] ||
            'app.anim.fullscreen' == item['type']) {
          _list.add(item);
        }
      }
    } catch (e) {
      Log.d(e);
      return;
    }

    if (_currentItem == null && _list.isNotEmpty) {
      setState(() {
        _currentItem = _list.removeAt(0);
      });
    }
  }

  _onComplete(String unique) {
    // Log.d("GlobalAppAnimWidget app.anim _onComplete unique=$unique");
    if (!mounted) return;
    setState(() {
      _currentItem = null;
    });

    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (mounted && _currentItem == null && _list.isNotEmpty) {
        setState(() {
          _currentItem = _list.removeAt(0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentItem == null) {
      return Container();
    }
    // Log.d("GlobalAppAnimWidget app.anim type=${this._currentItem['type']}");
    if ('app.anim.banner' == _currentItem?['type']) {
      return GlobalAppBannerAnimWidget(
        data: _currentItem!,
        onComplete: () {
          _onComplete('app.anim.banner');
        },
      );
    } else if ('app.anim.fullscreen' == _currentItem?['type']) {
      return GlobalAppAnimFullWidget(
        data: _currentItem!,
        onComplete: () {
          _onComplete('app.anim.fullscreen');
        },
      );
    }

    return Container();
  }
}
