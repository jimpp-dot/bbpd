import 'package:shared/shared.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';

///狼人杀 数据交互部分
class WolfRepository {
  static String pathPrefix = 'roomwolfv2';

  ///
  /// 设置游戏模式
  /// rid 房间id
  /// mode wolf_beans.dart - > WolfMode
  ///
  static Future<bool> setMode(int rid, int mode) async {
    String url = '${System.domain}$pathPrefix/setMode?v=2';

    Map<String, String> post = {
      'rid': '$rid',
      'm': '$mode',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '操作成功', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///
  /// 开始游戏
  /// rid 房间id
  ///
  static Future<bool> startGame(int rid) async {
    String url = '${System.domain}$pathPrefix/start';

    Map<String, String> post = {
      'rid': '$rid',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '操作成功', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///
  /// 抢身份
  /// rid 房间id
  /// role 角色 参见wolfConfig.dart - > WolfRole
  ///
  static Future<bool> getRole(int rid, String role) async {
    String url = '${System.domain}$pathPrefix/getRole?v=2';

    Map<String, String> post = {
      'rid': '$rid',
      'role': role,
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '抢身份成功', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///
  /// 预言家验人
  /// rid 房间id
  /// cuid 要验的人的uid
  ///
  static Future<Object?> seerRole(int rid, String cuid) async {
    String url = '${System.domain}$pathPrefix/seerRole';

    Map<String, String> post = {
      'rid': '$rid',
      'cuid': cuid,
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '操作成功', gravity: ToastGravity.CENTER);
      return data;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return null;
  }

  ///
  /// 狼人击杀
  /// rid 房间id
  /// cuid 要验的人的uid
  /// iskill 1:杀 0取消
  /// count 第几轮
  ///
  static Future<bool> wolfKill(int rid, String cuid, int isKill, int count,
      {bool isConfirm = false}) async {
    String url = '${System.domain}$pathPrefix/wolfKill';

    Map<String, String> post = {
      'rid': '$rid',
      'cuid': cuid,
      'isKill': '$isKill',
      'count': '$count',
      'isConfirm': '${isConfirm ? 1 : 0}',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: (isKill==1?'杀':'取消')+'成功', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///
  /// 守卫守护
  /// rid 房间id
  /// cuid 要验的人的uid
  /// count 第几轮
  ///
  static Future<bool> guardRole(int rid, String cuid, int count) async {
    bool flag = false;
    try {
      String url = '${System.domain}$pathPrefix/guardRole';

      Map<String, String> post = {
        'rid': '$rid',
        'cuid': cuid,
        'count': '$count',
      };

      XhrResponse response = await Xhr.postJson(url, post);

      if (response.error != null) {
        Fluttertoast.showToast(
            msg: '${response.error}', gravity: ToastGravity.CENTER);
      }
      Map? data = response.response as Map?;
      if (data != null) {
        if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '守卫成功', gravity: ToastGravity.CENTER);
          flag = true;
        } else {
          Fluttertoast.showToast(
              msg: '${data['msg']}', gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {}

    return flag;
  }

  ///
  /// 女巫救人
  /// rid 房间id
  /// cuid 要验的人的uid
  ///
  static Future<Object?> antidote(int rid, String cuid) async {
    String url = '${System.domain}$pathPrefix/antidote';

    Map<String, String> post = {
      'rid': '$rid',
      'cuid': cuid,
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '救人操作成功', gravity: ToastGravity.CENTER);
      return data;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return null;
  }

  ///
  /// 女巫毒人
  /// rid 房间id
  /// cuid 要验的人的uid
  ///
  static Future<Object?> poison(int rid, String cuid) async {
    String url = '${System.domain}$pathPrefix/poison'; //后续需要换回System.domain

    Map<String, String> post = {
      'rid': '$rid',
      'cuid': cuid,
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '毒人操作成功', gravity: ToastGravity.CENTER);
      return data;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return null;
  }

  ///
  /// 猎人自爆
  /// rid 房间id
  ///
  static Future<Object?> explode(int rid) async {
    String url = '${System.domain}$pathPrefix/wolfExplode';

    Map<String, String> post = {
      'rid': '$rid',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '自爆成功', gravity: ToastGravity.CENTER);
      return data;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
      return null;
    }
  }

  ///
  /// 猎人开枪带走
  /// rid 房间id
  /// cuid 要验的人的uid
  ///
  static Future<bool> gun(int rid, String cuid) async {
    String url = '${System.domain}$pathPrefix/gun';

    Map<String, String> post = {
      'rid': '$rid',
      'cuid': cuid,
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '带走成功', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///
  /// 投票
  /// rid 房间id
  /// cuid 要验的人的uid
  /// isVote  1:投。2取消
  /// count  轮数
  ///
  static Future<bool> vote(int rid, String cuid, int isVote, int count) async {
    String url = '${System.domain}$pathPrefix/vote';

    Map<String, String> post = {
      'rid': '$rid',
      'cuid': cuid,
      'isVote': '$isVote',
      'count': '$count',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: (isVote==1?'投票':'取消投票')+'成功', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///
  /// 过麦-跳过自己当前发言
  /// rid 房间id
  ///
  static Future<bool> pass(int rid) async {
    String url = '${System.domain}$pathPrefix/pass';

    Map<String, String> post = {
      'rid': '$rid',
    };

    XhrResponse response = await Xhr.postJson(url, post);
    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map? data = response.response as Map?;
    if (data != null) {
      if (data['success'] == true) {
        return true;
      } else {
        Fluttertoast.showToast(
            msg: '${data['msg']}', gravity: ToastGravity.CENTER);
      }
    }
    return false;
  }

  ///
  /// 结束游戏
  /// rid 房间id
  /// aid  数据库ID
  ///
  static Future<Object?> end(int rid, int aid) async {
    String url = '${System.domain}$pathPrefix/end';

    Map<String, String> post = {
      'rid': '$rid',
      'aid': '$aid',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: '结束成功', gravity: ToastGravity.CENTER);
      return data;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return null;
  }

  static Future<List<RoleItem>> getRoles(int rid, int aid) async {
    String url = '${System.domain}$pathPrefix/getrole';

    Map<String, String> post = {
      'rid': '$rid',
      'aid': '$aid',
    };
    List<RoleItem> result = [];

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
      List roles = data['data'];
      for (var item in roles) {
        RoleItem roleItem = RoleItem.fromJson(item);
        if (roleItem.roleCount > 0 && roleItem.role != WolfRole.Popular)
          result.add(roleItem);
      }
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return result;
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
        List data = res['data'];
        for (var element in data) {
          if (Util.parseInt(element['follow']) > 0)
            followedUids.add(Util.parseInt(element['uid']));
        }
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

  static Future<bool> setReady(int rid, int uid) async {
    String url = '${System.domain}$pathPrefix/ready';

    Map<String, String> post = {
      'rid': '$rid',
      'uid': '$uid',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> joinPolice(int rid, PoliceJoinFlag joinFlag) async {
    String url = '${System.domain}$pathPrefix/policeJoin';

    int joinValue = 1;
    switch (joinFlag) {
      case PoliceJoinFlag.join:
        joinValue = 1;
        break;
      case PoliceJoinFlag.giveUp:
        joinValue = 2;
        break;
      case PoliceJoinFlag.exit:
        joinValue = 3;
        break;
      default:
        joinValue = 1;
        break;
    }

    Map<String, String> post = {
      'rid': '$rid',
      'is_join': '$joinValue',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> setDescOrder(int rid, bool isUp) async {
    String url = '${System.domain}$pathPrefix/policeDescOrder';

    Map<String, String> post = {
      'rid': '$rid',
      'direction': isUp ? 'up' : 'down',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> policeChange(int rid, int cuid) async {
    String url = '${System.domain}$pathPrefix/policeChange';

    Map<String, String> post = {
      'rid': '$rid',
      'cuid': '$cuid',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///
  /// 12人局-参与警长投票
  /// rid 房间id
  /// cuid 要验的人的uid
  /// isVote  1:投。2取消
  /// count  轮数
  ///
  static Future<bool> policeVote(
      int rid, String cuid, int isVote, int count) async {
    String url = '${System.domain}$pathPrefix/policeVote';

    Map<String, String> post = {
      'rid': '$rid',
      'cuid': cuid,
      'is_vote': '$isVote',
      'count': '$count',
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
//      Fluttertoast.showToast(msg: (isVote==1?'投票':'取消投票')+'成功', gravity: ToastGravity.CENTER);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<bool> optionMic(int rid, String opt) async {
    String url = '${System.domain}roomwolfv2/optionMic';

    Map<String, String> post = {
      'rid': '$rid',
      'opt': opt,
    };

    XhrResponse response = await Xhr.postJson(url, post);

    if (response.error != null) {
      Fluttertoast.showToast(
          msg: '${response.error}', gravity: ToastGravity.CENTER);
    }
    Map data = response.response as Map;
    if (data['success'] == true) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: '${data['msg']}', gravity: ToastGravity.CENTER);
    }
    return false;
  }

  /// 获取人机交互新手引导静态数据
  static Future<Map?> getMachineJuben({String? jid}) async {
    Map? data;
    String url = '${System.domain}roomwolfv2/initMachineData';

    try {
      Map<String, String> post = {};

      XhrResponse response = await Xhr.postJson(
        url,
        post,
        throwOnError: true,
      );

      Map res = response.response as Map;
      if (res['success'] == true) {
        data = res['data'];
      }
    } catch (e) {
      Log.d(e);
    }
    return data;
  }

  static Future<bool> saveJoinMachine({String? jid}) async {
    String url = '${System.domain}roomwolfv2/saveJoinMachine';

    try {
      Map<String, String> post = {};

      await Xhr.postJson(
        url,
        post,
        throwOnError: true,
      );

      return true;
    } catch (e) {
      Log.d(e);
    }

    return false;
  }
}
