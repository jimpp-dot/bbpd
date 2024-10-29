import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auto_reply_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AutoReplyItem {
  String? content;
  int id;
  int state; //状态，0审核中，1通过，2失败
  int contentType; //0暂无，1文字，2语音，3图片
  String? scene;
  int sceneType; //2.收到指定礼物时
  List<int>? giftIds;

  @JsonKey(ignore: true)
  String? gsReplyCount;
  @JsonKey(ignore: true)
  String? userReplyRate;

  @JsonKey(ignore: true)
  int subIndex = 0;

  @JsonKey(ignore: true)
  AutoReplyItem? _backUpData;

  bool get hasData => content != null && content!.isNotEmpty;

  bool get isText => contentType == 1 && hasData;

  bool get isVoice => contentType == 2 && hasData;

  bool get isImage => contentType == 3 && hasData;

  bool get designatedGift => sceneType == 2; //收到指定礼物

  bool get noReply => sceneType == 6; //3分钟内未回复私聊

  bool get dataChanged {
    if (designatedGift) {
      if (!const ListEquality().equals(giftIds, _backUpData?.giftIds)) {
        return true;
      }
    }
    return contentChanged;
  }

  bool get contentChanged {
    return content != _backUpData?.content ||
        contentType != _backUpData?.contentType;
  }

  void backUp() {
    _backUpData = AutoReplyItem(content, id, state, contentType, scene,
        sceneType, giftIds != null ? List<int>.from(giftIds!) : null);
  }

  AutoReplyItem(this.content, this.id, this.state, this.contentType, this.scene,
      this.sceneType, this.giftIds);

  factory AutoReplyItem.fromJson(Map<String, dynamic> json) =>
      _$AutoReplyItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AutoReply {
  String scene;
  int sceneType; //2.收到指定礼物时
  List<AutoReplyItem> items;
  String gsReplyCount;
  String userReplyRate;

  bool get noReply => sceneType == 6; //3分钟内未回复私聊

  AutoReply(this.scene, this.sceneType, this.items, this.gsReplyCount,
      this.userReplyRate);

  factory AutoReply.fromJson(Map<String, dynamic> json) =>
      _$AutoReplyFromJson(json);
}
