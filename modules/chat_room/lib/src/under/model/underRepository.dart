import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import '../../base/config.dart';
import '../../chatRoomData.dart';

class UnderRepository {
  static loadGameUnderWord(ChatRoomData room, int aid) async {
    Log.d(
        'DEBUG: Load under word with rid:${room.rid}, aid:$aid, state:${room.config?.underData?.gameUnderState}');

    String url = '${System.domain}roomunder/getText';
    Map<String, String> post = {'rid': room.rid.toString(), 'aid': '$aid'};

    XhrResponse response = await Xhr.postJson(url, post);
    Map? data = response.response as Map?;
    if (data != null && data['success'] == true && data['data'] != null) {
      room.gameUnderWord = Util.notNullStr(data['data']);
      room.emit(RoomConstant.Event_Refresh);
    }
  }

  static Future<bool> votePosition(
      ChatRoomData room, RoomPosition position) async {
    Log.d(
        'DEBUG: Start to vote position: ${position.position}, state: ${room.config?.underData?.gameUnderState},'
        ' enableVote: ${room.positionForCurrentUser?.underData?.gameUnderEnableToVote},'
        ' enableVotedByOther: ${position.underData?.gameUnderEnableVotedByOther}');

    if (room.rid <= 0 ||
        (position.uid <= 0 && position.underData!.gameUnderOrigin <= 0)) {
      return false;
    }

    if (!position.underData!.gameUnderEnableVotedByOther ||
        !room.positionForCurrentUser!.underData!.gameUnderEnableToVote) {
      return false;
    }

    if (position.uid == Session.uid) {
      Log.d('DEBUG: Vote yourself, do nothing');
      Fluttertoast.showToast(
          msg: K.room_cant_vote_self, gravity: ToastGravity.CENTER);
      return false;
    }

    String url = '${System.domain}roomunder/setVote';
    Map<String, String> post = {
      'rid': room.rid.toString(),
      'position': '${position.position}',
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post);
      Map data = response.response as Map;

      room.loadConfig();

      if (data['success'] == true) {
        Fluttertoast.showToast(
            msg: K.room_vote_completed, gravity: ToastGravity.CENTER);
        return true;
      } else {
        Fluttertoast.showToast(
            msg: data['msg'] ?? K.room_vote_failed,
            gravity: ToastGravity.CENTER);
        return false;
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      return false;
    }
  }

  static Future<bool> startGameUnder(int rid, int uid) async {
    if (rid <= 0 || uid <= 0) return false;

    String url = '${System.domain}roomunder/setState';
    Map<String, String> post = {
      'rid': rid.toString(),
      'uid': '$uid',
      'state': 'send'
    };

    XhrResponse response = await Xhr.postJson(url, post);
    Map data = response.response as Map;
    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    if (data['success'] == true) {
//      Fluttertoast.showToast(
//          gravity: ToastGravity.CENTER,
//          widgetBuilder: UnderDescToast.builder('游戏开始啦')
//      );
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> endGameUnder(int rid, int aid) async {
    if (rid <= 0 || aid <= 0) return false;

    String url = '${System.domain}roomunder/end';
    Map<String, String> post = {
      'rid': rid.toString(),
      'aid': '$aid',
    };

    XhrResponse response = await Xhr.postJson(url, post);
    Map data = response.response as Map;
    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    if (data['success'] == true) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> startVote(int rid, int uid) async {
    if (rid <= 0 || uid <= 0) return false;

    String url = '${System.domain}roomunder/setState';
    Map<String, String> post = {
      'rid': rid.toString(),
      'uid': '$uid',
      'state': 'vote'
    };

    XhrResponse response = await Xhr.postJson(url, post);
    Map data = response.response as Map;
    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '开始投票啦', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> endVote(int rid, int uid) async {
    if (rid <= 0 || uid <= 0) return false;

    String url = '${System.domain}roomunder/setState';
    Map<String, String> post = {
      'rid': rid.toString(),
      'uid': '$uid',
      'state': 'result'
    };

    XhrResponse response = await Xhr.postJson(url, post);
    Map data = response.response as Map;
    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '投票结束啦', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> endDesc(int rid, int uid) async {
    if (rid <= 0 || uid <= 0) return false;

    String url = '${System.domain}roomunder/pass';
    Map<String, String> post = {
      'rid': rid.toString(),
    };

    XhrResponse response = await Xhr.postJson(url, post);
    Map data = response.response as Map;
    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '描述完啦', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> setGameAdmin(int rid, int position) async {
    if (rid <= 0 || position < 0) return false;

    String url = '${System.domain}roomunder/setadmin';
    Map<String, String> post = {
      'rid': rid.toString(),
      'position': '$position',
    };

    XhrResponse response = await Xhr.postJson(url, post);
    Map data = response.response as Map;
    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    if (data['success'] == true) {
      Fluttertoast.showToast(
          msg: K.room_operate_success, gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> setGameMode(int rid, bool isFun) async {
    String url = "${System.domain}roomunder/change";
    Map<String, String> post = {
      'rid': rid.toString(),
      'fun_mode': isFun ? '1' : '0',
    };

    try {
      await Xhr.postJson(url, post, throwOnError: true);
    } catch (e) {
      Toast.showCenter(System.context, e.toString());
      return false;
    }

    Toast.showCenter(System.context, K.room_operate_success);
    return true;
  }

  ///查下关注信息
  ///[uids]，要查查询的uid
  ///返回关注的uid列表
  static Future<List<int>> getFollowedUids(List<int>? uids) async {
    if (uids == null || uids.isEmpty) return [];

    List<int> followedUids = [];
    String url = 'go/yy/friend/isFollow';
    XhrResponse response = await Xhr.postJson(
        "${System.domain}$url", {'uids': uids.join(",")},
        formatJson: true);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        List? data = res['data'];
        data?.forEach((element) {
          if (Util.parseInt(element['follow']) > 0)
            followedUids.add(Util.parseInt(element['uid']));
        });
      } else if (res['msg'] != null) {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } else {
      Fluttertoast.showToast(msg: response.error.toString());
    }
    return followedUids;
  }

  static Future<bool> follow(int followUid) async {
    bool result = false;
    NormalNull response =
        await BaseRequestManager.onFollow(followUid.toString());
    if (response.success) {
      result = true;
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
    return result;
  }
}
