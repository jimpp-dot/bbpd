// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'share_moment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareMomentData _$ShareMomentDataFromJson(Map<String, dynamic> json) =>
    ShareMomentData(
      topicId: json['topic_id'] as int? ?? 0,
      uid: Util.parseInt(json['uid']),
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      content: json['content'] as String? ?? '',
      atype: json['atype'] as String? ?? '',
      isWork: json['isWork'] as bool? ?? false,
      attach:
          (json['attach'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      cover: json['cover'] as String? ?? '',
      systemRcmd: json['system_rcmd'] as int? ?? 0,
      profileAudio: json['profile_audio'] as String? ?? '',
      profileAudioDuration: json['profile_audio_duration'] as int? ?? 0,
    );
