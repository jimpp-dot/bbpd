import 'package:shared/shared.dart';
import 'package:chat_room/src/base/page/package_settings.dart';
import 'package:chat_room/src/base/widget/repo/mic_repo.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/accompany/widget/mic_time_select_widget.dart';
import 'package:chat_room/src/biz_plugin/juke_music/juke_music_util.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:chat_room/src/talent/talent_helper.dart';
import 'package:chat_room/src/talent/talent_module.dart';
import 'package:chat_room/src/under/model/underData.dart';
import 'package:commonrtc_api/commonrtc_api.dart';

class UserIconTapHandler {
  BuildContext? context;
  ChatRoomData? room;
  RoomPosition? position;

  List<SkillInfo> skillInfoList = [];
  List<SheetItem>? bottomSheetData;

  void init(
      {BuildContext? context, ChatRoomData? room, RoomPosition? position}) {
    this.context = context;
    this.room = room;
    this.position = position;
  }

  List<SheetItem> buildEightOwnerSheet() {
    List<SheetItem> res = [];
    if (room?.role == ClientRole.Broadcaster) {
      res.add(SheetItem(K.room_leave_mic_lietence, "mic-leavel"));
    } else {
      res.add(SheetItem(K.room_up_mic, "mic-join"));
    }

    if (Util.parseInt(room?.generalSetting?.data.openPiaDramaJuben) == 1) {
      /// pia戏房，支持房主编辑自己的剧本和房间内所有剧本（房间多人本/麦上所欧人的单人本）的接待费
      res.add(SheetItem(K.room_edit_drama, "room_edit_drama"));
      res.add(SheetItem(K.room_edit_drama_fee, "room_edit_drama_fee"));
    }

    return res;
  }

  Future<List<SheetItem>> buildEmptyMicSheet(bool isDefend, bool isPrivate,
      bool enabledPackageClear, Purview? purview) async {
    List<SheetItem> res = [];
    switch (purview) {
      case Purview.Createor:
      case Purview.SuperAdmin:
        if (!room!.isMic) {
          res.add(SheetItem(K.room_up_mic_self, "mic-join"));
        }
        if (!isDefend && !isPrivate) {
          res.add(SheetItem(K.room_pic_other_mic, "mic-join-other"));
        }

        /// 房主在麦上和不在麦上都可以邀请朋友
        if (ChatRoomUtil.isAccompany(room?.config)) {
          res.add(
              SheetItem(K.room_invite_friend_tips, "accompany-invite-friend"));
          res.add(SheetItem(K.room_invite_nearby_user,
              "accompany-invite-nearby-online-user"));
        }
        if (room!.config?.mode == RoomMode.Auto) {
          if (position?.lock == true) {
            res.add(SheetItem(K.room_unlock_mic, "mic-enable"));
          } else {
            res.add(SheetItem(K.room_lock_mic, "mic-disabled"));
          }
        }
        if (enabledPackageClear &&
            room!.config!.package > 0 &&
            room!.config!.package < PackageConfig.startUserWithMoney) {
          res.add(SheetItem(K.room_mic_statis_clear, "package-clear"));
        }

        if (room!.isMicLink) {
          res.add(SheetItem(K.room_edit_mic_label, "room_edit_mic_label"));
        }
        break;

      case Purview.Admin:
        if (position!.position == 0 && room!.config!.reception) {
          Fluttertoast.showToast(
              msg: K.room_limit_in_reception, gravity: ToastGravity.CENTER);
          return res;
        }
        if (room!.isMic) {
          Fluttertoast.showToast(
              msg: K.room_in_mic_limit, gravity: ToastGravity.CENTER);
          return res;
        }
        res.add(SheetItem(K.room_up_mic_self, "mic-join"));
        break;

      case Purview.Normal:
        if (!Session.isLogined) {
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);
          loginManager.show(context!);
          return res;
        }
        if (room!.isMic) {
          /// 1+1陪伴房在麦位上的普通用户可以邀请朋友
          if (ChatRoomUtil.isAccompany(room?.config)) {
            res.add(SheetItem(
                K.room_invite_friend_tips, "accompany-invite-friend"));
            res.add(SheetItem(K.room_invite_nearby_user,
                "accompany-invite-nearby-online-user"));
          } else {
            Fluttertoast.showToast(
                msg: K.room_in_mic_limit, gravity: ToastGravity.CENTER);
          }
          return res;
        }

        if (position!.position == 0) {
          /// 才艺厅的 0 号麦位为当前表演者，节目列表的前3后3可以直接上麦
          if (ChatRoomUtil.isLiveTalent(room!.config)) {
            bool canAutoUpMic = await TalentModule.isQueueAnchor(room!.realRid,
                toastError: true);

            if (canAutoUpMic == true) {
              bool? isGranted = await room!.checkAudioAuthorization();
              if (isGranted == true) {
                RoomRepository.joinMic(
                  room!.realRid,
                  position!.position,
                  needCertify: true,
                  type: room!.needVerify,
                  newType: room!.needVerifyNew,
                );
              }
              return res;
            }
          } else if (room!.config!.reception) {
            //接待位只能是管理员上
            Fluttertoast.showToast(
                msg: K.room_limit_in_reception, gravity: ToastGravity.CENTER);
            return res;
          }
        }

        if (isDefend) {
          handleIconTap(position!, 'wantDefend');
          return res;
        }
        if (room!.config?.mode == RoomMode.Lock) {
          //用户点击后排队上麦，分普通麦和老板麦
          if (room!.isSenderRoom &&
              room!.config?.type != 'black' &&
              Session.role != UserRole.GOD &&
              !ChatRoomUtil.isBossChair(position)) {
            //在非开黑标签的点单厅模式下，直有主播才能试音
            Fluttertoast.showToast(
                msg: K.room_just_boss_chair_in_order,
                gravity: ToastGravity.CENTER);
            return res;
          }

          var isBoss = ChatRoomUtil.isBossChair(position);
          bool isAuction = (room!.config?.types == RoomTypes.Auction &&
              position!.position == room!.auctionPosition);

          MicUpWaitList.show(
            context: context!,
            builder: (BuildContext context) {
              return MicUpWaitList(
                  room: room!, isBoss: isBoss, isAuction: isAuction);
            },
          );
        } else {
          if (position!.lock) {
            Fluttertoast.showToast(
                msg: K.room_the_mic_was_closed, gravity: ToastGravity.CENTER);
            return res;
          } else {
            bool isGranted = await room!.checkAudioAuthorization();
            if (isGranted == true) {
              RoomRepository.joinMic(
                room!.realRid,
                position!.position,
                needCertify: true,
                type: room!.needVerify,
                newType: room!.needVerifyNew,
              );
            }
          }
        }
        break;

      default:
        break;
    }
    return res;
  }

  List<SheetItem> buildSelfSheet(bool isDefend, bool isPrivate) {
    List<SheetItem> res = [];
    if (position!.uid == room!.config?.uid &&
        (room!.isEightPosition || room!.isFivePosition)) {
      if (room!.role == ClientRole.Audience) {
        res.add(SheetItem(K.room_up_mic, "mic-join"));
      }
    }
    if (!isPrivate) {
      res.add(SheetItem(K.room_leave_mic_lietence, "mic-leavel"));
    }
    if (position!.position > 0 && isDefend) {
      res.add(SheetItem(K.room_renewal_protect, "continueDefend"));
    }

    /// 非接待位、非老板位  点击自己时显示
    if (!ChatRoomUtil.isBossChair(position) &&
        !ChatRoomUtil.isReceptionChair(position!.position)) {
      /// 编辑歌单
      if (JukeMusicUtil.supportJukeMusic(room)) {
        res.add(SheetItem(K.room_juke_music_edit, 'juke-music-edit'));
      }

      /// 设为离开
      bool leave = position!.positionLeave;
      res.add(SheetItem(
          leave ? K.room_position_leave_cancel : K.room_position_leave_confirm,
          "position-leave",
          leave ? 0 : 1));
    }

    if (Util.parseInt(room!.generalSetting?.data.openPiaDramaJuben) == 1 &&
        !ChatRoomUtil.isBossChair(position)) {
      /// pia戏房，支持编辑自己的剧本
      res.add(SheetItem(K.room_edit_drama, "room_edit_drama"));
      if (ChatRoomUtil.isCreateOrReception()) {
        /// 接待房间内所有剧本（房间多人本/麦上所欧人的单人本）的接待费
        res.add(SheetItem(K.room_edit_drama_fee, "room_edit_drama_fee"));
      }
    }

    return res;
  }

  List<SheetItem> buildInMicSheet(
      Purview? purview, bool isPrivate, bool enabledPackageClear) {
    List<SheetItem> res = [];
    res.add(SheetItem(K.room_look_info, "profile"));

    if (room!.config?.types != RoomTypes.Live ||
        Session.uid == room!.createor?.uid) {
      // 直播房非房主不能打赏
      // 夜店卡座房非房主不能打赏
      // 桌球游戏不能打赏
      if (room!.config?.originalRFT != 'laya-billiards') {
        res.add(SheetItem(K.room_tab_item_package, "gift"));
      }
    }

    res.add(SheetItem(K.follow, "follow"));
    if (!(purview == Purview.Createor && !isPrivate)) {
      //非个人房且是房主,不能邀约
      res.add(SheetItem(K.room_invite, "order"));
    }

    if (purview != Purview.Createor &&
        (room!.permission & AdminWriteOperation > 0) &&
        !(room!.isKtvRoom || room!.isKtvChorusRoom) &&
        !ChatRoomUtil.isLiveTalent(room!.config) &&
        !isPrivate) {
      /// 非房主，但room.permission & AdminWriteOperation > 0，也有设置/取消管理权限
      if (room!.admins.contains(position!.uid)) {
        res.add(SheetItem(K.room_cancel_manage, "admin.cancel"));
      } else {
        res.add(SheetItem(K.room_set_reception_manager, "admin.set.super"));
        res.add(SheetItem(K.room_set_normal_manager, "admin.set"));
      }
    }

    switch (purview) {
      case Purview.Createor:
      case Purview.SuperAdmin:
        if (room!.isSenderRoom || room!.config?.type == 'black') {
          if (ChatRoomUtil.bossChairHasUser()) {
            _loadSkillList(position!.uid);
            if (skillInfoList.isNotEmpty) {
              res.insert(0, SheetItem(K.push_order, "push-order"));
            }
          }
        }
        if (!room!.isKtvRoom &&
            !room!.isKtvChorusRoom &&
            !room!.isCpLink &&
            !room!.isMicLink) {
          res.add(SheetItem(K.room_timer, "counter"));
        }

        /// 禁言（官方运营账号特权）
        if (Session.isOfficialAccount && Session.officialType == 7) {
          res.add(SheetItem(K.room_user_mute(["10"]), "room_user_mute"));
        }

        if (position!.forbidden) {
          res.add(SheetItem(K.room_open_mic, "mic-unforbidden"));
        } else {
          res.add(SheetItem(K.room_close_mic, "mic-forbidden"));
        }
        res.add(SheetItem(K.room_leave_mic_lietence, "mic-leavel"));

        if (room!.isMicLink) {
          res.add(SheetItem(K.room_edit_mic_label, "room_edit_mic_label"));
          if (position!.uid > 0 && position!.isLinkMic) {
            res.add(SheetItem(
                K.room_mic_link_disconnect, "room_mic_link_disconnect"));
          }
        }

        if (position!.uid != room!.realRid) {
          res.add(SheetItem(K.room_kickout, "kickout"));
        }
        if (room!.config?.mode != RoomMode.Lock &&
            !(room!.isKtvRoom || room!.isKtvChorusRoom)) {
          if (position!.lock) {
            res.add(SheetItem(K.room_unlock_mic, "mic-enable"));
          } else {
            res.add(SheetItem(K.room_lock_mic, "mic-disabled"));
          }
        }
        if (enabledPackageClear &&
            room!.config!.package > 0 &&
            room!.config!.package < PackageConfig.startUserWithMoney) {
          res.add(SheetItem(K.room_mic_statis_clear, "package-clear"));
        }

        //管理权限
        if (purview == Purview.Createor &&
            !(room!.isKtvRoom || room!.isKtvChorusRoom) &&
            !ChatRoomUtil.isLiveTalent(room!.config) &&
            !isPrivate) {
          if (room!.admins.contains(position!.uid)) {
            res.add(SheetItem(K.room_cancel_manage, "admin.cancel"));
          } else {
            res.add(SheetItem(K.room_set_reception_manager, "admin.set.super"));
            res.add(SheetItem(K.room_set_normal_manager, "admin.set"));
          }
        }
        break;

      case Purview.Admin:
        if (!room!.isKtvRoom && !room!.isKtvChorusRoom && !room!.isMicLink) {
          res.add(SheetItem(K.room_timer, "counter"));
        }
        break;

      case Purview.Normal:
        if (ChatRoomUtil.isLiveTalent(room!.config) &&
            TalentHelper.isCreateOrPerformer(room)) {
          res.add(SheetItem(K.room_leave_mic_lietence, "mic-leavel"));
        } else {
          res.clear();
          RoomNavUtil.goToImageScreenDialog(context!, position, room!);
        }
        return res;

      default:
        break;
    }

    return res;
  }

  _loadSkillList(int uid) async {
    if (bottomSheetData == null || bottomSheetData!.isEmpty) return;
    SheetItem firstSheetItem = bottomSheetData![0];

    // 未开启邀约时不返回技能列表
    String serveUrl = '${System.domain}profile/onServe?uid=$uid';
    XhrResponse serveResp = await Xhr.getJson(serveUrl);
    if (serveResp.error != null) return;
    Map res = serveResp.response as Map;
    if (res['success'] != true) return;
    if (res['data']['onServing'] != true) {
      skillInfoList.clear();
      if (firstSheetItem.key == "push-order") {
        bottomSheetData?.removeAt(0);
        eventCenter.emit(EventConstant.UpdateBottomSheet);
      }
      return;
    }

    String skillListUrl = '${System.domain}profile/skillList?uid=$uid';

    XhrResponse response = await Xhr.getJson(skillListUrl);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        skillInfoList.clear();
        for (var dataItem in res['data']) {
          skillInfoList.add(SkillInfo.fromJson(dataItem));
        }

        skillInfoList.removeWhere((item) => Util.unverifiedSkill(item.cid));

        if (bottomSheetData != null && bottomSheetData!.isNotEmpty) {
          if (skillInfoList.isNotEmpty) {
            if (firstSheetItem.key != "push-order") {
              bottomSheetData!.insert(0, SheetItem(K.push_order, "push-order"));
              eventCenter.emit(EventConstant.UpdateBottomSheet);
            }
          } else {
            if (firstSheetItem.key == "push-order") {
              bottomSheetData!.removeAt(0);
              eventCenter.emit(EventConstant.UpdateBottomSheet);
            }
          }
        }
      }
    }
  }

  onIconTap() async {
    ///当前用户是8麦位的房主
    bool isEightOwner = room?.isEightOwner(position?.uid ?? 0) ?? false;
    bool isDefend = room?.config?.types == RoomTypes.RadioDefend;
    bool isPrivate = room?.config?.property == RoomProperty.Private;

    /// 是否房主位点击---如果开启了房主位并且当前麦位是房主位
    bool isCreator =
        room?.config?.showOwnerSeat == true && position?.isCreator == true;

    bool enabledPackageClear = isDefend == false;
    if (enabledPackageClear) {
      if (room?.isEightPosition == true || room?.isFivePosition == true) {
        if (position?.uid == room?.realRid) {
          enabledPackageClear = false;
        }
      } else if (room?.positions.length != 2) {
        if ((position?.position ?? 0) <= 0) {
          enabledPackageClear = false;
        }
      }
    }
    List<SheetItem> res = [];
    Purview? purview = room?.purview;
    String title = K.room_operate_options;

    if (isEightOwner || isCreator) {
      if (Session.uid == position?.uid || room?.isCreator == true) {
        title = K.room_what_do_u_do_to_u;
        res = buildEightOwnerSheet();
      } else {
        if ((position?.uid ?? 0) <= 0) {
          await RoomNavUtil.goToImageScreenDialog(
              context!, RoomPosition.fromCreator(room!.createor!), room!);
        } else {
          await RoomNavUtil.goToImageScreenDialog(context!, position, room!);
        }

        return;
      }
    } else {
      if (room?.config?.factoryType == RoomFactoryType.BusinessPayVoice &&
          position?.position == 1) {
        if (room!.positions[0].uid == Session.uid &&
            room!.positions[1].uid == 0) {
          //已经在接待位因为不能给自己打赏所以不能切换到普通麦坑
          Fluttertoast.showCenter(msg: K.room_in_mic_limit);
          return;
        }
        if (position!.uid == 0) {
          MicTimeSelectWidget.show(context!, room!, 0);
          return;
        } else if (position!.uid == Session.uid) {
          _showLeaveMicConfirm();
          return;
        }
      }

      if (position?.uid == 0) {
        res = await buildEmptyMicSheet(
            isDefend, isPrivate, enabledPackageClear, purview);
      } else if (position?.uid == Session.uid) {
        title = K.room_what_do_u_do_to_u;
        if ((room?.isKtvRoom == true || room?.isKtvChorusRoom == true)) {
          // K歌房\一起看房，房主不在麦上也展示在麦位上，点击类似房主位
          res = buildEightOwnerSheet();
        } else {
          res = buildSelfSheet(isDefend, isPrivate);
        }
      } else {
        title = K.room_what_do_u_do([(position?.name ?? '')]);
        res = buildInMicSheet(purview, isPrivate, enabledPackageClear);
      }
    }
    if (res.isEmpty) return;

    bottomSheetData = res;
    SheetCallback? result = await displayModalBottomSheet(
        context: context!,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: title, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (result.value?.key == 'position-leave') {
      // 离开
      await MicRepo.setMicState(room?.realRid ?? 0, result.value?.extra);
      return;
    }
    if (result.value?.key == 'counter') {
      //显示多长时间
      _displayCounter();
      return;
    }
    if (result.value?.key == 'mic-leavel') {
      // 游戏过程中不能下麦
      if (_isGameStarted()) {
        Fluttertoast.showToast(
            msg: K.room_cant_leave_mic_in_playing,
            gravity: ToastGravity.CENTER);
        return;
      }
    }
    if (result.value?.key == 'push-order') {
      List<SheetItem> sheetItems = [];
      for (var info in skillInfoList) {
        sheetItems.add(SheetItem(info.name, '${info.cid}'));
      }
      SheetCallback? result = await displayModalBottomSheet(
          context: context!,
          builder: (BuildContext context) {
            return RadioBottomSheet(title: K.room_skill, data: sheetItems);
          });
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }
      int cid = Util.parseInt(result.value?.key);
      _showPushOrderConfirm(cid, room?.realRid ?? 0, position?.uid ?? 0,
          result.value?.label ?? '');

      return;
    }

    handleIconTap(position!, result.value?.key ?? '', result.value?.extra);
  }

  handleIconTap(RoomPosition position, String key, [dynamic extra]) async {
    ChatRoomUtil.handleIconTap(context!, room!, position, key, extra);
  }

  _showPushOrderConfirm(int cid, int rid, int god, String skillName) async {
    String godName = position?.name ?? '';
    bool? result = await showDialog(
        context: context!,
        builder: (BuildContext context) {
          return ConfirmDialog(
            content:
                '${K.if_push_order_to_boss}$godName${R.string('become_de')}$skillName${R.string('room_skill')}',
          );
        });

    if (result != null && result == true) {
      if (!ChatRoomUtil.bossChairHasUser()) {
        Fluttertoast.showToast(
            msg: K.boss_null_cannot_push_order, gravity: ToastGravity.CENTER);
        return;
      }
      int? bossPosition = ChatRoomUtil.getBossChairPositions()
          .lastWhereOrNull(
            (position) => position.uid > 0,
          )
          ?.position;
      bossPosition ??= room?.bossPosition ?? -1;
      int boss = (bossPosition >= 0) ? room!.positions[bossPosition].uid : 0;
      try {
        XhrResponse response = await Xhr.postJson(
            '${System.domain}room/pushOrder',
            {
              'god': god.toString(),
              'boss': boss.toString(),
              'rid': rid.toString(),
              'cid': cid.toString(),
            },
            throwOnError: true);
        Map res = response.value();
        if (res['success'] == true) {
          Fluttertoast.showToast(
              msg: K.has_pushed_order_for_boss, gravity: ToastGravity.CENTER);
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
      }
    }
  }

  _showLeaveMicConfirm() {
    showDialog(
        context: context!,
        builder: (context) {
          return ConfirmDialog(
            content: K.room_leave_will_clean_time,
            positiveButton: PositiveButton(
              text: K.room_not_now,
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            negativeButton: NegativeButton(
              text: K.room_confirm_leave_mic,
              onPressed: () {
                Navigator.of(context).pop();
                room!.emit(RoomConstant.Event_End_Remain_Time);
              },
            ),
          );
        });
  }

  _displayCounter() async {
    List<SheetItem> res = List.generate(10, (int i) {
      return SheetItem(K.room_few_mins(["${i + 1}"]), "counter", i + 1);
    });
    SheetCallback? result = await displayModalBottomSheet(
        context: context!,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    handleIconTap(position!, result.value?.key ?? '', result.value?.extra);
  }

  bool _isGameStarted() {
    if (room!.config?.game == Games.Under) {
      return room!.config?.underData?.gameUnderState != GameUnderState.Wait &&
          room!.config?.underData?.gameUnderState != GameUnderState.End;
    } else if (room!.config?.game == Games.Guess) {
      IDrawGuessManager drawGuessManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_DRAW_GUESS);
      return drawGuessManager.isGaming();
    } else if (room!.isGuessQueue) {
      return ChatRoomUtil.isGuessQueueStarted(room!);
    }
    return false;
  }
}

class SkillInfo {
  int cid;
  String name;

  SkillInfo.fromJson(jsonRes)
      : cid = Util.parseInt(jsonRes['cid']),
        name = Util.notNullStr(jsonRes['name']);
}
