// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    topicId: Util.parseInt(json['topic_id']),
    uid: Util.parseInt(json['uid']),
    icon: Util.parseStr(json['icon']),
    name: Util.parseStr(json['name']),
    markName: Util.parseStr(json['mkname']),
    content: Util.parseStr(json['content']),
    toUid: Util.parseInt(json['to_uid']),
    toName: Util.parseStr(json['to_name']),
    toMarkName: Util.parseStr(json['to_mkname']),
    time: Util.parseInt(json['time']),
    commentId: Util.parseInt(json['cmtid']),
    status: Util.parseStr(json['status']),
    isInAudit: Util.parseStr(json['status']) == 'pending',
    fcState: Util.parseInt(json['fc_state']),
    likeNum: Util.parseInt(json['like_num']),
    isLike: Util.parseBool(json['is_like']),
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'topic_id': instance.topicId,
      'cmtid': instance.commentId,
      'uid': instance.uid,
      'icon': instance.icon,
      'name': instance.name,
      'mkname': instance.markName,
      'content': instance.content,
      'to_uid': instance.toUid,
      'to_name': instance.toName,
      'to_mkname': instance.toMarkName,
      'time': instance.time,
      'status': instance.status,
      'isInAudit': instance.isInAudit,
      'fcState': instance.fcState,
      'likeNum': instance.likeNum,
      'isLike': instance.isLike
    };
