import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:chat_room/src/base/model/room_purview_model.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/model/create_party_beans.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/base/repo/room_create_repo.dart';

import '../../../k.dart';
import '../../../chat_room.dart';

//在通讯录点击1+1陪胖房按钮之后调用 包含了创建房间并邀请该好友的逻辑，
//按照需求规定 先检查本人在不在房 在房直接本人进入房间页面并向该好友发出进房间邀请
//如果本人没有建房间 那么创建1+1陪伴房 并发送邀请让该好友进房间
class RoomHelper {
  CreatePartyInfo? _createPartyInfo;
  String? _selectedRoomType;
  String? _partyName;
  int _privateAttr = 0;
  final Set<int> _selectedUids = HashSet();
  int selectedFriendUid;
  String? partyType;
  String refer;
  BuildContext context;
  List<OperateConfig> data = [];

  RoomHelper(this.context, this.selectedFriendUid,
      {this.partyType, this.refer = ''});

  void inviteToRoom() async {
    IRoomManager? roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    int rid = roomManager?.getRid() ?? 0;
    if (rid > 0) {
      _selectedUids.add(selectedFriendUid); //已经在房间 直接邀请进入此房间
      _handleSuccess(rid);
    } else {
      await _loadData();
      _createRoom();
    }
  }

  Future<void> _loadData() async {
    if (partyType?.isEmpty ?? true) partyType = 'accompany';

    _selectedUids.add(selectedFriendUid);
    DataRsp<CreatePartyInfo> resp =
        await PartyCreateRepo.getCreatePartyInfo(partyType.toString());
    if (resp.success && resp.data != null) {
      _createPartyInfo = resp.data;

      if (_createPartyInfo!.friends.length < 4) {
        ILoginManager? loginManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_LOGIN);
        List<IThirdPlatform> platforms =
            loginManager?.getThirdPlatforms() ?? [];
        for (var element in platforms) {
          if (element.supportShare()) {
            _createPartyInfo!.friends.add(FriendItem.type(element.tag()));
          }
        }
      }

      /// 更多
      if (_createPartyInfo!.friendNext) {
        _createPartyInfo!.friends.add(FriendItem.type(FriendItem.TYPE_MORE));
      }

      _selectedRoomType = _createPartyInfo!.roomList.first.roomType;
      _privateAttr = _createPartyInfo!.privateLevels.first.level;

      _partyName = _createPartyInfo!.partyName;
    } else {
      Log.d('error when create party: ${resp.msg}');
    }
  }

  void _inviteIntoRoom(int rid) async {
    BaseResponse resp = await RoomApi.inviteUserJoinRoom(
        '$selectedFriendUid', '$rid', 'friend', 0);
    if (resp.success) {
    } else {
      Fluttertoast.showToast(msg: resp.msg);
    }
  }

  void _createRoom() async {
    IPremadeManager? manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PREMADE);
    bool intercept = await manager?.checkMatchAndIntercept() ?? false;
    if (intercept) return;

    bool success = await _checkVerify(context);
    if (success) {
      if (_createPartyInfo?.roomInfo != null) {
        await _modifyRoom();
      } else {
        await _newRoom();
      }
    }
    BranchTrackUtils.firstClickStartParty();
  }

  Future<bool> _checkVerify(BuildContext context) async {
    if (Utility.isNeedVerify(0, _createPartyInfo?.needVerify)) {
      ILoginManager? loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool success = await loginManager?.openAuthDialog(
            context,
            type: 0,
            newType: _createPartyInfo?.needVerify ?? 0,
            refer: 'start_party_screen',
          ) ??
          false;
      if (success) {
        _createPartyInfo?.needVerify = 0;
        return _showLicenseDialog();
      } else {
        return false;
      }
    } else {
      return _showLicenseDialog();
    }
  }

  Future<bool> _showLicenseDialog() async {
    bool? isAgreed = 'true' == Config.get('createLicenseAgreed', 'false');
    if (!isAgreed) {
      String url = Util.licenseUrl(LicenseType.CREATE_FLEET);
      isAgreed = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            LicenseDialog(title: K.room_create_room_protocl, url: url),
      );

      if (isAgreed == true) {
        Config.set('createLicenseAgreed', 'true');
        return true;
      } else {
        if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        return false;
      }
    }
    return true;
  }

  Future _modifyRoom() async {
    if (Util.isStringEmpty(_partyName)) {
      Fluttertoast.showToast(
          msg: K.room_input_party_name, gravity: ToastGravity.CENTER);
      return;
    }

    bool result = await PartyCreateRepo.modifyRoom(
      _selectedRoomType ?? '',
      _partyName!,
      _privateAttr,
      false,
      _createPartyInfo!.roomInfo!,
      _selectedUids,
    );
    if (result) {
      _handleSuccess(_createPartyInfo!.roomInfo!.rid);
    }
  }

  void _handleSuccess(int rid) async {
    Tracker.instance.track(TrackEvent.join_party,
        properties: {'uid': Session.uid, 'refer': refer});

    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.setFirstRid(rid);
    roomManager.openChatRoomScreenShow(context, rid,
        autoJoin: 1, matchRid: rid, refer: refer);
    _inviteIntoRoom(rid); //直接邀请选中好友进房间
    Navigator.pop(context, rid);
  }

  Future _newRoom() async {
    if (Util.isStringEmpty(_partyName)) {
      Fluttertoast.showToast(
          msg: K.room_input_party_name, gravity: ToastGravity.CENTER);
      return;
    }

    int rid = await PartyCreateRepo.newRoom(_selectedRoomType ?? '',
        _partyName!, _privateAttr, true, _selectedUids);
    if (rid > 0) {
      _handleSuccess(rid);
    }
  }
}
