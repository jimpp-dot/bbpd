import 'package:shared/shared.dart';
import 'package:shared/widget/sound_fast_ware.dart';
import 'package:chat_room/src/base/widget/user_icon_tap_handler.dart';
import 'package:chat_room/src/live/model/live_repository_v3.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart' hide SoundFastWare;
import 'package:chat_room/src/base/punish/model/punish_beans.dart';
import 'package:chat_room/src/base/punish/widget/punish_stick_widget.dart';

import '../live_pk_config_v3.dart';

/// pk 用户头像
class LivePKUserIcon extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmoteAtMic;
  final bool isAudience;
  final LivePKConfigV3? pkConfig;
  final LivePKUserOnMicItem? item;

  const LivePKUserIcon({
    super.key,
    required this.room,
    this.displayEmoteAtMic = true,
    this.isAudience = true,
    this.pkConfig,
    this.item,
  });

  @override
  State<LivePKUserIcon> createState() => _LivePKUserIconState();
}

class _LivePKUserIconState extends State<LivePKUserIcon> {
  List<UserPunish> get _userIconPunish =>
      widget.pkConfig?.pkPunish?.getUserIconPunish(widget.item?.uid ?? 0) ?? [];

  UserPunish? get _namePunish =>
      widget.pkConfig?.pkPunish?.getNamePunish(widget.item?.uid ?? 0);

  void _openPersonalDialog(int uid, bool isOffline, int toRid) {
    RoomUserProfile.openImageFloatScreenDisplayModalBottomSheet(
        context, uid, widget.room, 0,
        isOffline: isOffline, toRid: toRid);
  }

  void _onIconTaped(LivePKUserOnMicItem item) async {
    if (item.uid == Session.uid) {
      //如果点击的是自己，返回
      if (!ChatRoomUtil.isMic) {
        /// 自己掉线回来，支持继续上麦
        if (widget.room.positions.isNotEmpty) {
          UserIconTapHandler handler = UserIconTapHandler();
          handler.init(
              context: context,
              room: widget.room,
              position: widget.room.positions[0]);
          handler.onIconTap();
        }
      }
      return;
    }

    if (widget.isAudience) {
      //观众点击
      if (item.rid == widget.room.rid) {
        //当前房间
        _openPersonalDialog(item.uid, item.uid == 0, 0);
      } else {
        //连麦主播房间
        _openPersonalDialog(item.uid, item.uid == 0, item.rid);
      }
    } else {
      List<SheetItem> res = [];
      if (item.mic == 2) {
        res.add(SheetItem(K.live_pk_open_mic, "openJoinMic"));
      } else {
        res.add(SheetItem(K.live_pk_close_mic, "closeJoinMic"));
      }

      if (res.isNotEmpty) {
        String title = '${K.room_operate_options} ${item.rid}';
        SheetCallback? result = await displayModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return RadioBottomSheet(title: title, data: res);
            });
        if (result == null || result.reason == SheetCloseReason.Active) {
          return;
        }
        if (result.value?.key == 'openJoinMic' ||
            result.value?.key == 'closeJoinMic') {
          int display;
          if (result.value?.key == 'closeJoinMic') {
            display = 2;
          } else {
            display = 1;
          }
          LiveRepositoryV3.closeJoinMic(
              item.rid, widget.pkConfig?.pkBase?.pk_id ?? 0, display);
        }
      }
    }
  }

  Widget _buildItem(LivePKUserOnMicItem? item, double itemWidth) {
    List<Widget> res = [];
    Color bgColor = Colors.black.withOpacity(0.2);

    /// 空麦位
    if (item == null) {
      res.add(
        Container(
          width: itemWidth,
          height: itemWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: const Text(
            '?',
            style: TextStyle(
                fontSize: 31.0,
                fontWeight: FontWeight.w600,
                color: Colors.white70),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    } else {
      //显示用户头像
      String icon = item.icon;
      Widget iconWidget;
      if (icon.isNotEmpty) {
        bool hasPunishMa = false;
        //惩罚的头像马赛克
        if (_userIconPunish.isNotEmpty) {
          int index = _userIconPunish
              .indexWhere((element) => element.type == SystemPunishType.mask);
          if (index >= 0) {
            hasPunishMa = true;
          }
        }
        if (hasPunishMa) {
          iconWidget = ImageBlurWidget(
            borderRadius: itemWidth / 2,
            child: CommonAvatar(
              path: icon,
              shape: BoxShape.circle,
              size: itemWidth,
            ),
          );
        } else {
          iconWidget = CommonAvatar(
            path: icon,
            shape: BoxShape.circle,
            size: itemWidth,
          );
        }
      } else {
        iconWidget = Container(
          width: itemWidth,
          height: itemWidth,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(itemWidth / 2),
          ),
        );
      }

      res.add(
        SizedBox(
          key: ChatRoomUtil.getGlobalKey(item.uid), //打赏产生的礼物动画需要根据该key找到坐标做位移效果
          width: itemWidth,
          child: InkWell(
            child: iconWidget,
            onTap: () => _onIconTaped(item),
          ),
        ),
      );

      // 惩罚
      if (_userIconPunish.isNotEmpty) {
        // 搞笑头像框
        int index = _userIconPunish
            .indexWhere((element) => element.type == SystemPunishType.header);
        if (index >= 0) {
          UserPunish userPunish = _userIconPunish[index];
          String frameImage = userPunish.content;
          double overflow = -5.0;
          if (itemWidth <= 44) {
            overflow = -3.0;
          }
          res.add(
            PositionedDirectional(
              start: overflow,
              end: overflow,
              top: overflow,
              bottom: overflow,
              child: IgnorePointer(
                child: CachedNetworkImage(
                  imageUrl: frameImage,
                  errorWidget: const SizedBox.shrink(),
                ),
              ),
            ),
          );
        }

        // 贴纸条
        int paperIndex = _userIconPunish
            .indexWhere((element) => element.type == SystemPunishType.paper);
        if (paperIndex >= 0) {
          res.add(PunishPaperWidget(
              size: itemWidth, count: _userIconPunish[paperIndex].pageCount));
        }
      }

      ///麦上光圈
      res.add(ValueListenableBuilder(
        valueListenable: widget.room.speakers,
        builder: (context, speakers, child) {
          return SoundEffectWidget(
            isSpeaking: speakers.containsKey(item.uid),
            aniColor: R.color.mainBrandColor,
            width: itemWidth,
            borderWidth: 3.0,
          );
        },
      ));

      //表情
      if (widget.displayEmoteAtMic) {
        res.add(EmoteAtMic(uid: item.uid, position: 0, width: itemWidth));
      }

      //显示离线
      bool isShowOnlineOff =
          (item.origin == 0 && item.uid > 0); //是否需要显示离线 //此房离线origin为0
      if (isShowOnlineOff) {
        res.add(
          IgnorePointer(
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(itemWidth / 2 + 1),
              child: Container(
                color: Colors.black.withOpacity(0.4),
                width: itemWidth,
                height: itemWidth,
                alignment: Alignment.center,
                child: Text(
                  K.room_offline,
                  style:
                      const TextStyle(fontSize: 10, color: Color(0xFF9B9B9B)),
                ),
              ),
            ),
          ),
        );
      }

      //禁麦或者被禁麦
      String forBiddenIcon = '';
      if (item.mic == 2) {
        //被关麦
        if (item.rid == widget.room.rid) {
          forBiddenIcon = 'live/room_live_pk_mic_be_forbiden.webp'; //被禁了
        } else {
          forBiddenIcon = 'live/room_live_pk_mic_forbiden.webp'; //禁了别人
        }
      }
      if (forBiddenIcon.isNotEmpty) {
        res.add(
          PositionedDirectional(
            end: 0.0,
            bottom: 0.0,
            child: IgnorePointer(
              child: R.img(
                forBiddenIcon,
                width: 16.0,
                height: 16.0,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          ),
        );
      }
    }

    //增加边框
    double overflow = -2.0;
    res.add(
      PositionedDirectional(
        start: overflow,
        end: overflow,
        top: overflow,
        bottom: overflow,
        child: IgnorePointer(
          child: Container(
            width: itemWidth - 2 * overflow,
            height: itemWidth - 2 * overflow,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: -overflow, color: Colors.white24),
            ),
          ),
        ),
      ),
    );

    return SizedBox(
      width: itemWidth,
      height: itemWidth,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: res,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem(widget.item, 60.0),
          const SizedBox(height: 8),
          LimitedBox(
            maxWidth: 70,
            child: Text(
              _namePunish?.content ?? widget.item?.name ?? '',
              style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
