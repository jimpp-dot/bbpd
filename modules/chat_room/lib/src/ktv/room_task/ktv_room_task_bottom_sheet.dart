/// KTV房间任务弹框视图
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import '../song_list/ktv_song_list_page.dart';
import 'ktv_room_grade_equity_bottom_sheet.dart';
import 'model/generated/ktv.pb.dart';
import 'model/ktv_task_repo.dart';

class KtvRoomTaskBottomSheet extends StatefulWidget {
  final ChatRoomData room;

  const KtvRoomTaskBottomSheet({Key? key, required this.room})
      : super(key: key);

  /// 打开KTV房间任务弹框视图
  static Future<bool?> show(BuildContext context,
      {Key? key, required ChatRoomData room}) async {
    Tracker.instance
        .track(TrackEvent.click, properties: {'click_page': 'task_entry'});
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.4),
      fullscreenDialog: true,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return KtvRoomTaskBottomSheet(key: key, room: room);
      },
    );
  }

  @override
  State<KtvRoomTaskBottomSheet> createState() => _KtvRoomTaskBottomSheetState();
}

class _KtvRoomTaskBottomSheetState extends State<KtvRoomTaskBottomSheet> {
  KtvRoomTaskLevelInfo? level; // 卡片等级
  KtvRoomTaskInfo? sign; // 每日登录领K值
  KtvRoomTaskInfo? giftSend; // 房间内去赠送好礼
  KtvRoomTaskInfo? online; // 本房间内在线时长
  KtvRoomTaskInfo? sing; // 在本房内上麦唱歌
  KtvRoomTaskInfo? screen; // 在本房内公屏互动

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    KtvTaskRepo.getKtvTask(widget.room.rid).then((resp) {
      if (resp.success && resp.hasData() && mounted) {
        setState(() {
          level = resp.data.level;
          sign = resp.data.sign;
          giftSend = resp.data.giftSend;
          online = resp.data.online;
          sing = resp.data.sing;
          screen = resp.data.screen;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height - 124 - MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFFECECFF), Color(0xFFF4F3FF)],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: R.img(
              'ktv/ktv_room_task_bg.webp',
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          Column(
            children: [
              Container(
                width: Util.width,
                height: 44,
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// 标题
                    Text(
                      K.room_ktv_room_task,
                      style: R.textStyle.medium16.copyWith(color: Colors.white),
                    ),

                    /// 规则说明
                    PositionedDirectional(
                      top: 11,
                      end: 12,
                      width: 22,
                      height: 22,
                      child: GestureDetector(
                        onTap: () {
                          String url = Util.getHelpUrlWithQStr('k117');
                          BaseWebviewScreen.show(context, url: url);
                        },
                        child: R.img('ic_info.svg',
                            color: Colors.white,
                            width: 22,
                            height: 22,
                            package: ComponentManager.MANAGER_BASE_ROOM),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // 房间等级卡片
                    _buildInRoomLevelWidget(),

                    // 每日登陆领K值
                    _buildInRoomDailySignInWidget(),

                    // 房间内去赠送好礼
                    _buildInRoomGoGiveGiftsWidget(),

                    // 本房间内在线时长
                    _buildInRoomOnlineWidget(),

                    // 在本房内上麦唱歌
                    _buildInRoomMicSongWidget(),

                    // 在本房内公屏互动
                    _buildInRoomPublicScreenInteractionWidget(),

                    SizedBox(height: MediaQuery.of(context).padding.bottom)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// 房间等级卡片
  Widget _buildInRoomLevelWidget() {
    if (level != null) {
      int roomLevel = level?.level ?? 0;
      // 渐变色值
      List<Color> colors = [const Color(0xFFFF6615), const Color(0xFFFFC336)];
      // 边框色值
      List<Color> borderColors;
      // 进度条色值
      Color indicatorColor = Colors.white;
      if (roomLevel == 0) {
        colors = [const Color(0xFFD09764), const Color(0xFFFFEBE0)];
        borderColors = [
          const Color(0xFFF3B792),
          const Color(0xFFFDC7AE),
          const Color(0xFFFFE4D5)
        ];
        indicatorColor = const Color(0xFFAE7543);
      } else if (roomLevel == 1) {
        colors = [const Color(0xFF6A66B1), const Color(0xFFD2EAFF)];
        borderColors = [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.8),
          Colors.white.withOpacity(0.5)
        ];
        indicatorColor = const Color(0xFFC29220);
      } else if (roomLevel == 2) {
        colors = [const Color(0xFFF3BB3B), const Color(0xFFF4CD6D)];
        borderColors = [
          const Color(0xFF958FFF),
          const Color(0xFFBDADFF),
          const Color(0xFFAB8AFF)
        ];
        indicatorColor = const Color(0xFFFF82FF);
      } else if (roomLevel == 3) {
        colors = [const Color(0xFF4553FF), const Color(0xFF9572FF)];
        borderColors = [
          const Color(0xFF958FFF),
          const Color(0xFFBDADFF),
          const Color(0xFFAB8AFF)
        ];
        indicatorColor = const Color(0xFFFFF056);
      } else if (roomLevel == 4 || roomLevel == 5) {
        colors = [const Color(0xFFFF6350), const Color(0xFFFFBD6C)];
        borderColors = [const Color(0xFFFFBE94), const Color(0xFFFFCE9B)];
        indicatorColor = const Color(0xFFFFF056);
      } else {
        colors = [const Color(0xFFFF6615), const Color(0xFFFFC336)];
        borderColors = [
          const Color(0xFFFFCC37),
          const Color(0xFFFFEF58),
          const Color(0xFFFFCE3A)
        ];
        indicatorColor = Colors.white;
      }

      // 距%1等级还差%2
      String levelName = '';
      KtvRoomTaskLevelItem? currentLevel;
      if (level != null && level?.levels.isNotEmpty == true) {
        if (roomLevel < (level?.levels.length ?? 0)) {
          currentLevel = level?.levels[roomLevel];
        } else {
          currentLevel = level?.levels.last;
        }
        if (currentLevel != null) {
          if (int.parse('${level?.current ?? 0}') >=
              int.parse('${currentLevel.next}')) {
            levelName =
                K.room_ktv_task_reached_what_level([currentLevel.levelName]);
          } else {
            levelName = K.room_ktv_task_distance_what_grade_diff_numbers([
              currentLevel.levelName,
              '${currentLevel.next - (level?.current ?? 0)}'
            ]);
          }
        }
      }

      // 计算进度条比例
      double percent = double.parse('${level?.current ?? 0.0}') /
          double.parse('${currentLevel?.next ?? 0.0}');
      if (percent < 0 || percent > 1) {
        percent = 1;
      }

      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          height: 148,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF8C99FF).withOpacity(0.5),
                offset: const Offset(0, 2),
                blurRadius: 20,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: borderColors,
              // stops: [0, 0.25, 1],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                width: Util.width - 44,
                height: 144,
                margin: const EdgeInsetsDirectional.only(
                  start: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  gradient: LinearGradient(
                    colors: colors,
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
              ),
              PositionedDirectional(
                top: 0,
                bottom: 0,
                start: 0,
                end: 0,
                child: R.img('ktv/ktv_room_level_card_bg.webp',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    fit: BoxFit.fitWidth),
              ),
              if (currentLevel != null &&
                  currentLevel.hasUrl() &&
                  currentLevel.url.isNotEmpty)
                PositionedDirectional(
                  top: 10,
                  end: 20,
                  child: CachedNetworkImage(
                    imageUrl: Util.parseIcon(currentLevel.url),
                    width: 96,
                    height: 96,
                    cachedWidth: 96,
                    cachedHeight: 96,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              Container(
                height: 148,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 96),
                      child: Text(
                        widget.room.createor?.name ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      levelName,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6), fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        Text(
                          '${level?.current ?? 0}',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: Util.numFontFamily,
                            package: ComponentManager.MANAGER_BASE_CORE,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '/',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: Util.numFontFamily,
                            package: ComponentManager.MANAGER_BASE_CORE,
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${currentLevel?.next ?? 0}',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: Util.numFontFamily,
                            package: ComponentManager.MANAGER_BASE_CORE,
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              PositionedDirectional(
                                start: 0,
                                end: 0,
                                child: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    return Container(
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              if (currentLevel != null &&
                                  currentLevel.hasNext() &&
                                  currentLevel.hasMin())
                                PositionedDirectional(
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      return Container(
                                        width: constraints.maxWidth * percent,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: indicatorColor,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Tracker.instance.track(TrackEvent.click, properties: {
                          'click_page': 'room_interest',
                        });
                        KtvRoomGradeEquityBottomSheet.show(context,
                            room: widget.room);
                      },
                      child: Row(
                        children: [
                          Text(
                            K.room_ktv_room_equity,
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          const SizedBox(width: 2),
                          R.img(
                            'light_constellation/light_constellation_arrow_right.webp',
                            width: 16,
                            height: 14,
                            package: ComponentManager.MANAGER_BASE_ROOM,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  /// 每日登陆领K值
  Widget _buildInRoomDailySignInWidget() {
    return sign != null
        ? Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
            child: Container(
              height: 145,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sign?.title ?? '',
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (sign?.status == 4) return;

                          /// 签到接口
                          NormalNull resp =
                              await KtvTaskRepo.postKtvSignIn(widget.room.rid);
                          if (resp.success) {
                            Tracker.instance
                                .track(TrackEvent.click, properties: {
                              'click_page': 'daily_sign_in',
                            });
                            _loadData();
                            Fluttertoast.showCenter(
                                msg: K.room_fans_task_sign_success);
                          } else {
                            Fluttertoast.showCenter(
                                msg: (resp.hasMsg() && resp.msg.isNotEmpty)
                                    ? resp.msg
                                    : K.room_fans_task_sign_fail);
                          }
                        },
                        child: Container(
                          width: 63,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: LinearGradient(
                                colors: R.color.mainBrandGradientColors
                                    .map((element) => element.withOpacity(
                                        sign?.status == 4 ? 0.5 : 1))
                                    .toList(),
                              )),
                          child: Text(
                            sign?.status == 4
                                ? K.room_task_signed
                                : K.room_fans_task_sign,
                            style: TextStyle(
                                color: Colors.white
                                    .withOpacity(sign?.status == 4 ? 0.5 : 1),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    sign?.desc ?? '',
                    style: TextStyle(
                        color: R.color.unionRankText1.withOpacity(0.6),
                        fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 38,
                    child: Stack(
                      children: [
                        PositionedDirectional(
                          top: 6,
                          start: 7,
                          end: 7,
                          child: Container(
                            height: 2,
                            color: R.color.dividerColor.withOpacity(0.1),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0;
                                i < (sign?.extra.signWeekly.signs.length ?? 0);
                                i++)
                              Column(
                                children: [
                                  R.img(
                                    (sign?.extra.signWeekly.signs[i].sign ??
                                            false)
                                        ? 'ktv/ktv_room_task_already_signin.webp'
                                        : 'ktv/ktv_room_task_not_signin.webp',
                                    width: 14,
                                    height: 14,
                                    package: ComponentManager.MANAGER_BASE_ROOM,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    sign?.extra.signWeekly.signs[i].tag ?? '',
                                    style: TextStyle(
                                        color: R.color.unionRankText1
                                            .withOpacity(0.4),
                                        fontSize: 13),
                                  ),
                                ],
                              )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  /// 房间内去赠送好礼
  Widget _buildInRoomGoGiveGiftsWidget() {
    return giftSend != null
        ? _buildNormalItem(
            giftSend?.title ?? '',
            giftSend?.desc ?? '',
            K.room_ktv_task_give_gifts,
            false,
            () {
              Navigator.of(context).pop();
              // 打开礼物面板
              IGiftManager giftManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_GIFT);
              giftManager.showRoomGiftPanel(context, room: widget.room);
            },
          )
        : const SizedBox.shrink();
  }

  /// 本房间内在线时长
  Widget _buildInRoomOnlineWidget() {
    if (online != null) {
      double percent = double.parse('${online?.extra.online.cur ?? 0.0}') /
          double.parse('${online?.extra.online.max ?? 0.0}');
      if (percent < 0 || percent > 1) {
        percent = 1;
      }
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Container(
          height: 123,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          online?.title ?? '',
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          online?.desc ?? '',
                          style: TextStyle(
                              color: R.color.unionRankText1.withOpacity(0.6),
                              fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (online?.status == 4) return;
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 63,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors
                                .map((e) => e
                                    .withOpacity(online?.status == 4 ? 0.5 : 1))
                                .toList(),
                          )),
                      child: Text(
                        online?.status == 4
                            ? K.room_task_has_done
                            : K.room_task_not_has_done,
                        style: TextStyle(
                            color: Colors.white
                                .withOpacity(online?.status == 4 ? 0.5 : 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PositionedDirectional(
                          start: 0,
                          end: 0,
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: R.color.dividerColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            },
                          ),
                        ),
                        PositionedDirectional(
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Container(
                                width: constraints.maxWidth * percent,
                                height: 4,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFFFF973A),
                                    Color(0xFFFFCF53)
                                  ]),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${((online?.extra.online.cur ?? 0) / 60).floor()}/${((online?.extra.online.max ?? 0) / 60).floor()}min',
                    style: TextStyle(
                      fontSize: 13,
                      color: R.color.mainTextColor.withOpacity(0.4),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  /// 在本房内上麦唱歌
  Widget _buildInRoomMicSongWidget() {
    return sing != null
        ? _buildNormalItem(
            sing?.title ?? '',
            sing?.desc ?? '',
            K.room_ktv_task_go_sing,
            false,
            () {
              Navigator.of(context).pop();
              // 跳转到推荐歌单列表
              bool isCreator = widget.room.createor?.uid == Session.uid;
              int musicNum = widget.room.config?.ktvInfo?.listCount ?? 0;
              KtvSongListPage.show(
                context,
                widget.room,
                SongSheetType.rcmd,
                isRoomMaster: isCreator,
                autoMic: widget.room.config?.mode == RoomMode.Lock,
                musicNum: musicNum,
              );
            },
          )
        : const SizedBox.shrink();
  }

  /// 在本房内公屏互动
  Widget _buildInRoomPublicScreenInteractionWidget() {
    return screen != null
        ? _buildNormalItem(
            screen?.title ?? '',
            screen?.desc ?? '',
            screen?.status == 4
                ? K.room_ktv_task_interacted
                : K.room_ktv_task_interact,
            screen?.status == 4,
            () {
              if (screen?.status == 4) return;
              Navigator.of(context).pop();
            },
          )
        : const SizedBox.shrink();
  }

  Widget _buildNormalItem(String taskName, String taskDesc, String btnText,
      bool btnDisabled, VoidCallback btnTappedCallback) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
      child: Container(
        height: 93,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    taskDesc,
                    style: TextStyle(
                        color: R.color.unionRankText1.withOpacity(0.6),
                        fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: btnTappedCallback,
              child: Container(
                width: 63,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    colors: R.color.mainBrandGradientColors
                        .map((e) => e.withOpacity(btnDisabled ? 0.5 : 1))
                        .toList(),
                  ),
                ),
                child: Text(
                  btnText,
                  style: TextStyle(
                      color: Colors.white.withOpacity(btnDisabled ? 0.5 : 1),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
