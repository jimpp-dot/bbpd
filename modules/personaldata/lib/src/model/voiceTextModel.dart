import 'package:shared/shared.dart';

class VoiceTextModelRsp {
  bool success = false;
  List<VoiceTextModel> dialogs = [];
  bool more = false;

  VoiceTextModelRsp.fromJson(Map json) {
    success = json['success'];
    Map data = json['data'];
    List itemList = data['list'];
    for (var element in itemList) {
      VoiceTextModel dialog = VoiceTextModel.fromJson(element);
      dialogs.add(dialog);
    }
    more = data['more'];
  }
}

class VoiceTextModel {
  int? id;
  String? title;
  String? subtitle;
  String? content;

  VoiceTextModel({this.id = 0, this.title, this.subtitle, this.content});

  VoiceTextModel.fromJson(Map json) {
    id = Util.parseInt(json['id']);
    title = json['title'];
    subtitle = json['subtitle'];
    content = json['content'];
  }
}

class AudioWordsInfoModel {
  String? words;
  int? firstMin;
  int? secondMin;

  AudioWordsInfoModel({this.words, this.firstMin, this.secondMin});

  AudioWordsInfoModel.fromJson(Map json) {
    secondMin = Util.parseInt(json['second_min_secs']);
    firstMin = Util.parseInt(json['first_min_secs']);
    words = json['words'];
  }
}

class MarkDownInfo {
  String? title;
  int? countdown;
  String? rules;

  MarkDownInfo({this.title, this.countdown, this.rules});

  MarkDownInfo.fromJson(Map json) {
    title = json['title'];
    countdown = Util.parseInt(json['countdown']);
    rules = json['rules'];
  }
}
