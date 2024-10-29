import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

abstract class ChatScreenInterface extends StatefulWidget {
  int get targetId;
  String get type;
  String? get title;
  SkillInfo? get skillInfo;
  String? get refer;
  bool get isFromHiList;
  int get official;
  set official(int value);
  String? get extType; //拓展字段
  bool get fromRoomPanel;
  int get hiMatchScore;
  VoidCallback? get onPageLoad;

  const ChatScreenInterface({super.key});
}
