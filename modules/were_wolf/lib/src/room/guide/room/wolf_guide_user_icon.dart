import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_base_user_icon.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/circle_position_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_role_label.dart';
import 'package:provider/provider.dart' hide Selector;

///
///
class WolfGuideUserIcon extends StatefulWidget {
  static const double iconSize = 44;
  static const double left = 25;
  static const double right = 16;
  static const Color borderColor = Color(0xFF4B4B4B);

  final Map<int, bool>? speakers;
  final RoomPosition? roomPosition;
  final WolfGuideIconStyle? style;

  const WolfGuideUserIcon({
    super.key,
    this.roomPosition,
    this.speakers,
    this.style,
  });

  @override
  _WolfGuideUserIconState createState() => _WolfGuideUserIconState();
}

class _WolfGuideUserIconState extends State<WolfGuideUserIcon> {
  //用户信息(性别/年龄/狼人等级称号)
  Widget _buildUserInfo(RoomPosition? item) {
    double width = 102;
    if (item == null || item.uidOrOrigin <= 0) {
      return SizedBox(
        width: width,
        height: WolfGuideUserIcon.iconSize + 6.0,
      );
    }
    bool isLeft = widget.style == WolfGuideIconStyle.left;
    String bgPath = '';
    WolfGuidePosition? wolfGuidePosition =
        item.positionExpendData as WolfGuidePosition?;
    if (item.uid > 0) {
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
      child: Text(
        item.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10.0,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
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
      height: WolfGuideUserIcon.iconSize + 6.0,
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
          if (wolfGuidePosition?.levelIcon != null &&
              wolfGuidePosition!.levelIcon.isNotEmpty)
            PositionedDirectional(
              top: 4.0,
              start: isLeft ? 24 : null,
              end: isLeft ? null : 24,
              child: CachedNetworkImage(
                width: 55,
                height: 16,
                imageUrl: '${System.imageDomain}${wolfGuidePosition.levelIcon}',
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

  //用户头像及用户信息
  Widget _buildUserIconAndInfo(WolfModel wolfModel, RoomPosition? item) {
    return SizedBox(
      width: 125.0, //102.0+23.0
      height: WolfGuideUserIcon.iconSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          PositionedDirectional(
            top: -2.0,
            start: widget.style == WolfGuideIconStyle.left ? 23.0 : null,
            end: widget.style == WolfGuideIconStyle.right ? 23.0 : null,
            child: _buildUserInfo(item),
          ),
          PositionedDirectional(
            top: 0.0,
            start: widget.style == WolfGuideIconStyle.left ? 0 : null,
            end: widget.style == WolfGuideIconStyle.right ? 0 : null,
            child: _buildUserIcon(wolfModel, item),
          ),
        ],
      ),
    );
  }

  //用户基础头像
//  GlobalKey _userIconKey;
  Widget _buildAvatar(RoomPosition? item) {
    Widget widget;
    bool isSpeaking = item != null &&
        item.uid > 0 &&
        this.widget.speakers != null &&
        this.widget.speakers!.containsKey(item.uid) &&
        this.widget.speakers![item.uid] == true;
//    _userIconKey = GlobalKey();
    widget = WolfGuideBaseUserIcon(
//        key: _userIconKey,
      isSpeaking: isSpeaking,
      position: item!,
      size: WolfGuideUserIcon.iconSize,
    );

    return Container(
      height: WolfGuideUserIcon.iconSize,
      width: WolfGuideUserIcon.iconSize,
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
    // 头像框
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
  Widget _buildAvatarDefault(RoomPosition? item) {
    double overflow = -3.0;

    Widget childWidget = IgnorePointer(
      child: R.img(
        item?.uid == -1
            ? 'wolfv2/user_icon/wolf_user_icon_locked.webp'
            : 'wolfv2/user_icon/wolf_user_icon_await.webp',
        width: WolfGuideUserIcon.iconSize - overflow,
        height: WolfGuideUserIcon.iconSize - overflow,
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
    double overflow;
    Widget childWidget;
    overflow = -3.0;
    childWidget = IgnorePointer(
      child: R.img(
        'wolfv2/user_icon/wolf_user_icon_default_border.webp',
        width: WolfGuideUserIcon.iconSize - overflow,
        height: WolfGuideUserIcon.iconSize - overflow,
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

  //用户头像边框：可发言且不在发言中 todo
  Widget? _buildAvatarBorderCanSpeak(WolfModel wolfModel, RoomPosition? item) {
    if (item == null) {
      return null;
    }
    bool canSpeak = false;
    WolfGuideConfigState? state = wolfModel.data.currentState;
    if (state == WolfGuideConfigState.DaytimeDesc) {
      int index = wolfModel.data.positions!.indexWhere((element) {
        WolfGuidePosition wolfGuidePosition =
            element.positionExpendData as WolfGuidePosition;
        return !wolfGuidePosition.isDead && wolfGuidePosition.isDesc;
      });
      if (index >= 0) {
        RoomPosition roomPosition = wolfModel.data.positions![index];
        if (roomPosition.uid == item.uid) {
          canSpeak = true;
        }
      }
    }

    bool isSpeaking = item.uid > 0 &&
        widget.speakers != null &&
        widget.speakers!.containsKey(item.uid) &&
        widget.speakers![item.uid]!;

    double overflow;
    Widget childWidget;
    if (canSpeak && !isSpeaking) {
      //可发言 && 不在发言中
      overflow = -6.0;
      childWidget = IgnorePointer(
        child: R.img(
          'wolfv2/user_icon/wolf_user_icon_can_speak.webp',
          width: WolfGuideUserIcon.iconSize - overflow,
          height: WolfGuideUserIcon.iconSize - overflow,
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
  Widget? _buildAvatarBorderSelected(WolfModel wolfModel, RoomPosition? item) {
    bool beSelected = false;
    if (wolfModel.actionUid > 0 && wolfModel.actionUid == item?.uid) {
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
          width: WolfGuideUserIcon.iconSize - overflow,
          height: WolfGuideUserIcon.iconSize - overflow,
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
    WolfGuidePosition? guidePosition =
        item?.positionExpendData as WolfGuidePosition?;
    //死亡状态
    bool isDead = guidePosition?.isDead ?? true;

    //离线状态
    bool offline = false;

    Widget? childWidget;
    if (isDead) {
      String imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_kill.webp';
      if (guidePosition?.deadType == WolfDeadType.killDead) {
        imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_kill.webp';
      } else if (guidePosition?.deadType == WolfDeadType.voteDead) {
        imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_vote.webp';
      } else if (guidePosition?.deadType == WolfDeadType.gunDead) {
        imgPath = 'wolfv2/user_icon/ic_wolf_label_dead_gun.webp';
      } else if (guidePosition?.deadType == WolfDeadType.explodeDead) {
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
        width: WolfGuideUserIcon.iconSize,
        height: WolfGuideUserIcon.iconSize,
        alignment: Alignment.center,
        child: childWidget,
      ),
    );
  }

  // 准备
  Widget? _buildReady(WolfModel wolfModel, RoomPosition? item) {
    WolfGuideConfigState? state = wolfModel.data.currentState;
    bool isReady = state == WolfGuideConfigState.Wait;

    Widget? childWidget;
    if (isReady) {
      String imgPath = 'wolfv2/user_icon/ic_wolf_label_ready.webp';
      childWidget = R.img(imgPath,
          width: 44, height: 44, package: ComponentManager.MANAGER_WERE_WOLF);
    }

    if (childWidget == null) return null;
    return IgnorePointer(
      child: Container(
        width: WolfGuideUserIcon.iconSize,
        height: WolfGuideUserIcon.iconSize,
        alignment: Alignment.center,
        child: childWidget,
      ),
    );
  }

  // 发言中(发言状态)
  Widget? _buildDescAndWait(WolfModel wolfModel, RoomPosition? item) {
    if (item == null) {
      return null;
    }
    bool isSpeaking = item.uid > 0 &&
        widget.speakers != null &&
        widget.speakers!.containsKey(item.uid) &&
        widget.speakers![item.uid]!;

    Widget? childWidget;
    double overflow = -3.0;

    if (isSpeaking) {
      bool isGameWait = false;
      WolfGuideConfigState? state = wolfModel.data.currentState;
      bool isWaitState = state == WolfGuideConfigState.Wait;
      if (isWaitState) {
        //准备阶段
        isGameWait = true;
      }

      String imgPath = isGameWait
          ? 'wolfv2/user_icon/ic_wolf_label_speaking_for_game_wait.webp'
          : 'wolfv2/user_icon/ic_wolf_label_speaking.webp';
      childWidget = R.img(imgPath,
          width: WolfGuideUserIcon.iconSize - overflow,
          height: WolfGuideUserIcon.iconSize - overflow,
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
          width: WolfGuideUserIcon.iconSize - overflow,
          height: WolfGuideUserIcon.iconSize - overflow,
          alignment: Alignment.center,
          child: childWidget,
        ),
      ),
    );
  }

  // 狼人击杀标 todo
  Widget? _buildKillingLabel(WolfModel wolfModel, RoomPosition? item) {
    //非夜晚杀人阶段
    WolfGuideConfigState? state = wolfModel.data.currentState;
    if (state != WolfGuideConfigState.NightAction) {
      return null;
    }

    //自己是狼人
    RoomPosition? selfPosition = wolfModel.positionForCurrentUser();

    int uid = item?.uid ?? 0;
    Map<int, List<RoomPosition>>? killingData = wolfModel.data.killingData;

    if (uid > 0 &&
        killingData != null &&
        killingData.containsKey(uid) &&
        killingData[uid]!.isNotEmpty) {
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

  //PK标签
  Widget? _buildPKLabel(RoomPosition? item) {
    return null;
  }

  //警上&退水&警长标识
  Widget? _buildPoliceJoinLabel(RoomPosition? item) {
    return null;
  }

  // 角色标签(真实身份)
  Widget? _buildRoleLabel(WolfModel wolfModel, RoomPosition? item) {
    WolfGuideConfigState? state = wolfModel.data.currentState;
    if (state == WolfGuideConfigState.Wait ||
        state == WolfGuideConfigState.GameStart ||
        state == WolfGuideConfigState.GetRole) {
      return null;
    }

    RoomPosition? rp;
    for (var _ in wolfModel.data.positions!) {
      if (_.uidOrOrigin == Session.uid) {
        rp = _;
        break;
      }
    }

    WolfGuidePosition? rpWolfGuidePosition =
        rp?.positionExpendData as WolfGuidePosition?;
    WolfGuidePosition? itemWolfGuidePosition =
        item?.positionExpendData as WolfGuidePosition?;

    //item是自己 或 item是狼人自己也是狼人 或者身份需公示（猎人开枪带走后，公示猎人身份）
    // 或者 明牌场
    if (item?.uid == Session.uid ||
        (itemWolfGuidePosition?.role == WolfRole.Werewolf &&
            rpWolfGuidePosition?.role == WolfRole.Werewolf) ||
        itemWolfGuidePosition?.publishRole == true) {
      return PositionedDirectional(
        top: -2.0,
        start: widget.style == WolfGuideIconStyle.right ? -9.0 : null,
        end: widget.style == WolfGuideIconStyle.left ? -9.0 : null,
        child: WolfRoleLabel(
          role: itemWolfGuidePosition?.role,
        ),
      );
    } else {
      return null;
    }
  }

  // 金水
  Widget? _buildSeerMarkRole(RoomPosition? item) {
    return null;
  }

  // 玩家标记
  Widget? _buildMarkRole(RoomPosition? item) {
    return null;
  }

  //房主
  Widget? _buildCreator(RoomPosition? item) {
    bool isCreator = item?.position == 0;

    if (isCreator) {
      return PositionedDirectional(
        bottom: 0.0,
        end: widget.style == WolfGuideIconStyle.left ? 13.0 : null,
        start: widget.style == WolfGuideIconStyle.right ? 13.0 : null,
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

  //性别
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

  //序号或你
  Widget _buildPosition(RoomPosition? item) {
    bool isSelf = (item != null && item.uid > 0 && Session.uid == item.uid);
    Widget positionWidget = Container(
      width: 22.0,
      height: 22.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(
              isSelf
                  ? 'wolfv2/user_icon/wolf_position_self_bg.webp'
                  : 'wolfv2/user_icon/wolf_position_bg.webp',
              package: ComponentManager.MANAGER_WERE_WOLF,
            ),
          ),
        ),
      ),
      child: Text(
        isSelf ? K.wolf_self_position : '${(item?.position ?? 0) + 1}',
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    );

    return PositionedDirectional(
      bottom: -2.0,
      end: widget.style == WolfGuideIconStyle.right ? -9.0 : null,
      start: widget.style == WolfGuideIconStyle.left ? -9.0 : null,
      child: positionWidget,
    );
  }

  ///
  /// 用户头像及相关状态
  /// 占用width为WolfUserIcon.iconSize,超过部分为visible
  ///
  Widget _buildUserIcon(WolfModel wolfModel, RoomPosition? item) {
    if (item?.uid == -1) {
      //空麦位置，如6、9人房间
      return SizedBox(
        width: WolfGuideUserIcon.iconSize,
        height: WolfGuideUserIcon.iconSize,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [_buildAvatarDefault(item)],
        ),
      );
    }
    List<Widget> res = [];

    //用户基础头像
    Widget avatarWidget = _buildAvatar(item);
    res.add(avatarWidget);

    //用户自定义头像框frame
    Widget? avatarFrameWidget = _buildAvatarFrame(item);
    if (avatarFrameWidget != null) {
      res.add(avatarFrameWidget);
    }

    //用户头像边框 或 默认
    if (item?.uid == 0) {
      //等待状态且坑位没人
      Widget avatarDefaultWidget = _buildAvatarDefault(item!);
      res.add(avatarDefaultWidget);
    } else {
      //如果可发言
      //如果选中
      //默认边框
      bool canNormal = true;

      Widget? avatarBorderSelectedWidget =
          _buildAvatarBorderSelected(wolfModel, item);
      if (avatarBorderSelectedWidget != null) {
        res.add(avatarBorderSelectedWidget);
        canNormal = false;
      }

      Widget? avatarBorderCanSpeakWidget =
          _buildAvatarBorderCanSpeak(wolfModel, item);
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

    //准备
    Widget? readyWidget = _buildReady(wolfModel, item);
    if (readyWidget != null) res.add(readyWidget);

    //发言中(发言状态)&等待
    Widget? descAndWaitWidget = _buildDescAndWait(wolfModel, item);
    if (descAndWaitWidget != null) res.add(descAndWaitWidget);

    //狼人击杀标识
    Widget? killingLabel = _buildKillingLabel(wolfModel, item);
    if (killingLabel != null) res.add(killingLabel);

    //PK标识
    Widget? pkLabel = _buildPKLabel(item);
    if (pkLabel != null) res.add(pkLabel);

    //警上&退水&警长标识
    Widget? policeJoinLabel = _buildPoliceJoinLabel(item);
    if (policeJoinLabel != null) res.add(policeJoinLabel);

    //角色标签(真实身份)
    Widget? roleLabel = _buildRoleLabel(wolfModel, item);
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

    //序号或你
    Widget positionWidget = _buildPosition(item);
    res.add(positionWidget);

    return SizedBox(
      width: WolfGuideUserIcon.iconSize,
      height: WolfGuideUserIcon.iconSize,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: res,
      ),
    );
  }

  Widget _buildBody(WolfModel wolfModel, RoomPosition? item) {
    WolfGuideConfigState? state = wolfModel.data.currentState;
    bool isWaitState = state == WolfGuideConfigState.Wait;

    List<Widget> widgets = <Widget>[
      Container(width: WolfGuideUserIcon.left), //16.0+9.0
      isWaitState
          ? _buildUserIconAndInfo(wolfModel, item)
          : _buildUserIcon(wolfModel, item),
      Container(width: WolfGuideUserIcon.right), //7.0+9.0
    ];
    if (widget.style == WolfGuideIconStyle.right)
      widgets = widgets.reversed.toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        onIconTap();
      },
      child: _buildBody(wolfModel, widget.roomPosition),
    );
  }

  onIconTap() async {
    RoomPosition? position = widget.roomPosition;
    WolfGuidePosition? wolfPositionData =
        position?.positionExpendData as WolfGuidePosition?;

    if (wolfPositionData == null) {
      return;
    }

    Log.d(
        "onIconTap wolfPositionData.canBeSelected=${wolfPositionData.canBeSelected} wolfPositionData.isDead=${wolfPositionData.isDead}");

    if (!wolfPositionData.canBeSelected) {
      //不能被选中
      return;
    }

    if (wolfPositionData.isDead) {
      //玩家已出局
      return;
    }

    int uid = position!.uid;

    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
    WolfGuideConfigState? wolfState = wolfModel.data.currentState;

    RoomPosition? selfPosition = wolfModel.positionForCurrentUser();
    WolfGuidePosition wolfGuidePosition =
        selfPosition?.positionExpendData as WolfGuidePosition;

    if (wolfState == WolfGuideConfigState.NightAction &&
        wolfGuidePosition.canAction) {
      //狼人夜晚行动且未行动过
      wolfModel.wolfKill(uid);
      //刀人埋点
      int day = wolfModel.data.dayCount ?? 0;
      Tracker.instance.track(TrackEvent.wolf_ai_game_operate_click,
          properties: {'op': '1', 'day': day + 1, 'isConfirm': '0'});
      return;
    }

    if (wolfState == WolfGuideConfigState.DaytimeVote &&
        wolfGuidePosition.canAction) {
      //白天投票且未行动过
      wolfModel.vote(uid);
      //投票埋点
      int day = wolfModel.data.dayCount ?? 0 + 1;
      Tracker.instance.track(TrackEvent.wolf_ai_game_operate_click,
          properties: {'op': '2', 'day': day + 1, 'isConfirm': '0'});
      return;
    }
  }
}

enum WolfGuideIconStyle {
  left, //左侧麦位
  right, //右侧麦位
}
