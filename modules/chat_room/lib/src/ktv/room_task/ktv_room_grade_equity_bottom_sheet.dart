/// KTV房间等级权益弹框视图
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import 'model/generated/ktv.pb.dart';
import 'model/ktv_task_repo.dart';

class KtvRoomGradeEquityBottomSheet extends StatefulWidget {
  final ChatRoomData room;

  const KtvRoomGradeEquityBottomSheet({Key? key, required this.room})
      : super(key: key);

  /// 打开KTV房间等级权益弹框视图
  static Future<bool?> show(BuildContext context,
      {Key? key, required ChatRoomData room}) async {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      defineBarrierColor: Colors.black.withOpacity(0.4),
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return KtvRoomGradeEquityBottomSheet(key: key, room: room);
      },
    );
  }

  @override
  State<KtvRoomGradeEquityBottomSheet> createState() =>
      _KtvRoomGradeEquityBottomSheetState();
}

class _KtvRoomGradeEquityBottomSheetState
    extends State<KtvRoomGradeEquityBottomSheet>
    with SingleTickerProviderStateMixin<KtvRoomGradeEquityBottomSheet> {
  final List<String> _tabs = [];
  ExtendedTabController? _tabController;
  int _curTabIndex = 0;

  KtvRoomTaskBenefitInfo? _data;

  @override
  void initState() {
    super.initState();
    _loadData(initial: true);
  }

  void _loadData({bool initial = false}) {
    KtvTaskRepo.getKtvBenefit(widget.room.rid).then((resp) {
      if (resp.success && resp.hasData() && mounted) {
        setState(() {
          _data = resp.data;
          if (initial) {
            if (_tabs.isNotEmpty) {
              _tabs.clear();
            }
            if (_data != null && _data?.level.levels.isNotEmpty == true) {
              for (int i = 0; i < (_data?.level.levels.length ?? 0); i++) {
                KtvRoomTaskLevelItem? tab = _data?.level.levels[i];
                if (tab != null &&
                    tab.hasLevelName() &&
                    tab.levelName.isNotEmpty) {
                  _tabs.add(tab.levelName);
                }
              }
            }
          }
        });
        if (initial) {
          _initTabs();
        }
      }
    });
  }

  void _initTabs() {
    if (_tabController != null) return;
    if (_data == null ||
        _data?.level == null ||
        _data?.level.levels.isEmpty == true) return;
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex:
              _data!.level.level == 0 ? 0 : ((_data!.level.level) - 1),
          length: _data!.level.levels.length,
          vsync: this)
        ..addListener(_onTabChanged),
    );
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    super.dispose();
  }

  _onTabChanged() {
    if (_tabController?.indexIsChanging == true) return;
    setState(() {
      _curTabIndex = _tabController?.index ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [];
    if (_curTabIndex == 0) {
      colors = [
        const Color(0xFFD9965A),
        const Color(0xFFFFC38F),
        const Color(0xFFECECFF)
      ];
    } else if (_curTabIndex == 1) {
      colors = [
        const Color(0xFFE3BA21),
        const Color(0xFFF1C456).withOpacity(0.87),
        const Color(0xFFECECFF)
      ];
    } else if (_curTabIndex == 2) {
      colors = [
        const Color(0xFF4553FF),
        const Color(0xFF9572FF),
        const Color(0xFFECECFF)
      ];
    } else if (_curTabIndex == 3) {
      colors = [
        const Color(0xFF8C32E2),
        const Color(0xFFFB79E5),
        const Color(0xFFECECFF)
      ];
    } else if (_curTabIndex == 4) {
      colors = [
        const Color(0xFFFF6350),
        const Color(0xFFFFBD6C),
        const Color(0xFFECECFF)
      ];
    }
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
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            height: 328,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: colors,
                  // stops: [0, 0.55, 0.75],
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  'static/ktv/ktv_room_task_grade_equity_mask_bg.webp'),
            ),
          ),
          PositionedDirectional(
            top: 328,
            start: 0,
            end: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFECECFF), Color(0xFFF4F3FF)],
                ),
              ),
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
                    /// 返回箭
                    PositionedDirectional(
                      top: 10,
                      start: 12,
                      width: 24,
                      height: 24,
                      child: BackButton(
                        color: Colors.white,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),

                    /// 标题
                    Text(
                      K.room_ktv_room_grade_equity,
                      style: R.textStyle.title.copyWith(color: Colors.white),
                    ),

                    /// 规则说明
                    PositionedDirectional(
                      top: 10,
                      end: 12,
                      width: 24,
                      height: 24,
                      child: GestureDetector(
                        onTap: () {
                          String url = Util.getHelpUrlWithQStr('k117');
                          BaseWebviewScreen.show(context, url: url);
                        },
                        child: R.img(
                          'ic_info.svg',
                          color: Colors.white,
                          width: 24,
                          height: 24,
                          package: ComponentManager.MANAGER_BASE_ROOM,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    _buildTab(),
                    if (_tabController != null)
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            for (int i = 0; i < _tabs.length; i++)
                              _KtvRoomGradeEquityTabBarView(
                                  widget.room, _data, i)
                          ],
                        ),
                      )
                  ],
                ),
              ),

              /// 领取房间礼物
              if (_data != null &&
                  (_data?.receivedStatus == 2 ||
                      _data?.receivedStatus == 3)) ...[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () async {
                      if (_data?.receivedStatus == 3) return;
                      _loadReceiveBenefit();
                    },
                    child: Container(
                      width: Util.width - 40,
                      height: 52,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors
                              .map((e) => e.withOpacity(
                                  _data?.receivedStatus == 3 ? 0.5 : 1))
                              .toList(),
                        ),
                      ),
                      child: Text(
                        _getReceivedRoomGiftsButtonText(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(
                              _data?.receivedStatus == 3 ? 0.5 : 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom)
              ]
            ],
          )
        ],
      ),
    );
  }

  String _getReceivedRoomGiftsButtonText() {
    // 0 未知，1，不可领取，2，可领取未领取，3，可领取已领取
    if (_data?.receivedStatus == 2) {
      return K.room_ktv_get_room_gifts;
    } else if (_data?.receivedStatus == 3) {
      return K.room_ktv_received_room_gifts;
    } else {
      return K.room_ktv_cannot_receive_room_gifts;
    }
  }

  Widget _buildTab() {
    return _tabs.isNotEmpty && _tabs.length > 1
        ? Container(
            width: double.infinity,
            height: 48.0,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // margin: EdgeInsets.only(bottom: 2.0, top: 2.0),
            child: CommonTabBar(
              tabs: [
                for (int i = 0; i < _tabs.length; i++)
                  Tab(
                    child: Text(_tabs[i]),
                  )
              ],
              isScrollable: true,
              controller: _tabController,
              labelColor: Colors.white,
              labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
              unselectedLabelColor: Colors.white.withOpacity(0.8),
              unselectedLabelStyle:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15),
              indicator: const CommonUnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: Color(0xFF2EFEFD)),
                insets: EdgeInsetsDirectional.only(bottom: 0),
                wantWidth: 12,
                draggingWidth: 12.0,
              ),
              indicatorWeight: 0,
              marginStart: 8,
              marginEnd: 60,
              labelPadding:
                  const EdgeInsetsDirectional.only(start: 12, end: 12),
            ),
          )
        : const SizedBox.shrink();
  }

  /// 领取房间礼物
  void _loadReceiveBenefit() async {
    NormalNull resp = await KtvTaskRepo.postKtvReceiveBenefit(widget.room.rid);
    if (resp.success) {
      Tracker.instance.track(TrackEvent.click, properties: {
        'click_page': 'receive_room_gifts',
      });
      _loadData();
      Fluttertoast.showCenter(msg: K.room_get_success);
    } else {
      Fluttertoast.showCenter(
          msg: (resp.hasMsg() && resp.msg.isNotEmpty)
              ? resp.msg
              : K.room_lucky_bag_get_fail);
    }
  }
}

class _KtvRoomGradeEquityTabBarView extends StatefulWidget {
  final ChatRoomData room;
  final KtvRoomTaskBenefitInfo? data;
  final int index;

  const _KtvRoomGradeEquityTabBarView(this.room, this.data, this.index,
      {Key? key})
      : super(key: key);

  @override
  State<_KtvRoomGradeEquityTabBarView> createState() =>
      _KtvRoomGradeEquityTabBarViewState();
}

class _KtvRoomGradeEquityTabBarViewState
    extends State<_KtvRoomGradeEquityTabBarView>
    with AutomaticKeepAliveClientMixin {
  // int lines = 0;
  KtvRoomTaskLevelItem? levelItem;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // lines = (6 / 3).ceil();
    if (widget.data != null) {
      if (widget.data?.hasLevel() == true &&
          widget.data?.level.levels.isNotEmpty == true) {
        levelItem = widget.data?.level.levels[widget.index];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.data == null) return const SizedBox.shrink();

    int roomLevel = widget.index;
    Color indicatorColor = Colors.white;
    if (roomLevel == 0) {
      indicatorColor = const Color(0xFFAE7543);
    } else if (roomLevel == 1) {
      indicatorColor = const Color(0xFFC29220);
    } else if (roomLevel == 2) {
      indicatorColor = const Color(0xFFFF82FF);
    } else if (roomLevel == 3) {
      indicatorColor = const Color(0xFFFFF056);
    } else if (roomLevel == 4) {
      indicatorColor = const Color(0xFFFFF056);
    }

    // 距%1等级还差%2
    String levelName = '';
    KtvRoomTaskLevelItem? currentLevel;
    if (widget.data?.level != null &&
        widget.data?.level.levels.isNotEmpty == true) {
      currentLevel = widget.data?.level.levels[roomLevel];
      if (currentLevel != null) {
        if (int.parse('${widget.data?.level.current ?? 0}') >=
            int.parse('${currentLevel.next}')) {
          levelName =
              K.room_ktv_task_reached_what_level([currentLevel.levelName]);
        } else {
          levelName = K.room_ktv_task_distance_what_grade_diff_numbers([
            currentLevel.levelName,
            '${currentLevel.next - (widget.data?.level.current ?? 0)}',
          ]);
        }
      }
    }

    // 计算进度条比例
    double percent = Util.parseDouble('${widget.data?.level.current}') /
        Util.parseDouble('${currentLevel?.next}');
    if (percent < 0 || percent > 1) {
      percent = 1;
    }
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              /// 权益等级图标
              SizedBox(
                width: Util.width,
                height: 132,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: Util.parseIcon(levelItem?.url ?? ''),
                    width: 96,
                    height: 96,
                    cachedWidth: 96,
                    cachedHeight: 96,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),

              /// 权益等级卡片
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.room.createor?.name ?? '',
                              style: TextStyle(
                                  color: R.color.mainTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            levelName,
                            style: TextStyle(
                                color: R.color.mainTextColor.withOpacity(0.4),
                                fontSize: 13),
                          ),
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
                          const SizedBox(width: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${widget.data?.level.current ?? 0}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: R.color.mainTextColor,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '/',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: R.color.mainTextColor.withOpacity(0.4),
                                ),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '${currentLevel?.next ?? 0}',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: R.color.mainTextColor.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              /// 拥有特权
              _buildHasPrivilegeWidget(),
            ],
          ),
        ),
      ],
    );
  }

  /// 拥有特权
  Widget _buildHasPrivilegeWidget() {
    if (widget.data?.benefits != null &&
        widget.data?.benefits.isNotEmpty == true) {
      KtvRoomTaskLevelBenefit? benefits =
          widget.data?.benefits[widget.index + 1];
      if (benefits != null && benefits.benefit.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 61,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        K.room_ktv_room_task_have_privilege,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 72,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: LinearGradient(
                              colors: R.color.mainBrandGradientColors,
                            ),
                          ),
                          child: Text(
                            K.room_do_ktv_task,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: Util.width - 40,
                  height: 110.0 * (benefits.benefit.length / 3).ceil(),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: benefits.benefit.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 3, //横轴三个子widget
                      mainAxisExtent: 100,
                    ),
                    itemBuilder: (context, index) {
                      return _buildItemWidget(context, index, benefits);
                    },
                  ),
                ),
                const SizedBox(height: 7)
              ],
            ),
          ),
        );
      }
    }
    return const SizedBox.shrink();
  }

  Widget _buildItemWidget(
      BuildContext context, int index, KtvRoomTaskLevelBenefit benefits) {
    KtvRoomTaskBenefitItem benefit = benefits.benefit[index];
    return InkWell(
      onTap: () {},
      child: Container(
        width: 92,
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xFF313131).withOpacity(0.04),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            const SizedBox(height: 8),
            SizedBox(
              width: 60,
              height: 54,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(benefit.url),
                    width: 60,
                    height: 54,
                    fit: BoxFit.fitWidth,
                  ),
                  if (benefit.num > 0)
                    PositionedDirectional(
                      top: 3,
                      end: 1,
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxHeight: 14, minWidth: 22),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          height: 14,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.topCenter,
                              end: AlignmentDirectional.bottomCenter,
                              colors: [
                                const Color(0xFFFFAE11).withOpacity(0.8),
                                const Color(0xFFFD7607).withOpacity(0.8)
                              ],
                            ),
                          ),
                          child: Text(
                            benefit.num.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Text(
                benefit.desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.6),
                    fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
