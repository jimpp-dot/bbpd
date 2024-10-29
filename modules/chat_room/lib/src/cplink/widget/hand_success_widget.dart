import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';
import 'package:chat_room/src/cplink/widget/cplink_user_icon.dart';
import '../../../k.dart';

/// 心动连连看，牵手成功阶段
class HandSuccessWidget extends StatefulWidget {
  final double iconRadius;

  final ChatRoomData room;

  final bool displayEmote;

  final bool luck; // 送欧气开关

  const HandSuccessWidget(
      {Key? key,
      required this.iconRadius,
      required this.room,
      required this.displayEmote,
      this.luck = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HandSuccessState();
  }
}

class _HandSuccessState extends State<HandSuccessWidget> {
  static String LOG_TAG = "_HandSuccessState";

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      child: _buildMainScreen(),
    );
  }

  Widget _buildMainScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildScenes(),
        const SizedBox(height: 20),
        _buildUserIcons(),
      ],
    );
  }

  Widget _buildUserIcons() {
    int heartValue = cpLinkData.heartValue[0];
    return SizedBox(
      width: Util.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 44.dp,
          ),
          _buildItem(true, widget.room.positions[2]),
          Expanded(
            child: Container(
              height: 88,
              margin: const EdgeInsetsDirectional.only(top: 8),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(R.imagePath('cplink/cplink_link_big.png',
                        package: ComponentManager.MANAGER_BASE_ROOM)),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Text(
                  _formatValue(heartValue),
                  style:
                      const TextStyle(color: Color(0xFFFEFEFE), fontSize: 14),
                ),
              ),
            ),
          ),
          _buildItem(false, widget.room.positions[5]),
          SizedBox(
            width: 44.dp,
          ),
        ],
      ),
    );
  }

  String _formatValue(int value) {
    if (value >= 10000) {
      return '${(value / 10000.0).toStringAsFixed(2)}w';
    } else {
      return '$value';
    }
  }

  Widget _buildScenes() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 10),
      child: GradientBorder(
        borderRadius: 29,
        borderWidth: 1,
        borderGradient: const LinearGradient(
            colors: [Color(0xFFCD90FF), Color(0xFFC177FF)]),
        child: Container(
          height: 56,
          width: 240,
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
          decoration: const ShapeDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF852AB6), Color(0xFF773AD2)]),
            shape: StadiumBorder(),
          ),
          child: _buildSceneItem(),
        ),
      ),
    );
  }

  Widget _buildSceneItem() {
    List<Scene> scenes = cpLinkData.scenes;
    int heartValue = cpLinkData.heartValue[0];
    Scene? sceneDisplay;
    if (Util.isCollectionEmpty(scenes)) {
      return Container();
    }

    int length = scenes.length;
    int nextIndex = 0;
    for (int i = length - 1; i >= 0; i--) {
      Scene item = scenes[i];

      /// 大于等于其中某个item
      if (heartValue >= item.money) {
        sceneDisplay = item;
        nextIndex = i + 1;
        break;
      }
    }
    int nextHeartValue =
        nextIndex >= length ? scenes.last.money : scenes[nextIndex].money;
    bool reachMin = sceneDisplay != null;

    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      ClipOval(
        child: CachedNetworkImage(
          imageUrl: System.imageDomain +
              ((reachMin ? sceneDisplay.icon : scenes[0].icon) ?? ''),
          width: 48,
          height: 48,
        ),
      ),
      const SizedBox(width: 4),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            (reachMin ? sceneDisplay.name : scenes[0].name) ?? '',
            style:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
          ),
          const SizedBox(height: 3),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: SizedBox(
              height: 4,
              child: LinearProgressIndicator(
                value: heartValue / nextHeartValue,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xFFFF8FAB)),
                backgroundColor: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          const SizedBox(height: 3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img('cplink/cplink_heart_small.png',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  width: 8,
                  height: 8),
              const SizedBox(width: 2),
              Text(
                K.room_cplink_heart_value(["$heartValue/$nextHeartValue"]),
                style: TextStyle(
                    fontSize: 10, color: Colors.white.withOpacity(0.6)),
              ),
            ],
          ),
        ],
      )),
      const SizedBox(width: 4),
      if (canShowSelectSceneBtn())
        GestureDetector(
          onTap: () {
            //最低的场景都没达到
            if (!reachMin) {
              Log.d(tag: LOG_TAG, "最低级的场景都没有达到...选不了场景！");
              return;
            }
            int targetUid = 0;
            if (Session.uid == widget.room.positions[2].uid) {
              targetUid = widget.room.positions[5].uid;
            } else if (Session.uid == widget.room.positions[5].uid) {
              targetUid = widget.room.positions[2].uid;
            }
            CpLinkRepo.chooseScene(sceneDisplay?.scene ?? 0, !_selected,
                widget.room.rid, targetUid);
            _selected = !_selected;
            setState(() {});
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Color(0xFFFF96F4), Color(0xFFFF61D6)],
              ),
              shape: BoxShape.circle,
            ),
            foregroundDecoration: BoxDecoration(
              color:
                  reachMin ? Colors.transparent : Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional.center,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    const Color(0xFFFFFFFF).withOpacity(0.3),
                    const Color(0x00FFFFFF)
                  ],
                ),
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                _selected ? K.cancel : K.room_cplink_choose_selected,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        )
    ]);
  }

  bool canShowSelectSceneBtn() {
    int uid = Session.uid;
    return uid == widget.room.positions[2].uid ||
        uid == widget.room.positions[5].uid;
  }

  Widget _buildItem(bool isLeft, RoomPosition roomPosition) {
    double iconSize = widget.iconRadius * 2;
    return CpLinkUserIcon(
      iconSize: iconSize,
      room: widget.room,
      isAnimating: false,
      displayEmote: widget.displayEmote,
      roomPosition: roomPosition,
      assist: widget.room.cpLinkAssist,
      luck: widget.luck,
    );
  }

  CpLinkConfigData get cpLinkData =>
      widget.room.config?.configExpendData as CpLinkConfigData;
}
