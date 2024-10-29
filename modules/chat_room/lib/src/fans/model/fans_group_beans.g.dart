// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fans_group_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarChallengeResp _$StarChallengeRespFromJson(Map<String, dynamic> json) {
  return StarChallengeResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : StarChallengeData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

StarChallengeData _$StarChallengeDataFromJson(Map<String, dynamic> json) {
  return StarChallengeData(
    json['user_info'] == null
        ? null
        : BasicInfo.fromJson(json['user_info'] as Map<String, dynamic>),
    Util.parseList(
        json['task_data'], (e) => TaskInfo.fromJson(e as Map<String, dynamic>)),
    Util.parseStr(json['task_name']),
  );
}

BasicInfo _$BasicInfoFromJson(Map<String, dynamic> json) {
  return BasicInfo(
    Util.parseStr(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['popularity']),
    Util.parseInt(json['stars_count']),
    Util.parseInt(json['fans_num']),
  );
}

TaskInfo _$TaskInfoFromJson(Map<String, dynamic> json) {
  return TaskInfo(
    Util.parseInt(json['status']),
    Util.parseInt(json['percent']),
    Util.parseInt(json['award_popularity']),
    Util.parseList(
        json['task_list'], (e) => TaskItem.fromJson(e as Map<String, dynamic>)),
  );
}

TaskItem _$TaskItemFromJson(Map<String, dynamic> json) {
  return TaskItem(
    Util.parseStr(json['icon']),
    Util.parseStr(json['name']),
    Util.parseStr(json['process']),
    Util.parseInt(json['percent']),
  );
}

FansEntranceResp _$FansEntranceRespFromJson(Map<String, dynamic> json) {
  return FansEntranceResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : FansEntrance.fromJson(json['data'] as Map<String, dynamic>),
  );
}

FansEntrance _$FansEntranceFromJson(Map<String, dynamic> json) {
  return FansEntrance(
    Util.parseBool(json['follow']),
    Util.parseBool(json['fans']),
    Util.parseInt(json['uid']),
  );
}

JoinFansGroupResp _$JoinFansGroupRespFromJson(Map<String, dynamic> json) {
  return JoinFansGroupResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : JoinFansGroup.fromJson(json['data'] as Map<String, dynamic>),
  );
}

JoinFansGroup _$JoinFansGroupFromJson(Map<String, dynamic> json) {
  return JoinFansGroup(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['fans_num']),
    Util.parseInt(json['rank']),
    json['gift'] == null
        ? null
        : JoinGift.fromJson(json['gift'] as Map<String, dynamic>),
    Util.parseList(
        json['rights'], (e) => FansRight.fromJson(e as Map<String, dynamic>)),
  );
}

JoinGift _$JoinGiftFromJson(Map<String, dynamic> json) {
  return JoinGift(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']),
    Util.parseDouble(json['price']),
    Util.parseStr(json['type']),
    Util.parseStr(json['gift_type']),
    Util.parseInt(json['cid']),
  );
}

FansRight _$FansRightFromJson(Map<String, dynamic> json) {
  return FansRight(
    Util.parseStr(json['name']),
    Util.parseStr(json['desc']),
    Util.parseStr(json['icon']),
  );
}

FansGroupRankItem _$FansGroupRankItemFromJson(Map<String, dynamic> json) {
  return FansGroupRankItem(
    Util.parseInt(json['rank']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['sex']),
    Util.parseStr(json['credit']),
  );
}

FansGroupRankData _$FansGroupRankDataFromJson(Map<String, dynamic> json) {
  return FansGroupRankData(
    Util.parseInt(json['page']),
    Util.parseInt(json['size']),
    Util.parseInt(json['next']),
    Util.parseList(json['list'],
        (e) => FansGroupRankItem.fromJson(e as Map<String, dynamic>)),
  );
}

FansGroupRankRsp _$FansGroupRankRspFromJson(Map<String, dynamic> json) {
  return FansGroupRankRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : FansGroupRankData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

GroupInfoData _$GroupInfoDataFromJson(Map<String, dynamic> json) {
  return GroupInfoData(
    Util.parseInt(json['rid']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['member_num']),
    Util.parseInt(json['credit']),
    Util.parseInt(json['rank']),
  );
}

FansUserInfo _$FansUserInfoFromJson(Map<String, dynamic> json) {
  return FansUserInfo(
    Util.parseInt(json['rank']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['credit']),
    Util.parseStr(json['label']),
    Util.parseInt(json['level']),
    Util.parseStr(json['label_image']),
    Util.parseList(json['label_colors'], (e) => Util.parseStr(e) ?? ''),
  );
}

FansRankItem _$FansRankItemFromJson(Map<String, dynamic> json) {
  return FansRankItem(
    Util.parseStr(json['name']),
    Util.parseInt(json['rank']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['credit']),
    Util.parseInt(json['level']),
    Util.parseStr(json['label']),
    Util.parseInt(json['sex']),
    Util.parseStr(json['label_image']),
    Util.parseList(json['label_colors'], (e) => Util.parseStr(e) ?? ''),
  );
}

FansTaskItem _$FansTaskItemFromJson(Map<String, dynamic> json) {
  return FansTaskItem(
    Util.parseStr(json['name']),
    Util.parseStr(json['label']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['award_credit']),
    Util.parseStr(json['award_note']),
    Util.parseStr(json['complete_note']),
    Util.parseInt(json['max_num']),
    Util.parseInt(json['complete_num']),
  );
}

FansGroupItem _$FansGroupItemFromJson(Map<String, dynamic> json) {
  return FansGroupItem(
    json['group_info'] == null
        ? null
        : GroupInfoData.fromJson(json['group_info'] as Map<String, dynamic>),
    json['user_info'] == null
        ? null
        : FansUserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
    Util.parseList(json['task_list'],
        (e) => FansTaskItem.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['rank_list'],
        (e) => FansRankItem.fromJson(e as Map<String, dynamic>)),
  );
}

FansGroupRsp _$FansGroupRspFromJson(Map<String, dynamic> json) {
  return FansGroupRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : FansGroupItem.fromJson(json['data'] as Map<String, dynamic>),
  );
}

FansPrivilegeBagData _$FansPrivilegeBagDataFromJson(Map<String, dynamic> json) {
  return FansPrivilegeBagData(
    Util.parseInt(json['pkg_id']),
    Util.parseInt(json['price']),
    Util.parseInt(json['original_price']),
    Util.parseList(json['list'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
  );
}

FansPrivilegeRsp _$FansPrivilegeRspFromJson(Map<String, dynamic> json) {
  return FansPrivilegeRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : FansPrivilegeBagData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

FansLabelListResp _$FansLabelListRespFromJson(Map<String, dynamic> json) {
  return FansLabelListResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : FansLabelList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

FansLabelList _$FansLabelListFromJson(Map<String, dynamic> json) {
  return FansLabelList(
    Util.parseList(json['list'],
        (e) => FansLabelItemData.fromJson(e as Map<String, dynamic>)),
  );
}

FansLabelItemData _$FansLabelItemDataFromJson(Map<String, dynamic> json) {
  return FansLabelItemData(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['age']),
    Util.parseInt(json['popularity_level']),
    Util.parseInt(json['credit_today']),
    Util.parseInt(json['level']),
    Util.parseStr(json['label']),
    Util.parseInt(json['credit_total']),
    Util.parseInt(json['credit_level']),
    Util.parseBool(json['is_join']),
    Util.parseInt(json['rid']),
    Util.parseBool(json['is_live']),
    Util.parseStr(json['label_image']),
    Util.parseList(json['label_colors'], (e) => Util.parseStr(e) ?? ''),
  );
}
