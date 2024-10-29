import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/common_yearbeast.pb.dart';
import 'package:chat_room/src/protobuf/generated/rpc_room_frame.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/public_screen_enhancement_model.dart';
import 'package:chat_room/src/base/model/room_create_bean.dart';
import 'package:chat_room/src/base/model/room_simple_user_profile.dart';
import 'package:chat_room/src/base/create_room/create.dart';
import 'package:chat_room/src/base/page/roomModifyScreen.dart';
import 'package:chat_room/src/base/page/roomPassword.dart';
import 'package:chat_room/src/base/widget/room_pwd_dialog.dart';
import 'package:chat_room/src/base/widget/room_unable_recomend_user_dialog.dart';
import 'package:chat_room/src/protobuf/generated/background_list.pb.dart';
import 'package:chat_room/src/protobuf/generated/room_info.pb.dart';

import '../../protobuf/generated/drainage.pb.dart';
import '../../protobuf/generated/rpc_chatroom_precheck.pb.dart';
import '../widget/room_nobility_privilege_dialog.dart';

///room房间的一些公共的http操作
class RoomRepository {
  ///上麦   needCertify=true:根据后台配置是否要先认证,需要传type参数（认证类型）
  static Future<Map?> joinMic(int rid, int pos,
      {int uid = 0,
      bool toastError = true,
      bool toastSuccess = true,
      bool needCertify = false,
      int type = 0,
      int newType = 0,
      int inviterId = 0,
      bool onStage = false}) async {
    if (needCertify == true && (Utility.isNeedVerify(type, newType))) {
      // 上麦前需要认证

      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool? suc = await loginManager.openAuthDialog(System.context,
          type: type, newType: newType, refer: 'join_mic');

      if (suc == true) {
        // 发消息刷新chatRoomData
        eventCenter.emit(EventConstant.EventCertifyChange, 0);
      } else {
        // 未认证不能上麦
        return null;
      }
    }

    if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config)) {
      RPCReqOnMic pb = RPCReqOnMic(
          position: pos, toUid: uid > 0 ? uid : Session.uid, version: 8);
      Log.d(() => 'joinMic: ${pb.toProto3Json()}');

      try {
        await ChatRoomData.getInstance()
            ?.onMic(pb)
            .timeout(const Duration(seconds: 3));
        eventCenter.emit('JoinMic.Success');
        return {'success': true, 'msg': ''};
      } catch (e) {
        Log.e(e);
        return {'success': false, 'msg': e.toString()};
      }
    }

    try {
      Map? res = await _xhrAutoError(
        // 5: 团战pk中支持上麦
        // 6: 拍卖房改版限制老版本用户开启拍卖
        // 7: KTV支持合唱 直播PKV3
        // 8: 电台PK版本兼容cd ..
        'room/joinMic?version=8',
        {
          'rid': rid.toString(),
          'position': pos.toString(),
          'uid': uid.toString(),
          'inviter_uid': inviterId.toString(),
          'on_stage': onStage ? '1' : '0',
        },
        toastError: toastError,
        toastSuccess: toastSuccess,
      );
      if (res != null && res['success'] == true) {
        eventCenter.emit('JoinMic.Success');
      }
      return res;
    } catch (e) {
      Log.d(e.toString());
      return null;
    }
  }

  ///停止征兆
  static Future<bool> stopMatch({String rid = ''}) async {
    try {
      String url = "${System.domain}match/stop";
      Map<String, String> params = {'rid': rid};
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        return true;
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///开始征兆
  static Future<bool> startMatch(
      {required BuildContext context,
      String rid = '',
      String mode = '',
      String? type,
      String admin_role = '',
      String? publishDeal}) async {
    try {
      String url = "${System.domain}match/call?version=3";
      Map<String, String> params = {
        'rid': rid,
        'mode': mode,
        'admin_role': admin_role
      };
      if (type != null && type.isNotEmpty) {
        params['type'] = type;
      }
      if (publishDeal != null && publishDeal.isNotEmpty) {
        params['is_open_card'] = publishDeal;
      }
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        DataReporter.reportEvent(CallEvent(rid, type));
        return true;
      } else if (res['error'] == 'mode') {
        bool? confirm = await showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                content: Text(K.room_change_mic_mode_free),
                actions: <Widget>[
                  CupertinoButton(
                      child: Text(K.cancel),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      }),
                  CupertinoButton(
                      child: Text(K.sure),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      }),
                ],
              );
            });
        if (confirm == true)
          startMatch(context: context, rid: rid, mode: 'auto');
      } else if (res['msg'] != null) {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///暂停 取消暂停征兆 op 1 暂停 2 取消暂停
  static Future<bool> pauseMatch({String rid = '', int status = 0}) async {
    try {
      String url = "${System.domain}match/pause";
      Map<String, String> params = {'rid': rid, 'status': status.toString()};
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        return true;
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///封禁房间
  static Future<bool> forbidRoom(int rid, int duration) async {
    try {
      String url = "${System.domain}room/forbidden";
      Map<String, String> params = {'rid': '$rid', 'duration': '$duration'};
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(
            msg: K.room_operate_success, gravity: ToastGravity.CENTER);
        return true;
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  ///通用http接口实现
  static Future<Map?> _xhrAutoError(String url, Map<String, String> post,
      {bool toastError = true,
      bool toastSuccess = true,
      String? successMsg}) async {
    XhrResponse response = await Xhr.postJson("${System.domain}$url", post);
    if (response.error != null) {
      if (toastError == true) {
        Fluttertoast.toastException(
            exp: response.error, gravity: ToastGravity.CENTER);
      }
      throw AssertionError(response.error.toString());
    }
    bool hasDisplay = false;
    Map res = response.value();
    if (res['success'] == false) {
      if (toastError == true) {
        hasDisplay = true;
        Fluttertoast.showToast(
            msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
      }
    }
    if (toastSuccess == true && hasDisplay == false) {
      Fluttertoast.showToast(
          msg: successMsg ?? K.room_operate_success,
          gravity: ToastGravity.CENTER);
    }
    return res;
  }

  ///通用http接口实现
  static Future<Map?> xhrAutoError(String url, Map<String, String> post,
      {bool toastError = true, bool toastSuccess = true, String? successMsg}) {
    return _xhrAutoError(url, post,
        toastError: toastError,
        toastSuccess: toastSuccess,
        successMsg: successMsg);
  }

  ///下麦
  static Future<Map?> leavelMic(int rid, [int uid = 0, int vrid = 0]) async {
    if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config)) {
      RPCReqOffMic pb = RPCReqOffMic(
        toUid: uid > 0 ? uid : Session.uid,
        vrid: vrid,
      );
      Log.d(() => 'offMic: ${pb.toProto3Json()}');
      try {
        await ChatRoomData.getInstance()
            ?.offMic(pb)
            .timeout(const Duration(seconds: 3));
        return {'success': true, 'msg': ''};
      } catch (e) {
        Log.e(e);
        return {'success': false, 'msg': e.toString()};
      }
    }

    try {
      return await _xhrAutoError(
          'room/leavelMic',
          {
            'rid': rid.toString(),
            'uid': uid.toString(),
            'vrid': vrid.toString()
          },
          toastSuccess: false);
    } catch (e) {
      return null;
    }
  }

  ///关房
  static Future<Map?> close(int rid) async {
    if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config)) {
      await ChatRoomData.getInstance()?.closeRoom().catchError((e) {
        Fluttertoast.showCenter(msg: e.toString());
      });
      return null;
    }
    try {
      return await _xhrAutoError('room/close', {
        'rid': rid.toString(),
        'deleted': '1',
      });
    } catch (e) {
      return null;
    }
  }

  ///麦位相关操作接口
  static Future<Map?> opMic(int rid, int? pos, String op,
      {int duration = 0,
      bool toastError = true,
      bool toastSuccess = true}) async {
    if (Util.parseInt(pos) > 30) return null;

    if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config)) {
      try {
        await ChatRoomData.getInstance()
            ?.opMic(RPCReqOpMic(position: pos, op: op, duration: duration))
            .timeout(const Duration(seconds: 3));
        return {'success': true, 'msg': ''};
      } catch (e) {
        Log.e(e);
        return {'success': false, 'msg': e.toString()};
      }
    } else {
      try {
        return await _xhrAutoError(
            'room/opMic',
            {
              'rid': rid.toString(),
              'op': op,
              'position': pos.toString(),
              'duration': duration.toString(),
            },
            toastError: toastError,
            toastSuccess: toastSuccess);
      } catch (e) {
        return null;
      }
    }
  }

  /// 设置房间背景图片
  static Future<Map?> opbgswitch(int rid, String background) async {
    var post = {
      'rid': rid.toString(),
      'value': background,
    };
    try {
      XhrResponse response =
          await Xhr.postJson("${System.domain}room/bgswitch", post);
      if (response.error != null) {
        Fluttertoast.toastException(
            exp: response.error, gravity: ToastGravity.CENTER);
        return null;
      }
      bool hasDisplay = false;
      Map res = response.value();
      if (res['success'] == true) {
        if (res['data'] != null && res['data']['has_atmosphere_bg'] == 1) {
          hasDisplay = true;
          Fluttertoast.showToast(
              msg: K.room_atm_bg_mutually, gravity: ToastGravity.CENTER);
        }
      } else if (res['success'] == false) {
        hasDisplay = true;
        Fluttertoast.showToast(
            msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
      }
      if (hasDisplay == false) {
        Fluttertoast.showToast(
            msg: K.room_operate_success, gravity: ToastGravity.CENTER);
      }
      return res;
    } catch (e) {
      return null;
    }
  }

  ///房间相关设置接口
  static Future<Map?> opSetting(int rid, String type, dynamic value) async {
    try {
      return await _xhrAutoError('room/setting?rid=$rid', {
        'rid': rid.toString(),
        'type': type,
        'value': value.toString(),
      });
    } catch (e) {
      return null;
    }
  }

  /// 获取房间背景图片
  static Future<ResBackgroundList> getRoomBgList(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
          "${System.domain}go/room/background/list",
          {
            'rid': rid.toString(),
          },
          pb: true);
      if (response.error != null) {
        Fluttertoast.toastException(
            exp: response.error, gravity: ToastGravity.CENTER);
      }
      return ResBackgroundList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResBackgroundList(msg: e.toString(), success: false);
    }
  }

  ///需要根据返回结果设置房间的senderId值
  static Future<bool> senderEnd(int rid, int senderId) async {
    bool flag = false;
    try {
      await _xhrAutoError(
          'room/orderEnd',
          {
            'rid': rid.toString(),
            'id': senderId.toString(),
          },
          toastSuccess: true);
      flag = true;
    } catch (e) {}

    return flag;
  }

  static Future<Map?> displayMessage(int rid, [bool close = false]) async {
    try {
      return await _xhrAutoError('room/displayMessage', {
        'rid': rid.toString(),
        'display': close ? '0' : '1',
      });
    } catch (e) {
      return null;
    }
  }

  ///排麦   needCertify=true:根据后台配置是否要先认证,需要传type参数（认证类型）
  static Future<Map?> queue(int rid, int position,
      {bool boss = false,
      bool isAuction = false,
      bool needCertify = false,
      int type = 0,
      int newType = 0}) async {
    if (Utility.isNeedVerify(type, newType)) {
      // 排麦前需要认证

      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool? suc = await loginManager.openAuthDialog(System.context,
          type: type, newType: newType, refer: 'queue_mic');

      if (suc == true) {
        // 发消息刷新chatRoomData
        eventCenter.emit(EventConstant.EventCertifyChange, 0);
      } else {
        // 未认证不能排麦
        return {'certify': false};
      }
    }

    try {
      return await _xhrAutoError('room/queue?version=2', {
        'rid': rid.toString(),
        'position': position.toString(),
        'boss': boss ? '1' : '0',
        'auction': isAuction ? '1' : '0',
      });
    } catch (e) {
      return null;
    }
  }

  static Future<void> cpSetState(
      int rid, String state, String roomFactoryType) async {
    try {
      await _xhrAutoError("roomcp/setState", {
        'rid': rid.toString(),
        'state': state,
        'room_factory_type': roomFactoryType
      });
    } catch (e) {}
    return;
  }

  static Future<bool> roomRepositoryQueue(
      {required BuildContext context,
      required int rid,
      int position = -1,
      bool boss = false}) async {
    try {
      XhrResponse response =
          await Xhr.postJson('${System.domain}room/queue?version=2', {
        'rid': rid.toString(),
        'position': position.toString(),
        'boss': boss ? '1' : '0',
      });

      if (response.error != null) {
        if (System.debug) {
          Fluttertoast.toastException(
              exp: response.error, gravity: ToastGravity.CENTER);
        }
        return false;
      }
      Map res = response.value();
      if (res['success'] == false) {
        if (System.debug) {
          Fluttertoast.showToast(
              msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
        }
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Map?> preCheck(
      {required BuildContext context, int rid = 0, String? type}) async {
    Map? result;
    try {
      XhrResponse response =
          await Xhr.postJson('${System.domain}roomwolf/precheck', {
        'rid': '$rid',
        if (type != null && type.isNotEmpty) 'type': type,
      });

      Map res = response.value();
      if (res['success'] == true) {
        result = res['data'];
      }
    } catch (e) {
      Log.d('Catch exception when check room, exception: $e');
    }
    return result;
  }

  static Future<bool?> roomPreCheckNew(
      {BuildContext? context,
      int rid = 0,
      String? type,
      bool checkVideoGuide = false,
      int recommendUid = 0}) async {
    bool? result = false;
    try {
      Map<String, String> post = {
        'version': '${RoomConstant.configVersion}',
        'rid': '$rid',
        'password': PasswordManager.getValue(rid),
        'check': '1',
        'board_game_version': '${RoomConstant.boardGameConfigVersion}',
        'room_version': '${RoomConstant.roomVersion}',
      };

      XhrResponse response =
          await Xhr.postPb('${System.domain}go/room/room/check', post);
      ResRoomBusi res = ResRoomBusi.fromBuffer(response.bodyBytes);

      if (res.success == true) {
        if (!checkVideoGuide) {
          result = true;
        } else {
          result = true;
        }
      } else {
        String? msg = res.error;

        if ('password.require' == res.extend['error'] ||
            res.extend['error'] == 'password.error') {
          PasswordManager.remove(rid);
          if (res.extend['error'] == 'password.error') {
            msg = Util.parseStr(res.extend['reason']);
            Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
          }

          String? pwd = await showDialog(
              context: System.context,
              builder: (context) {
                return const RoomPwdDialog();
              });
          if (pwd != null) {
            PasswordManager.setValue(rid, pwd);
            result = await roomPreCheckNew(
                context: System.context, rid: rid, recommendUid: recommendUid);
          } else {
            result = false;
          }
        } else if ('ticket.require' == res.extend['error'] ||
            'drainage.ticket.require' == res.extend['error']) {
          /// 贵族付费房需要支付/大小房付费小房
          int giftId = Util.parseInt(res.extend['gift_id']);
          int money = Util.parseInt(res.extend['money']);
          String giftName = Util.notNullStr(res.extend['gift_name']);
          int roomCreator = Util.parseInt(res.extend['room_creator']);
          int giftNum = Util.parseInt(res.extend['gift_num'], 1);
          String title = Util.notNullStr(res.extend['title']);
          String subTitle = Util.notNullStr(res.extend['sub_title']);
          result = await showDialog(
            context: context ?? System.context,
            barrierColor: Colors.black.withOpacity(0.4),
            builder: (context) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                insetPadding: EdgeInsets.zero,
                content: RoomNobilityPrivilegeDialog(
                  rid,
                  roomCreator,
                  giftId,
                  giftName,
                  money,
                  giftNum: giftNum,
                  title: title,
                  subTitle: subTitle,
                ),
              );
            },
          );
          if (Util.parseBool(result)) {
            result = await roomPreCheckNew(
                context: System.context, rid: rid, recommendUid: recommendUid);
          } else {
            result = false;
          }
        } else if (res.extend.containsKey('errCode') &&
            Util.parseInt(res.extend['errCode']) == 1000025) {
          ISettingManager settingManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_SETTINGS);
          settingManager.showKillerCreateRoomCheckDialog();
        } else if (msg.isNotEmpty) {
          if (recommendUid == 0) {
            Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
          } else {
            await showDialog(
              context: Constant.context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return RoomUnableRecommendUserDialog(
                    content: msg, uid: recommendUid);
              },
            );
          }
        }
      }
    } catch (e) {
      Log.d('Catch exception when check room, exception: $e');
      Fluttertoast.showToast(
          msg: R.array('xhr_error_type_array')[6],
          gravity: ToastGravity.CENTER);
    }
    return result;
  }

  static Future<List<RoomTag>> getRoomTags() async {
    List<RoomTag> result = [];
    try {
      XhrResponse response =
          await Xhr.getJson('${System.domain}room/createtypeinfo?version=13');

      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        result = (res['data'] as List)
            .map((jsonItem) => RoomTag.fromJson(jsonItem))
            .toList();
      }
    } catch (e) {
      Log.d('Catch exception when check room, exception: $e');
    }
    return result;
  }

  static Future<int> updateRoomStealth(int rid) async {
    int stealth = -1;
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}room/getroomstealth",
          {
            'rid': '$rid',
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        Map? data = res['data'];
        stealth = Util.parseInt(data?['stealth']);
      }
    } catch (e) {}
    return stealth;
  }

  static Future<RecommendResult?> getRecommendList(
      {required int rid,
      String? from,
      int direct = 0,
      List<int>? ridList,
      String? lastFrom}) async {
    RecommendResult? result;
    try {
      XhrResponse response;
      String url = '${System.domain}slide/next';
      response = await Xhr.postJson(
          url,
          {
            'rid': '$rid',
            'type': from ?? '',
            'direct': '$direct',
            'data': jsonEncode({'rids': ridList ?? [], 'type': lastFrom}),
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        List? data = res['data'];
        List<int>? idList = data?.map((item) => Util.parseInt(item)).toList();
        String? type = Util.parseStr(res['type']);
        result = RecommendResult(idList ?? [], type ?? '');
      }

      return result;
    } catch (e) {}
    return result;
  }

  static Future<bool> hideRank(int rid, bool hide) async {
    try {
      String url = "${System.domain}room/topset";
      Map<String, String> params = {
        'rid': '$rid',
        'hide': hide ? '1' : '0',
        'ver': '1'
      };
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        return true;
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  //根据type和subject创建房间
  static Future<int> createRoom(String type, String subject,
      {int puzzleId = 0, int appraiserId = 0}) async {
    int rid = -1;

    String url =
        '${System.domain}room/new?room_version=${RoomConstant.roomVersion}';
    try {
      Map<String, String> params = {
        'display': 'private',
        'version': '${RoomConstant.roomNewVersion}',
        'type': type,
        'subject': subject,
      };
      if (puzzleId > 0) {
        params['puzzle_id'] = '$puzzleId';
      }

      if (appraiserId > 0) {
        params['apra_id'] = '$appraiserId';
      }

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();
      rid = Util.parseInt(res['data']);
    } catch (e) {
      Log.d(e.toString());
    }

    return rid;
  }

  //根据type和subject修改原来的rid
  static Future<bool> updateRoom(int rid, String type, String subject,
      {int puzzleId = 0,
      int appraiserId = 0,
      Map<String, String>? postData}) async {
    bool flag = false;
    if (postData != null && postData.isNotEmpty == true) {
      if (puzzleId > 0) {
        postData['puzzle_id'] = '$puzzleId';
      }
      await roomCreate(postData);
    } else {
      ///获取原来房间的信息，然后修改
      ResRoomInfo rsp = await getRoomInfo(rid);

      if (rsp.success) {
        Map<String, String> post = {
          'icon': rsp.data.icon,
          'type': type,
          'prefix': rsp.data.prefix,
          'name': subject,
          'description': rsp.data.description,
          'rid': rid.toString(),
          'password': rsp.data.password,
          'clientVersion': '${RoomConstant.createClientVersion}',
          'reception': rsp.data.reception.toString(),
          'paier': rsp.data.paier.toString(),
        };
        if (puzzleId > 0) {
          post['puzzle_id'] = '$puzzleId';
        }

        if (appraiserId > 0) {
          post['apra_id'] = '$appraiserId';
        }
        await roomCreate(post);
      } else if (rsp.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
      }
    }

    return flag;
  }

  /// 公屏增强接口
  static Future<PublicScreenEnhancementModel?> loadPublicScreenEnhancement(
      int rid, String type) async {
    PublicScreenEnhancementModel? model;
    try {
      String url =
          '${System.domain}room/rcmdContent?rid=$rid&type=$type&package=${Constant.packageName}';
      XhrResponse response = await Xhr.getJson(url);
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true) {
          model = PublicScreenEnhancementModel.fromJson(
              res as Map<String, dynamic>);
        }
      }
    } catch (e) {
      Log.d(e.toString());
    }

    return model;
  }

  static Future<RoomCreateResponse?> getCreateRoomTags() async {
    try {
      XhrResponse response =
          await Xhr.getJson('${System.domain}room/gameCreatetypeinfo?v=8');

      Map res = response.value();

      if (res['success'] == false) {
        Fluttertoast.showToast(
            msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
      }

      RoomCreateResponse roomCreateResponse =
          RoomCreateResponse.fromJson(response.value() as Map<String, dynamic>);
      return roomCreateResponse;
    } catch (e) {
      Log.d('Catch exception when check room, exception: $e');
    }
    return null;
  }

  static Future<RoomSimpleUserProfile?> getProfileInfo(int uid) async {
    try {
      XhrResponse response =
          await Xhr.getJson('${System.domain}profile/info?uid=$uid');

      Map res = response.value();

      if (res['success'] == false) {
        Fluttertoast.showToast(
            msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
      }

      RoomSimpleUserProfile roomSimpleUserProfile =
          RoomSimpleUserProfile.fromJson(
              response.value() as Map<String, dynamic>);
      return roomSimpleUserProfile;
    } catch (e) {
      Log.d('Catch exception when check room, exception: $e');
    }
    return null;
  }

  static Future<ResYearBeastProgress> getYearBeastProgress(int rid) async {
    String url = '${System.domain}go/yy/yearbeast/progress?rid=$rid';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResYearBeastProgress.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResYearBeastProgress(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> birthdayExtraMic(int rid, int show) async {
    String url = '${System.domain}go/yy/roombirthday/setting';
    NormalNull resp;
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'extra_mic': '$show'}, pb: true);
      resp = NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      resp = NormalNull(msg: e.toString(), success: false);
    }

    String msg;
    if (resp.success) {
      msg = K.room_operate_success;
    } else {
      msg = resp.msg;
    }

    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
    return resp;
  }

  /// 查询房间是否为大小房主房间，是否可设置小房间是否展示未赠礼用户
  static Future<int> getDrainagePreferences(int rid) async {
    String url = '${System.domain}go/room/drainage/preferences';
    ResDrainagePreferences? resp;
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'rid': '$rid',
          },
          pb: true);
      resp = ResDrainagePreferences.fromBuffer(response.bodyBytes);

      if (resp.success) {
        return resp.data.showNoPermission;
      }
    } catch (e) {
      Log.d('getDrainagePreferences error: $e');
    }

    return 0;
  }

  /// 设置大小房：小房邀请列表是否展示未赠礼用户
  /// state: 1 展示， 2 不展示
  static Future<NormalNull> showDrainagNoPermission(int rid, int state) async {
    String url = '${System.domain}go/room/drainage/setting';
    NormalNull resp;
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'state': '$state'}, pb: true);
      resp = NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      resp = NormalNull(msg: e.toString(), success: false);
    }

    String msg;
    if (resp.success) {
      msg = K.room_operate_success;
    } else {
      msg = resp.msg;
    }

    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
    return resp;
  }

  ///创建or修改房间信息,主要是type和subject
  static Future<bool> roomCreate(Map<String, String> postData) async {
    String url =
        "${System.domain}room/create?room_version=${RoomConstant.roomVersion}";
    try {
      XhrResponse response =
          await Xhr.postJson(url, postData, throwOnError: true);
      DataRsp rsp = DataRsp.fromXhrResponse(response, null);
      if (rsp.success == true) {
        return true;
      } else {
        if (rsp.msg?.isNotEmpty ?? false) {
          Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
        }
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
      return false;
    }
  }

  static Future<ResRoomInfo> getRoomInfo(int rid) async {
    String url =
        "${System.domain}go/room/room/info/?rid=$rid&version=${RoomModifyScreen.INFO_VERSION}";
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      ResRoomInfo rsp = ResRoomInfo.fromBuffer(response.bodyBytes);
      Log.d('getRoomInfo: ${rsp.data.toString()}');
      return rsp;
    } catch (e) {
      return ResRoomInfo(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> reportWillDestroyRoom(int rid, int identity) async {
    String url = "${System.domain}go/yy/room/closeRoomReport";
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'rid': rid, 'identity': identity}, pb: true);
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  static Future<ResGetRoomSetInfo> getRoomSetInfo(int rid) async {
    try {
      String url = '${System.domain}go/room/room/getRoomSetInfo?rid=$rid';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      ResGetRoomSetInfo res = ResGetRoomSetInfo.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return ResGetRoomSetInfo(success: false, msg: e.toString());
    }
  }

  static Future<ResRoomPanel> getRoomMineList() async {
    try {
      String url = '${System.domain}go/room/room/panel';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResRoomPanel.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomPanel(success: false, msg: e.toString());
    }
  }
}

class RecommendResult {
  final List<int>? ridList;
  final String? type;

  RecommendResult(this.ridList, this.type);
}
