import 'package:shared/src/util.dart';

class ScreenShowModel {
  bool? onMic;
  bool? welcome;

  ScreenShowModel.fromJson(Map json) {
    onMic = Util.parseBool(json['on_mic']);
    welcome = Util.parseBool(json['welcome']);
  }
}
