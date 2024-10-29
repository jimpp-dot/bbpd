import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/create_room/room_mine_list_page.dart';
import 'package:chat_room/src/base/create_room/room_property_select_panel.dart';
import 'package:chat_room/src/base/model/roomRepository.dart';
import 'package:chat_room/src/base/model/room_purview_model.dart';
import 'package:chat_room/src/base/create_room/create.dart';
import 'package:chat_room/src/base/create_room/party_list_screen.dart';
import 'package:chat_room/src/base/repo/room_create_repo.dart';
import 'package:flutter/material.dart';

import '../model/roomConstant.dart';

class InitOperate {
  static display(BuildContext context,
      {String? refer, bool fromWolfHomePage = false}) async {
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    int needVerifyNew = 0;
    List<OperateConfig> data = [];
    OperateConfigRsp rsp = await PartyCreateRepo.hasPurview();
    if (rsp.success) {
      needVerifyNew = rsp.needVerifyNew ?? 0;
      data = rsp.data ?? [];
    } else {
      return;
    }

    if (Utility.isNeedVerify(0, needVerifyNew)) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool suc = await loginManager.openAuthDialog(context,
          type: 0, newType: needVerifyNew, refer: 'room:send_msg');
      if (suc == true) {
      } else {
        return;
      }
    }

    OperateConfig? config;
    if (data.length == 1) {
      config = data[0];
    } else {
      config = await RoomPropertySelectPanel.show(context, data);
    }

    if (config == null) return;

    //合作房进入合作房列表
    if (config.display != 'private' && config.display != 'vip') {
      RoomMineListPage.show(System.context, name: config.name);
      return;
    }

    if (config.rid > 0) {
      if (config.deleted == 2) {
        Fluttertoast.showCenter(msg: K.room_notice_room_be_closed);
      } else if (config.deleted == 1) {
        if (config.display == 'private' || config.display == 'vip') {
          //个人房
          try {
            _newRoom(context, config.display, config.rid,
                refer: refer, fromWolfHomePage: fromWolfHomePage);
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        } else {
          //合作厅删除后，先打开修改界面，修改完直接进房 模拟厅逻辑相同
          _modifyAndEnterRoom(context, config.rid);
        }
      } else if (config.deleted == 0) {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, config.rid,
            refer: refer ?? 'create_room_page');
      } else if (config.deleted == -1) {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openRoomModifyScreen(context, rid: config.rid);
      } else {
        Fluttertoast.showCenter(msg: K.room_not_prosable);
      }
    } else {
      if (config.display == 'private' || config.display == 'vip') {
        //仅支持有3个或3个以上互粉好友的用户开启个人房
        bool canCreatePrivateRoom = false;
        if (config.display == 'private') {
          try {
            String url = '${System.domain}go/yy/friend/data';
            final Map<String, String> params = {
              "type": FriendsListType.Friend,
              "page": "1",
              "pageSize": "15",
            };
            XhrResponse response = await Xhr.postJson(url, params,
                throwOnError: true, formatJson: true);
            Map res = response.value();
            List list = res['data'] ?? [];
            //人数大于等于3
            if (list.length >= 3) {
              canCreatePrivateRoom = true;
            } else {
              canCreatePrivateRoom = false;
            }
          } catch (e) {
            Log.d(e.toString());
          }
        } else {
          canCreatePrivateRoom = true;
        }
        if (canCreatePrivateRoom) {
          _newRoom(context, config.display, config.rid,
              refer: refer, fromWolfHomePage: fromWolfHomePage);
        } else {
          Toast.showCenter(context, K.room_notice_cant_open_room);
        }
      } else {
        Toast.showCenter(context, K.room_not_prosable);
      }
    }
  }

  static _modifyAndEnterRoom(BuildContext context, int rid) async {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openRoomModifyScreen(context, rid: rid, showRoom: true);
  }

  static _newRoom(BuildContext context, String display, int roomId,
      {String? refer, bool fromWolfHomePage = false}) async {
    int? rid;

    if (display == 'private' || display == 'vip') {
      if (fromWolfHomePage) {
        ///狼人杀二级首页创建房间
        rid = await Navigator.of(System.context).push(MaterialPageRoute(
          builder: (context) => CreateRoomStep2(
            rid: roomId,
            fromWolfHomePage: fromWolfHomePage,
            label: K.room_wolf_create,
          ),
          settings: const RouteSettings(name: CreateRoomStep2.routeName),
        ));
      } else {
        rid = await PartyListScreen.show(context);
      }

      if (rid != null && rid > 0) {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, rid,
            autoJoin: 1, matchRid: rid, refer: refer ?? 'create_room_page');
      }
    } else {
      try {
        XhrResponse response = await Xhr.postJson(
          "${System.domain}room/new?room_version=${RoomConstant.roomVersion}",
          {
            'display': display,
            'version': '1',
          },
          throwOnError: true,
        );
        Map res = response.value();
        rid = Util.parseInt(res['data']);
      } catch (e) {
        Toast.show(context, e.toString());
        return;
      }
      if (rid <= 0) {
        Fluttertoast.showToast(msg: K.room_create_failed);
        return;
      }
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openRoomModifyScreen(context, rid: rid);
    }
  }

  ///剧本房切换到个人房
  static openJubenToPersonalRoomDisplay(BuildContext context,
      {int rid = 0}) async {
    //如果未登录，则登录
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    //使用V2接口获取用户的房间信息以及身份验证信息
    int needVerifyNew = 0;
    List<OperateConfig> data = []; //房间列表
    OperateConfigRsp rsp = await PartyCreateRepo.hasPurview();
    if (rsp.success) {
      needVerifyNew = rsp.needVerifyNew ?? 0;
      data = rsp.data ?? [];
    } else {
      return;
    }

    //如果身份未认证,弹出身份认证
    if (Utility.isNeedVerify(0, needVerifyNew)) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool suc = await loginManager.openAuthDialog(context,
          type: 0, newType: needVerifyNew, refer: 'room:send_msg');
      if (suc == true) {
      } else {
        return;
      }
    }

    //如果没有房间数据,直接返回
    if (data.isEmpty) {
      return;
    }

    //取到房间数据中的个人房数据
    OperateConfig? config;
    if (data.isNotEmpty) {
      config = data.firstWhereOrNull((item) {
        return item.display == 'private' || item.display == 'vip';
      });
    }

    //没有个人房数据,返回
    if (config == null) {
      return;
    }

    int? newRid = await PartyListScreen.show(context);

    ///退出顶部页面直到房间页面为止,如果是跟页面(/)保留
    bool find = false;
    try {
      NavigatorState state = Navigator.of(context);
      state.popUntil((Route route) {
        if (find) return true;
        String? name = route.settings.name;
        if (name == null) {
          return false;
        } else {
          name = name.toLowerCase();
          if (name.startsWith('/room/')) {
            find = true;
            return true;
          } else {
            if (name != '/') {
              return false;
            } else {
              return true;
            }
          }
        }
      });
    } catch (e) {}

    //通知房间刷新
    if (newRid != null && newRid > 0) {
      bool flag = false;

      int oRid = rid;
      int nRid = newRid;

      try {
        String url = '${System.domain}juben/refresh';

        Map<String, String> post = {
          "o_rid": '$oRid',
          "n_rid": '$nRid',
        };

        XhrResponse response =
            await Xhr.postJson(url, post, throwOnError: true);

        Map res = response.value();

        if (res['success'] == false) {
          Fluttertoast.showToast(
              msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
        }

        if (res['success'] == true) {
          flag = true;
        }
      } catch (e) {
        Log.d(e.toString());
      }

      if (flag) {
        eventCenter.emit(EventConstant.roomChangeRid, newRid);
      }
    }
  }

  ///直接创建或修改为指定个人房
  static openPersonalRoomDisplayDirect(BuildContext context,
      {int puzzleId = 0,
      int appraiserId = 0,
      Map<String, String>? postData}) async {
    //如果未登录，则登录
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    //使用V2接口获取用户的房间信息以及身份验证信息
    int needVerifyNew = 0;
    List<OperateConfig> data = []; //房间列表
    OperateConfigRsp rsp = await PartyCreateRepo.hasPurview();
    if (rsp.success) {
      needVerifyNew = rsp.needVerifyNew ?? 0;
      data = rsp.data ?? [];
    } else {
      return;
    }

    //如果身份未认证,弹出身份认证
    if (Utility.isNeedVerify(0, needVerifyNew)) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool suc = await loginManager.openAuthDialog(context,
          type: 0, newType: needVerifyNew, refer: 'room:send_msg');
      if (suc == true) {
      } else {
        return;
      }
    }

    //如果没有房间数据,直接返回
    if (data.isEmpty) {
      return;
    }

    //取到房间数据中的个人房数据
    OperateConfig? config;
    if (data.isNotEmpty) {
      config = data.firstWhereOrNull((item) {
        return item.display == 'private' || item.display == 'vip';
      });
    }

    //没有个人房数据,返回
    if (config == null) {
      return;
    }

    bool? createLicenseAgreed =
        'true' == Config.get('createLicenseAgreed', 'false');
    if (!createLicenseAgreed) {
      String url = Util.licenseUrl(LicenseType.CREATE_FLEET);
      createLicenseAgreed = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return LicenseDialog(title: K.room_create_room_protocl, url: url);
        },
      );

      if (createLicenseAgreed != null && createLicenseAgreed) {
        Config.set('createLicenseAgreed', 'true');
      } else {
        if (Navigator.of(context).canPop()) Navigator.of(context).pop();
      }
    } else {
      int personalRid = config.rid;
      int? newRid;
      if (personalRid <= 0) {
        if (appraiserId > 0) {
          newRid = await RoomRepository.createRoom('appraiser', Session.name,
              appraiserId: appraiserId);
        } else {
          newRid = await RoomRepository.createRoom('puzzle', Session.name,
              puzzleId: puzzleId);
        }
      } else {
        newRid = personalRid;
        if (postData != null && postData.isNotEmpty) {
          newRid = int.parse(postData["rid"]!);
        }
        if (appraiserId > 0) {
          await RoomRepository.updateRoom(
              personalRid, 'appraiser', Session.name,
              appraiserId: appraiserId);
        } else {
          await RoomRepository.updateRoom(personalRid, 'puzzle', Session.name,
              puzzleId: puzzleId, postData: postData);
        }
      }

      //进房
      if (newRid > 0) {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, newRid,
            refer: 'create_room_page', matchRid: newRid, autoJoin: 1);
      }
    }
  }
}
