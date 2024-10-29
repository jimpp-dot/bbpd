import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 未成年人弹窗。有别于青少年模式弹窗，该弹窗是主动判断，强制性的
class MinorDialog extends StatelessWidget {
  static final String _keyTodayUsedMinutes =
      '${DateTime.now().toyyyyMMdd()}_minor_used_minutes';

  static void init() {
    if (Util.isLocale) {
      return;
    }

    Timer? timer;

    query(int used) async {
      XhrResponse response =
          await Xhr.postJson('${System.domain}youngmode/canuse', {
        'use_time': used.toString(),
      });
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true && res['data'] is Map) {
          int status = Util.parseInt(res['data']['status'], 1);
          String msg = res['data']['msg'];
          if (status == 0) {
            // 1 可以使用 0禁止使用
            timer?.cancel();
            _show(msg);
          }
        }
      }
    }

    // 启动时先查询一次
    int used = Config.getInt(_keyTodayUsedMinutes, 0);
    query(used);

    timer = Timer.periodic(const Duration(minutes: 1), (_) async {
      if (appStateObserver.value == AppLifecycleState.paused) {
        return;
      }
      int used = Config.getInt(_keyTodayUsedMinutes, 0);
      Config.set(_keyTodayUsedMinutes, (++used).toString());
      // 每隔10分钟上报查询一次
      if (used % 10 == 0) {
        query(used);
      }
    });
  }

  static _show(String content) {
    DialogQueue.root.enqueue(
      context: System.context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: MinorDialog(content: content),
        );
      },
    );
  }

  final String? content;

  const MinorDialog({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      content: content,
      negativeButton: null,
      positiveButton: PositiveButton(
        onPressed: () {
          SharedAppPlugin.exitApplication();
        },
      ),
    );
  }
}
