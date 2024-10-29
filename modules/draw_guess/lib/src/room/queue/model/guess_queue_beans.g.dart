// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guess_queue_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordCategoryDataResp _$WordCategoryDataRespFromJson(Map<String, dynamic> json) {
  return WordCategoryDataResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : WordCategoryList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

WordCategoryList _$WordCategoryListFromJson(Map<String, dynamic> json) {
  return WordCategoryList(
    json['list'] == null
        ? null
        : (json['list'] as List)
            .where((e) => e != null)
            .map((e) => WordCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

WordCategory _$WordCategoryFromJson(Map<String, dynamic> json) {
  return WordCategory(
    Util.parseInt(json['cate_id']),
    Util.parseStr(json['cate_name']),
    Util.parseInt(json['num']),
  );
}

GuessQueueResultRankData _$GuessQueueResultRankDataFromJson(
    Map<String, dynamic> json) {
  return GuessQueueResultRankData(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseBool(json['queue_suc']),
    Util.parseInt(json['liked_num']),
    Util.parseBool(json['follow']),
  );
}

GuessQueueResultRankList _$GuessQueueResultRankListFromJson(
    Map<String, dynamic> json) {
  return GuessQueueResultRankList(
    json['list'] == null
        ? null
        : (json['list'] as List)
            .where((e) => e != null)
            .map((e) =>
                GuessQueueResultRankData.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

GuessQueueResultRankRsp _$GuessQueueResultRankRspFromJson(
    Map<String, dynamic> json) {
  return GuessQueueResultRankRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : GuessQueueResultRankList.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

GuessQueueConfirmWordData _$GuessQueueConfirmWordDataFromJson(
    Map<String, dynamic> json) {
  return GuessQueueConfirmWordData(
    Util.parseStr(json['id']),
    Util.parseStr(json['word']),
    Util.parseStr(json['cate_id']),
  );
}

GuessQueueConfirmWordList _$GuessQueueConfirmWordListFromJson(
    Map<String, dynamic> json) {
  return GuessQueueConfirmWordList(
    json['list'] == null
        ? null
        : (json['list'] as List)
            .where((e) => e != null)
            .map((e) =>
                GuessQueueConfirmWordData.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

GuessQueueConfirmWordRsp _$GuessQueueConfirmWordRspFromJson(
    Map<String, dynamic> json) {
  return GuessQueueConfirmWordRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : GuessQueueConfirmWordList.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

DrawWordResp _$DrawWordRespFromJson(Map<String, dynamic> json) {
  return DrawWordResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : DrawWordData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

DrawWordData _$DrawWordDataFromJson(Map<String, dynamic> json) {
  return DrawWordData(
    Util.parseStr(json['word']),
    Util.parseStr(json['image']),
    json['prev'] == null
        ? null
        : GuessUserData.fromJson(json['prev'] as Map<String, dynamic>),
    json['next'] == null
        ? null
        : GuessUserData.fromJson(json['next'] as Map<String, dynamic>),
    Util.parseStr(json['originalWord']),
    json['current'] == null
        ? null
        : GuessUserData.fromJson(json['current'] as Map<String, dynamic>),
    json['original'] == null
        ? null
        : GuessUserData.fromJson(json['original'] as Map<String, dynamic>),
    Util.parseStr(json['nextWord']),
  );
}

GuessUserData _$GuessUserDataFromJson(Map<String, dynamic> json) {
  return GuessUserData(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
  );
}

GuessImgResp _$GuessImgRespFromJson(Map<String, dynamic> json) {
  return GuessImgResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : GuessImgData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

GuessImgData _$GuessImgDataFromJson(Map<String, dynamic> json) {
  return GuessImgData(
    Util.parseStr(json['image']),
    json['prev'] == null
        ? null
        : GuessUserData.fromJson(json['prev'] as Map<String, dynamic>),
    json['next'] == null
        ? null
        : GuessUserData.fromJson(json['next'] as Map<String, dynamic>),
    json['current'] == null
        ? null
        : GuessUserData.fromJson(json['current'] as Map<String, dynamic>),
  );
}
