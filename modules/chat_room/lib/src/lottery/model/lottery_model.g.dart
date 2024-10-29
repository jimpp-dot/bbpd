// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LotteryRecord _$LotteryRecordFromJson(Map<String, dynamic> json) {
  return LotteryRecord(
    Util.parseInt(json['id']),
    Util.parseInt(json['setting_id']),
    Util.parseInt(json['round']),
    Util.notNullStr(json['words']),
    Util.notNullStr(json['create_time']),
    Util.notNullStr(json['join_way']),
  );
}

LotteryRecordResponse _$LotteryRecordResponseFromJson(
    Map<String, dynamic> json) {
  return LotteryRecordResponse(
    Util.parseList(
        json['list'], (e) => LotteryRecord.fromJson(e as Map<String, dynamic>)),
  );
}

LotteryWinner _$LotteryWinnerFromJson(Map<String, dynamic> json) {
  return LotteryWinner(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
  );
}

LotteryWinners _$LotteryWinnersFromJson(Map<String, dynamic> json) {
  return LotteryWinners(
    Util.notNullStr(json['title']),
    Util.parseList(json['list'], (e) => LotteryWinner.fromJson(e)),
  );
}

LotteryInfo _$LotteryInfoFromJson(Map<String, dynamic> json) {
  return LotteryInfo(
    Util.notNullStr(json['admin_name']),
    Util.notNullStr(json['words']),
    Util.parseInt(json['round_time']),
    Util.parseInt(json['start_time']),
    Util.parseInt(json['now']),
    Util.parseInt(json['joined']),
    Util.parseList(json['members'], (e) => LotteryWinner.fromJson(e)),
    Util.notNullStr(json['join_way']),
    Util.parseInt(json['gift_id']),
    Util.notNullStr(json['gift_name']),
  );
}
