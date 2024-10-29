import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/create_party_beans.dart';
import 'package:chat_room/src/base/model/room_purview_model.dart';

class PartyCreateRepo {
  static Future<OperateConfigRsp> hasPurview() async {
    try {
      String url = "${System.domain}room/hasPurviewV2?version=5";
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      return OperateConfigRsp.fromJson(response.value());
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      return OperateConfigRsp(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  static Future<DataRsp<CreatePartyInfo>> getCreatePartyInfo(
      String type) async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}room/partyData?party_type=$type&version=2&cg_version=${RoomConstant.cloudGameVersion}');
      return DataRsp<CreatePartyInfo>.fromXhrResponse(
        response,
        (object) => CreatePartyInfo.fromJson(object as Map<String, dynamic>),
      );
    } catch (e) {
      return DataRsp<CreatePartyInfo>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// [cid] 直播游戏标签cid
  /// [isMulti] 是否多人房间，一起看
  /// [gameId] 云游戏game_id
  static Future<int> newRoom(
      String type, String name, int private, bool notify, Set<int> friends,
      {int? giftId,
      String? background,
      int? cid,
      bool? isMulti,
      String? roomCover,
      String? gameId}) async {
    double lat = Util.parseDouble(Config.get('location.latitude'));
    double lng = Util.parseDouble(Config.get('location.longitude'));

    try {
      String url =
          '${System.domain}room/new?room_version=${RoomConstant.roomVersion}';
      Map<String, String> params = {
        'display': 'private',
        'version': '${RoomConstant.roomNewVersion}',
        'type': type,
        'subject': name,
        'notify': notify ? '1' : '0',
        'private_level': private.toString(),
        'friends': friends.join(","),
        'lat': lat.toString(),
        'lng': lng.toString(),
      };

      // 创建房间时选择的礼物
      if (giftId != null && Util.parseInt(giftId) > 0) {
        params['gift_id'] = '$giftId';
      }

      if (cid != null) {
        params['cid'] = '$cid';
      }

      if (isMulti != null) {
        params['mode'] = '${isMulti ? 2 : 1}';
      }

      if (roomCover?.isNotEmpty ?? false) {
        params[RoomSettingActions.ROOM_COVER] = roomCover!;
      }

      //选择房间背景
      if (background != null && background.isNotEmpty) {
        params['background'] = background;
      }

      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        return Util.parseInt(res['data']);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return -1;
  }

  /// [cid] 直播游戏标签cid
  /// [isMulti] 是否多人房间，一起看
  /// [gameId] 云游戏game_id
  static Future<bool> modifyRoom(
    String type,
    String name,
    int private,
    bool notify,
    RoomInfo roomInfo,
    Set<int> friends, {
    int? giftId,
    String? background,
    int? cid,
    bool? isMulti,
    String? roomCover,
    String? gameId,
  }) async {
    double lat = Util.parseDouble(Config.get('location.latitude'));
    double lng = Util.parseDouble(Config.get('location.longitude'));
    Map<String, String> post = {
      'icon': roomInfo.icon,
      'type': type,
      'prefix': roomInfo.prefix,
      'name': name,
      'description': roomInfo.description,
      'rid': roomInfo.rid.toString(),
      'password': roomInfo.password,
      'clientVersion': '${RoomConstant.createClientVersion}',
      'reception': roomInfo.reception.toString(),
      'paier': roomInfo.paier.toString(),
      'notify': notify ? '1' : '0',
      'private_level': private.toString(),
      'friends': friends.join(","),
      'lat': lat.toString(),
      'lng': lng.toString(),
    };

    if (cid != null) {
      post['cid'] = '$cid';
    }

    if (isMulti != null) {
      post['mode'] = '${isMulti ? 2 : 1}';
    }

    if (roomCover?.isNotEmpty ?? false) {
      post[RoomSettingActions.ROOM_COVER] = roomCover!;
    }

    if (gameId?.isNotEmpty ?? false) {
      post['game_id'] = gameId!;
    }

    //选择房间背景
    if (background != null && background.isNotEmpty) {
      post['background'] = background;
    }

    // 创建房间时选择的礼物
    if (giftId != null && Util.parseInt(giftId) > 0) {
      post['gift_id'] = '$giftId';
    }

    return await RoomRepository.roomCreate(post);
  }

  static Future<List<String>> getPartyRecommendNames(String type) async {
    List<String> list = [];

    String url = '${System.domain}room/getCreateTags';
    try {
      XhrResponse response =
          await Xhr.postJson(url, {'type': type}, throwOnError: true);
      Map res = response.value();
      List data = res['data'];
      for (var value in data) {
        list.add(value.toString());
      }
    } catch (e) {
      Log.d(e.toString());
    }
    return list;
  }

  /// source：drainage，需要过滤部分房型，比如海龟汤（创建流程没法跟创建小房邀请的流程结合）
  static Future<DataRsp<List<PartyList>>> getPartyList(
      {String source = ''}) async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}option/partyInfo?version=13&source=$source');
      return DataRsp.fromXhrResponse(response,
          (json) => Util.parseList(json, (e) => PartyList.fromJson(e)));
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }
}
