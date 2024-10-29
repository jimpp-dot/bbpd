import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart' hide SliverAppBar;
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/a.dart';
import 'package:profile/assets.dart';
import 'package:profile/k.dart';
import 'package:profile/src/model/gs_task_bean.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

class GsTaskScreen extends StatefulWidget {
  final GsTaskType taskType;
  final int rid;

  const GsTaskScreen(
      {super.key, this.taskType = GsTaskType.receptionTask, this.rid = 0});

  static Future show(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const GsTaskScreen();
    }));
  }

  @override
  _GsTaskScreenState createState() => _GsTaskScreenState();
}

class _GsTaskScreenState extends State<GsTaskScreen>
    with TickerProviderStateMixin {
  GsTaskRsp? _rsp;
  GsTaskInfo? _gsTaskInfo;
  int? _selectedLevel;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  _load() {
    GsTaskRepo.getGsTaskInfo(widget.taskType, widget.rid).then((value) {
      _rsp = value;
      if (_rsp!.success == true) {
        _gsTaskInfo = _rsp!.data;
        _selectedLevel = _gsTaskInfo?.curLevel;
      }
      if (mounted) setState(() {});
    });
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        const SizedBox(width: 20),
        CommonAvatar(
          path: _gsTaskInfo!.icon,
          shape: BoxShape.circle,
          size: 56,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: Util.width - 120),
              child: Text(
                _gsTaskInfo!.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              _gsTaskInfo!.note,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Widget _buildTab(TabController tabController) {
    List<String> tabList = [
      K.profile_week_achievement,
      K.profile_challenge_reward
    ];

    return SizedBox(
      height: 38,
      child: CommonTabBar(
        controller: tabController,
        labelColor: Colors.white,
        indicator: const CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.white),
            wantWidth: 36,
            draggingWidth: 42.0),
        unselectedLabelColor: const Color(0xB3FFFFFF),
        tabs: tabList.map((_) => Text(_)).toList(),
      ),
    );
  }

  String get taskLevelStr {
    int index = min(_selectedLevel! - 1, A.gs_task_level.length - 1);
    index = max(index, 0);
    return '${A.gs_task_level[index]}${K.profile_challenge}';
  }

  Widget _buildTaskPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GsTaskStepWidget(
          taskType: widget.taskType,
          taskInfo: _gsTaskInfo!,
          onStepClick: (level) {
            if (level <= _gsTaskInfo!.curLevel) {
              setState(() {
                _selectedLevel = level;
              });
            }
          },
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
          child: Text(
            taskLevelStr,
            style: TextStyle(fontSize: 17, color: R.color.mainTextColor),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        if (_gsTaskInfo?.tasks?['$_selectedLevel']?.isNotEmpty ?? false)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _gsTaskInfo!.tasks!['$_selectedLevel']!
                    .map((_) => GsTaskItemWidget(
                          item: _,
                        ))
                    .toList(),
              ),
            ),
          ),
        if (Util.isIphoneX)
          SizedBox(
            height: Util.iphoneXBottom,
          ),
      ],
    );
  }

  Widget _buildRewardPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 2,
                  color: Color(0x0A000000))
            ],
          ),
          padding: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GsRewardItemWidget(
                item: _gsTaskInfo!.rewards[index],
                index: index,
              ),
              itemCount: _gsTaskInfo?.rewards.length ?? 0,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
            padding: const EdgeInsetsDirectional.only(start: 18, end: 18),
            child: Text(
              K.profile_reward_desc,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w600),
            )),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 18, end: 18),
            child: ListView.separated(
                padding: const EdgeInsets.all(0.0),
                itemBuilder: (context, index) => Text(
                      _gsTaskInfo!.rewardDesc[index],
                      style: TextStyle(
                          fontSize: 14, color: R.color.secondTextColor),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: _gsTaskInfo?.rewardDesc.length ?? 0),
          ),
        ),
        if (Util.isIphoneX)
          SizedBox(
            height: Util.iphoneXBottom,
          ),
      ],
    );
  }

  Widget _buildBody() {
    if (_rsp == null) {
      return const Expanded(
        child: CupertinoActivityIndicator(),
      );
    }

    if (_rsp!.success != true) {
      return Expanded(
        child: EmptyWidget(
          desc: _rsp!.msg ?? BaseK.K.no_data,
          onTap: _load,
        ),
      );
    }

    List<Widget> widgets = [_buildTaskPage(), _buildRewardPage()];

    return Expanded(
      child: Column(
        children: [
          _buildUserInfo(),
          const SizedBox(
            height: 16,
          ),
          _buildTab(_tabController),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widgets,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          R.img('bg_gs_task_header.webp',
              height: 296,
              width: Util.width,
              package: ComponentManager.MANAGER_PROFILE,
              fit: BoxFit.fill),
          Column(
            children: [
              AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: R.img(
                    'ic_titlebar_back.svg',
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  K.profile_reception_task,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: R.textStyle.title.copyWith(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: _gsTaskInfo == null
                        ? null
                        : () => BaseWebviewScreen.show(context,
                            url: _gsTaskInfo!.descUrl),
                    icon: R.img(
                      'ic_companion_help.svg',
                      package: ComponentManager.MANAGER_PROFILE,
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              _buildBody(),
            ],
          ),
        ],
      ),
    );
  }
}

class GsTaskStepWidget extends StatelessWidget {
  final GsTaskInfo taskInfo;
  final GsTaskType taskType;
  final ValueChanged<int> onStepClick;

  const GsTaskStepWidget(
      {super.key,
      required this.taskInfo,
      required this.taskType,
      required this.onStepClick});

  String get timeLeftStr {
    DateTime endTime =
        DateTime.fromMillisecondsSinceEpoch(taskInfo.endTime * 1000);
    Duration dur = endTime.difference(DateTime.now());
    if (dur.isNegative) return '';

    return '${K.profile_remain}${dur.inDays}${BaseK.K.base_day}${[
      dur.inHours.remainder(24),
      dur.inMinutes.remainder(60),
      dur.inSeconds.remainder(60)
    ].map((seg) {
      return seg.toString().padLeft(2, '0');
    }).join(':')}';
  }

  Widget _buildStepItem(int level) {
    Color color = level > taskInfo.curLevel
        ? const Color(0xFFF6F7F9)
        : const Color(0xFFFFCA38);
    String iconPath = Assets.profile$gs_task_level_doing_webp;
    if (level > taskInfo.curLevel) {
      iconPath = Assets.profile$gs_task_level_future_webp;
    } else if (level < taskInfo.curLevel) {
      iconPath = Assets.profile$gs_task_level_done_webp;
    }

    return GestureDetector(
      onTap: () => onStepClick(level),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (level == 1)
            const SizedBox(
              width: 12,
            ),
          if (level > 1)
            Container(
              height: 2,
              width: 24,
              color: color,
              margin: const EdgeInsetsDirectional.only(top: 23),
            ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(iconPath, width: 48, height: 48),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Lv.$level',
                style: TextStyle(
                  color: level > taskInfo.curLevel
                      ? R.color.thirdTextColor
                      : R.color.secondTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 2,
              color: Color(0x0A000000))
        ],
      ),
      padding: const EdgeInsetsDirectional.only(top: 14, bottom: 16),
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 14,
              ),
              Text(
                K.profile_week_achievement_title,
                style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              TimerWidget(
                stop:
                    DateTime.fromMillisecondsSinceEpoch(taskInfo.endTime * 1000)
                        .difference(DateTime.now()),
                builder: (context) {
                  return Text(
                    timeLeftStr,
                    style: TextStyle(
                      fontSize: 11,
                      color: R.color.secondTextColor,
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 14,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 74,
            child: ListView.builder(
              controller: ScrollController(
                  initialScrollOffset: max(0, taskInfo.curLevel - 3) * 68.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _buildStepItem(index + 1),
              itemCount: taskInfo.levelNum,
            ),
          ),
        ],
      ),
    );
  }
}

class GsTaskItemWidget extends StatelessWidget {
  final GsTaskItem item;

  const GsTaskItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      alignment: AlignmentDirectional.center,
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 48,
            height: 48,
            imageUrl: '${System.imageDomain}${item.icon}',
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      item.title,
                      style:
                          TextStyle(color: R.color.mainTextColor, fontSize: 16),
                    ),
                    const Spacer(),
                    Text('${item.curProgress}/${item.totalProgress}',
                        style: TextStyle(
                            color: R.color.secondTextColor, fontSize: 13))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                  child: LinearProgressIndicator(
                    value: min(1.0, item.curProgress / item.totalProgress),
                    minHeight: 4,
                    backgroundColor: R.color.secondBgColor,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(R.color.mainBrandColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GsRewardItemWidget extends StatelessWidget {
  final int index;
  final GsRewardItem item;

  const GsRewardItemWidget(
      {super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF6F7F9), width: 1),
      ),
      margin: EdgeInsetsDirectional.only(start: index == 0 ? 14 : 12),
      alignment: AlignmentDirectional.center,
      child: CachedNetworkImage(
        width: 66,
        height: 66,
        imageUrl: '${System.imageDomain}${item.icon}',
      ),
    );
  }
}

// 好友激活
class FriendActivityPage extends StatefulWidget {
  const FriendActivityPage({super.key});

  @override
  _FriendActivityPageState createState() => _FriendActivityPageState();
}

class _FriendActivityPageState extends State<FriendActivityPage>
    with AutomaticKeepAliveClientMixin {
  GlobalKey pageKey = GlobalKey();
  late GsTaskFriendActivitRepository _source;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _source = GsTaskFriendActivitRepository(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      padding: EdgeInsetsDirectional.only(top: 12, bottom: Util.iphoneXBottom),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
        ),
      ),
      child: RefreshIndicatorFactory.of(
        onRefresh: () async {
          _source.refresh();
        },
        child: NestedScrollViewInnerScrollPositionKeyWidget(
          pageKey,
          LoadingMoreList(
            ListConfig<GsTaskFriendActivitItem>(
              itemBuilder: (BuildContext context, GsTaskFriendActivitItem item,
                  int index) {
                return _gsTaskFriendActivityItemWidget(
                    item: item, index: index);
              },
              sourceList: _source,
              indicatorBuilder: _indicatorBuilder,
            ),
          ),
        ),
      ),
    );
  }

  Widget _gsTaskFriendActivityItemWidget(
      {required GsTaskFriendActivitItem item, required int index}) {
    return Container(
      height: 84,
      padding: const EdgeInsetsDirectional.only(
          start: 20, top: 10, bottom: 10, end: 10),
      child: Row(
        children: [
          CommonAvatar(
            path: System.imageDomain + item.icon,
            shape: BoxShape.circle,
            size: 64,
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, item.uid,
                  refer: const PageRefer('GsTaskScreen'));
            },
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: Util.width - 220),
                child: Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: R.color.mainTextColor),
                ),
              ),
              IDWidget(
                uid: item.uid,
                fontSize: 13.0,
                fontColor: R.color.thirdTextColor,
                fontWeight: FontWeight.w600,
              ),
              Text(
                item.award.isNotEmpty
                    ? '${K.profile_friend_prize}${item.award}'
                    : K.profile_friend_prize_not_yet,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: R.color.thirdTextColor),
              ),
            ],
          ),
          const Spacer(),
          _buildStatusWidget(item),
        ],
      ),
    );
  }

  Widget _buildStatusWidget(GsTaskFriendActivitItem item) {
    if (item.status < 1 || item.status > 6) {
      return Container();
    }

    List<String> statusStrs = [
      K.profile_friend_need_remind,
      K.profile_friend_need_activit,
      K.profile_friend_activited,
      K.profile_friend_robbed,
      K.profile_friend_invalid,
      K.profile_friend_completed
    ];
    List<Color> textColors = [
      R.color.mainBrandColor,
      R.color.unionRankText2,
      R.color.unionRankText2.withOpacity(0.5),
      R.color.thirdTextColor,
      R.color.thirdTextColor,
      R.color.mainBrandColor.withOpacity(0.4)
    ];

    if (item.deadline > 0 &&
        (item.status == 1 || item.status == 2 || item.status == 3)) {
      return Column(children: [
        const SizedBox(
          height: 5,
        ),
        Text(statusStrs[item.status - 1],
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: textColors[item.status - 1])),
        const SizedBox(
          height: 5,
        ),
        Text(K.profile_friend_prize_countdown,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: R.color.thirdTextColor)),
        PrizeCountDownWidget(
            needUpdate: true,
            timeIntervals: item.deadline,
            refreshCallBack: () {
              _source.refresh();
            }),
      ]);
    }

    return Text(statusStrs[item.status - 1],
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: textColors[item.status - 1]));
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class PrizeCountDownWidget extends StatefulWidget {
  final int timeIntervals;
  final VoidCallback? refreshCallBack;
  bool needUpdate;

  PrizeCountDownWidget(
      {super.key,
      this.timeIntervals = 0,
      this.refreshCallBack,
      this.needUpdate = false});

  @override
  _PrizeCountDownWidgetState createState() => _PrizeCountDownWidgetState();
}

class _PrizeCountDownWidgetState extends State<PrizeCountDownWidget> {
  Timer? _countDownTimer;
  int _timeInterval = 0;

  @override
  void initState() {
    super.initState();

    _timeInterval = widget.timeIntervals;
    widget.needUpdate = false;
    _startTimer();
  }

  void _startTimer() {
    _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeInterval > 0) {
        if (mounted) {
          setState(() {
            _timeInterval--;
          });
        }
      } else {
        _countDownTimer?.cancel();
        _countDownTimer = null;

        if (widget.refreshCallBack != null) {
          widget.refreshCallBack!();
        }
      }
    });
  }

  @override
  void dispose() {
    _countDownTimer?.cancel();
    _countDownTimer = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.needUpdate == true && widget.timeIntervals > 0) {
      _timeInterval = widget.timeIntervals;
      widget.needUpdate = false;

      if (_countDownTimer == null) {
        _startTimer();
      }
    }

    if (_timeInterval < 0) {
      return Container();
    }

    int leftSec = 0;

    int day = (_timeInterval / (24 * 3600)).floor();
    day = day > 7 ? 7 : day;
    leftSec = _timeInterval % (24 * 3600);

    int hour = (leftSec / 3600).floor();
    leftSec = leftSec % 3600;

    int min = (leftSec / 60).floor();
    int sec = leftSec % 60;

    String timeStr = '';

    if (day > 0) {
      timeStr += '$day ${K.profile_friend_left_day} ';
    }

    if (hour < 10) {
      timeStr += '0$hour : ';
    } else {
      timeStr += '$hour : ';
    }

    if (min < 10) {
      timeStr += '0$min : ';
    } else {
      timeStr += '$min : ';
    }

    if (sec < 10) {
      timeStr += '0$sec';
    } else {
      timeStr += '$sec';
    }

    return Container(
      alignment: AlignmentDirectional.center,
      width: 80,
      child: Text(timeStr,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: R.color.thirdTextColor)),
    );
  }
}
