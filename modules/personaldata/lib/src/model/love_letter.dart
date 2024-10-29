import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'love_letter.g.dart';

@JsonSerializable()
class LoveLetterListResponse extends BaseResponse
    with PageListResponse<LoveLetterListItem> {
  @override
  @JsonKey(name: 'list')
  List<LoveLetterListItem>? items;

  LoveLetterListResponse({bool success = false, String msg = '', this.items})
      : super(msg: msg, success: success);

  factory LoveLetterListResponse.fromJson(Map<String, dynamic> json) =>
      _$LoveLetterListResponseFromJson(json);
}

@JsonSerializable()
class LoveLetterListItem {
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  @JsonKey(fromJson: Util.parseInt)
  int cid;
  @JsonKey(name: 'letter_id', fromJson: Util.parseInt)
  int letterId;
  @JsonKey(name: 'propose_id', fromJson: Util.parseInt)
  int proposeId;
  @JsonKey(name: 'create_time', fromJson: Util.parseInt)
  int sendTime;
  @JsonKey(name: 'is_read', fromJson: Util.parseBool)
  bool read;
  @JsonKey(fromJson: Util.parseInt)
  int status; //3代表已拒绝
  Profile? profile;
  Commodity? commodity;

  LoveLetterListItem(this.uid, this.cid, this.letterId, this.proposeId,
      this.sendTime, this.read, this.status, this.profile, this.commodity);

  factory LoveLetterListItem.fromJson(Map<String, dynamic> json) =>
      _$LoveLetterListItemFromJson(json);
}

@JsonSerializable()
class Profile {
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  String name;
  String icon;

  Profile(this.uid, this.name, this.icon);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@JsonSerializable()
class Commodity {
  @JsonKey(fromJson: Util.parseInt)
  int id;
  @JsonKey(fromJson: Util.parseInt)
  int cid;
  String name;
  String avatar;
  String image;

  Commodity(this.id, this.cid, this.name, this.avatar, this.image);

  factory Commodity.fromJson(Map<String, dynamic> json) =>
      _$CommodityFromJson(json);
}

@JsonSerializable()
class Letter {
  @JsonKey(fromJson: Util.parseInt)
  int id;
  @JsonKey(name: 'propose_id', fromJson: Util.parseInt)
  int proposeId;
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  @JsonKey(name: 'to_uid', fromJson: Util.parseInt)
  int toUid;
  String content;

  Letter(this.id, this.proposeId, this.uid, this.toUid, this.content);

  factory Letter.fromJson(Map<String, dynamic> json) => _$LetterFromJson(json);
}

class LoveLetterRepository {
  static Future<LoveLetterListResponse> getLoveLetterItems(int page) async {
    String url = '${System.domain}games/marrypropose/myLetter';
    try {
      Map<String, String> params = {'p': '$page'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return LoveLetterListResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return LoveLetterListResponse(msg: res['msg'], success: false);
      }
      try {
        LoveLetterListResponse responseData = LoveLetterListResponse.fromJson(
            {'success': res['success'], 'list': res['data']['list']});
        return responseData;
      } catch (e) {
        return LoveLetterListResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return LoveLetterListResponse(msg: e.toString(), success: false);
    }
  }
}
