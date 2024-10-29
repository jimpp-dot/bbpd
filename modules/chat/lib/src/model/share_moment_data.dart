import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
part 'share_moment_data.g.dart';

/// @Author bobzhou
/// @Description
/// @Date 2022-03-31 16:21

@JsonSerializable(createToJson: false)
class ShareMomentData {
  //List<String> _keys = ['topic_id', 'uid', 'name', 'icon', 'content', 'atype', 'attach', 'cover'];

  /// 动态ID
  @JsonKey(name: 'topic_id')
  final int topicId;
  final int uid;
  final String name;

  /// 备注名

  final String icon;

  final String content;

  /// 发布动态的附件类型（picture, video, text)
  final String atype;

  /// 目前作品也属于atype=video（服务端暂时不支持下发atype=work）,这里区分下是否是作品
  final bool isWork;

  // 动态附加数据, 图片，video，audio取第一个
  final List<String?>? attach;

  final String cover;

  @JsonKey(name: 'system_rcmd')
  final int systemRcmd; // 1-系统推荐，0-用户分享

  @JsonKey(name: 'profile_audio')
  final String profileAudio; // 用户资料语音

  @JsonKey(name: 'profile_audio_duration')
  final int profileAudioDuration; // 用户资料语音

  ShareMomentData(
      {this.topicId = 0,
      this.uid = 0,
      this.name = '',
      this.icon = '',
      this.content = '',
      this.atype = '',
      this.isWork = false,
      this.attach,
      this.cover = '',
      this.systemRcmd = 0,
      this.profileAudio = '',
      this.profileAudioDuration = 0});

  factory ShareMomentData.fromJson(Map<String, dynamic> json) =>
      _$ShareMomentDataFromJson(json);

  /// 系统推荐的 动态消息
  bool get recommend => systemRcmd == 1;

  /// 系统推荐的 动态消息 中是否有用户资料语音
  bool get hasProfileAudio =>
      profileAudio.isNotEmpty && profileAudioDuration > 0;
}
