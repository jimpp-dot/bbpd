import 'package:shared/model/user_bean.dart';
import 'package:shared/src/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'base_moment_bean.g.dart';

const String FEED_ID_KEY = 'feed_id_v1_';
const String FEED_ID_PREV_KEY = 'prev_feed_id_v1_';
const String MESSAGE_ID_KEY = 'msg_id_';

/// 最近一次动态发布的人和头像response
@JsonSerializable()
class RecentTopicResponse extends BaseResponse {
  final UserBean? data;

  RecentTopicResponse({super.success, super.msg, this.data});

  factory RecentTopicResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentTopicResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecentTopicResponseToJson(this);
}

/// 未读消息response
@JsonSerializable()
class UnreadMessagesResponse extends BaseResponse {
  final UnreadMessage? data;

  UnreadMessagesResponse({bool success = false, String msg = '', this.data})
      : super(msg: msg, success: success);

  factory UnreadMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreadMessagesResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UnreadMessagesResponseToJson(this);
}

@JsonSerializable()
class UnreadMessage {
  @JsonKey(fromJson: Util.parseInt)
  final int num;

  UnreadMessage(this.num);

  factory UnreadMessage.fromJson(Map<String, dynamic> json) =>
      _$UnreadMessageFromJson(json);

  Map<String, dynamic> toJson() => _$UnreadMessageToJson(this);
}
