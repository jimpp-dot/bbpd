import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quick_msg_item.g.dart';

@JsonSerializable()
class QuickMsgItem {
  String? content;

  int id = 0;

  int type = 0; //0暂无，1文字，2语音

  @JsonKey(ignore: true)
  QuickMsgItem? _backUpData;

  bool get hasData => content != null && content!.isNotEmpty;

  bool get isText => type == 1 && hasData;

  bool get isVoice => type == 2 && hasData;

  bool get dataChanged {
    return content != _backUpData?.content || type != _backUpData?.type;
  }

  void backup() {
    _backUpData = QuickMsgItem.fromJson(_$QuickMsgItemToJson(this));
  }

  QuickMsgItem.empty({this.id = 0});

  QuickMsgItem(this.content, this.id, this.type);

  factory QuickMsgItem.fromJson(Map<String, dynamic> json) =>
      _$QuickMsgItemFromJson(json);
}
