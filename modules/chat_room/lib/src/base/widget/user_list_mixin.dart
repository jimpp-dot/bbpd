import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:chat_room/src/base/widget/canvasCirclePart.dart';
import 'package:chat_room/src/base/widget/room_defend_update_progress.dart';
import 'package:chat_room/src/base/widget/user_mic_line_widget.dart';
import 'package:chat_room/src/cplove/heart/cp_heart_pkg_at_mic.dart';
import 'package:flutter/material.dart';

import '../model/mic_defend_relation_bean.dart';
import 'room_role_widget.dart';

mixin UserListMixin<T extends StatefulWidget> on State<T> {
  int index = 0;
  double itemWidth = IconSize.normal;
  double firstLeftMargin = 0;
  double otherLeftMargin = 0;
  final List<DefendRelationModel> _defendModels = [];
  late ChatRoomData room;
  late UserIconStyle iconStyle;

  @override
  void initState() {
    super.initState();
    initConfigs();
    eventCenter.addListener(
        RoomConstant.EVENT_Show_Mic_Line, _micLineStateChange);
    eventCenter.addListener(RoomConstant.Event_Welcome_To_Me, _tryShowHiTips);
    room.addListener(RoomConstant.EVENT_Defend_User_Off_Mic, offMic);
    _loadDefend();
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        RoomConstant.EVENT_Show_Mic_Line, _micLineStateChange);
    eventCenter.removeListener(
        RoomConstant.Event_Welcome_To_Me, _tryShowHiTips);
    room.removeListener(RoomConstant.EVENT_Defend_User_Off_Mic, offMic);
    super.dispose();
  }

  void _loadDefend() async {
    if (room.isBaba) {
      /// 靓号房人多，避免切换玩法时，大批量用户同时请求接口
      return;
    }
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}room/fullScreen?rid=${room.rid}",
        throwOnError: true,
      );
      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return;
      }
      MicDefendRelationBean data =
          MicDefendRelationBean.fromJson(Map<String, dynamic>.from(res));

      if (Util.validList(data.data?.defendInfo)) {
        _defendModels.addAll(data.data!.defendInfo);
        refresh();
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  bool _isMale(int position) {
    return (position == 1 || position == 2 || position == 5 || position == 6)
        ? false
        : true;
  }

  void offMic(String type, dynamic value) {
    /// 下麦
    if (value != null && value is Map) {
      int length = _defendModels.length;
      Map data = value;
      if (Util.parseInt(data['rid']) == room.rid && _defendModels.isNotEmpty) {
        _defendModels.removeWhere((element) {
          if (element.uid == Util.parseInt(data['uid']) ||
              element.defendUid == Util.parseInt(data['uid'])) {
            return true;
          }
          return false;
        });
      }
      if (mounted && (_defendModels.length != length)) {
        /// 麦上守护关系变化刷新
        setState(() {});
      }
    }
  }

  void _micLineStateChange(String type, dynamic value) {
    if (value is List) {
      for (var element in value) {
        DefendRelationModel item = DefendRelationModel.fromJson(element);
        item.fromRoomSocket = true;

        /// socket推送的需要展示动画
        _defendModels.add(item);
      }
    }
  }

  void _tryShowHiTips(String type, dynamic value) {
    if (value is int) {
      if (mounted) {
        setState(() {
          room.uid = value;
        });
      }
    }
  }

  DefendRelationModel? _matchingDefendModel(int uid, int nextPositionUid) {
    for (DefendRelationModel element in _defendModels) {
      if ((element.uid == uid && element.defendUid == nextPositionUid) ||
          (element.uid == nextPositionUid && element.defendUid == uid)) {
        if ((element.level ?? 0) > 1 || element.lineUrl.isNotEmpty) {
          return element;
        }
      }
    }
    return null;
  }

  Widget buildRowBottom(BuildContext context, int skip, double width) {
    List<RoomPosition> items = room.positions.skip(skip).take(4).toList();
    double halfIcon = IconStyles[iconStyle]!.width / 2.0;
    double lineW = width - halfIcon * 2 + otherLeftMargin;
    List<Widget> widgets = [];
    for (int index = 0; index < items.length - 1; index++) {
      double pointX = firstLeftMargin +
          width / 2.0 +
          halfIcon +
          (width + otherLeftMargin) * index;
      DefendRelationModel? defendModel =
          _matchingDefendModel(items[index].uid, items[index + 1].uid);
      if (defendModel != null) {
        widgets.add(UserMicLineWidget(
            defendModel.level ?? 0,
            defendModel.position ?? 0,
            defendModel.levelName ?? '',
            defendModel.title ?? '',
            lineW,
            halfIcon,
            pointX,
            (defendModel.upgrade ?? 0) > 0,
            defendModel.category ?? 0,
            defendModel.fromRoomSocket,
            lineBeforeUrl: defendModel.lineBeforeUrl,
            lineUrl: defendModel.lineUrl,
            hideDefendName: defendModel.hideDefendName,
            key: ValueKey(
                'user_line_${defendModel.uid}_${defendModel.defendUid}')));
      }
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildRow(context, skip, width),
        ...widgets,
      ],
    );
  }

  Widget _buildRow(BuildContext context, int skip, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: room.positions.skip(skip).take(4).map((RoomPosition item) {
        return buildUserItem(item, width);
      }).toList(),
    );
  }

  Widget buildUserItem(RoomPosition item, double width) {
    index++;
    String name;
    RoomUserRole? userRole;
    bool isBoss = false;
    bool isBusinessHeart = room.isBusinessHeart;
    bool isBusinessRadio = room.isBusinessRadio;
    bool isMale = _isMale(item.position);

    bool isInMic = room.positions.skip(1).any((RoomPosition pos) {
      return pos.uid == Session.uid;
    });
    bool isInFirst = room.positions[0].uid == Session.uid;
    bool isCpSwitch =
        room.isBusinessCpLove && room.config?.cpState == CpLoveState.Switch;

    bool isCpResult =
        room.isBusinessCpLove && room.config?.cpState == CpLoveState.Result;

    int cpMeTarget = 0;
    if (isInMic && isCpSwitch) {
      try {
        RoomPosition pos = room.positions.firstWhere((RoomPosition pos) {
          return pos.uid == Session.uid;
        });
        cpMeTarget = pos.cpTarget;
      } catch (e) {
        Log.d(e.toString());
      }
    }

    /// 电台守护
    if ((room.config?.reception ?? false) && item.position == 0) {
      //接待
      if (item.uid == 0) {
        name = K.room_reception;
      } else {
        name = item.name;
        userRole = RoomUserRole.Reception;
      }
    } else if (item.isBoss) {
      // 嘉宾位和老板位都算老板位，只是麦位上名称显示不一样
      isBoss = true;
      if (item.uid == 0) {
        if (item.positionRole == RoomPositionRole.guest) {
          name = K.room_guest_title;
        } else {
          name = K.room_boss;
        }
      } else {
        name = item.name;
        if (item.positionRole == RoomPositionRole.guest) {
          userRole = RoomUserRole.Guest;
        } else {
          userRole = RoomUserRole.Boss;
        }
      }
    } else {
      name = item.name;
      if (room.isBusinessCpLove && item.uid <= 0) {
        if (!isMale) {
          name = K.room_feman_god_position;
        } else {
          name = K.room_man_god_position;
        }
      } else if (room.isGuessQueue && item.uid <= 0) {
        name = item.name;
        if (Util.isStringEmpty(name)) {
          name = K.room_empty_mic_prefix;
        }
      } else if (item.uid <= 0) {
        name = K.room_empty_mic_prefix;
      }
    }

    if (item.uid <= 0 &&
        room.config?.mode != RoomMode.Lock &&
        item.lock == true) {
      name = K.room_mic_locked;
    }

    List<Widget> res = [];
    res.add(Column(
      children: <Widget>[
        UserIcon(
          room: room,
          position: item,
          size: IconStyles[iconStyle]!.width,
          showDefend: room.config?.types == RoomTypes.RadioDefend,
        ),
        Container(
          height: (isBusinessHeart || isBusinessRadio) ? null : 40,
          margin: const EdgeInsets.only(top: 8.0),
          alignment: Alignment.topCenter,
          child: _renderNameWithTag(
              name, item, room.isBusinessCpLove, isMale, isBoss, userRole),
        ),
        if (isBusinessHeart)
          CpHeartPkgAtMic(
            position: item,
            room: room,
          ),
        if (isBusinessRadio) RoomDefendUpdateProgress(position: item),
      ],
    ));

    if (!room.isBusinessHeart) {
      res.add(PackageAtMic(position: item, room: room));
    }

    if (isCpSwitch) {
      if (isInMic) {
        if (item.uid != Session.uid) {
          res.add(Positioned(
            top: 0.0,
            width: IconStyles[iconStyle]!.width,
            height: IconStyles[iconStyle]!.height,
            child: InkWell(
              onTap: () async {
                try {
                  await RoomRepository.xhrAutoError(
                      "roomcp/setTarget",
                      {
                        'rid': room.rid.toString(),
                        'position': item.position.toString(),
                        'op': cpMeTarget <= 0 ? 'add' : 'cancel',
                        'room_factory_type': room.config?.originFactory ?? ''
                      },
                      successMsg: cpMeTarget <= 0
                          ? K.room_choose_success
                          : K.room_cancel_choose);
                } catch (e) {
                  Log.d(e.toString());
                }
              },
              child: cpMeTarget == item.position
                  ? CustomPaint(
                      painter: CanvasCirclePart(const Color(0xFFD363E9)),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 18.0,
                          alignment: Alignment.center,
                          child: Text(
                            K.room_has_choosed,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10.0),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(IconStyles[iconStyle]!.width / 2),
                        ),
                      ),
                    ),
            ),
          ));
        }
      } else {
        String text;
        if (item.cpTarget > 0) {
          text = isInFirst && room.isBusinessHeart
              ? '${K.room_has_choosed}${item.cpTarget}'
              : K.room_has_choosed;
        } else {
          text = K.room_un_choose;
        }
        res.add(Positioned(
          top: 0.0,
          width: IconStyles[iconStyle]!.width,
          height: IconStyles[iconStyle]!.height,
          child: CustomPaint(
            painter: CanvasCirclePart(item.cpTarget > 0
                ? const Color(0xFFD363E9)
                : const Color(0xFF9B9B9B)),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 18.0,
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ),
            ),
          ),
        ));
      }
    }

    if (item.uid > 0 &&
        item.uid == room.config?.guessQueueRoomConfigData?.lineUid) {
      res.add(PositionedDirectional(
        top: -20,
        child: Column(
          children: [
            Container(
              width: 46,
              height: 20,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: StadiumBorder(),
              ),
              child: Center(
                child: Text(
                  K.room_game_replaying,
                  style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF5955FA),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            R.img('guess_queue_bottom_triangle.png',
                width: 12,
                height: 5,
                package: ComponentManager.MANAGER_DRAW_GUESS)
          ],
        ),
      ));
    }

    if (isCpResult) {
      String text = '?';
      if (isInFirst && room.isBusinessHeart && item.cpTarget > 0) {
        text = '${item.cpTarget}';
      }

      int background = 0xFF8D61F7;
      Widget child = Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10.0),
      );
      if (item.cpDisplay) {
        if (item.cpTarget > 0) {
          background = 0x99000000;
          child = Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.only(top: 3.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(isMale ? 0xFF55C3FF : 0xFFF427A5),
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Text(
              item.cpTarget.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          );
        } else {
          background = 0xFF9B9B9B;
          child = Text(
            K.room_un_choose,
            style: const TextStyle(color: Colors.white, fontSize: 10.0),
          );
        }
      }
      if (isInFirst && item.cpDisplay == false) {
        res.add(Positioned(
          top: 0.0,
          width: IconStyles[iconStyle]!.width,
          height: IconStyles[iconStyle]!.height,
          child: GestureDetector(
            onTap: () async {
              try {
                await RoomRepository.xhrAutoError("roomcp/setDisplay", {
                  'rid': room.rid.toString(),
                  'position': item.position.toString(),
                  'room_factory_type': room.config?.originFactory ?? '',
                });
              } catch (e) {
                Log.d(e.toString());
              }
            },
            child: CustomPaint(
              painter: CanvasCirclePart(Color(background)),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 16.0,
                  alignment: Alignment.center,
                  child: child,
                ),
              ),
            ),
          ),
        ));
      } else {
        res.add(Positioned(
          top: 0.0,
          width: IconStyles[iconStyle]!.width,
          height: IconStyles[iconStyle]!.height,
          child: IgnorePointer(
            child: CustomPaint(
              painter: CanvasCirclePart(Color(background)),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 18.0,
                  alignment: Alignment.center,
                  child: child,
                ),
              ),
            ),
          ),
        ));
      }
    }

    if (room.uid != null &&
        room.uid! > 0 &&
        item.uid == room.uid &&
        !item.isMystery) {
      res.add(
        Positioned(
          top: -24,
          child: UserTip(
            timerCompleteCallback: () {
              if (!mounted) return;
              if (room.config == null) return;
              setState(() {
                room.uid = 0;
              });
            },
          ),
        ),
      );
    }

    return Container(
      width: width,
      margin: EdgeInsetsDirectional.only(
          start: index % 4 == 1 ? firstLeftMargin : otherLeftMargin),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: res,
      ),
    );
  }

  Widget _renderNameWithTag(
    String name,
    RoomPosition item,
    bool showIndex,
    bool isMale,
    bool isBoss,
    RoomUserRole? userRole,
  ) {
    String godTagIcon = GodTagUtil.getGodTagByUid(item.uid);
    List<Widget> list = [];
    // 标签
    if (!Util.isStringEmpty(godTagIcon)) {
      list.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 3),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(godTagIcon),
            height: 12,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }
    // 索引
    if (showIndex) {
      list.add(
        Container(
          width: 12,
          height: 12,
          margin:
              const EdgeInsetsDirectional.only(end: 2.0, top: 1.5, bottom: 1.5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(isMale ? 0xFF55C3EF : 0xFFF427A5)),
          alignment: AlignmentDirectional.center,
          child: Text(
            '${item.position}',
            style:
                const TextStyle(fontSize: 10, color: Colors.white, height: 1.1),
          ),
        ),
      );
    }
    // 角色
    if (userRole != null) {
      list.add(
        RoomRoleWidget(role: userRole),
      );
    }
    Widget nameWidget = _buildName(name, item, isBoss);
    if (list.isEmpty) {
      return nameWidget;
    } else {
      list.add(Flexible(child: nameWidget));
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list,
    );
  }

  Widget _buildName(String name, RoomPosition item, bool isBoss) {
    Color textColor = Colors.white;

    if (item.uid == 0 || isBoss) {
      if (item.uid == 0) {
        textColor = Colors.white.withOpacity(0.4);
      }

      if (isBoss) {
        textColor = const Color(0xFFFFE735);
      }

      return Text(
        name.toCharacterBreakStr(),
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            height: 1.2,
            fontSize: 11,
            color: textColor,
            letterSpacing: 0,
            wordSpacing: 0),
      );
    }

    List<Color> colors = item.colorfulName ?? [];
    if (colors.isEmpty) {
      return Text(
        item.name.toCharacterBreakStr(),
        style: const TextStyle(
          color: Colors.white,
          height: 1.2,
          fontSize: 11.0,
          letterSpacing: 0.0,
          wordSpacing: 0.0,
        ),
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      );
    }

    return ColorfulNickName(
      colors: colors,
      textBuild: (bool show, {Key? key, Paint? paint}) {
        return Text(
          name.toCharacterBreakStr(),
          key: key,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            height: 1.2,
            fontSize: 11.0,
            letterSpacing: 0.0,
            wordSpacing: 0.0,
            foreground: paint,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildContent();
  }

  Widget buildContent();

  void initConfigs();
}
