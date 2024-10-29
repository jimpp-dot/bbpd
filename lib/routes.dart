import 'package:flutter/material.dart';
import 'package:message/message.dart';
import 'package:rank/rank.dart';

@Deprecated('Do not use, will remove in later version')
class NamedRoutes {
  static Route<dynamic>? getRoutes(RouteSettings settings) {
    if (settings.name == HiList.routeName &&
        settings.arguments is HiListArguments) {
      final HiListArguments args = settings.arguments as HiListArguments;

      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return HiList(
            data: args.data,
            title: args.title,
          );
        },
      );
    } else if (settings.name == RoomScreen.routeName &&
        settings.arguments is RoomScreenArgs) {
      final RoomScreenArgs args = settings.arguments as RoomScreenArgs;

      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return RoomScreen(
              tabs: args.tabs,
              showHead: args.showHead,
              title: args.title,
            );
          });
    }

    return null;
  }
}
