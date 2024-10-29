import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/circle_position_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/mark_role_item_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/mark_role_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_base_user_icon.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_role_label.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_role_seer_label.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';
import 'package:provider/provider.dart' hide Selector;

enum WolfIconStyle {
  left, //左侧麦位
  right, //右侧麦位
}

///
/// 用户麦位视图
///
class WolfUserIcon extends StatefulWidget {
  static const double iconSize = 44;
  static const double left = 25;
  static const double right = 16;
  static const Color borderColor = Color(0xFF4B4B4B);

  final Map<int, bool>? speakers;
  final ChatRoomData room;
  final bool displayEmote;
  final RoomPosition? roomPosition;
  final WolfIconStyle? style;
  final int? position;
  final WolfModel wolfModel;

  const WolfUserIcon(
      {super.key,
      required this.room,
      this.roomPosition,
      this.speakers,
      required this.displayEmote,
      this.style,
      this.position,
      required this.wolfModel});

  @override
  _WolfUserIconState createState() => _WolfUserIconState();
}

class _WolfUserIconState extends State<WolfUserIcon> {
  //用户信息(性别/年龄/狼人等级称号)
  Widget _buildUserInfo(RoomPosition? item) {
    double width = 102;
    if (item == null || item.uidOrOrigin <= 0) {
      return SizedBox(
        width: width,
        height: WolfUserIcon.iconSize + 6.0,
      );
    }
    bool isLeft = widget.style == WolfIconStyle.left;
    String bgPath = '';
    WolfPositionData? itemWolfPositionData =
        item.positionExpendData as WolfPositionData?;
    if (itemWolfPositionData?.readyState == WolfReadyState.ready &&
        item.uid > 0) {
      if (isLeft) {
        bgPath = 'wolfv2/user_icon/wolf_user_icon_unready_left_bg.webp';
      } else {
        bgPath = 'wolfv2/user_icon/wolf_user_icon_unready_right_bg.webp';
      }
    } else {
      if (isLeft) {
        bgPath = 'wolfv2/user_icon/wolf_user_icon_unready_left_bg.webp';
      } else {
        bgPath = 'wolfv2/user_icon/wolf_user_icon_unready_right_bg.webp';
      }
    }

    Widget nameWidget = Container(
      constraints: const BoxConstraints(
        maxWidth: 58.0,
      ),
      child: _buildName(item.name),
    );

    List<Widget> res = [];
    if (isLeft) {
      res.add(
        _buildSex(item),
      );
      res.add(
        Container(
          width: 2.0,
        ),
      );
      res.add(
        nameWidget,
      );
    } else {
      res.add(
        nameWidget,
      );
      res.add(
        Container(
          width: 2.0,
        ),
      );
      res.add(
        _buildSex(item),
      );
    }

    return Container(
      width: width,
      height: WolfUserIcon.iconSize + 6.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(
              bgPath,
              package: ComponentManager.MANAGER_WERE_WOLF,
            ),
          ),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          if (itemWolfPositionData?.levelIcon != null &&
              itemWolfPositionData!.levelIcon.isNotEmpty)
            PositionedDirectional(
              top: 4.0,
              start: isLeft ? 24 : null,
              end: isLeft ? null : 24,
              child: CachedNetworkImage(
                width: 55,
                height: 16,
                imageUrl:
                    '${System.imageDomain}${itemWolfPositionData.levelIcon}',
              ),
            ),
          PositionedDirectional(
            bottom: 8.0,
            start: isLeft ? 24.0 : null,
            end: isLeft ? null : 24.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: res,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName(String name) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10.0,
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }

  //用户头像及用户信息
  Widget _buildUserIconAndInfo(RoomPosition? item) {
    return SizedBox(
      width: 125.0, //102.0+23.0
      height: WolfUserIcon.iconSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          PositionedDirectional(
            top: -2.0,
            start: widget.style == WolfIconStyle.left ? 23.0 : null,
            end: widget.style == WolfIconStyle.right ? 23.0 : null,
            child: _buildUserInfo(item),
          ),
          PositionedDirectional(
            top: 0.0,
            start: widget.style == WolfIconStyle.left ? 0 : null,
            end: widget.style == WolfIconStyle.right ? 0 : null,
            child: _buildUserIcon(item),
          ),
        ],
      ),
    );
  }

  //用户基础头像
  GlobalKey? _userIconKey;

  Widget _buildAvatar(RoomPosition item) {
    Widget widget;
    _userIconKey = GlobalKey();
    widget = WolfBaseUserIcon(
        key: _userIconKey,
        room: this.widget.room,
        position: item,
        size: WolfUserIcon.iconSize,
        displayEmote: false);

    return Container(
      height: WolfUserIcon.iconSize,
      width: WolfUserIcon.iconSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: widget,
    );
  }

  //用户头像框
  Widget? _buildAvatarFrame(RoomPosition? item) {
    Widget childWidget;
    double overflow;
    String? frameImage = item?.getFrameImg();
    if (frameImage != null && frameImage.isNotEmpty) {
      overflow = -5.0;
      childWidget = IgnorePointer(
        child: CachedNetworkImage(
          imageUrl: frameImage,
        ),
      );

      return PositionedDirectional(
        start: overflow,
        end: overflow,
        top: overflow,
        bottom: overflow,
        child: childWidget,
      );
    }

    return null;
  }

  //用户默认头像
  Widget _buildAvatarDefault(RoomPosition item) {
    double overflow = -3.0;

    Widget childWidget = IgnorePointer(
      child: R.img(
        item.uid == -1
            ? 'wolfv2/user_icon/wolf_user_icon_locked.webp'
            : 'wolfv2/user_icon/wolf_user_icon_await.webp',
        width: WolfUserIcon.iconSize - overflow,
        height: WolfUserIcon.iconSize - overflow,
        package: ComponentManager.MANAGER_WERE_WOLF,
      ),
    );
    return PositionedDirectional(
      start: overflow,
      end: overflow,
      top: overflow,
      bottom: overflow,
      child: childWidget,
    );
  }

  //用户头像边框：普通
  Widget _buildAvatarBorderNormal(RoomPosition? item) {
    // 头像框
    String? frameImage = item?.getFrameImg();
    if (frameImage != null && frameImage.isNotEmpty) {
      return Container();
    }

    double overflow;
    Widget childWidget;
    overflow = -3.0;
    childWidget = IgnorePointer(
      child: R.img(
        'wolfv2/user_icon/wolf_user_icon_default_border.webp',
        width: WolfUserIcon.iconSize - overflow,
        height: WolfUserIcon.iconSize - overflow,
        package: ComponentManager.MANAGER_WERE_WOLF,
      ),
    );

    return PositionedDirectional(
      start: overflow,
      end: overflow,
      top: overflow,
      bottom: overflow,
      child: childWidget,
    );
  }

  //用户头像边框：可发言且不在发言中
  Widget? _buildAvatarBorderCanSpeak(RoomPosition item) {
    bool canSpeak = false;
    WolfConfigData? wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData?;
    WolfState? wolfState = wolfConfigData?.state;
    if (wolfState == WolfState.DaytimeDesc ||
        wolfState == WolfState.DaytimeLastWords ||
        wolfState == WolfState.PoliceDesc) {
      //发言阶段
      if (item.position == wolfConfigData?.current) {
        //当前发言麦序
        canSpeak = true;
      }
    }

    bool isSpeaking = item.uid > 0 &&
        widget.speakers != null &&
        widget.speakers!.containsKey(item.uid);

    double overflow;
    Widget childWidget;
    if (canSpeak && !isSpeaking) {
      //可发言 && 不在发言中
      overflow = -6.0;
      childWidget = IgnorePointer(
        child: R.img(
          'wolfv2/user_icon/wolf_user_icon_can_speak.webp',
          width: WolfUserIcon.iconSize - overflow,
          height: WolfUserIcon.iconSize - overflow,
          package: ComponentManager.MANAGER_WERE_WOLF,
        ),
      );

      return PositionedDirectional(
        start: overflow,
        end: overflow,
        top: overflow,
        bottom: overflow,
        child: childWidget,
      );
    } else {
      return null;
    }
  }

  //用户头像边框：选中
  Widget? _buildAvatarBorderSelected(RoomPosition item) {
    bool beSelected = false;
    if (widget.wolfModel.actionUid > 0 &&
        widget.wolfModel.actionUid == item.originId) {
      beSelected = true;
    }

    double overflow;
    Widget childWidget;
    if (beSelected) {
      //选中
      overflow = -6.0;
      childWidget = IgnorePointer(
        child: R.img(
          'wolfv2/user_icon/wolf_user_icon_selected_border.webp',
          width: WolfUserIcon.iconSize - overflow,
          height: WolfUserIcon.iconSize - overflow,
          package: ComponentManager.MANAGER_WERE_WOLF,
        ),
      );

      return PositionedDirectional(
        start: overflow,
        end: overflow,
        top: overflow,
        bottom: overflow,
        child: childWidget,
      );
    } else {
      return null;
    }
  }

  // 死亡&离线
  Widget? _buildDeadAndOffline(RoomPosition? item) {
    WolfPositionData? itemWolfPositionData =
        item?.positionExpendData as WolfPositionData?;

    if (itemWolfPositionData == null) return null;

    //死亡状态
    bool isDead = itemWolfPositionData.isDead;

    //离线状态
    bool offline = (item!.uid == 0 && itemWolfPositionData.origin > 0);

    Widget? childWidget;
    if (isDead) {
      String imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_kill.webp';
      if (itemWolfPositionData.deadType == WolfDeadType.killDead) {
        imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_kill.webp';
      } else if (itemWolfPositionData.deadType == WolfDeadType.voteDead) {
        imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_vote.webp';
      } else if (itemWolfPositionData.deadType == WolfDeadType.gunDead) {
        imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_gun.webp';
      } else if (itemWolfPositionData.deadType == WolfDeadType.explodeDead) {
        imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_explode.webp';
      }
      childWidget = R.img(imgPath,
          width: 44, height: 44, package: ComponentManager.MANAGER_WERE_WOLF);
    } else if (offline) {
      String imgPath = 'wolfv2/user_icon/ic_wolf_label_offline.webp';
      childWidget = R.img(imgPath,
          width: 44, height: 44, package: ComponentManager.MANAGER_WERE_WOLF);
    }

    if (childWidget == null) return null;
    return IgnorePointer(
      child: Container(
        width: WolfUserIcon.iconSize,
        height: WolfUserIcon.iconSize,
        alignment: Alignment.center,
        child: childWidget,
      ),
    );
  }

  // 发言中(发言状态)
  Widget? _buildDescAndWait(RoomPosition item) {
    bool isSpeaking = item.uid > 0 &&
        widget.speakers != null &&
        widget.speakers!.containsKey(item.uid);

    Widget? childWidget;
    double overflow = -3.0;

    if (isSpeaking) {
      WolfConfigData? wolfConfigData =
          widget.room.config?.configExpendData as WolfConfigData?;
      if (wolfConfigData?.state == WolfState.Wait) {
        //准备阶段
      }

      String imgPath = 'wolfv2/user_icon/ic_wolf_label_speaking_all.webp';
      childWidget = R.img(imgPath,
          width: WolfUserIcon.iconSize - overflow,
          height: WolfUserIcon.iconSize - overflow,
          package: ComponentManager.MANAGER_WERE_WOLF);
    }
    if (childWidget == null) return null;

    return PositionedDirectional(
      start: overflow,
      end: overflow,
      top: overflow,
      bottom: overflow,
      child: IgnorePointer(
        child: Container(
          width: WolfUserIcon.iconSize - overflow,
          height: WolfUserIcon.iconSize - overflow,
          alignment: Alignment.center,
          child: childWidget,
        ),
      ),
    );
  }

  // 狼人击杀标 todo
  Widget? _buildKillingLabel(RoomPosition? item) {
    //只给狼人显示
    WolfConfigData? wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData?;
    //夜晚杀人阶段
    WolfState? wolfState = wolfConfigData?.state;
    if (!(wolfState == WolfState.NightAction ||
        wolfState == WolfState.NightAntidote ||
        wolfState == WolfState.NightPoison)) return null;

    //自己是狼人
    RoomPosition? selfPosition = WolfOpUtil.getRoomPosition(widget.room);
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;
    if (selfWolfPositionData?.role == null ||
        selfWolfPositionData!.role != WolfRole.Werewolf) return null;

    int uid = item?.uidOrOrigin ?? 0;
    Map<int, List<RoomPosition>> killingData = <int, List<RoomPosition>>{};
    //狼人杀人阶段，显示狼人杀人图标
    if (wolfConfigData?.state == WolfState.NightAction) {
      for (var element in widget.room.positions) {
        WolfPositionData? elementWolfPositionData =
            element.positionExpendData as WolfPositionData?;
        if (elementWolfPositionData?.role == WolfRole.Werewolf) {
          int targetUid = elementWolfPositionData!.actionUid;
          if (killingData.containsKey(targetUid)) {
            killingData[targetUid]!.add(element);
          } else {
            killingData[targetUid] = [element];
          }
        }
      }
    }

    if (uid > 0 && killingData.containsKey(uid)) {
      double overflow = -2.0;
      return PositionedDirectional(
          start: overflow,
          end: overflow,
          top: overflow,
          bottom: overflow,
          child: IgnorePointer(
            child: Container(
              decoration: const ShapeDecoration(
                  color: Color(0x66FF2D2D),
                  shape: CircleBorder(
                      side: BorderSide(color: Color(0xFFFF2D2D), width: 2.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: killingData[uid]!
                        .take(2)
                        .map((item) => CirclePositionWidget(
                            positionText: WolfParseUtil.encodePosition(
                                item.position, selfPosition)))
                        .toList(growable: false),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: killingData[uid]!
                        .skip(2)
                        .take(2)
                        .map((item) => CirclePositionWidget(
                            positionText: WolfParseUtil.encodePosition(
                                item.position, selfPosition)))
                        .toList(growable: false),
                  ),
                ],
              ),
            ),
          ));
    } else {
      return null;
    }
  }

  //PK标签 todo
  Widget? _buildPKLabel(RoomPosition item) {
    if (WolfOpUtil.isPK(widget.room, item)) {
      return PositionedDirectional(
        top: 7.0,
        start: widget.style == WolfIconStyle.left ? -9 : null,
        end: widget.style == WolfIconStyle.right ? -9 : null,
        child: R.img(
          'wolfv2/user_icon/ic_wolf_label_pk.webp',
          width: 23.0,
          height: 16.0,
          package: ComponentManager.MANAGER_WERE_WOLF,
        ),
      );
    } else {
      return null;
    }
  }

  //警上&退水&警长标识 todo
  Widget? _buildPoliceJoinLabel(RoomPosition? item) {
    String? imgPath;
    WolfPositionData? selfWolfPositionData =
        item?.positionExpendData as WolfPositionData?;
    if (selfWolfPositionData?.police == 1) {
      //警长
      imgPath = 'wolfv2/user_icon/ic_wolf_icon_label_police.webp';
    } else {
      WolfConfigData? wolfConfigData =
          widget.room.config?.configExpendData as WolfConfigData?;
      if (wolfConfigData?.currentResult == null) return null;

      Map? dataMap = wolfConfigData?.currentResult!['policeJoinConfig'];
      if (dataMap == null) return null;

      PoliceJoinConfig policeJoinConfig =
          PoliceJoinConfig.fromJson(dataMap as Map<String, dynamic>);

      if (policeJoinConfig.exitPosition.contains(item?.position)) {
        imgPath = 'wolfv2/user_icon/ic_wolf_icon_label_police_exit.webp';
      } else if (policeJoinConfig.joinPosition.contains(item?.position)) {
        imgPath = 'wolfv2/user_icon/ic_wolf_icon_label_police_join.webp';
      }
    }

    if (imgPath == null || imgPath.isEmpty) return null;

    return PositionedDirectional(
        top: -2.0,
        start: widget.style == WolfIconStyle.left ? -9.0 : null,
        end: widget.style == WolfIconStyle.right ? -9.0 : null,
        child: R.img(imgPath,
            width: 20.0,
            height: 20.0,
            package: ComponentManager.MANAGER_WERE_WOLF));
  }

  // 角色标签(真实身份) todo
  Widget? _buildRoleLabel(RoomPosition? item) {
    RoomPosition? rp = WolfOpUtil.getRoomPosition(widget.room);
    WolfPositionData? rpWolfPositionData =
        rp?.positionExpendData as WolfPositionData?;
    WolfPositionData? itemWolfPositionData =
        item?.positionExpendData as WolfPositionData?;

    if (rpWolfPositionData?.role == null ||
        rpWolfPositionData?.role == WolfRole.None) return null;
    WolfConfigData? wolfConfigData =
        ChatRoomData.getInstance()?.config?.configExpendData as WolfConfigData?;
    //item是自己 或 item是狼人自己也是狼人 或者身份需公示（猎人开枪带走后，公示猎人身份）
    // 或者 明牌场
    if (item?.uidOrOrigin == Session.uid ||
        (itemWolfPositionData?.role == WolfRole.Werewolf &&
            rpWolfPositionData?.role == WolfRole.Werewolf) ||
        (itemWolfPositionData?.publishRole ?? false) ||
        ((wolfConfigData?.publishDeal ?? false) &&
            (itemWolfPositionData?.isDead ?? false))) {
      return PositionedDirectional(
        top: -2.0,
        start: widget.style == WolfIconStyle.right ? -9.0 : null,
        end: widget.style == WolfIconStyle.left ? -9.0 : null,
        child: WolfRoleLabel(
          role: itemWolfPositionData?.role,
        ),
      );
    } else {
      return null;
    }
  }

  // 金水
  Widget? _buildSeerMarkRole(RoomPosition item) {
    RoomPosition? selfPosition = WolfOpUtil.getRoomPosition(widget.room);
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;

    if (selfWolfPositionData?.role == null ||
        selfWolfPositionData?.role == WolfRole.None) return null;

//    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
    int flag = widget.wolfModel.getSeerMark(item.uidOrOrigin);
    if (flag <= 0) return null;

    return PositionedDirectional(
        top: -2.0,
        start: widget.style == WolfIconStyle.right ? -9.0 : null,
        end: widget.style == WolfIconStyle.left ? -9.0 : null,
        child: WolfRoleSeerLabel(
          flag: flag,
        ));
  }

  // 玩家标记
  Widget? _buildMarkRole(RoomPosition item) {
    RoomPosition? selfPosition = WolfOpUtil.getRoomPosition(widget.room);
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;

    if (selfWolfPositionData?.role == null ||
        selfWolfPositionData?.role == WolfRole.None) return null;

//    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
    WolfRole? markedRole = widget.wolfModel.getMarkedRole(item.uidOrOrigin);
    if (markedRole == null) return null;

    return PositionedDirectional(
        top: -2.0,
        start: widget.style == WolfIconStyle.right ? -9.0 : null,
        end: widget.style == WolfIconStyle.left ? -9.0 : null,
        child: MarkRoleItemWidget(
          wolfRole: markedRole,
          size: 20,
        ));
  }

  //房主
  Widget? _buildCreator(RoomPosition? item) {
    bool isCreator = item != null &&
        item.uidOrOrigin > 0 &&
        widget.room.config?.uid == item.uidOrOrigin;

    if (isCreator) {
      return PositionedDirectional(
        bottom: 0.0,
        end: widget.style == WolfIconStyle.left ? 13.0 : null,
        start: widget.style == WolfIconStyle.right ? 13.0 : null,
        child: R.img(
          'wolfv2/user_icon/ic_wolf_position_creator.webp',
          width: 18.0,
          height: 10.0,
          package: ComponentManager.MANAGER_WERE_WOLF,
        ),
      );
    }
    return null;
  }

  //性别 todo
  Widget _buildSex(RoomPosition? item) {
    String sexIcon = '';
    if (item?.sex == Sex.Male) {
      sexIcon = 'wolfv2/user_icon/icon_sex_male.webp';
    } else if (item?.sex == Sex.Female) {
      sexIcon = 'wolfv2/user_icon/icon_sex_female.webp';
    }

    if (sexIcon.isNotEmpty) {
      return R.img(
        sexIcon,
        width: 13.0,
        height: 17.0,
        package: ComponentManager.MANAGER_WERE_WOLF,
      );
    }
    return const SizedBox();
  }

  //序号或你或准备
  Widget _buildPosition(RoomPosition? item) {
    bool isSelf = (item != null &&
        item.uidOrOrigin > 0 &&
        Session.uid == item.uidOrOrigin);

    WolfConfigData? wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData?;
    bool isReady = false;
    if (wolfConfigData?.state == WolfState.Wait) {
      //准备阶段
      if ((item?.uid ?? 0) > 0) {
        //麦上有人
        WolfPositionData? itemWolfPositionData =
            item?.positionExpendData as WolfPositionData?;
        isReady = itemWolfPositionData?.readyState == WolfReadyState.ready;
      }
    }

    Widget positionWidget = Container(
      width: 22.0,
      height: 22.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(
              isReady
                  ? 'wolfv2/user_icon/wolf_position_ready.webp'
                  : (isSelf
                      ? 'wolfv2/user_icon/wolf_position_self_bg.webp'
                      : 'wolfv2/user_icon/wolf_position_bg.webp'),
              package: ComponentManager.MANAGER_WERE_WOLF,
            ),
          ),
        ),
      ),
      child: Text(
        isReady ? '' : (isSelf ? '你' : '${item!.position + 1}'),
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    );

    return PositionedDirectional(
      bottom: -2.0,
      end: widget.style == WolfIconStyle.right ? -9.0 : null,
      start: widget.style == WolfIconStyle.left ? -9.0 : null,
      child: positionWidget,
    );
  }

  Widget? _buildForbidden(RoomPosition? item) {
    if (item != null && item.forbidden) {
      WolfConfigData? wolfConfigData =
          widget.room.config?.configExpendData as WolfConfigData?;
      WolfState? wolfState = wolfConfigData?.state;
      if (wolfState == WolfState.Wait ||
          wolfState == WolfState.GameEnd ||
          wolfState == WolfState.End) {
        //非游戏中状态
        return MicForbidden(forbidden: item.forbidden);
      }
    }
    return null;
  }

  ///
  /// 用户头像及相关状态
  /// 占用width为WolfUserIcon.iconSize,超过部分为visible
  ///
  Widget _buildUserIcon(RoomPosition? item) {
    if (item?.uid == -1) {
      //空麦位置，如6、9人房间
      return SizedBox(
        width: WolfUserIcon.iconSize,
        height: WolfUserIcon.iconSize,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [_buildAvatarDefault(item!)],
        ),
      );
    }
    WolfConfigData? wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData?;
    List<Widget> res = [];

    //用户基础头像
    Widget avatarWidget = _buildAvatar(item!);
    res.add(avatarWidget);

    //用户自定义头像框frame
    Widget? avatarFrameWidget = _buildAvatarFrame(item);
    if (avatarFrameWidget != null) {
      res.add(avatarFrameWidget);
    }

    //用户头像边框 或 默认
    if (item.uid == 0 && wolfConfigData?.state == WolfState.Wait) {
      //等待状态且坑位没人
      Widget avatarDefaultWidget = _buildAvatarDefault(item);
      res.add(avatarDefaultWidget);
    } else {
      //如果可发言
      //如果选中
      //默认边框
      bool canNormal = true;

      Widget? avatarBorderSelectedWidget = _buildAvatarBorderSelected(item);
      if (avatarBorderSelectedWidget != null) {
        res.add(avatarBorderSelectedWidget);
        canNormal = false;
      }

      Widget? avatarBorderCanSpeakWidget = _buildAvatarBorderCanSpeak(item);
      if (avatarBorderCanSpeakWidget != null) {
        res.add(avatarBorderCanSpeakWidget);
        canNormal = false;
      }

      if (canNormal) {
        Widget avatarBorderNormalWidget = _buildAvatarBorderNormal(item);
        res.add(avatarBorderNormalWidget);
      }
    }

    //死亡&离线
    Widget? deadAndOfflineWidget = _buildDeadAndOffline(item);
    if (deadAndOfflineWidget != null) res.add(deadAndOfflineWidget);

    // //准备
    // Widget readyWidget = _buildReady(item);
    // if (readyWidget != null) res.add(readyWidget);

    //发言中(发言状态)&等待
    Widget? descAndWaitWidget = _buildDescAndWait(item);
    if (descAndWaitWidget != null) res.add(descAndWaitWidget);

    //狼人击杀标识
    Widget? killingLabel = _buildKillingLabel(item);
    if (killingLabel != null) res.add(killingLabel);

    //PK标识
    Widget? pkLabel = _buildPKLabel(item);
    if (pkLabel != null) res.add(pkLabel);

    //警上&退水&警长标识
    Widget? policeJoinLabel = _buildPoliceJoinLabel(item);
    if (policeJoinLabel != null) res.add(policeJoinLabel);

    //角色标签(真实身份)
    Widget? roleLabel = _buildRoleLabel(item);
    if (roleLabel != null) {
      res.add(roleLabel);
    } else {
      //金水&玩家标记
      Widget? seerMarkRole = _buildSeerMarkRole(item);
      if (seerMarkRole != null) {
        res.add(seerMarkRole);
      } else {
        Widget? markRole = _buildMarkRole(item);
        if (markRole != null) res.add(markRole);
      }
    }

    //房主标签
    Widget? creatorWidget = _buildCreator(item);
    if (creatorWidget != null) res.add(creatorWidget);

    //序号或你或准备
    Widget positionWidget = _buildPosition(item);
    res.add(positionWidget);

    //表情
    if (widget.displayEmote) {
      res.add(EmoteAtMic(
        uid: item.uid,
        position: item.position,
        width: WolfUserIcon.iconSize,
      ));
    }

    //禁麦
    Widget? forbiddenWidget = _buildForbidden(item);
    if (forbiddenWidget != null) {
      res.add(
        forbiddenWidget,
      );
    }

    return SizedBox(
      width: WolfUserIcon.iconSize,
      height: WolfUserIcon.iconSize,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: res,
      ),
    );
  }

  Widget _buildBody(RoomPosition? item) {
    WolfConfigData? wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData?;
    bool isWaitState = wolfConfigData?.state == WolfState.Wait;

    List<Widget> widgets = <Widget>[
      Container(width: WolfUserIcon.left), //16.0+9.0
      isWaitState ? _buildUserIconAndInfo(item) : _buildUserIcon(item),
      Container(width: WolfUserIcon.right), //7.0+9.0
    ];
    if (widget.style == WolfIconStyle.right)
      widgets = widgets.reversed.toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ((_userIconKey?.currentState as WolfUserIconState?)?.onIconTap()),
      child: _buildBody(widget.roomPosition),
    );
  }
}

///
/// 点击行为实现
///
class WolfUserIconState extends WolfBaseUserIconState {
  _onTapNormal() {
    WolfConfigData wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData;
    WolfState wolfState = wolfConfigData.state;
    if (wolfState == WolfState.Wait ||
        wolfState == WolfState.GameEnd ||
        wolfState == WolfState.End) {
      super.onIconTap();
    } else {
      //点击有用户的麦位，显示用户资料
      WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
      int uid = widget.position.uidOrOrigin;

      RoomPosition? selfPosition = WolfOpUtil.getRoomPosition(widget.room);
      WolfPositionData? selfWolfPositionData =
          selfPosition?.positionExpendData as WolfPositionData?;
      bool showMarkRole =
          selfPosition != null && !(selfWolfPositionData?.isDead ?? false);

      if (selfPosition != null &&
          (selfWolfPositionData?.role == null ||
              selfWolfPositionData?.role == WolfRole.None)) {
        return;
      }

      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.goToImageScreenDialog(
        context,
        widget.position,
        widget.room,
        topWidget: showMarkRole
            ? MarkRoleWidget(
                uid: uid,
                wolfModel: wolfModel,
                markdedRole: wolfModel.getMarkedRole(uid),
              )
            : null,
      );
    }
  }

  @override
  onIconTap() async {
    WolfConfigData wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData;
    WolfState wolfState = wolfConfigData.state;
    RoomPosition position = widget.position;
    WolfPositionData? wolfPositionData =
        position.positionExpendData as WolfPositionData?;
    RoomPosition? selfPosition = WolfOpUtil.getRoomPosition(widget.room);
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;
    int uid = position.uidOrOrigin;
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);

    Log.d(
        'User icon tapped, itemUid: $uid, selfData: ${selfWolfPositionData?.toJson()}');

    //自己不在麦上或者没有行动权限
    if (selfPosition == null ||
        selfWolfPositionData?.actionStatus != WolfActionStatus.enable) {
      _onTapNormal();
      return;
    }

    //点击已出局玩家
    if (wolfPositionData?.isDead ?? false) {
      //猎人带走
      if (selfWolfPositionData!.role == WolfRole.Hunter &&
          wolfState == WolfState.DaytimeLastWords) {
        Fluttertoast.showToast(msg: R.string('the_palyer_cant_take_away'));
      } else {
        _onTapNormal();
      }
      return;
    } else if (selfWolfPositionData!.role == WolfRole.Werewolf &&
        wolfState == WolfState.NightAction) {
      //狼人杀人
      int isKill =
          selfWolfPositionData.actionUid == position.uidOrOrigin ? 0 : 1;

      wolfModel.wolfKill(widget.room.rid, uid, isKill, wolfConfigData.count);
      return;
    } else if (selfWolfPositionData.role == WolfRole.Seer &&
        wolfState == WolfState.NightAction) {
      //预言家验人

      wolfModel.seerRole(widget.room.rid, uid);
      return;
    } else if (selfWolfPositionData.role == WolfRole.Guard &&
        wolfState == WolfState.NightAction) {
      wolfModel.guardRole(widget.room.rid, uid, wolfConfigData.count);
      return;
    } else if (wolfState == WolfState.NightPoison &&
        selfWolfPositionData.role == WolfRole.Witch) {
      //女巫毒人

      wolfModel.poison(widget.room.rid, uid);
      return;
    } else if (wolfState == WolfState.NightAntidote &&
        selfWolfPositionData.role == WolfRole.Witch) {
      //女巫救人阶段，麦位无操作
      //await wolfModel.antidote(this.widget.room.rid, uid);
    } else if (wolfState == WolfState.DaytimeGun &&
        selfWolfPositionData.role == WolfRole.Hunter) {
      // 猎人带走
      wolfModel.gun(widget.room.rid, uid);
      return;
    } else if (wolfState == WolfState.DaytimeVote ||
        wolfState == WolfState.PoliceVote) {
      //投票

      if (selfWolfPositionData.actionStatus == WolfActionStatus.disable) {
        Fluttertoast.showToast(msg: K.wolf_vote_denied);
      }

      //活人但是不可选，当前为PK阶段，点击不可选麦位，toast提示
      if (wolfPositionData?.canBeSelected != true) {
        //只有pk投票阶段的非pk玩家,改字段才为false
        Fluttertoast.showToast(msg: K.wolf_vote_only_pk);
        return;
      }

      //投票
      wolfModel.vote(widget.room.rid, uid, 1, wolfConfigData.count, false);

      return;
    } else if (wolfState == WolfState.PoliceChange) {
      wolfModel.policeChange(widget.room.rid, uid);
      return;
    }

    _onTapNormal();
  }
}
