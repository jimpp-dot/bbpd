import 'package:shared/shared.dart' hide MessageType;
import 'package:json_annotation/json_annotation.dart';

part 'true_word_beans.g.dart';

@JsonSerializable()
class TrueWordSheetItem {
  String type;
  String desc;

  TrueWordSheetItem(this.type, this.desc);

  factory TrueWordSheetItem.fromJson(Map<String, dynamic> json) =>
      _$TrueWordSheetItemFromJson(json);
}

@JsonSerializable()
class TrueWordMsgData {
  @JsonKey(name: 'source')
  int askUid;

  @JsonKey(name: 'target')
  int answerUid;

  @JsonKey(fromJson: TrueWordMsgData.parseMode)
  TrueWordMode mode;

  @JsonKey(fromJson: TrueWordMsgData.parseType)
  TrueWordMsgType type;

  String content;
  TrueWordQuestion? question;

  TrueWordMsgData(this.askUid, this.answerUid, this.mode, this.type,
      this.content, this.question);

  factory TrueWordMsgData.fromJson(Map<String, dynamic> json) =>
      _$TrueWordMsgDataFromJson(json);

  static TrueWordMode parseMode(dynamic value) {
    int modeValue = Util.parseInt(value);

    if (modeValue == 1) {
      return TrueWordMode.ask;
    } else {
      return TrueWordMode.answer;
    }
  }

  static TrueWordMsgType parseType(dynamic value) {
    String typeStr = Util.notNullStr(value);
    if (typeStr == 'true_word_private') {
      return TrueWordMsgType.private;
    } else if (typeStr == 'true_word_open') {
      return TrueWordMsgType.open;
    } else if (typeStr == 'true_word_private_invite') {
      return TrueWordMsgType.privateInvite;
    } else {
      return TrueWordMsgType.normal;
    }
  }

  static String typeToString(TrueWordMsgType? type) {
    switch (type) {
      case TrueWordMsgType.private:
        return 'true_word_private';
      case TrueWordMsgType.normal:
        return 'true_word_normal';
      case TrueWordMsgType.open:
        return 'true_word_open';
      case TrueWordMsgType.privateInvite:
        return 'true_word_private_invite';
      default:
        return 'true_word_normal';
    }
  }
}

@JsonSerializable()
class TrueWordQuestion {
  String content; //问题
  List<String> answers; //答案

  @JsonKey(fromJson: TrueWordMsgData.parseType)
  TrueWordMsgType type; //问题类型

  TrueWordQuestion(this.content, this.answers, this.type);

  factory TrueWordQuestion.fromJson(Map<String, dynamic> json) =>
      _$TrueWordQuestionFromJson(json);
}

enum TrueWordMsgType {
  private, //私密
  normal, //经典
  open, //公开
  privateInvite //私密邀请
}

enum TrueWordMode {
  ask, //问
  answer, //答
}
