import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:personaldata/k.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';

import '../model/cp_small_house_repo.dart';
import '../model/pb/generated/slp_cp_house.pb.dart';
import 'create_house_main_screen.dart';
import 'destroy_cp_house_dialog.dart';

class CpSmallHouseDetailScreen extends StatefulWidget {
  final int uid;
  final int id;

  const CpSmallHouseDetailScreen(
      {Key? key, required this.uid, required this.id})
      : super(key: key);

  @override
  State<CpSmallHouseDetailScreen> createState() =>
      _CpSmallHouseDetailScreenState();

  static Future show(BuildContext context,
      {required int uid, required int id}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CpSmallHouseDetailScreen(uid: uid, id: id),
      ),
    );
  }
}

class _CpSmallHouseDetailScreenState extends State<CpSmallHouseDetailScreen> {
  HouseDetail? _houseDetail;
  int _cpMissionListLength = 0;
  int _dayMissionListLength = 0;
  int _weekMissionListLength = 0;
  int _houseLevel = 1;
  String _houseName = '';
  int _houseIndex = 0;
  final SwiperController _controller = SwiperController();
  bool _loading = true;
  String? _errMsg;

  @override
  void initState() {
    super.initState();
    _loadData();

    Tracker.instance.track(TrackEvent.house_build_show, properties: {
      'uid': Session.uid,
    });
  }

  void _loadData() {
    CpSmallHouseRepo.getCpHouseDetail(widget.uid, widget.id).then((resp) {
      if (resp.success && resp.hasHouseDetail()) {
        setState(() {
          _houseDetail = resp.houseDetail;
          _loading = false;
          _errMsg = null;
          // 亲密度任务/每日任务/一周任务
          _cpMissionListLength =
              _houseDetail?.houseMission.cpMissionList.length ?? 0;
          _dayMissionListLength =
              _houseDetail?.houseMission.dayMissionList.length ?? 0;
          _weekMissionListLength =
              _houseDetail?.houseMission.weekMissionList.length ?? 0;

          // 通过当前等级获取当前小屋名称
          _houseLevel = _houseDetail?.houseLevel ?? 1;
          if (_houseDetail != null &&
              !Util.isCollectionEmpty(_houseDetail?.houseLevelConfig)) {
            HouseLevelConfig firstConfig =
                resp.houseDetail.houseLevelConfig.first;
            HouseLevelConfig lastConfig =
                resp.houseDetail.houseLevelConfig.last;
            if (_houseLevel <= firstConfig.unlockeLevel) {
              _houseName = firstConfig.name;
              _houseIndex = 0;
            } else if (_houseLevel >= lastConfig.unlockeLevel) {
              _houseName = lastConfig.name;
              _houseIndex = resp.houseDetail.houseLevelConfig.length - 1;
            } else {
              for (int i = 0;
                  i < resp.houseDetail.houseLevelConfig.length;
                  i++) {
                HouseLevelConfig config = resp.houseDetail.houseLevelConfig[i];
                if (_houseLevel == config.unlockeLevel) {
                  HouseLevelConfig realConfig =
                      resp.houseDetail.houseLevelConfig[i];
                  _houseName = realConfig.name;
                  _houseIndex = i;
                  break;
                }
                if (_houseLevel < config.unlockeLevel && i > 0) {
                  HouseLevelConfig realConfig =
                      resp.houseDetail.houseLevelConfig[i - 1];
                  _houseName = realConfig.name;
                  _houseIndex = i - 1;
                  break;
                }
              }
            }
          }
        });
      } else {
        setState(() {
          _loading = false;
          _errMsg = Util.validStr(resp.msg) ? resp.msg : BaseK.K.base_net_error;
        });
      }
    });
  }

  /// 判断是否访问的是自己
  bool get _isMe => (Util.parseInt(_houseDetail?.from.uid) > 0 &&
      Util.parseInt(_houseDetail?.from.uid) == Session.uid);

  /// 判断是否访问的是自己 && 还有小屋了
  bool get _isMeHasHouse => (_isMe && Util.parseInt(_houseDetail?.to.uid) > 0);

  bool get _isMeNotHouse => (_isMe && Util.parseInt(_houseDetail?.to.uid) <= 0);

  bool get _isOtherNotHouse =>
      (!_isMe && Util.parseInt(_houseDetail?.to.uid) <= 0);

  bool get _showCpHouseOwners => (Util.parseInt(_houseDetail?.from.uid) > 0 &&
      Util.parseInt(_houseDetail?.from.uid) != Session.uid &&
      Util.parseInt(_houseDetail?.to.uid) > 0 &&
      Util.parseInt(_houseDetail?.to.uid) != Session.uid);

  bool get _showCpHouseTaskList =>
      ((Util.parseInt(_houseDetail?.from.uid) > 0 &&
              Util.parseInt(_houseDetail?.from.uid) == Session.uid &&
              Util.parseInt(_houseDetail?.to.uid) > 0) ||
          (Util.parseInt(_houseDetail?.to.uid) > 0 &&
              Util.parseInt(_houseDetail?.to.uid) == Session.uid));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: Util.height,
      child: Stack(
        children: [
          // 背景图片
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFDDC9FF), Color(0xFFDFD0F3)],
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(
                    'static/cp_small_house_detail_mask_bg.webp'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 导航栏
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: BaseAppBar.custom(
              backgroundColor: Colors.transparent,
              backColor: const Color(0xFF5837A4),
              statusBrightness: Brightness.dark,
              title: Text(
                K.personaldata_cp_small_house,
                style: const TextStyle(
                    color: Color(0xFF5837A4),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      String url = Util.getHelpUrlWithQStr('k129');
                      BaseWebviewScreen.show(context, url: url);
                    },
                    child: Container(
                      width: 50,
                      height: 35,
                      color: Colors.transparent,
                      alignment: AlignmentDirectional.center,
                      child: R.img(
                        'cp_house/cp_small_house_nav_more.webp',
                        width: 22,
                        height: 22,
                        package: ComponentManager.MANAGER_PERSONALDATA,
                      ),
                    ))
              ],
            ),
          ),
          // 内容视图
          PositionedDirectional(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
            start: 0,
            end: 0,
            bottom: 0,
            child: _buildBody(),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (Util.validStr(_errMsg)) {
      return ErrorData(
        error: _errMsg,
        onTap: () {
          _loadData();
        },
      );
    }
    return Column(
      children: [
        // 顶部小屋卡片
        _buildTopCpHouseCardWidget(),

        // 内容滚动视图
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 小屋图片轮播视图
                _buildSlideHouseWidget(),

                // 按钮
                _buildButtonsWidget(),

                //消息提示条
                if (_isMe && (_houseDetail?.hasNewInvite ?? false))
                  _buildMessageTipsWidget(),

                // 小屋所有者
                if (_showCpHouseOwners) _buildCpHouseOwnerWidget(),

                // 每日任务 + 一周任务
                if (_showCpHouseTaskList) _buildDailyAndWeeklyTaskWidget(),

                SizedBox(height: MediaQuery.of(context).padding.bottom)
              ],
            ),
          ),
        )
      ],
    );
  }

  /// 顶部小屋卡片
  Widget _buildTopCpHouseCardWidget() {
    double percent = _houseDetail != null
        ? Util.parseDouble('${_houseDetail?.exp ?? 0.0}') /
            Util.parseDouble('${_houseDetail?.nextLevelExp ?? 0.0}')
        : 0;
    if (percent < 0 || percent > 1) {
      percent = 1;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        width: Util.width - 32,
        height: 58,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 左边：小屋卡片
            Container(
              width: 212,
              height: 58,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 8, end: 10),
                    child: SizedBox(
                      width: 62,
                      height: 34,
                      child: Stack(
                        children: [
                          PositionedDirectional(
                            top: 0,
                            start: 0,
                            bottom: 0,
                            child: Container(
                              width: 34,
                              height: 34,
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white,
                              ),
                              child: CommonAvatar(
                                path: _isMe
                                    ? (_houseDetail?.from.icon ?? Session.icon)
                                    : (_houseDetail?.from.icon ?? ''),
                                size: 33,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            top: 0,
                            end: 0,
                            bottom: 0,
                            child: Container(
                              width: 34,
                              height: 34,
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white,
                              ),
                              child: _houseDetail != null &&
                                      Util.validStr(_houseDetail?.to.icon)
                                  ? CommonAvatar(
                                      path: _houseDetail?.to.icon ?? '',
                                      size: 33,
                                      shape: BoxShape.circle,
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        CreateHouseMainScreen.show(context,
                                            uid: widget.uid,
                                            initialIndex: 0,
                                            refer: 'cp_house_detail');
                                      },
                                      child: Container(
                                        width: 33,
                                        height: 33,
                                        alignment: AlignmentDirectional.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.5),
                                          color: const Color(0xFFE9D9FF),
                                        ),
                                        child: R.img(
                                          'ic_add.png',
                                          width: 16.0,
                                          height: 16.0,
                                          color: Colors.white,
                                          package: ComponentManager
                                              .MANAGER_BASE_ROOM,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              _houseName,
                              style: const TextStyle(
                                  color: Color(0xFF5837A4),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 4),
                            if (_houseDetail != null &&
                                (_houseDetail?.houseLevel ?? 0) > 0)
                              Container(
                                height: 16,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFFBF7C),
                                      Color(0xFFFF8342)
                                    ],
                                  ),
                                ),
                                child: Text(
                                  K.personaldata_how_many_levels(
                                      ['${_houseDetail?.houseLevel ?? 0}']),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
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
                                              color: R.color.dividerColor
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(2),
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
                                            width:
                                                constraints.maxWidth * percent,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF9F7BF9),
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
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${_houseDetail?.exp ?? 0}/${_houseDetail?.nextLevelExp ?? 0}',
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF5837A4),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 8)
                ],
              ),
            ),
            // 右边：拆除小屋
            if (_isMeHasHouse)
              GestureDetector(
                onTap: () async {
                  DestroyCpHouseDialog.show(context, cancelCallback: () {
                    Navigator.of(context).pop();
                  }, confirmCallback: () async {
                    NormalNull resp =
                        await CpSmallHouseRepo.postCpHouseDestroy(widget.id);
                    if (resp.success) {
                      Navigator.of(context).pop();
                      Future.delayed(const Duration(seconds: 1), () {
                        _loadData();
                        Fluttertoast.showCenter(
                            msg: K.personaldata_destroy_house_succeed);
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName('/image'));
                        eventCenter.emit(EventConstant.EventCpHouseDataChanged);
                      });
                    } else {
                      Fluttertoast.showCenter(msg: resp.msg);
                    }
                  });
                },
                child: SizedBox(
                  width: 48,
                  height: 53,
                  child: Stack(
                    children: [
                      GradientBorderBox(
                        begin: AlignmentDirectional.topEnd,
                        end: AlignmentDirectional.bottomEnd,
                        gradientColors: const [
                          Color(0xFF9F9DFF),
                          Color(0xFFD873FF)
                        ],
                        borderWidth: 2,
                        borderRadius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter,
                                colors: [Color(0xFFDBD5FF), Colors.white],
                              ),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                PositionedDirectional(
                                  top: 2,
                                  child: R.img(
                                    'cp_house/destroy_cp_house.webp',
                                    width: 32,
                                    height: 32,
                                    package:
                                        ComponentManager.MANAGER_PERSONALDATA,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        start: 0,
                        end: 0,
                        bottom: 0,
                        child: Container(
                          height: 18,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFC780FF),
                            border: Border.all(
                                color: const Color(0xFFE1D0FF), width: 1),
                          ),
                          child: Text(
                            K.personaldata_destroy_house,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  /// 小屋图片轮播视图
  Widget _buildSlideHouseWidget() {
    return Container(
      height: 260,
      width: Util.width,
      alignment: AlignmentDirectional.centerStart,
      child: !Util.isCollectionEmpty(_houseDetail?.houseLevelConfig)
          ? Swiper(
              key: ValueKey(_houseDetail?.houseLevelConfig.length ?? 0),
              controller: _controller,
              itemCount: _houseDetail?.houseLevelConfig.length ?? 0,
              index: _houseIndex,
              pagination: null,
              autoplay: false,
              loop: false,
              autoplayDelay: 3000,
              autoplayDisableOnInteraction: true,
              viewportFraction: 0.6,
              scale: 0.6,
              itemBuilder: (BuildContext context, int index) {
                HouseLevelConfig? config =
                    _houseDetail?.houseLevelConfig[index];
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 260,
                      height: 240,
                      // color: Colors.red,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          PositionedDirectional(
                            start: 0,
                            end: 0,
                            bottom: 0,
                            child: CachedNetworkImage(
                              imageUrl: Util.getRemoteImgUrl(config?.bg ?? ''),
                              // + '?x-oss-process=image/resize,w_480,h_480',
                              width: 240,
                              height: 240,
                              fit: BoxFit.contain,
                            ),
                          ),
                          if ((config?.unlockeLevel ?? 0) > _houseLevel)
                            Center(
                              child: Container(
                                width: 54,
                                height: 54,
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(54 / 2),
                                  color:
                                      const Color(0xFF000000).withOpacity(0.4),
                                ),
                                child: R.img(
                                  'cp_house/cp_small_house_lock.webp',
                                  width: 24,
                                  height: 24,
                                  package:
                                      ComponentManager.MANAGER_PERSONALDATA,
                                ),
                              ),
                            ),
                          if ((config?.unlockeLevel ?? 0) > _houseLevel)
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 240),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 12),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF000000).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  K.personaldata_deblock_cp_house_need_level([
                                    '${config?.unlockeLevel ?? 0}',
                                    config?.name ?? ''
                                  ]),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 13),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                );
              },
              onIndexChanged: (index) {
                setState(() {
                  _houseIndex = index;
                });
              },
            )
          : const SizedBox.shrink(),
    );
  }

  /// 按钮
  Widget _buildButtonsWidget() {
    /// 如果是自己 & 没有小屋，则展示"邀请组CP"按钮
    if (_isMeNotHouse) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 6),
        child: GestureDetector(
          onTap: () async {
            CreateHouseMainScreen.show(context,
                uid: widget.uid,
                initialIndex: _isMe ? 0 : 1,
                refer: 'cp_house_detail');
          },
          child: R.img(
            'cp_house/cp_small_house_create_cp_house_btn_icon.webp',
            width: 178,
            height: 71,
            package: ComponentManager.MANAGER_PERSONALDATA,
          ),
        ),
      );
    }

    /// 如果是别人 & 没有小屋，则展示"邀请TA建立小屋"按钮
    if (_isOtherNotHouse) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 6),
        child: GestureDetector(
          onTap: () async {
            NormalNull resp =
                await CpSmallHouseRepo.postCpHouseInvite(widget.uid);
            if (resp.success) {
              Fluttertoast.showCenter(msg: K.personaldata_send_invite_succeed);
              _sendInviteMessage(widget.uid);
              Tracker.instance
                  .track(TrackEvent.send_house_together_build, properties: {
                'uid': Session.uid,
              });
            } else {
              Fluttertoast.showCenter(msg: resp.msg);
            }
          },
          child: R.img(
            'cp_house/cp_small_house_create_cp_house_btn_icon.webp',
            width: 178,
            height: 71,
            package: ComponentManager.MANAGER_PERSONALDATA,
          ),
        ),
      );
    }

    /// 啥都不展示
    return const SizedBox.shrink();
  }

  /// 发送邀请消息
  void _sendInviteMessage(int targetUid) {
    MessageContent content = MessageContent(MessageType.Text,
        SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = K.personaldata_invite_create_cp_house;
    Map extra = {'type': 'cp.house.invite'};
    content.extra = json.encode(extra);
    Im.sendMessage(ConversationType.Private, targetUid.toString(), content);
  }

  /// 消息提示条
  Widget _buildMessageTipsWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
      child: GestureDetector(
        onTap: () {
          CreateHouseMainScreen.show(context,
              uid: widget.uid, initialIndex: 1, refer: 'cp_house_detail');
        },
        child: Container(
          height: 103,
          width: Util.width - 40,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 0,
                spreadRadius: 0,
                color: Color(0xFFFF6C8F),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xFFFFE5EE), Color(0xFFFF98B4)],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  const Color(0xFFFFF470).withOpacity(0.5),
                  Colors.white.withOpacity(0)
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 18),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(
                      'cp_house/cp_small_house_title_left_icon.webp',
                      width: 14,
                      height: 10,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      K.personaldata_receive_new_invited_title,
                      style: const TextStyle(
                          color: Color(0xFF5F32AA),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 8),
                    R.img(
                      'cp_house/cp_small_house_title_right_icon.webp',
                      width: 14,
                      height: 10,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    K.personaldata_receive_new_invited_desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xFF5829AC).withOpacity(0.8),
                        fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 每日任务 + 一周任务
  Widget _buildDailyAndWeeklyTaskWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 20),
      child: GradientBorder(
        borderGradient: const LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: [Color(0xFFFFEFF9), Color(0xFFFF6CBC)],
        ),
        borderRadius: 36,
        borderWidth: 0.5,
        child: Container(
          width: Util.width - 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 0,
                spreadRadius: 0,
                color: Color(0xFFFF6CBF),
              ),
            ],
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xFFFFD8E6), Color(0xFFFF81A3)],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 20, bottom: 17),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(
                      'cp_house/cp_small_house_title_left_icon.webp',
                      width: 14,
                      height: 10,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      K.personaldata_upgrade_cp_level,
                      style: const TextStyle(
                          color: Color(0xFF5F32AA),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 8),
                    R.img(
                      'cp_house/cp_small_house_title_right_icon.webp',
                      width: 14,
                      height: 10,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                    ),
                  ],
                ),
              ),
              if (_isMeHasHouse)
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 11),
                  child: Text(
                    K.personaldata_me_has_house_tip,
                    style: TextStyle(
                        color: const Color(0xFF5837A4).withOpacity(0.8),
                        fontSize: 13),
                  ),
                ),
              // 亲密度任务
              if (_houseDetail != null &&
                  !Util.isCollectionEmpty(
                      _houseDetail?.houseMission.cpMissionList))
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 8, end: 8, bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [Color(0xFFF1EFFF), Color(0xFFFFFFFF)],
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildTaskNavWidget(
                            title: K.personaldata_intimacy_task),
                        if (_cpMissionListLength > 0) ...[
                          for (int i = 0; i < _cpMissionListLength; i++)
                            _buildTaskItemWidget(
                                item:
                                    _houseDetail?.houseMission.cpMissionList[i],
                                showDivider: i == _cpMissionListLength - 1)
                        ]
                      ],
                    ),
                  ),
                ),
              // 每日任务
              if (_houseDetail != null &&
                  !Util.isCollectionEmpty(
                      _houseDetail?.houseMission.dayMissionList))
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 8, end: 8, bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [Color(0xFFF1EFFF), Color(0xFFFFFFFF)],
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildTaskNavWidget(
                            title: K.personaldata_daily_task,
                            desc: K.personaldata_daily_task_desc),
                        if (_dayMissionListLength > 0) ...[
                          for (int i = 0; i < _dayMissionListLength; i++)
                            _buildTaskItemWidget(
                                item: _houseDetail
                                    ?.houseMission.dayMissionList[i],
                                showDivider: i == _dayMissionListLength - 1)
                        ]
                      ],
                    ),
                  ),
                ),
              // 一周任务
              if (_houseDetail != null &&
                  !Util.isCollectionEmpty(
                      _houseDetail?.houseMission.weekMissionList))
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 8, end: 8, bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [Color(0xFFF1EFFF), Color(0xFFFFFFFF)],
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildTaskNavWidget(
                            title: K.personaldata_weekly_task,
                            desc: K.personaldata_weekly_task_desc),
                        if (_weekMissionListLength > 0) ...[
                          for (int i = 0; i < _weekMissionListLength; i++)
                            _buildTaskItemWidget(
                                item: _houseDetail
                                    ?.houseMission.weekMissionList[i],
                                showDivider: i == _weekMissionListLength - 1)
                        ]
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 4, bottom: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    R.img(
                      'cplove/cp_heart_pkg_icon.png',
                      width: 8,
                      height: 8,
                      color: Colors.white,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      K.personaldata_task_bottom_desc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    const SizedBox(width: 8),
                    R.img(
                      'cplove/cp_heart_pkg_icon.png',
                      width: 8,
                      height: 8,
                      color: Colors.white,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 小屋所有者
  Widget _buildCpHouseOwnerWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 20),
      child: GradientBorder(
        borderGradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            const Color(0xFFFFEFF9).withOpacity(0.7),
            const Color(0xFFFF6CBC).withOpacity(0.7)
          ],
        ),
        borderRadius: 16,
        borderWidth: 1,
        child: Container(
          width: Util.width - 16,
          height: 236,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 0,
                spreadRadius: 0,
                color: Color(0xFFFF6CBF),
              ),
            ],
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xFFFFE5EE), Color(0xFFFF98B4)],
            ),
          ),
          child: Container(
            width: Util.width - 18,
            height: 236,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  const Color(0xFFFFF470).withOpacity(0.5),
                  Colors.white.withOpacity(0)
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 18, bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      R.img(
                        'cp_house/cp_small_house_title_left_icon.webp',
                        width: 14,
                        height: 10,
                        package: ComponentManager.MANAGER_PERSONALDATA,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        K.personaldata_cp_small_house_owner,
                        style: const TextStyle(
                            color: Color(0xFF5F32AA),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 8),
                      R.img(
                        'cp_house/cp_small_house_title_right_icon.webp',
                        width: 14,
                        height: 10,
                        package: ComponentManager.MANAGER_PERSONALDATA,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    width: Util.width - 18 - 24,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                          begin: AlignmentDirectional.topCenter,
                          end: AlignmentDirectional.bottomCenter,
                          colors: [Color(0xFFF1EFFF), Colors.white]),
                      image: DecorationImage(
                        image: AssetImage(
                          R.imagePath(
                            'cp_house/cp_house_owner_heart_mask_bg.webp',
                            package: ComponentManager.MANAGER_PERSONALDATA,
                          ),
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        R.img(
                          'cp_house/cp_house_owner_heart.webp',
                          width: 77,
                          height: 64,
                          package: ComponentManager.MANAGER_PERSONALDATA,
                        ),
                        PositionedDirectional(
                          start: 30,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 68,
                                height: 68,
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(34),
                                    color: const Color(0xFF9D9EFF)
                                        .withOpacity(0.4)),
                                child: CommonAvatar(
                                  path: _houseDetail?.from.icon ?? '',
                                  size: 63,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 90),
                                child: Text(
                                  (_houseDetail?.from.name ?? '')
                                      .safeSubstring(0, 6),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Color(0xFF5837A4),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        PositionedDirectional(
                          end: 30,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 68,
                                height: 68,
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(34),
                                    color: const Color(0xFFDC70FF)
                                        .withOpacity(0.4)),
                                child: CommonAvatar(
                                  path: _houseDetail?.to.icon ?? '',
                                  size: 63,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 90),
                                child: Text(
                                  (_houseDetail?.to.name ?? '')
                                      .safeSubstring(0, 6),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Color(0xFF5837A4),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 任务标题视图
  Widget _buildTaskNavWidget({required String title, String desc = ''}) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 4),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF5837A4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            if (Util.validStr(desc)) ...[
              const SizedBox(width: 8),
              Text(
                desc,
                style: const TextStyle(color: Color(0xFF5837A4), fontSize: 13),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItemWidget({
    HouseMissionItem? item,
    bool showDivider = true,
  }) {
    if (item == null) return const SizedBox.shrink();
    return Container(
      height: 72,
      padding: const EdgeInsetsDirectional.only(start: 12),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CachedNetworkImage(
              imageUrl: Util.imageFullUrl(
                  '${item.icon}?x-oss-process=image/resize,w_96,h_96'),
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                    color: Color(0xFF5837A4),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(
                                    K.personaldata_cp_house_task_dressup_value,
                                    style: TextStyle(
                                        color: const Color(0xFF5837A4)
                                            .withOpacity(0.6),
                                        fontSize: 13),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '+${item.addExp}',
                                    style: const TextStyle(
                                        color: Color(0xFFFF662D), fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (item.status) return;
                                // 跳首页
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/'));
                                eventCenter.emit('HomePage.JumpToHomePage');
                              },
                              child: Container(
                                width: 63,
                                height: 32,
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: const Color(0xFFFF6C8B)
                                          .withOpacity(item.status ? 0.5 : 1),
                                      width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                      color: const Color(0xFFFF6C82)
                                          .withOpacity(item.status ? 0.5 : 1),
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    begin: AlignmentDirectional.topCenter,
                                    end: AlignmentDirectional.bottomCenter,
                                    colors: [
                                      const Color(0xFFFFC1D7),
                                      const Color(0xFFFF2F4B)
                                    ]
                                        .map((e) => e
                                            .withOpacity(item.status ? 0.5 : 1))
                                        .toList(),
                                  ),
                                ),
                                child: Text(
                                  item.status
                                      ? K.personal_task_has_done
                                      : K.personal_go_do_task,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            ),
                            if (item.limit > 0) ...[
                              const SizedBox(height: 2),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item.progress >= 100000
                                        ? '${(item.progress / 10000).floor()}w'
                                        : '${item.progress}',
                                    style: const TextStyle(
                                        color: Color(0xFF5837A4),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '/${item.limit}',
                                    style: const TextStyle(
                                        color: Color(0xFF5837A4), fontSize: 10),
                                  ),
                                ],
                              )
                            ]
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                if (showDivider)
                  Container(
                    height: 1,
                    color: R.color.dividerColor,
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
