import 'dart:async';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared/shared.dart';

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

class PushUtils {
  static Future<bool> setBadge(int number) async {
    PushUtils.getLocalNotification().setBadgeNumber(number);
    return true;
  }

  static Future<int> getBadge() async {
    return PushUtils.getLocalNotification().getBadgeNumber();
  }

  static Future<bool> clear() async {
    PushUtils.setBadge(0);
    return true;
  }

  static Future onDidRecieveLocalNotification(int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  static FlutterLocalNotificationsPlugin getLocalNotification() {
    if (flutterLocalNotificationsPlugin == null) {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      var initializationSettingsAndroid = const AndroidInitializationSettings('ic_launcher');
      var initializationSettingsIOS = const IOSInitializationSettings();
      var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
      Future<dynamic> selectNotification(String string) async {
        SchemeUrlHelper.instance().checkSchemeUrlAndGo(Constant.context, string);
      }

      flutterLocalNotificationsPlugin!.initialize(initializationSettings, onSelectNotification: selectNotification);
    }

    return flutterLocalNotificationsPlugin!;
  }

  static String? _channelName;
  static String? _channelDesc;

  static Future<bool> presentLocationNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    if (Platform.isAndroid) {
      _channelName ??= await SharedAppPlugin.getMetadata('CHAT_MSG_CHANNEL_NAME');
      _channelDesc ??= await SharedAppPlugin.getMetadata('CHAT_MSG_CHANNEL_DESC');
    } else {
      _channelName = 'your channel name';
      _channelDesc = 'your channel description';
    }

    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('channel_chat_msg', _channelName!, _channelDesc!, importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    var plugin = PushUtils.getLocalNotification();
    await plugin.show(id, title, body, platformChannelSpecifics, payload: payload);

    return true;
  }
}
