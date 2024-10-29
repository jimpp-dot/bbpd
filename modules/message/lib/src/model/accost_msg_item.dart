import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accost_msg_item.g.dart';

@JsonSerializable()
class AccostMsgItem {
  String? content;

  @JsonKey(name: 'msg_id')
  int msgId = 0;

  int state = 0; //状态，0审核中，1通过，2失败

  int type = 0; //0暂无，1文字，2语音，3图片

  @JsonKey(ignore: true)
  AccostMsgItem? _backUpData;

  bool get hasData => content != null && content!.isNotEmpty;

  bool get isText => type == 1 && hasData;

  bool get isVoice => type == 2 && hasData;

  bool get isImage => type == 3 && hasData;

  bool get dataChanged {
    return content != _backUpData?.content || type != _backUpData?.type;
  }

  void backUp() {
    _backUpData = AccostMsgItem.fromJson(_$AccostMsgItemToJson(this));
  }

  AccostMsgItem copy() {
    return AccostMsgItem.fromJson(_$AccostMsgItemToJson(this));
  }

  AccostMsgItem.empty({this.msgId = 0});

  AccostMsgItem(this.content, this.msgId, this.state, this.type);

  factory AccostMsgItem.fromJson(Map<String, dynamic> json) =>
      _$AccostMsgItemFromJson(json);
}
