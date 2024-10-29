import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/fans/fans_rule_dialog.dart';
import 'package:chat_room/src/fans/model/fans_group_beans.dart';
import 'package:chat_room/src/fans/repo/fans_group_repository.dart';
import 'package:chat_room/src/protobuf/generated/api_room_challenge.pb.dart';
import 'package:flutter/material.dart';

import '../../a.dart';

/// 十星挑战
class FiveStartChallengeScreen extends StatefulWidget {
  final ChatRoomData roomData;

  const FiveStartChallengeScreen({Key? key, required this.roomData})
      : super(key: key);

  @override
  State<FiveStartChallengeScreen> createState() => _FiveStartChallengeState();

  static show(BuildContext context, {required ChatRoomData roomData}) {
    displayModalBottomSheet(
      context: context,
      isBarrierDismissible: true,
      maxHeightRatio: 1.0,
      disableTapDismissible: true,
      defineBarrierColor: const Color(0xB3000000),
      settings: const RouteSettings(name: '/FiveStartChallengeScreen'),
      builder: (BuildContext context) {
        return FiveStartChallengeScreen(roomData: roomData);
      },
    );
  }
}

class _FiveStartChallengeState extends BaseScreenState<FiveStartChallengeScreen>
    with TickerProviderStateMixin {
  final double _itemWidth = 128.dp;
  int _selectedStarIndex = 0;

  ChallengeData? _challengeData;
  ScrollController? _scrollController;

  double _progressWidth = 0.0;

  @override
  void initState() {
    super.initState();
    _progressWidth = Util.width - 16.dp * 2 - 72.dp - 14.dp;
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  void _loadData() async {
    ResChallengeData fansGroupResp =
        await FansGroupRepo.getStarChallengeData(widget.roomData.rid);
    if (fansGroupResp.success && fansGroupResp.hasData()) {
      _challengeData = fansGroupResp.data;
      _calculateInitSelectedStarIndex();
      setScreenReady();
    } else {
      setScreenError(errorMsg: fansGroupResp.msg);
    }
    if (mounted) {
      setState(() {});
    }
  }

  /// 要默认选中第一个未完成的
  void _calculateInitSelectedStarIndex() {
    if (Util.isCollectionEmpty(_challengeData?.taskData)) {
      return;
    }
    for (int i = 0; i < _challengeData!.taskData.length; i++) {
      ChallengeDataTaskData taskInfo = _challengeData!.taskData[i];
      if (taskInfo.status == TaskInfo.STATUS_NON) {
        _selectedStarIndex = i;
        break;
      }
      if (i == _challengeData!.taskData.length - 1) {
        _selectedStarIndex = _challengeData!.taskData.length - 1;
      }
    }
    _scrollController = ScrollController(initialScrollOffset: _scrollOffset());
  }

  // 手动滑动之后回弹
  bool _bounceBackScroll = false;
  bool _bounceScrolling = false;

  /// 滑动结束监听, 回弹到离得最近的index
  void _onScrollEndListener() {
    // Log.d('FiveStartChallengeScreen0 _bounceBackScroll=$_bounceBackScroll _bounceScrolling=$_bounceScrolling');

    if (!mounted) return;
    if (!_scrollController!.hasClients ||
        !_scrollController!.position.hasPixels ||
        !_scrollController!.position.hasContentDimensions ||
        _bounceBackScroll ||
        _bounceScrolling) {
      _bounceBackScroll = false;
      return;
    }
    double offset = _scrollController!.offset;
    double tempIndex = offset / _itemWidth;
    if (offset > _itemWidth) {
      tempIndex += 0.7;
    } else {
      tempIndex += 0.2;
    }
    int index = tempIndex.round().clamp(0, _challengeData!.taskData.length - 1);
    double scrollOffset = 0;
    int scrollIndex = index;
    _selectedStarIndex = scrollIndex;
    if (_selectedStarIndex == 2) {
      scrollOffset = _itemWidth;
    } else if (_selectedStarIndex == _challengeData!.taskData.length - 1) {
      scrollOffset = (_selectedStarIndex - 2) * _itemWidth;
    } else if (_selectedStarIndex > 2) {
      scrollOffset = (_selectedStarIndex - 1) * _itemWidth;
    }
    setState(() {});
    if (scrollOffset != _scrollController!.offset) {
      _bounceBackScroll = true;
      _scrollController
          ?.animateTo(scrollOffset,
              duration: const Duration(milliseconds: 300), curve: Curves.linear)
          .whenComplete(() {
        _bounceBackScroll = false;
      });
    }
  }

  /// 星级列表滑动距离
  double _scrollOffset() {
    if (_selectedStarIndex <= 1) {
      return 0;
    } else if (_selectedStarIndex == _challengeData!.taskData.length - 1) {
      return (_selectedStarIndex - 2) * _itemWidth;
    }
    return (_selectedStarIndex - 1) * _itemWidth;
  }

  /// 标题
  String _getTitle() {
    if (_challengeData != null && _challengeData!.taskData.isNotEmpty) {
      return K.room_how_star_challenge(
          [R.array("number_words")[_selectedStarIndex]]);
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: 635.dp,
      child: Stack(
        children: [
          _renderBg(),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 37.dp),
              _buildTitleBar(),
              Expanded(child: (buildStatusContent())),
            ],
          ),
        ],
      ),
    );
  }

  @override
  onTapErrorWidget() {
    _loadData();
  }

  @override
  Widget buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 6.dp),
        _buildAvatarArea(),
        SizedBox(height: 12.dp),
        Expanded(
          child: _buildTabBarView(),
        ),
      ],
    );
  }

  Widget _renderBg() {
    return R.img(RoomAssets.chat_room$fans_bg_star_chanllege_webp,
        width: Util.width, fit: BoxFit.fitWidth);
  }

  Widget _buildTitleBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).pop(true);
          },
          child: Container(
            width: 44.dp,
            height: 44.dp,
            margin: EdgeInsetsDirectional.only(start: 6.dp),
            alignment: Alignment.center,
            child: R.img(
              RoomAssets.chat_room$fans_ic_back_webp,
              width: 24.dp,
              height: 24.dp,
              color: Colors.white,
            ),
          ),
        ),
        GradientText(
          _getTitle(),
          gradient: const LinearGradient(colors: [
            Color(0xFFFDDFE0),
            Color(0xFFF3F2F8),
            Color(0xFFF0CBFE)
          ]),
          style: Util.youSheBiaoTiYuan.copyWith(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 50.dp),
      ],
    );
  }

  Widget _buildAvatarArea() {
    String countStr = '';
    int num = _challengeData!.userInfo.starsCount - 1;
    if (num >= 0 && num < A.number_words.length) {
      countStr = A.number_words[num];
    } else {
      countStr = '${_challengeData!.userInfo.starsCount}';
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 56.dp,
            height: 56.dp,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.dp),
                shape: BoxShape.circle),
            child: CommonAvatar(
                path: _challengeData!.userInfo.icon,
                size: 52.dp,
                shape: BoxShape.circle),
          ),
          SizedBox(width: 10.dp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.roomData.isBusinessRadio
                      ? _challengeData!.userInfo.name
                      : K.room_fans_group_info([
                          _challengeData!.userInfo.name,
                          '${_challengeData!.userInfo.fansNum}'
                        ]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16.dp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4.dp),
                Text(
                  K.room_fans_get_star_count([countStr]),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 12.dp),
                )
              ],
            ),
          ),
          Container(
            height: 48.dp,
            padding: EdgeInsets.all(4.dp),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: Colors.white.withOpacity(0.2),
            ),
            child: Container(
              height: 40.dp,
              padding: EdgeInsetsDirectional.only(start: 8.5.dp, end: 8.5.dp),
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(colors: [
                  Color(0xFFFDDFE0),
                  Color(0xFFF3F2F8),
                  Color(0xFFF0CBFE)
                ]),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(RoomAssets.chat_room$fans_ic_group_fire_webp,
                        width: 16.dp,
                        height: 19.dp,
                        package: ComponentManager.MANAGER_BASE_ROOM),
                    SizedBox(width: 4.dp),
                    NumText(
                      '+${_challengeData!.userInfo.popularity}',
                      style: TextStyle(
                        fontSize: 24.dp,
                        color: const Color(0xE6000000),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 16.dp, end: 16.dp, bottom: Util.bottomMargin),
        child: Column(
          children: [
            _buildStars(),
            SizedBox(height: 16.dp),
            _buildTaskList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStars() {
    double arrowStart;
    if (_selectedStarIndex == 0) {
      arrowStart = 25.dp;
    } else if (_selectedStarIndex + 1 == _challengeData?.taskData.length) {
      arrowStart = 281.dp;
    } else {
      arrowStart = 153.dp;
    }
    ChallengeDataTaskData taskInfo =
        _challengeData!.taskData[_selectedStarIndex];
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 110.dp,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.dp),
        borderRadius: BorderRadius.circular(16.dp),
        color: const Color(0xFFF5EBFA),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 110.dp,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF3DBFF),
                      Color(0xFFFFFEFF),
                      Color(0xFFFDF9FE)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.dp)),
                ),
                padding: EdgeInsetsDirectional.only(top: 20.dp, bottom: 20.dp),
                child: Listener(
                  onPointerDown: (event) {
                    _bounceScrolling = true;
                  },
                  onPointerUp: (event) {
                    if (!_bounceScrolling || _bounceBackScroll) {
                      _bounceScrolling = false;
                      _bounceBackScroll = false;
                      return;
                    }
                    _bounceScrolling = false;
                    Future.delayed(const Duration(milliseconds: 200), () {
                      _onScrollEndListener();
                    });
                  },
                  child: ListView.builder(
                    padding: EdgeInsetsDirectional.only(
                        start: 13.dp, end: 13.dp + _itemWidth),
                    controller: _scrollController,
                    itemBuilder: _buildStarItem,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _challengeData?.taskData.length ?? 0,
                  ),
                ),
              ),
              AnimatedPositionedDirectional(
                start: arrowStart,
                bottom: 0,
                width: 24.dp,
                height: 12.dp,
                duration: const Duration(milliseconds: 300),
                child: R.img(RoomAssets.chat_room$fans_ic_arrow_up_webp,
                    width: 24.dp, height: 12.dp),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 20.dp,
            ),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(16.dp)),
            ),
            padding: EdgeInsetsDirectional.only(top: 10.dp, bottom: 12.dp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 14.dp),
                  child: Text(
                    K.room_current_reward,
                    style: TextStyle(
                        color: const Color(0xE6000000),
                        fontSize: 16.dp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 10.dp),
                Wrap(
                  runSpacing: 4.dp,
                  children: taskInfo.rewardShow
                      .map((e) => _renderRewardItem(e))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 奖励item
  Widget _renderRewardItem(ChallengeDataRewardItem item) {
    double width = (Util.width - 18.dp * 2) / 2;
    return Container(
      width: width,
      height: 60.dp,
      padding: EdgeInsetsDirectional.only(start: 14.dp),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(children: [
            CachedNetworkImage(
                imageUrl: item.icon, width: 48.dp, height: 48.dp),
            if (item.smallIconDesc.isNotEmpty)
              PositionedDirectional(
                  end: 0,
                  top: 0,
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: 18.dp,
                      minHeight: 12.dp,
                      maxHeight: 12.dp,
                    ),
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsetsDirectional.only(start: 3.dp, end: 3.dp),
                    decoration: const ShapeDecoration(
                        shape: StadiumBorder(), color: Color(0xFFFF5B3C)),
                    child: Text(
                      item.smallIconDesc,
                      style: TextStyle(
                          height: 1.1,
                          color: const Color(0xE6FFFFFF),
                          fontSize: 8.dp,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
          ]),
          SizedBox(width: 10.dp),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: const Color(0xE6000000),
                      fontSize: 14.dp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 1.dp),
                Text(
                  item.desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: const Color(0x80000000), fontSize: 11.dp),
                ),
                SizedBox(
                  height: 14.5.dp,
                  child: item.remark.isNotEmpty
                      ? Text(
                          item.remark,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: const Color(0x4D000000), fontSize: 8.dp),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarItem(BuildContext context, int index) {
    bool isActive = index == _selectedStarIndex;

    ChallengeDataTaskData taskInfo = _challengeData!.taskData[index];

    bool isComplete = taskInfo.status == TaskInfo.STATUS_COMPLETE;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _bounceBackScroll = true;
            if (!isActive) {
              _selectedStarIndex = index;
              int currentTime = DateTime.now().millisecondsSinceEpoch;
              _scrollController
                  ?.animateTo(_scrollOffset(),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear)
                  .then((value) {
                if (DateTime.now().millisecondsSinceEpoch - currentTime >=
                    300) {
                  _bounceBackScroll = false;
                }
              });
            }
            setState(() {});
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              R.img(
                isComplete
                    ? RoomAssets.chat_room$fans_ic_chanllege_unlock_webp
                    : RoomAssets.chat_room$fans_ic_chanllege_lock_webp,
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 48.dp,
                height: 48.dp,
              ),
              Container(
                height: 22.dp,
                width: 48.dp,
                alignment: AlignmentDirectional.bottomCenter,
                child: isActive
                    ? GradientText(
                        K.room_fans_star_index(
                            [R.array("number_words")[index]]),
                        gradient: const LinearGradient(
                            colors: [Color(0xFF9A0099), Color(0xFF730081)]),
                        style: TextStyle(
                            fontSize: 16.dp, fontWeight: FontWeight.w600),
                      )
                    : Text(
                        K.room_fans_star_index(
                            [R.array("number_words")[index]]),
                        style: TextStyle(
                            color: const Color(0xFFBC6DD5),
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w600),
                      ),
              ),
            ],
          ),
        ),
        index < _challengeData!.taskData.length - 1
            ? Container(
                width: 72.dp,
                height: 5.dp,
                margin: EdgeInsetsDirectional.only(
                    start: 4.dp, top: 21.dp, end: 4.dp),
                child: Stack(
                  children: [
                    Container(
                      decoration: const ShapeDecoration(
                          shape: StadiumBorder(), color: Color(0xFFF3E6FA)),
                    ),
                    Container(
                      width: (taskInfo.percent / 100) * 72.dp,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: LinearGradient(colors: [
                          Color(0xFFFED270),
                          Color(0xFFFF5C5E),
                          Color(0xFFFF5CCE)
                        ]),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(width: 14.dp),
      ],
    );
  }

  Widget _buildTaskList() {
    int index = _selectedStarIndex;
    ChallengeDataTaskData taskInfo = _challengeData!.taskData[index];

    bool isComplete = taskInfo.status == TaskInfo.STATUS_COMPLETE;
    String rewardText = isComplete
        ? K.room_fans_task_reward([taskInfo.awardPopularity.toString()])
        : K.room_fans_task_reward_can([taskInfo.awardPopularity.toString()]);

    return Container(
      padding: EdgeInsetsDirectional.only(
          top: 17.dp, start: 14.dp, end: 14.dp, bottom: 12.dp),
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 110.dp,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.dp),
        borderRadius: BorderRadius.circular(16.dp),
        gradient: const LinearGradient(
          colors: [Color(0xFFF3DBFF), Color(0xFFFFFEFF), Color(0xFFFDF9FE)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                K.room_fans_task_title([R.array("number_words")[index]]),
                style: TextStyle(
                    color: const Color(0xE6000000),
                    fontSize: 16.dp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 4.dp),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (_challengeData?.helpTxt.isNotEmpty == true) {
                    FansRuleDialog.show(context, _challengeData!.helpTxt);
                  }
                },
                child: R.img(RoomAssets.chat_room$room_fans_question_sign_png,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: 16.dp,
                    height: 16.dp),
              ),
              const Spacer(),
              R.img(RoomAssets.chat_room$fans_ic_group_fire_webp,
                  height: 12.dp, fit: BoxFit.fitHeight),
              SizedBox(width: 4.dp),
              Text(rewardText,
                  style: TextStyle(
                      color: const Color(0x80000000), fontSize: 12.dp)),
            ],
          ),
          SizedBox(height: 8.dp),
          if (taskInfo.taskList.isNotEmpty)
            ...taskInfo.taskList.mapIndexed(
                (i, e) => _buildTaskItem(context, taskInfo.taskList[i])),
        ],
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, ChallengeDataTaskList taskItem) {
    return Container(
      width: double.infinity,
      height: 72.dp,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: <Widget>[
          CommonAvatar(
            path: taskItem.icon,
            shape: BoxShape.circle,
            size: 48.dp,
          ),
          SizedBox(width: 10.dp),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        taskItem.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: const Color(0xE6000000), fontSize: 14.dp),
                      ),
                    ),
                    Text(
                      taskItem.process,
                      style: TextStyle(
                          color: const Color(0x80000000), fontSize: 12.dp),
                    ),
                  ],
                ),
                SizedBox(height: 3.dp),
                SizedBox(
                  height: 8.dp,
                  child: Stack(
                    children: [
                      Container(
                        width: _progressWidth,
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(), color: Color(0xFFF3E6FA)),
                      ),
                      Container(
                        width: _progressWidth * (taskItem.percent / 100),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          gradient: LinearGradient(colors: [
                            Color(0xFFFED270),
                            Color(0xFFFF5C5E),
                            Color(0xFFFF5CCE)
                          ]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
