import 'package:shared/shared.dart';
import 'package:group/src/model/group_setting_beans.dart';

import '../../k.dart';
import '../model/pb/generated/group_setting.pb.dart';

class GroupRepo {
  static Future<bool> checkCreateGroup() async {
    try {
      String url = '${System.domain}go/yy/group/checkPermission';
      XhrResponse response = await Xhr.postJson(url, {}, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        return true;
      } else {
        int needVerifyNew = Util.parseInt(res['need_verify_new'], 0);
        if (Utility.isNeedVerify(0, needVerifyNew)) {
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);
          bool suc = await loginManager.openAuthDialog(Constant.context,
              type: 0, newType: needVerifyNew, refer: 'room:send_msg');
          if (suc == true) {
            return true;
          } else {
            return false;
          }
        }
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  static Future<GroupSettingDataRsp> getGroupSettings(int? groupId) async {
    try {
      XhrResponse response = await Xhr.postPb(
          "${System.domain}go/yy/group/settings",
          {"groupId": groupId.toString()},
          throwOnError: false);
      return GroupSettingDataRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GroupSettingDataRsp(msg: e.toString(), success: false);
    }
  }

  static Future<bool> updateSettings(
      int? groupId, String key, String value) async {
    try {
      String url = '${System.domain}go/yy/group/updateSettings';
      Map<String, String> params = {
        "groupId": groupId.toString(),
        key: value,
        "field": key
      };
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.setting_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  static Future<GroupApplyListResp> getGroupApplyList(
      int? groupId, int page) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}go/yy/group/getApplyList",
          {
            "groupId": groupId.toString(),
            "page": page.toString(),
            "limit": "20"
          },
          formatJson: true,
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GroupApplyListResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map<dynamic, dynamic>;
      if (!(res['success'] ?? false)) {
        return GroupApplyListResp(msg: res['msg'], success: false);
      }
      try {
        GroupApplyListResp responseData =
            GroupApplyListResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getGroupApplyList and e msg = ${e.toString()}");

        return GroupApplyListResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GroupApplyListResp(msg: e.toString(), success: false);
    }
  }

  /// 审核加群申请
  static Future<bool> handleApply(
      int? groupId, List<int> ids, bool agree) async {
    try {
      String url = '${System.domain}go/yy/group/auditApply';
      Map<String, String> params = {
        "groupId": groupId.toString(),
        "ids": ids.join(","),
        "action": agree ? "1" : "2"
      };
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  /// 申请加入群组
  static Future<bool> applyJoinGroup(int groupId) async {
    try {
      String url = '${System.domain}go/yy/group/groupApply';
      Map<String, String> params = {
        "groupId": groupId.toString(),
        "uid": Session.uid.toString()
      };
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  /// 创建群组
  static Future<int> createGroup(String cover, String name) async {
    try {
      String url = '${System.domain}go/yy/group/createPartyGroup';
      Map<String, String> params = {"cover": cover, "name": name};
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return Util.parseInt(res['data']['group_id']);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return -1;
  }

  static Future<GroupListResp> getGroupList(int? uid) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}go/yy/group/groupList",
          {"uid": uid.toString(), "page": "1", "limit": "50"},
          formatJson: true,
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GroupListResp(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map<dynamic, dynamic>;
      if (!(res['success'] ?? false)) {
        return GroupListResp(msg: res['msg'], success: false);
      }
      try {
        GroupListResp responseData =
            GroupListResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getGroupList and e msg = ${e.toString()}");

        return GroupListResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GroupListResp(msg: e.toString(), success: false);
    }
  }

  /// 邀请加入群组
  static Future<bool> inviteUsers(int? groupId, List<int> uids) async {
    try {
      String url = '${System.domain}go/yy/group/invite';
      Map<String, String> params = {
        "groupId": groupId.toString(),
        "uids": uids.join(',')
      };
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  /// 退出群组
  static Future<bool> quit(int? groupId) async {
    try {
      String url = '${System.domain}go/yy/group/quit';
      Map<String, String> params = {"groupId": groupId.toString()};
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  /// 解散群组
  static Future<bool> dismiss(int? groupId) async {
    try {
      String url = '${System.domain}go/yy/group/dismiss';
      Map<String, String> params = {"groupId": groupId.toString()};
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  static Future<GroupInfoResp> getInviteInfo(int? inviteId) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}go/yy/group/enterInvite",
          {"inviteId": inviteId.toString()},
          formatJson: true,
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GroupInfoResp(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map<dynamic, dynamic>;
      if (!(res['success'] ?? false)) {
        return GroupInfoResp(msg: res['msg'], success: false);
      }
      try {
        GroupInfoResp responseData =
            GroupInfoResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getGroupInfo and e msg = ${e.toString()}");

        return GroupInfoResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GroupInfoResp(msg: e.toString(), success: false);
    }
  }

  /// 邀请操作：同意
  static Future<bool> inviteOperate(int? inviteId) async {
    try {
      String url = '${System.domain}go/yy/group/agreeInvite';
      Map<String, String> params = {"inviteId": inviteId.toString()};
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  static Future<GroupInfoResp> getGroupInfo(int? groupId) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}go/yy/group/groupInfo",
          {"groupId": groupId.toString()},
          formatJson: true,
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GroupInfoResp(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map<dynamic, dynamic>;
      if (!(res['success'] ?? false)) {
        return GroupInfoResp(msg: res['msg'], success: false);
      }
      try {
        GroupInfoResp responseData =
            GroupInfoResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getGroupInfo and e msg = ${e.toString()}");

        return GroupInfoResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GroupInfoResp(msg: e.toString(), success: false);
    }
  }

  /// 设为(取消)管理员
  static Future<bool> setManager(int? groupId, int? uid, int op) async {
    try {
      String url = '${System.domain}go/yy/group/setManager';
      Map<String, String> params = {
        'groupId': '$groupId',
        "uid": '$uid',
        'op': '$op'
      };
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  /// 设置群昵称
  static Future<bool> setGroupNickName(int? groupId, String nickname) async {
    try {
      String url = '${System.domain}go/yy/group/updateMember';
      Map<String, String> params = {
        'groupId': '$groupId',
        "nickname": nickname
      };
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  static Future<GroupMemberListResp> getGroupMemberList(
      int? groupId, String query) async {
    try {
      String url = '${System.domain}go/yy/group/memberList';
      Map<String, String> params = {'groupId': '$groupId', "query": query};
      XhrResponse response = await Xhr.postJson(url, params, formatJson: true);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GroupMemberListResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map<dynamic, dynamic>;
      if (!(res['success'] ?? false)) {
        return GroupMemberListResp(msg: res['msg'], success: false);
      }
      try {
        GroupMemberListResp responseData =
            GroupMemberListResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getGroupMemberList and e msg = ${e.toString()}");

        return GroupMemberListResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GroupMemberListResp(msg: e.toString(), success: false);
    }
  }

  /// 讨论组，添加群成员
  static Future<bool> addMemberForDiscussionGroup(
      int? groupId, List<int> uidList) async {
    try {
      String url = "${System.domain}go/yy/group/add";
      Map<String, String> params = {
        'uids': uidList.join(','),
        'version': '12',
        'groupId': '$groupId'
      };
      XhrResponse response =
          await Xhr.postJson(url, params, formatJson: true, throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.group_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return true;
  }

  static Future<GroupInviteTabResp> getGroupInviteTabs() async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}go/yy/group/getInviteTab",
          formatJson: true,
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GroupInviteTabResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map<dynamic, dynamic>;
      if (!(res['success'] ?? false)) {
        return GroupInviteTabResp(msg: res['msg'], success: false);
      }
      try {
        GroupInviteTabResp responseData =
            GroupInviteTabResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getGroupInviteTabs and e msg = ${e.toString()}");

        return GroupInviteTabResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GroupInviteTabResp(msg: e.toString(), success: false);
    }
  }
}
