// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:shared/shared.dart';
import 'package:shared/util/log/web_console/web_console_widget.dart';
import 'package:flutter/material.dart';
import '../../log/widget/log_console.dart';
import 'http_log_console.dart';
import 'socket_log_console.dart';

import 'package:shared/util/developer/guagua/pluggable.dart';

class HttpLogPlugin implements Pluggable {
  @override
  ImageProvider<Object>? get iconImageProvider => null;

  @override
  String get name => 'httplog';

  @override
  String get displayName => 'Http Log';

  @override
  void onTrigger() async {
    if (_active) return;

    _active = true;
    DialogTransition.scaleShow(
            context: Constant.context,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 400),
            builder: (context) => const HttpLogConsole())
        .then((value) => _active = false);
  }

  @override
  IconData get iconData => Icons.network_check;

  bool _active = false;
}

class ConsoleLogPlugin implements Pluggable {
  @override
  ImageProvider<Object>? get iconImageProvider => null;

  @override
  String get name => 'consolelog';

  @override
  String get displayName => 'Console Log';

  @override
  void onTrigger() async {
    if (_active) return;

    _active = true;
    DialogTransition.scaleShow(
            context: Constant.context,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 400),
            builder: (context) => const LogConsole())
        .then((value) => _active = false);
  }

  @override
  IconData get iconData => Icons.network_ping;

  bool _active = false;
}

class WebConsolePlugin implements Pluggable {
  @override
  ImageProvider<Object>? get iconImageProvider => null;

  @override
  String get name => 'WebConsolePlugin';

  @override
  String get displayName => 'Web Console';

  @override
  void onTrigger() async {
    if (_active) return;

    _active = true;
    await Navigator.of(Constant.context).push(MaterialPageRoute(
      builder: (context) => const WebConsoleWidget(),
      settings: const RouteSettings(name: '/webconsole'),
    ));
    _active = false;
  }

  @override
  IconData get iconData => Icons.adb_rounded;

  bool _active = false;
}

class RoomScoketLogPlugin implements Pluggable {
  RoomScoketLogPlugin() {
    SocketLog.instance?.init();
  }
  @override
  ImageProvider<Object>? get iconImageProvider => null;

  @override
  String get name => 'socketlog';

  @override
  String get displayName => 'Socket Log';

  @override
  void onTrigger() async {
    if (_active) return;

    _active = true;
    DialogTransition.scaleShow(
            context: Constant.context,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 400),
            builder: (context) => const SocketLogConsole())
        .then((value) => _active = false);
  }

  @override
  IconData get iconData => Icons.legend_toggle;

  bool _active = false;
}
