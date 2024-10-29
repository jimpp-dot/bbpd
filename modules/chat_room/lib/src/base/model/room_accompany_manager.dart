import 'dart:math';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/create_party_beans.dart';
import 'package:chat_room/src/base/repo/room_create_repo.dart';
import 'package:chat_room/k.dart';

class RoomAccompanyManager {
  static Future openAccompanyRoom(BuildContext context, List<int> targetIds,
      List<String> targetNames, String partyType, String roomType,
      {int privateLevel = 1, bool notifyFans = false, int autoJoin = 1}) async {
    DataRsp<CreatePartyInfo> resp =
        await PartyCreateRepo.getCreatePartyInfo(partyType);
    if (resp.success == true && resp.data != null) {
      CreatePartyInfo info = resp.data!;

      bool success = await _checkVerify(context, info);
      if (success) {
        String partyName = Util.validStr(info.partyName)
            ? info.partyName
            : K.room_accompany_default_name;

        List<String> names =
            await PartyCreateRepo.getPartyRecommendNames(roomType);
        if (!Util.isCollectionEmpty(names)) {
          partyName = names[Random().nextInt(names.length)];
        }

        if (info.roomInfo != null) {
          await _modifyRoom(
              context,
              info,
              targetIds,
              targetNames,
              partyType,
              roomType,
              partyName,
              privateLevel,
              notifyFans,
              autoJoin,
              'accbox');
        } else {
          await _newRoom(
              context,
              info,
              targetIds,
              targetNames,
              partyType,
              roomType,
              partyName,
              privateLevel,
              notifyFans,
              autoJoin,
              'accbox');
        }
      }
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  static _modifyRoom(
      BuildContext context,
      CreatePartyInfo info,
      List<int> targetIds,
      List<String> targetNames,
      String partyType,
      String roomType,
      String partyName,
      int privateLevel,
      bool notifyFans,
      int autoJoin,
      String background) async {
    bool result = await PartyCreateRepo.modifyRoom(partyType, partyName,
        privateLevel, notifyFans, info.roomInfo!, targetIds.toSet(),
        background: background);
    if (result) {
      _handleSuccess(context, info.roomInfo!.rid, targetIds, targetNames,
          partyType, roomType, partyName, privateLevel, notifyFans, autoJoin);
    }
  }

  static _newRoom(
      BuildContext context,
      CreatePartyInfo info,
      List<int> targetIds,
      List<String> targetNames,
      String partyType,
      String roomType,
      String partyName,
      int privateLevel,
      bool notifyFans,
      int autoJoin,
      String background) async {
    int rid = await PartyCreateRepo.newRoom(
        partyType, partyName, privateLevel, notifyFans, targetIds.toSet(),
        background: background);
    if (rid > 0) {
      _handleSuccess(context, rid, targetIds, targetNames, partyType, roomType,
          partyName, privateLevel, notifyFans, autoJoin);
    }
  }

  static _handleSuccess(
      BuildContext context,
      int rid,
      List<int> targetIds,
      List<String> targetNames,
      String partyType,
      String roomType,
      String partyName,
      int privateLevel,
      bool notifyFans,
      int autoJoin) async {
    Tracker.instance.track(TrackEvent.start_party, properties: {
      'party_type': partyType,
      'room_type': roomType,
      'invited_num': targetIds.length,
      'is_Informfans': notifyFans ? 1 : 0,
      'visible_range': privateLevel
    });

    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.setFirstRid(rid);
    roomManager.openChatRoomScreenShow(context, rid,
        autoJoin: autoJoin, matchRid: rid, refer: 'home_page');

    await Future.delayed(const Duration(milliseconds: 2000));

    ChatRoomData.getInstance()?.emit(
        RoomConstant.Event_Message,
        _makeMessage(
          '',
          navType: 'changeRoomPrivacy',
          navText1: K.room_accompany_has_invited_prefix,
          navText2: targetNames.join(','),
          navText3: K.room_accompany_has_invited_suffix,
        ));
    ChatRoomData.getInstance()?.emit(
        RoomConstant.Event_Message,
        _makeMessage(
          K.room_accompany_current_private,
          navType: 'changeRoomPrivacyClick',
        ));
  }

  static Future<bool> _showLicenseDialog(BuildContext context) async {
    bool? createLicenseAgreed =
        'true' == Config.get('createLicenseAgreed', 'false');
    if (!createLicenseAgreed) {
      String url = Util.licenseUrl(LicenseType.CREATE_FLEET);
      createLicenseAgreed = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LicenseDialog(title: K.room_create_room_protocl, url: url);
          });

      if (createLicenseAgreed != null && createLicenseAgreed) {
        Config.set('createLicenseAgreed', 'true');
        return true;
      } else {
        if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        return false;
      }
    }
    return true;
  }

  static Future<bool> _checkVerify(
      BuildContext context, CreatePartyInfo info) async {
    if (Utility.isNeedVerify(0, info.needVerify)) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool? suc = await loginManager.openAuthDialog(context,
          type: 0, newType: info.needVerify, refer: 'home_page');
      if (suc == true) {
        info.needVerify = 0;
        return _showLicenseDialog(context);
      } else {
        return false;
      }
    } else {
      return _showLicenseDialog(context);
    }
  }

  static MessageContent _makeMessage(String msg,
      {String? navType, String? navText1, String? navText2, String? navText3}) {
    Map extra = {'type': 'local'};

    if (navType != null && navType.isNotEmpty) {
      extra['nav-type'] = navType;
    }

    if (navText1 != null && navText1.isNotEmpty) {
      extra['nav-text1'] = navText1;
    }

    if (navText2 != null && navText2.isNotEmpty) {
      extra['nav-text2'] = navText2;
    }

    if (navText3 != null && navText3.isNotEmpty) {
      extra['nav-text3'] = navText3;
    }

    MessageContent message =
        MessageContent.from(msg, extra, null, null, type: MessageType.Local);

    return message;
  }
}
