import 'dart:async';
import 'dart:ui';
import 'package:shared/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/page/box/room_users_avatars_list.dart';
import 'package:flutter/material.dart';
import '../../../assets.dart';

class RecommendRoomScreen extends StatefulWidget {
  final HomeRecommendEnterRoom recommendData;

  const RecommendRoomScreen({
    Key? key,
    required this.recommendData,
  }) : super(key: key);

  static Future<void> show(
      BuildContext context, HomeRecommendEnterRoom recommendData) async {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return RecommendRoomScreen(
          recommendData: recommendData, // 这里传入你的推荐数据
        );
      },
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<RecommendRoomScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  int _seconds = 0;
  Timer? _timer;
  int _closeNum = 0;

  @override
  void initState() {
    super.initState();
    _seconds = widget.recommendData.time;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        SizedBox(
          width: Util.width - 32,
          height: 210,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0x2999FFBC),
                    Color(0x2926C4FF),
                    Color(0x29926AFF)
                  ]),
                ),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
                width: Util.width - 32,
                height: 210,
                decoration: BoxDecoration(
                    color: R.colors.mainTextColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        userIcon(),
                        roomInfo(),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      constraints: BoxConstraints(maxWidth: Util.width - 90),
                      child: Text(
                        widget.recommendData.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: R.colors.brightTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        IRoomManager roomManager = ComponentManager.instance
                            .getManager(ComponentManager.MANAGER_BASE_ROOM);
                        if (widget.recommendData.rid > 0) {
                          Navigator.pop(context);
                          roomManager.openChatRoomScreenShow(
                              context, widget.recommendData.rid,
                              from: const RoomFrom(
                                  'call', RoomFrom.new_room_recommend));
                          Tracker.instance
                              .track(TrackEvent.new_room_enter, properties: {
                            'rid': widget.recommendData.rid,
                            'room_tape': widget.recommendData.roomFactoryType,
                          });
                        }
                      },
                      child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 20, end: 20),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                              colors: R.dColor.mainBrandGradientColors,
                            ),
                          ),
                          height: 48,
                          width: Util.width - 64,
                          alignment: AlignmentDirectional.center,
                          child: Text(K.room_recommend_join_room(['$_seconds']),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xE6000000),
                                  fontWeight: FontWeight.w500))),
                    )
                  ],
                )),
            PositionedDirectional(
                top: -42,
                start: -37,
                child: MultiframeImage.asset(
                  R.imagePath(
                    BaseAssets.shared$recommend_room_wave_webp,
                  ),
                  width: 180,
                  height: 180,
                  loop: true,
                ))
          ],
        ),
        PositionedDirectional(
            top: 0,
            end: 16,
            child: R.img(BaseAssets.shared$room_recommend_bg_webp,
                width: 120, height: 120)),
        PositionedDirectional(
            top: 16,
            end: 37,
            child: GestureDetector(
              onTap: () {
                setCloseCount();
                Navigator.pop(context);
              },
              child: Rext.autoStyleImg(
                  BaseAssets.shared$recommend_room_close_png,
                  width: 24,
                  height: 24),
            )),
      ],
    );
  }

  // 保存手动关闭的次数和时间
  Future<void> setCloseCount() async {
    Map? closeInfo = await HiveUtil.get<Map>(
        '${Session.uid}_${HiveBoxConstant.recRoomCloseInfo}');
    if (closeInfo?.isNotEmpty == true) {
      _closeNum = closeInfo?['count'] ?? 0;
      _closeNum++;
    } else {
      _closeNum = 1;
    }
    HiveUtil.put<Map>('${Session.uid}_${HiveBoxConstant.recRoomCloseInfo}',
        {'count': _closeNum, 'date': DateTime.now()});
  }

  // 房间信息
  Widget roomInfo() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 8.5, start: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: Util.width - 231),
            child: Text(
              widget.recommendData.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: R.colors.brightTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (widget.recommendData.avatarList.isNotEmpty)
            RoomUsersAvatarsList(
              micIcons: widget.recommendData.avatarList,
              num: widget.recommendData.num,
            ),
        ],
      ),
    );
  }

  // 用户头像
  Widget userIcon() {
    return Container(
        padding: const EdgeInsetsDirectional.only(start: 20, top: 15),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  gradient: const LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                      Color(0xFF99FFBC),
                      Color(0xFF26C4FF),
                      Color(0xFF926AFF),
                    ],
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  child: CommonAvatar(
                    path: Util.getRemoteImgUrl(widget.recommendData.icon),
                    size: 66,
                    shape: BoxShape.circle,
                  ),
                )),
            PositionedDirectional(
                bottom: 0,
                end: 0,
                child: Container(
                  width: 21,
                  height: 21,
                  decoration: BoxDecoration(
                    gradient: (widget.recommendData.typeBg.isNotEmpty)
                        ? LinearGradient(
                            colors:
                                Util.parseColors(widget.recommendData.typeBg))
                        : null,
                    color: Util.parseColor(widget.recommendData.tagColor),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: CommonAvatar(
                    path:
                        Util.getRemoteImgUrl(widget.recommendData.roomTagIcon),
                    size: 21,
                    shape: BoxShape.circle,
                  ),
                ))
          ],
        ));
  }
}
