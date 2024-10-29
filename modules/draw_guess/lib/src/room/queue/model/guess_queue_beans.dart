import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guess_queue_beans.g.dart';

@JsonSerializable(createToJson: false)
class WordCategoryDataResp extends BaseResponse {
  WordCategoryList? data;

  WordCategoryDataResp({required bool success, String? msg, this.data})
      : super(success: success, msg: msg);

  factory WordCategoryDataResp.fromJson(Map<String, dynamic> json) =>
      _$WordCategoryDataRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class WordCategoryList {
  List<WordCategory>? list;

  WordCategoryList(this.list);

  factory WordCategoryList.fromJson(Map<String, dynamic> json) =>
      _$WordCategoryListFromJson(json);
}

@JsonSerializable(createToJson: false)
class WordCategory {
  @JsonKey(name: 'cate_id')
  int cid;
  @JsonKey(name: 'cate_name')
  String? name;
  int num;

  WordCategory(this.cid, this.name, this.num);

  factory WordCategory.fromJson(Map<String, dynamic> json) =>
      _$WordCategoryFromJson(json);
}

/// 画猜接龙排行榜
@JsonSerializable(createToJson: false)
class GuessQueueResultRankData {
  int uid;
  String? name;
  String? icon;

  @JsonKey(name: 'queue_suc')
  bool queueSucess;

  @JsonKey(name: 'liked_num')
  int likedNum;

  @JsonKey(name: 'follow')
  bool follow;

  GuessQueueResultRankData(this.uid, this.name, this.icon, this.queueSucess,
      this.likedNum, this.follow);

  factory GuessQueueResultRankData.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueResultRankDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueResultRankList {
  List<GuessQueueResultRankData>? list;

  GuessQueueResultRankList(this.list);

  factory GuessQueueResultRankList.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueResultRankListFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueResultRankRsp extends BaseResponse {
  GuessQueueResultRankList? data;

  GuessQueueResultRankRsp({super.success, super.msg, this.data});

  factory GuessQueueResultRankRsp.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueResultRankRspFromJson(json);
}

/// 获取选词阶段的词语
@JsonSerializable(createToJson: false)
class GuessQueueConfirmWordData {
  @JsonKey(name: 'id')
  String? wordId;

  String? word;

  @JsonKey(name: 'cate_id')
  String? cateId;

  GuessQueueConfirmWordData(this.wordId, this.word, this.cateId);

  factory GuessQueueConfirmWordData.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueConfirmWordDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueConfirmWordList {
  List<GuessQueueConfirmWordData>? list;

  GuessQueueConfirmWordList(this.list);

  factory GuessQueueConfirmWordList.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueConfirmWordListFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueConfirmWordRsp extends BaseResponse {
  GuessQueueConfirmWordList? data;

  GuessQueueConfirmWordRsp({required bool success, String? msg, this.data})
      : super(msg: msg, success: success);

  factory GuessQueueConfirmWordRsp.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueConfirmWordRspFromJson(json);
}

@JsonSerializable(createToJson: false)
class DrawWordResp extends BaseResponse {
  DrawWordData? data;

  DrawWordResp({required bool success, String? msg, this.data})
      : super(msg: msg, success: success);

  factory DrawWordResp.fromJson(Map<String, dynamic> json) =>
      _$DrawWordRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class DrawWordData {
  String? word;
  String? image;
  String? originalWord;
  String? nextWord;

  GuessUserData? prev;
  GuessUserData? next;
  GuessUserData? current;
  GuessUserData? original;

  DrawWordData(
    this.word,
    this.image,
    this.prev,
    this.next,
    this.originalWord,
    this.current,
    this.original,
    this.nextWord,
  );

  factory DrawWordData.fromJson(Map<String, dynamic> json) =>
      _$DrawWordDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessUserData {
  int uid;
  String? name;
  String? icon;

  GuessUserData(this.uid, this.name, this.icon);

  factory GuessUserData.fromJson(Map<String, dynamic> json) =>
      _$GuessUserDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessImgResp extends BaseResponse {
  GuessImgData? data;

  GuessImgResp({required bool success, String? msg, this.data})
      : super(msg: msg, success: success);

  factory GuessImgResp.fromJson(Map<String, dynamic> json) =>
      _$GuessImgRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessImgData {
  String? image;

  GuessUserData? prev;
  GuessUserData? next;
  GuessUserData? current;

  GuessImgData(this.image, this.prev, this.next, this.current);

  factory GuessImgData.fromJson(Map<String, dynamic> json) =>
      _$GuessImgDataFromJson(json);
}
