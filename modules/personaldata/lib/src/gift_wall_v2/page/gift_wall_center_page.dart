import 'dart:math';

import 'package:shared/shared.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/gift_wall_v2/page/gift_wall_point_panel.dart';
import 'package:personaldata/src/gift_wall_v2/widget/gift_wall_change_light_widget.dart';
import 'package:personaldata/src/gift_wall_v2/widget/gift_wall_giver_widget.dart';
import 'package:personaldata/src/gift_wall_v2/widget/star_widget.dart';
import 'package:flutter/material.dart';

import '../../../K.dart';
import '../../api/gift_wall_api.dart';
import '../controller/gift_wall_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../model/gift_util.dart';
import '../widget/arrow_widget.dart';
import '../widget/gift_medal_widget.dart';
import 'gift_detail_dialog.dart';
import 'package:shared/assets.dart';
import 'package:shared/widget/vertical_text.dart';

import 'gift_wall_task_panel.dart';
import 'level_up_dialog.dart';
import 'package:sliver_tools/sliver_tools.dart';

class GiftWallCenterPage extends StatefulWidget {
  final int targetUid;
  final String? roomType;
  final int rid;
  final int giftId;
  final int initIndex;

  const GiftWallCenterPage(
      {Key? key,
      this.targetUid = 0,
      this.roomType,
      this.rid = 0,
      this.giftId = 0,
      this.initIndex = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => GiftWallCenterPageState();

  /// 如果传了giftId，则页面打开时会打开对应的礼物弹窗,且展示送礼体系
  static Future show(BuildContext context, int targetUid,
      {String? roomType, int rid = 0, int giftId = 0, int initIndex = 0}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: '/GiftWallCenterPage'),
            builder: (_) => GiftWallCenterPage(
                targetUid: targetUid,
                roomType: roomType,
                rid: rid,
                giftId: giftId,
                initIndex: initIndex)));
  }
}

class GiftWallCenterPageState extends State<GiftWallCenterPage>
    with BaseScreenStateMixin, TickerProviderStateMixin<GiftWallCenterPage> {
  final GiftWallController _giftXController =
      Get.put<GiftWallController>(GiftWallController());
  int _currentIndex = 0;
  String initType = ""; // 首次进入时展示的礼物类型，send or receive
  late SwiperController _controller;
  GiftMeta? _targetItem;
  final ValueNotifier<bool> _showRedDot = ValueNotifier(false);
  bool isSelf = true;
  final ScrollController _scrollController = ScrollController();
  final String _tag = "GiftWallCenterPageState";

  ///未点亮默认收起
  bool unlitExpand = false;

  ///点亮默认未选择，默认选择觉醒
  bool isChooseLight = false;

  @override
  void initState() {
    super.initState();
    _controller = SwiperController();
    initType = widget.giftId > 0 ? 'send' : '';
    isSelf = Session.uid == widget.targetUid;
    _scrollController.addListener(_onScroll);
    eventCenter.addListener(EventConstant.EventHandBookSwitch, _onEvent);
    _currentIndex = widget.initIndex >= 0 ? widget.initIndex : 0;
    _loadData(loadType: initType, refreshType: 0);
    Tracker.instance.track(TrackEvent.view_gift_handbook, properties: {
      'target_uid': widget.targetUid,
      'rid': widget.rid,
      'room_type': widget.roomType,
    });
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;

    double r = _scrollController.offset / 150;
    if (r < 0) {
      r = 0;
    }
    if (r > 1) {
      r = 1;
    }
    _giftXController.updateHeader(r);
  }

  _onEvent(String type, dynamic data) async {
    if (type == EventConstant.EventHandBookSwitch) {
      if (data is bool && mounted) {
        if (data) {
          _controller.previous();
        } else {
          _controller.next();
        }
      }
    }
  }

  /// loadType: 送礼or收礼 send,receive
  /// refreshType：刷新方式  0:首次进入，1,切换送礼体系刷新,2.觉醒后返回刷新
  _loadData({String? loadType, int refreshType = 0}) async {
    await _giftXController.initData(widget.targetUid, type: loadType);
    if (_giftXController.rsp?.success == true &&
        _giftXController.rsp?.data.seriesList.isNotEmpty == true) {
      if (loadType == null || loadType.isEmpty) {
        initType = _giftXController.rsp!.data.typ;
      }
      _giftXController.listSortType = 'star';
      _giftXController.listIsasc = 'false';
      _giftXController.requestListData(
          widget.targetUid,
          _giftXController.rsp!.data.typ,
          _giftXController.rsp!.data.seriesList[_currentIndex].typ);
      setScreenReady();
      _showRedDot.value = _giftXController.rsp!.data.canAwakeReward &&
          _giftXController.rsp!.data.awakeRoadSwitchOn;
      if (widget.giftId > 0 && _targetItem == null) {
        /// 弹出对应的礼物框
        GiftHandbookGiftListRsp rsp = await GiftWallApi.getGiftList(
            widget.targetUid, 'send', 'all', 'star', 'false');
        try {
          _targetItem = rsp.data.giftList
              .firstWhere((element) => element.id == widget.giftId);
        } catch (e) {
          _targetItem = null;
        }
        if (_targetItem != null && mounted) {
          GiftBookRuleInfo? rule =
              _giftXController.rsp!.data.ruleInfoMap[_targetItem?.price ?? 0];
          bool? result = await GiftDetailDialog.show(
            context,
            _targetItem,
            widget.targetUid,
            rule,
            _giftXController.rsp?.data.typ ?? '',
            rid: widget.rid,
            jumpRid: rsp.data.roomId,
            roomType: widget.roomType,
            isChooseLightType: isChooseLight,
          );
          if (result != null && result == true) {
            _giftXController.updateSelectionOpt(SelectionOpt.none);
            await _loadData(
                loadType: _giftXController.rsp?.data.typ ?? '', refreshType: 2);
          }
        }
      } else if (refreshType == 0 &&
          _giftXController.rsp!.data.canAwakeReward &&
          mounted &&
          isSelf &&
          _giftXController.rsp!.data.awakeRoadSwitchOn) {
        bool hasShown = Config.getBool(
            GiftWallController.KEY_HAS_SHOW_REWARD_DIALOG, false);
        if (hasShown) {
          return;
        }
        Config.setBool(GiftWallController.KEY_HAS_SHOW_REWARD_DIALOG, true);
        LevelUpDialog.show(context, _giftXController.rsp!.data.awakeRewardToast,
            () async {
          NormalNull res = await GiftWallApi.getAwardsAll();
          if (!mounted) {
            return;
          }
          if (res.success) {
            if (Navigator.of(context).canPop()) {
              Navigator.pop(context);
            }
            _showRedDot.value = false;
            Fluttertoast.showCenter(msg: res.msg);
            IVipManager vipManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_VIP);
            vipManager.showBagPage(context, tabType: "gift");
          } else {
            Fluttertoast.showCenter(msg: res.msg);
          }
        });
      }
    } else {
      setScreenEmpty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF283152), body: buildStatusContent());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    eventCenter.removeListener(EventConstant.EventHandBookSwitch, _onEvent);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    Get.delete<GiftWallController>();
  }

  @override
  Widget buildContent() {
    return GetBuilder<GiftWallController>(builder: (_) {
      return _giftXController.rsp?.success == true
          ? _buildBody()
          : const EmptyWidget();
    });
  }

  Widget _buildAppBar() {
    return BaseAppBar.custom(
        backgroundColor:
            const Color(0xFF283152).withOpacity(_giftXController.alpha),
        statusBrightness: Brightness.dark,
        leading: const BackButton(color: Colors.white),
        actions: <Widget>[_buildTaskAndRank()]);
  }

  Widget _buildTaskAndRank() {
    return Container(
      width: Util.width - 8,
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      margin: const EdgeInsetsDirectional.only(end: 8),
      alignment: Alignment.center,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 50,
          ),
          GiftWallChangeLightWidget(
            finishChoose: (int index) {
              isChooseLight = index == 1;
              _giftXController.updateGiftList();

              ///主要为了刷新header
              _onScroll();
            },
          ),
          const Spacer(),
          if (isSelf && !isChooseLight) ...[
            GestureDetector(
              child: R.img(
                Assets.personaldata$gift_wall_ic_point_png,
                width: 24,
                height: 24,
              ),
              onTap: () {
                GiftWallPointPanel.show(context);
              },
            ),
            SizedBox(width: 12.dp),
          ],
          if (isSelf &&
              _giftXController.rsp?.data.awakeRoadSwitchOn == true &&
              !isChooseLight)
            GestureDetector(
              child: ValueListenableBuilder<bool>(
                  valueListenable: _showRedDot,
                  builder: (context, value, child) {
                    return SizedBox(
                        width: _showRedDot.value ? 30 : 24,
                        height: 24,
                        child: Stack(
                          children: [
                            R.img(
                              Assets.personaldata$gift_wall_task_ic_task_webp,
                              width: 24,
                              height: 24,
                            ),
                            Visibility(
                                visible: value,
                                child: PositionedDirectional(
                                  end: 0,
                                  top: 0,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: R.color.thirdBrightColor,
                                    ),
                                  ),
                                ))
                          ],
                        ));
                  }),
              onTap: () {
                if (_giftXController.rsp!.data.seriesList.isNotEmpty &&
                    _currentIndex <
                        _giftXController.rsp!.data.seriesList.length) {
                  GiftWallTaskPanel.show(
                      context,
                      _currentIndex,
                      _giftXController.rsp!.data.typ,
                      _giftXController.rsp!.data.seriesList,
                      _giftXController.rsp!.data.ruleInfoMap);
                } else {}
              },
            ),
          SizedBox(width: 12.dp),
          if (!_giftXController.rsp!.data.isHideIntimateList || isSelf) ...[
            GestureDetector(
              child: R.img(
                Assets.personaldata$gift_wall_task_ic_rank_webp,
                width: 24,
                height: 24,
              ),
              onTap: () {
                BaseWebviewScreen.show(context,
                    url: _giftXController.rsp!.data.intimateUrl);
              },
            ),
            SizedBox(width: 12.dp),
          ],
          GestureDetector(
            child: R.img(
              BaseAssets.titlebar_ic_titlebar_question_svg,
              color: Colors.white,
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
            onTap: () {
              String url = _giftXController.rsp!.data.ruleUrl;
              if (url.isNotEmpty) {
                BaseWebviewScreen.show(context, url: url);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    List<Widget> topUsers = _giftXController.rsp!.data.rankTop
        .mapIndexed((i, e) => PositionedDirectional(
            start: (i * 12).dp,
            child: CommonAvatar(
              path: e.icon,
              suffix: Util.squareResizeSuffix(50),
              size: 18.dp,
              shape: BoxShape.circle,
            )))
        .toList();
    return Stack(
      children: [
        PositionedDirectional(
            top: 0.dp,
            child: Container(
                width: Util.width,
                height: Util.height,
                color: const Color(0xFF283152))),
        PositionedDirectional(
          child: CustomScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 440.dp,
                  child: Stack(
                    children: [
                      GetBuilder<GiftWallController>(
                          id: GiftWallController.ID_UPDATE_INDEX_CHANGE,
                          builder: (_) {
                            bool isLightAll =
                                _giftXController.isLightAll(_currentIndex);
                            return R.img(
                              isLightAll
                                  ? Assets
                                      .personaldata$gift_wall_gift_header_bg_light_webp
                                  : Assets
                                      .personaldata$gift_wall_gift_header_bg_webp,
                              width: Util.width,
                              height: 440.dp,
                            );
                          }),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              _buildHeader(),
                              PositionedDirectional(
                                top: Util.statusHeight + 6.dp,
                                end: 0.dp,
                                height: 26.dp,
                                child: GestureDetector(
                                  onTap: () {
                                    if (_giftXController
                                        .rsp!.data.rankUrl.isNotEmpty) {
                                      BaseWebviewScreen.show(context,
                                          url: _giftXController
                                              .rsp!.data.rankUrl);
                                    }
                                  },
                                  child: Container(
                                    height: 26.dp,
                                    padding: EdgeInsetsDirectional.only(
                                        start: 6.dp, end: 4.dp),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [
                                          Color(0xFF4D5A89),
                                          Color(0xFF283152)
                                        ]),
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                                topStart:
                                                    Radius.circular(20.dp),
                                                bottomStart:
                                                    Radius.circular(20.dp)),
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 1.dp,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(K.gift_wall_rank,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                fontSize: 12.dp)),
                                        SizedBox(width: 4.dp),
                                        SizedBox(
                                            width:
                                                (8 + topUsers.length * 12).dp,
                                            child: Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              fit: StackFit.loose,
                                              children:
                                                  topUsers.reversed.toList(),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                top: Util.statusHeight,
                                start: 0.dp,
                                height: 57.dp,
                                child: GetBuilder<GiftWallController>(
                                    id: GiftWallController.ID_UPDATE_EXP_STATE,
                                    builder: (_) {
                                      return _.isExpExpanded
                                          ? _buildExperienceExpand()
                                          : _buildExperienceClose();
                                    }),
                              ),
                            ],
                          ),
                          _buildSwiper(),
                          Stack(children: [
                            GetBuilder<GiftWallController>(
                                id: GiftWallController.ID_UPDATE_LIST,
                                builder: (_) {
                                  bool isLightAll = _giftXController
                                      .isLightAll(_currentIndex);
                                  return Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          bottom: 25.dp),
                                      child: GiftWallGiverWidget(
                                        isAll: isLightAll,
                                        userList: _giftXController
                                            .listRsp?.data.richManAvatars,
                                        typ: _giftXController.rsp!.data
                                            .seriesList[_currentIndex].typ,
                                        seriesType:
                                            _giftXController.rsp!.data.typ,
                                      ));
                                }),
                            PositionedDirectional(
                              bottom: 5,
                              start: 0,
                              end: 0,
                              child: GetBuilder<GiftWallController>(
                                  id: GiftWallController.ID_UPDATE_SELECTION,
                                  builder: (_) {
                                    return _buildSelection();
                                  }),
                            ),
                          ]),
                        ],
                      )
                    ],
                  ),
                )),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 10.dp,
                )),
                GetBuilder<GiftWallController>(
                    id: GiftWallController.ID_UPDATE_LIST,
                    builder: (_) {
                      if (_giftXController.isListLoading) {
                        return SliverToBoxAdapter(
                          child: Container(
                            alignment: Alignment.center,
                            width: Util.width,
                            height: 100,
                            child: const Loading(),
                          ),
                        );
                      }

                      if (_giftXController.listRsp == null) {
                        return const SliverToBoxAdapter();
                      }

                      if (!_giftXController.listRsp!.success) {
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: ErrorData(
                            error: R.string('data_error'),
                            fontColor: Colors.white,
                            onTap: () async {
                              _giftXController.requestListData(
                                  widget.targetUid,
                                  _giftXController.rsp!.data.typ,
                                  _giftXController
                                      .rsp!.data.seriesList[_currentIndex].typ);
                            },
                          ),
                        );
                      }

                      if (_giftXController.listRsp!.data.giftList.isEmpty) {
                        ///空页面
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: EmptyWidget(
                            textColor: Colors.white,
                            onTap: () async {
                              _giftXController.requestListData(
                                  widget.targetUid,
                                  _giftXController.rsp!.data.typ,
                                  _giftXController
                                      .rsp!.data.seriesList[_currentIndex].typ);
                            },
                          ),
                        );
                      } else {
                        if (isChooseLight) {
                          return _buildSliverLightGiftList();
                        }
                        return _buildSliverGiftList();
                      }
                    }),
              ]),
        ),
        PositionedDirectional(
          width: Util.width,
          height: 88.dp,
          child: GetBuilder<GiftWallController>(
              id: GiftWallController.ID_UPDATE_HEADER,
              builder: (_) {
                return _buildAppBar();
              }),
        )
      ],
    );
  }

  Widget _buildSliverGiftList() {
    return SliverPadding(
      padding: EdgeInsetsDirectional.only(
          start: 9.dp, end: 9.dp, top: 6.dp, bottom: Util.bottomMargin),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 9,
          crossAxisSpacing: 9,
          childAspectRatio: 114 / 173,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return _giftItemBuilder(
                context, _giftXController.listRsp!.data.giftList[index], index);
          },
          childCount: _giftXController.listRsp?.data.giftList.length ?? 0,
        ),
      ),
    );

    // return LoadingMoreSliverList(SliverListConfig<GiftMeta>(
    //   sourceList: _source!,
    //   padding: EdgeInsetsDirectional.only(start: 9.dp, end: 9.dp, top: 5.dp),
    //   lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
    //   indicatorBuilder: _indicatorBuilder,
    //   extendedListDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 3,
    //     mainAxisSpacing: 9,
    //     crossAxisSpacing: 9,
    //   ),
    //   itemBuilder: (BuildContext context, GiftMeta item, int index) {
    //     return _giftItemBuilder(context, item, index);
    //   },
    //   itemExtent: 173.dp,
    // ));
  }

  Widget _buildSliverLightGiftList() {
    List<GiftMeta> unlitList = [];
    List<GiftMeta> lightList = [];
    _giftXController.listRsp?.data.giftList.map((element) {
      if (element.isOn) {
        lightList.add(element);
      } else {
        unlitList.add(element);
      }
    }).toList();

    return MultiSliver(
      children: [
        if (unlitList.isNotEmpty)
          SliverToBoxAdapter(
              child: Row(
            children: [
              const Spacer(),
              Container(
                width: 118.dp,
                height: 0.5.dp,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white.withOpacity(0), Colors.white],
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (unlitList.length > 10) {
                    unlitExpand = !unlitExpand;
                    _giftXController.updateGiftList();
                  }
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 3, bottom: 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      R.img(
                          Assets.personaldata$gift_wall_gift_unlight_text_webp,
                          width: 26.dp,
                          height: 10.dp),
                      R.img(
                          (unlitExpand || unlitList.length <= 10)
                              ? Assets.personaldata$gift_wall_arrow_down_png
                              : Assets.personaldata$gift_wall_arrow_up_webp,
                          width: 12.dp,
                          height: 12.dp),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 118.dp,
                height: 0.5.dp,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white.withOpacity(0)],
                  ),
                ),
              ),
              const Spacer(),
            ],
          )),
        if (unlitList.isNotEmpty)
          SliverPadding(
            padding: const EdgeInsetsDirectional.only(start: 9, end: 9, top: 3),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                childAspectRatio: 66 / 100,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _giftItemBuilder(context, unlitList[index], index,
                      small: true);
                },
                childCount: unlitList.length <= 10
                    ? unlitList.length
                    : (unlitExpand ? unlitList.length : 10),
              ),
            ),
          ),
        if (lightList.isNotEmpty)
          SliverToBoxAdapter(
              child: Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 9, end: 9, top: 20),
            child: Row(
              children: [
                const Spacer(),
                Container(
                  width: 118.dp,
                  height: 0.5.dp,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0), Colors.white],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(
                        Assets.personaldata$gift_wall_gift_has_light_text_webp,
                        width: 26.dp,
                        height: 10.dp),
                    R.img(Assets.personaldata$gift_wall_arrow_down_png,
                        width: 12.dp, height: 12.dp),
                  ],
                ),
                const SizedBox(
                  width: 7,
                ),
                Container(
                  width: 118.dp,
                  height: 0.5.dp,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0)],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          )),
        if (lightList.isNotEmpty)
          SliverPadding(
            padding: EdgeInsetsDirectional.only(
                start: 9, end: 9, top: 6, bottom: Util.bottomMargin),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                childAspectRatio: 66 / 100,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _giftItemBuilder(context, lightList[index], index,
                      small: true);
                },
                childCount: lightList.length,
              ),
            ),
          ),
      ],
    );
  }

  Widget _giftItemBuilder(BuildContext context, GiftMeta item, int index,
      {bool small = false}) {
    return GestureDetector(
      onTap: () async {
        GiftBookRuleInfo? rule =
            _giftXController.rsp!.data.ruleInfoMap[item.price];
        bool? result = await GiftDetailDialog.show(
          context,
          item,
          widget.targetUid,
          rule,
          _giftXController.rsp!.data.typ,
          rid: widget.rid,
          jumpRid: _giftXController.listRsp?.data.roomId ?? 0,
          roomType: widget.roomType,
          isChooseLightType: isChooseLight,
        );
        if (result != null && result == true) {
          _giftXController.updateSelectionOpt(SelectionOpt.none);
          await _loadData(
              loadType: _giftXController.rsp!.data.typ, refreshType: 2);
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Opacity(
              opacity: item.isOn ? 1.0 : 0.5,
              child: Container(
                  height: small ? 100.dp : 173.dp,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                              GiftUtil.getGiftBgMain(item.qualityLevel)))),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      PositionedDirectional(
                          bottom: 15.dp,
                          width: small ? 67.dp : 103.dp,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 5.dp, end: 5.dp),
                                child: Text(item.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 12.dp)),
                              ),
                              SizedBox(height: 2.dp),
                              if (!small)
                                Container(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 10.dp, end: 10.dp),
                                  child: LightStarWidget(
                                      totalNum: 5,
                                      lightNum: item.startNum,
                                      size: 15.dp,
                                      targetUid: widget.targetUid),
                                )
                            ],
                          )),
                      PositionedDirectional(
                        top: 25.dp,
                        width: small ? 40.dp : 90.dp,
                        height: small ? 40.dp : 90.dp,
                        child: CachedNetworkImage(
                            imageUrl: Util.squareResize(item.icon, 240),
                            width: small ? 36.dp : 83.dp,
                            height: small ? 36.dp : 83.dp,
                            fit: BoxFit.contain),
                      ),
                      if (!small && item.awakeStatus == 2)
                        PositionedDirectional(
                            top: 95.dp,
                            child: R.img(
                                Assets.personaldata$gift_wall_btn_awoken_webp,
                                height: 26.dp)),
                      if (item.isOn)
                        PositionedDirectional(
                            width: small ? 60.dp : 103.dp,
                            height: 26.dp,
                            top: small ? 8.dp : 25.dp,
                            child: Container(
                              padding: EdgeInsetsDirectional.only(
                                  start: 4.dp, end: 4.dp),
                              child: Row(
                                children: [
                                  ///点亮模式下显示点亮的头像，有擦除则不展示
                                  isChooseLight
                                      ? (item.isErased
                                          ? const SizedBox.shrink()
                                          : CommonAvatar(
                                              path: item.lightUser.icon,
                                              suffix:
                                                  Util.squareResizeSuffix(50),
                                              size: small ? 10.dp : 16.dp,
                                              shape: BoxShape.circle,
                                            ))
                                      : CommonAvatar(
                                          path: item.namingUser.icon,
                                          suffix: Util.squareResizeSuffix(50),
                                          size: small ? 10.dp : 16.dp,
                                          shape: BoxShape.circle,
                                        ),
                                  const Spacer(),

                                  ///点亮模式不显示数字
                                  if (!isChooseLight)
                                    Container(
                                      padding: EdgeInsetsDirectional.only(
                                          start: 4.dp,
                                          end: 4.dp,
                                          top: small ? 0.dp : 2.dp,
                                          bottom: small ? 0.dp : 2.dp),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  small ? 10.dp : 40.dp),
                                          color:
                                              Colors.white.withOpacity(0.15)),
                                      child: Text("X${item.num}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: small ? 8.dp : 10.dp)),
                                    )
                                ],
                              ),
                            )),
                    ],
                  ))),
          if (!item.isOn)
            PositionedDirectional(
              top: small ? 40.dp : 60.dp,
              child: R.img(
                  Assets.personaldata$gift_wall_gift_state_unlight_webp,
                  width: 80.dp,
                  fit: BoxFit.contain,
                  package: ComponentManager.MANAGER_PERSONALDATA),
            ),
        ],
      ),
    );
  }

  // Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
  //   if (status == IndicatorStatus.loadingMoreBusying) {
  //     return LoadingFooter(hasMore: true, textColor: Colors.white);
  //   } else if (status == IndicatorStatus.fullScreenBusying) {
  //     return const SliverFillRemaining(
  //       child: Center(
  //         child: CupertinoActivityIndicator(),
  //       ),
  //     );
  //   } else if (status == IndicatorStatus.noMoreLoad) {
  //     return LoadingFooter(hasMore: false, textColor: Colors.white);
  //   } else if (status == IndicatorStatus.fullScreenError) {
  //     return SliverFillRemaining(
  //       hasScrollBody: false,
  //       child: ErrorData(
  //         error: R.string('data_error'),
  //         fontColor: Colors.white,
  //         onTap: () async {
  //           await _source!.refresh();
  //           _giftXController.updateGiftList();
  //         },
  //       ),
  //     );
  //   } else if (status == IndicatorStatus.error) {
  //     return LoadingFooter(
  //       errorMessage: R.string('data_error'),
  //       textColor: Colors.white,
  //       loadMore: _source!.loadMore,
  //     );
  //   } else if (status == IndicatorStatus.empty) {
  //     return SliverFillRemaining(
  //       hasScrollBody: false,
  //       child: EmptyWidget(
  //         textColor: Colors.white,
  //         onTap: () async {
  //           await _source!.refresh();
  //           _giftXController.updateGiftList();
  //         },
  //       ),
  //     );
  //   }
  //   return LoadingFooter(hasMore: true, textColor: R.colors.secondTextColor);
  // }

  Widget _buildHeader() {
    int roomId = _giftXController.rsp!.data.me.roomId;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () async {
              if (roomId > 0 && !isSelf) {
                IRoomManager roomManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                roomManager.openChatRoomScreenShow(context, roomId,
                    refer: "GiftCenter", uid: widget.targetUid);
              }
            },
            child: Container(
              width: 72.dp,
              height: 72.dp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 1.2.dp, color: Colors.white.withOpacity(0.5)),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CommonAvatar(
                    path: _giftXController.rsp!.data.me.icon,
                    size: 64.dp,
                    shape: BoxShape.circle,
                  ),
                  if (roomId > 0 && !isSelf)
                    R.img(
                      BaseAssets.shared$living_small_webp,
                      width: 20.0,
                      height: 20.0,
                    ),
                ],
              ),
            )),
        SizedBox(height: 9.dp),
        Text(
          _giftXController.rsp!.data.me.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.dp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.dp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 102.dp,
              height: 24.dp,
              alignment: AlignmentDirectional.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          Assets.personaldata$gift_wall_light_bg_webp))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(K.gift_wall_light,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 10.dp,
                          fontWeight: FontWeight.w600)),
                  Text(" ${_giftXController.rsp!.data.briefInfo.lightNum}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.dp,
                          fontWeight: FontWeight.w700,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE)),
                  Text("/${_giftXController.rsp!.data.briefInfo.total}",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 10.dp,
                          fontWeight: FontWeight.w700,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE)),
                ],
              ),
            ),
            SizedBox(width: 12.dp),
            Container(
              width: 102.dp,
              height: 24.dp,
              alignment: AlignmentDirectional.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          Assets.personaldata$gift_wall_light_bg_webp))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(K.gift_wall_awake_state_1,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 10.dp,
                          fontWeight: FontWeight.w600,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE)),
                  Text(" ${_giftXController.rsp!.data.briefInfo.awakeNum}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.dp,
                          fontWeight: FontWeight.w700)),
                  Text("/${_giftXController.rsp!.data.briefInfo.awakeTotal}",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 10.dp,
                          fontWeight: FontWeight.w700,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE)),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 12.dp),
        GiftMedalWidget(medalList: _giftXController.rsp!.data.levelList)
      ],
    );
  }

  /// 经验展开
  Widget _buildExperienceExpand() {
    int currExp = _giftXController.rsp!.data.levelExp.score;
    int totalExp = _giftXController.rsp!.data.levelExp.total;
    double expWidth = 150.dp;
    return Container(
      width: 305.dp,
      constraints: BoxConstraints(minWidth: 60.dp),
      padding: EdgeInsetsDirectional.only(start: 10.dp, end: 5.dp),
      decoration: BoxDecoration(
          image: DecorationImage(
              scale: Util.devicePixelRatio,
              centerSlice: const Rect.fromLTWH(32, 21, 1, 1),
              image: const AssetImage(
                  Assets.personaldata$gift_wall_exp_bg_expand_webp))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          R.img(Util.getRemoteImgUrl(_giftXController.rsp!.data.levelExp.icon),
              height: 48.dp, width: 48.dp),
          SizedBox(width: 6.dp),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      R.img(
                          Util.handBookLevelIcon(
                              _giftXController.rsp!.data.levelExp.curLevel),
                          height: 20.dp,
                          package: ComponentManager.MANAGER_BASE_CORE),
                      SizedBox(width: 2.dp),
                      _giftXController.rsp!.data.levelExp.score >=
                              _giftXController.rsp!.data.levelExp.total
                          ? Text(K.gift_wall_level_tips_5,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.dp,
                                  fontWeight: FontWeight.w600))
                          : RichText(
                              text: TextSpan(children: [
                              TextSpan(
                                  text: K.gift_wall_level_tips_1,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 9.dp,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: _giftXController
                                      .rsp!.data.levelExp.nextLevelName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.dp,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: K.gift_wall_level_tips_2,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 9.dp,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: K.gift_wall_level_tips_3(
                                      ["${totalExp - currExp}"]),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.dp,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: K.gift_wall_level_tips_4,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 9.dp,
                                      fontWeight: FontWeight.w400)),
                            ])),
                    ],
                  ),
                  SizedBox(height: 6.dp),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: expWidth,
                            height: 5.dp,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10.dp)),
                          ),
                          Container(
                            width: totalExp > 0
                                ? min(currExp / totalExp, 1) * expWidth
                                : 0,
                            height: 5.dp,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xFF8C96C9),
                                  Color(0xFFC2CCFF)
                                ]),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10.dp)),
                          ),
                        ],
                      ),
                      SizedBox(width: 5.dp),
                      Expanded(
                          flex: 1,
                          child: Text(
                              "${_giftXController.rsp!.data.levelExp.score}/${_giftXController.rsp!.data.levelExp.total}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.dp,
                                  fontWeight: FontWeight.w700))),
                    ],
                  )
                ],
              )),
          GestureDetector(
            onTap: () {
              _giftXController.updateExpExpandState();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                    width: 30.dp,
                    height: 30.dp,
                    child: CustomPaint(
                      painter: VerticalText(
                        text: K.gift_wall_close,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 9.dp,
                            fontWeight: FontWeight.w700),
                        width: 30.dp,
                        height: 30.dp,
                      ),
                    )),
                Transform.rotate(
                    angle: pi,
                    child: R.img(Assets.personaldata$gift_wall_ic_pause_svg,
                        width: 10.dp,
                        height: 10.dp,
                        fit: BoxFit.cover,
                        package: ComponentManager.MANAGER_PERSONALDATA)),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 经验收起
  Widget _buildExperienceClose() {
    return GestureDetector(
      onTap: () {
        _giftXController.updateExpExpandState();
      },
      child: Container(
          alignment: AlignmentDirectional.centerStart,
          width: 66.dp,
          constraints: BoxConstraints(minWidth: 60.dp),
          padding: EdgeInsetsDirectional.only(start: 2.dp, end: 5.dp),
          decoration: BoxDecoration(
              image: DecorationImage(
                  scale: Util.devicePixelRatio,
                  centerSlice: const Rect.fromLTWH(32, 21, 2, 1),
                  image: const AssetImage(
                      Assets.personaldata$gift_wall_exp_bg_close_webp))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  R.img(
                      Util.squareResize(
                          _giftXController.rsp?.data.levelExp.icon ?? '', 100),
                      height: 36.dp,
                      width: 36.dp),
                  R.img(
                      Util.handBookLevelIcon(
                          _giftXController.rsp?.data.levelExp.curLevel ?? ''),
                      height: 10.dp,
                      package: ComponentManager.MANAGER_BASE_CORE),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 10.dp,
                      height: 30.dp,
                      child: CustomPaint(
                        painter: VerticalText(
                          text: K.gift_wall_expand,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 9.dp,
                              fontWeight: FontWeight.w700),
                          width: 10.dp,
                          height: 30.dp,
                        ),
                      )),
                  R.img(Assets.personaldata$gift_wall_ic_pause_svg,
                      width: 10.dp,
                      height: 10.dp,
                      fit: BoxFit.cover,
                      package: ComponentManager.MANAGER_PERSONALDATA),
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildSelection() {
    return Container(
      height: 33.dp,
      padding: EdgeInsetsDirectional.only(start: 9.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSelf || _giftXController.rsp!.data.isCanSelect // 客态仅白名单用户才能切换送礼/收礼
              ? Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        onGiftTypeChanged();
                      },
                      child: R.img(
                          _giftXController.isSelected
                              ? BaseAssets.ic_selected_svg
                              : BaseAssets.ic_unselected_svg,
                          width: 12.dp,
                          fit: BoxFit.contain,
                          package: ComponentManager.MANAGER_BASE_CORE),
                    ),
                    SizedBox(width: 2.dp),
                    GestureDetector(
                      onTap: () async {
                        onGiftTypeChanged();
                      },
                      child: Text(
                          initType == "send"
                              ? K.gift_wall_select_1
                              : K.gift_wall_select_0,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.dp,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          Container(
              height: 33.dp,
              width: _giftXController.isSelectExpanded ? 200.dp : 72.dp,
              padding: EdgeInsetsDirectional.only(
                  start: 10.dp, end: 10.dp, bottom: 2.dp),
              alignment: AlignmentDirectional.centerStart,
              decoration: ShapeDecoration(
                shape: BeveledRectangleBorder(
                    side: BorderSide(
                        color: Colors.white,
                        width: 0.5.dp,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    borderRadius: BorderRadiusDirectional.horizontal(
                        start: Radius.circular(15.dp))),
                gradient: const LinearGradient(
                    colors: [Color(0xFF283152), Color(0xFF4D5A89)]),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () async {
                        _giftXController.updateSelectExpandState();
                      },
                      child: Container(
                        width: 20.dp,
                        height: 20.dp,
                        padding: EdgeInsetsDirectional.all(5.dp),
                        child: Transform.rotate(
                          angle: pi,
                          child: R.img(
                              Assets.personaldata$gift_wall_ic_pause_svg,
                              width: 10.dp,
                              height: 10.dp,
                              fit: BoxFit.cover,
                              package: ComponentManager.MANAGER_PERSONALDATA),
                        ),
                      )),
                  InkWell(
                    onTap: () async {
                      _giftXController.updateSelectExpandState();
                    },
                    child: Text(K.gift_wall_select_2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.dp,
                            fontWeight: FontWeight.w500)),
                  ),
                  if (_giftXController.isSelectExpanded) ...[
                    SizedBox(width: 8.dp),
                    InkWell(
                      onTap: () async {
                        _giftXController.updateSelectionOpt(
                            (_giftXController.opt == SelectionOpt.starDown)
                                ? SelectionOpt.starUp
                                : SelectionOpt.starDown);
                        String isAsc =
                            _giftXController.opt == SelectionOpt.starDown
                                ? "true"
                                : "false";

                        _giftXController.listSortType = 'star';
                        _giftXController.listIsasc = isAsc;
                        _giftXController.requestListData(
                            widget.targetUid,
                            _giftXController.rsp!.data.typ,
                            _giftXController
                                .rsp!.data.seriesList[_currentIndex].typ,
                            isShowLoading: false);
                      },
                      child: Row(
                        children: [
                          Text(K.gift_wall_select_3,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 11.dp,
                                  fontWeight: FontWeight.w400)),
                          ArrowWidget(state: getArrowState(SelectionArgs.star)),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.dp),
                    InkWell(
                      onTap: () async {
                        _giftXController.updateSelectionOpt(
                            (_giftXController.opt == SelectionOpt.wealthDown)
                                ? SelectionOpt.wealthUp
                                : SelectionOpt.wealthDown);
                        String isAsc =
                            _giftXController.opt == SelectionOpt.wealthDown
                                ? "true"
                                : "false";

                        _giftXController.listSortType = 'price';
                        _giftXController.listIsasc = isAsc;
                        _giftXController.requestListData(
                            widget.targetUid,
                            _giftXController.rsp!.data.typ,
                            _giftXController
                                .rsp!.data.seriesList[_currentIndex].typ,
                            isShowLoading: false);
                      },
                      child: Row(
                        children: [
                          Text(K.gift_wall_select_4,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 11.dp,
                                  fontWeight: FontWeight.w400)),
                          ArrowWidget(
                              state: getArrowState(SelectionArgs.wealth)),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.dp),
                    InkWell(
                      onTap: () async {
                        _giftXController.updateSelectionOpt(
                            (_giftXController.opt == SelectionOpt.numDown)
                                ? SelectionOpt.numUp
                                : SelectionOpt.numDown);
                        String isAsc =
                            _giftXController.opt == SelectionOpt.numDown
                                ? "true"
                                : "false";

                        _giftXController.listSortType = 'num';
                        _giftXController.listIsasc = isAsc;
                        _giftXController.requestListData(
                            widget.targetUid,
                            _giftXController.rsp!.data.typ,
                            _giftXController
                                .rsp!.data.seriesList[_currentIndex].typ,
                            isShowLoading: false);
                      },
                      child: Row(
                        children: [
                          Text(K.gift_wall_select_5,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 11.dp,
                                  fontWeight: FontWeight.w400)),
                          ArrowWidget(state: getArrowState(SelectionArgs.num)),
                        ],
                      ),
                    ),
                  ],
                ],
              ))
        ],
      ),
    );
  }

  ArrowState getArrowState(SelectionArgs args) {
    ArrowState state = ArrowState.none;
    switch (args) {
      case SelectionArgs.star:
        state = _giftXController.opt == SelectionOpt.starDown
            ? ArrowState.down
            : (_giftXController.opt == SelectionOpt.starUp
                ? ArrowState.up
                : ArrowState.none);
        break;
      case SelectionArgs.wealth:
        state = _giftXController.opt == SelectionOpt.wealthDown
            ? ArrowState.down
            : (_giftXController.opt == SelectionOpt.wealthUp
                ? ArrowState.up
                : ArrowState.none);
        break;
      case SelectionArgs.num:
        state = _giftXController.opt == SelectionOpt.numDown
            ? ArrowState.down
            : (_giftXController.opt == SelectionOpt.numUp
                ? ArrowState.up
                : ArrowState.none);
        break;
    }
    return state;
  }

  Widget _buildSwiper() {
    int offsetIndex = widget.initIndex >= 0 &&
            widget.initIndex < _giftXController.rsp!.data.seriesList.length
        ? widget.initIndex
        : 0;
    return Swiper(
      itemCount: _giftXController.rsp!.data.seriesList.length,
      scrollDirection: Axis.horizontal,
      layout: SwiperLayout.CUSTOM,
      index: offsetIndex,
      itemWidth: 120.dp,
      itemHeight: 150.dp,
      controller: _controller,
      customLayoutOption:
          CustomLayoutOption(startIndex: -2 + offsetIndex, stateCount: 5)
              .addRotate([
        30.0 / 180,
        15 / 180,
        0.0,
        -15 / 180,
        -30.0 / 180
      ]).addTranslate([
        Offset(-190.dp, 0.dp),
        Offset(-100.dp, -6.dp),
        Offset(0.dp, 0.dp),
        Offset(100.dp, -6.dp),
        Offset(190.dp, 0.dp)
      ]).addScale([0.75, 0.75, 1.0, 0.75, 0.75], Alignment.center).addOpacity(
                  [0.4, 0.6, 1.0, 0.6, 0.4]),
      itemBuilder: _buildGiftSeries,
      autoplay: false,
      loop: true,
      onIndexChanged: (index) async {
        _currentIndex = (index + offsetIndex) %
            _giftXController.rsp!.data.seriesList.length;
        _giftXController.updateSelectionOpt(SelectionOpt.none);
        _giftXController.updateIndexChanged();

        _giftXController.listSortType = 'star';
        _giftXController.listIsasc = 'false';
        _giftXController.requestListData(
            widget.targetUid,
            _giftXController.rsp!.data.typ,
            _giftXController.rsp!.data.seriesList[_currentIndex].typ);
      },
      onTap: (index) {
        _showDescDialog(_giftXController.rsp!.data.seriesList[index].desc);
      },
    );
  }

  Widget _buildGiftSeries(BuildContext context, int index) {
    String iconWebp = _giftXController.rsp!.data.seriesList[index].iconWebp;
    String iconStatic = _giftXController.rsp!.data.seriesList[index].icon;
    String icon =
        Util.getRemoteImgUrl(index == _currentIndex ? iconWebp : iconStatic);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RepaintBoundary(
          child: CachedNetworkImage(
            key: ValueKey(icon),
            imageUrl: icon,
            width: 120.dp,
            height: 120.dp,
            fit: BoxFit.contain,
            placeholder: CachedNetworkImage(
                width: 120.dp, height: 120.dp, imageUrl: iconStatic),
          ),
        ),
        Text(
            index == _currentIndex
                ? "${_giftXController.rsp!.data.seriesList[index].lightNum}/${_giftXController.rsp!.data.seriesList[index].total}"
                : "",
            style: TextStyle(
                color: Colors.white,
                fontSize: 10.dp,
                fontWeight: FontWeight.w700,
                fontFamily: Util.numFontFamily,
                package: ComponentManager.MANAGER_BASE_CORE))
      ],
    );
  }

  /// 系列说明
  Future<void> _showDescDialog(String content) async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            content: Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsetsDirectional.only(
                  start: 24.dp, end: 24.dp, top: 15.dp, bottom: 15.dp),
              width: 300.dp,
              height: 100.dp,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        Assets.personaldata$gift_wall_task_desc_bg_webp),
                    fit: BoxFit.fitWidth),
              ),
              child: Text(content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.dp,
                      fontWeight: FontWeight.w500)),
            ),
          );
        });
  }

  ///切换送礼/收礼体系
  void onGiftTypeChanged() async {
    _giftXController.updateSelectState();
    _giftXController.updateSelectionOpt(SelectionOpt.none);
    if (_giftXController.rsp!.data.typ == "send") {
      await _loadData(loadType: "receive", refreshType: 1);
    } else if (_giftXController.rsp!.data.typ == "receive") {
      await _loadData(loadType: "send", refreshType: 1);
    }
  }
}
