import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/under/underIcon.dart';

import '../../chat_room.dart';
import 'model/underData.dart';
import 'model/underRepository.dart';
import 'underMessageHandler.dart';
import 'under_util.dart';
import 'widget/timer_widget.dart';
import 'widget/under_user_icon.dart';
import 'widget/vote_result.dart';

class GameUnderWidget extends StatefulWidget {
  static const String DISPATCH_GAME_UNDER_EVENT = 'room.game.under';

  final ChatRoomData room;
  final bool displayEmote;

  const GameUnderWidget(
      {super.key, required this.room, required this.displayEmote});

  @override
  _GameUnderWidgetState createState() => _GameUnderWidgetState();
}

class _GameUnderWidgetState extends State<GameUnderWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    int count = 4;
    children.add(UnderUserList(
      room: widget.room,
      displayEmote: widget.displayEmote,
      start: 0,
      count: count,
    ));

    children.add(Expanded(
        child: UnderCenterWidget(
      room: widget.room,
    )));

    children.add(UnderUserList(
      room: widget.room,
      displayEmote: widget.displayEmote,
      start: count,
      count: count,
    ));

    return Container(
      height: 340,
      margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  void onUnderMessage(String type, dynamic data) {
    setState(() {});
    UnderMessageHandler.handleMessage(widget.room);
  }

  @override
  void initState() {
    super.initState();
    widget.room
        .addListener(GameUnderWidget.DISPATCH_GAME_UNDER_EVENT, onUnderMessage);
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      UnderMessageHandler.handleMessage(widget.room);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.room.removeListener(
        GameUnderWidget.DISPATCH_GAME_UNDER_EVENT, onUnderMessage);
  }
}

class UnderUserList extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmote;
  final int start;
  final int count;

  const UnderUserList(
      {super.key,
      required this.room,
      required this.displayEmote,
      required this.start,
      required this.count});

  @override
  _UnderUserListState createState() => _UnderUserListState();
}

class _UnderUserListState extends State<UnderUserList> {
  Widget _buildUserIcon(RoomPosition item) {
    UserIconStyle style = UserIconStyle.Wolf;

    List<Widget> res = [];
    res.add(
      UserIcon(
        size: IconSize.wolf,
        room: widget.room,
        position: item,
        showOffline: (item.uid <= 0 && item.underData!.gameUnderOrigin > 0),
        tapHandler: UnderIconTapHandler(),
      ),
    );

    //角色&离线标识
    bool isLoser = item.underData!.gameUnderRole != GameUnderRole.None; //是否出局
    bool offline = item.uid == 0 && item.underData!.gameUnderOrigin > 0; //是否离线
    if (isLoser || offline) {
      res.add(
        IgnorePointer(
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius:
                BorderRadius.circular((IconStyles[style]?.width ?? 60) / 2 + 1),
            child: Container(
              color: Colors.black.withOpacity(0.6),
              width: IconStyles[style]?.width ?? 60,
              height: IconStyles[style]?.height ?? 60,
              alignment: Alignment.center,
              child: !isLoser
                  ? Text(
                      K.room_offline,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF9B9B9B),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        R.img(
                            item.underData?.gameUnderRole ==
                                        GameUnderRole.Under ||
                                    item.underData?.gameUnderRole ==
                                        GameUnderRole.Under_Loser
                                ? 'under/ic_under_role_under.svg'
                                : 'under/ic_under_role_populace.svg',
                            package: ComponentManager.MANAGER_BASE_ROOM),
                        Text(
                          item.underData?.gameUnderRole ==
                                      GameUnderRole.Under ||
                                  item.underData?.gameUnderRole ==
                                      GameUnderRole.Under_Loser
                              ? K.room_under
                              : K.room_civilian,
                          style:
                              R.textStyle.caption.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    }

    //表情
    if (widget.displayEmote) {
      res.add(
        EmoteAtMic(
          uid: item.uid,
          position: item.position,
          width: IconStyles[style]?.width ?? 60,
        ),
      );
    }

    //投票状态
    if (widget.room.config?.underData?.gameUnderState == GameUnderState.Vote &&
        item.underData!.gameUnderEnableToVote &&
        !item.underData!.gameUnderVoted) {
      res.add(Positioned(
          bottom: -3,
          child: IgnorePointer(
            child: SizedBox(
              width: 38,
              height: 14,
              child: RawMaterialButton(
                onPressed: null,
                constraints:
                    const BoxConstraints.tightFor(width: 38, height: 14),
                fillColor: const Color(0xFFA146FF),
                shape: const StadiumBorder(),
                child: Text(
                  K.voting,
                  style: R.textStyle.caption
                      .copyWith(color: Colors.white, fontSize: 9),
                ),
              ),
            ),
          )));
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: res,
    );
  }

  Widget _buildLabel(RoomPosition item, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(left: 4, right: 4),
      alignment: Alignment.center,
      child: _buildName(item.name, item.titleNew),
    );
  }

  Widget _buildName(String name, int titleNew) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 11.0,
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildItem(RoomPosition item, Size size) {
    bool hasUser = item.uid > 0 || item.underData!.gameUnderOrigin > 0;

    List<Widget> res = [];

    res.add(Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildUserIcon(item),
        hasUser ? _buildLabel(item, size.width) : Container(),
      ],
    ));

    //打赏统计
    res.add(PackageAtMic(
      position: item,
      room: widget.room,
    ));

    //麦序
    res.add(PositionedDirectional(
      top: -3,
      start: 4,
      child: UnderIconPositionWidget(
        text: '${item.position + 1}',
      ),
    ));

    //PK标识
    if (item.underData!.gameUnderEnableVotedByOther &&
        !item.underData!.gameUnderEnableToVote) {
      res.add(PositionedDirectional(
        top: -3,
        end: -4,
        child: R.img('under/ic_under_pk.svg',
            package: ComponentManager.MANAGER_BASE_ROOM, width: 26, height: 14),
      ));
    }

    //当前发言麦位，添加背景标识
    bool isDesc =
        widget.room.config?.underData?.gameUnderState == GameUnderState.Desc &&
            widget.room.config?.underData?.gameUnderCurrent == item.position;
    Color bgColor = isDesc ? const Color(0xFFCEFFDE) : const Color(0xFF8DC1FC);

    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 2.0),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: res,
      ),
    );
  }

  Widget _buildColumn(BuildContext context, int skip, int count) {
    Size size = const Size(62.0, 74.0);

    List<Widget> res = [];
    res = widget.room.positions
        .skip(skip)
        .take(count)
        .map((RoomPosition item) => _buildItem(item, size))
        .toList(growable: true);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: res,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 0.0,
      ),
      child: _buildColumn(context, widget.start, widget.count),
    );
  }
}

class UnderCenterWidget extends StatefulWidget {
  final ChatRoomData room;

  const UnderCenterWidget({super.key, required this.room});

  @override
  _UnderCenterWidgetState createState() => _UnderCenterWidgetState();
}

class _UnderCenterWidgetState extends State<UnderCenterWidget> {
  ///卧底词-'我的词语'
  Widget _buildWord() {
    String? underWord = widget.room.gameUnderWord;
    if (underWord == null || underWord.isEmpty) {
      underWord = '--';
    }

    return Container(
      width: 125,
      height: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(R.imagePath('under/bg_under_word.png',
                package: ComponentManager.MANAGER_BASE_ROOM))),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            K.under_my_word,
            style:
                R.textStyle.subtitle.copyWith(color: const Color(0xFF1F86FF)),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            underWord,
            style: R.textStyle.title
                .copyWith(color: const Color(0xFF202020), fontSize: 20),
          ),
        ],
      ),
    );
  }

  ///状态按钮-'第X轮描述'
  List<Widget> _buildStatus() {
    String statusStr = UnderUtil.getUnderStateStr(widget.room);
    String img = 'bg_under_status_blue.png';
    GameUnderState? state = widget.room.config?.underData?.gameUnderState;
    if (state == GameUnderState.Vote ||
        state == GameUnderState.VoteResult ||
        state == GameUnderState.PublishDead) {
      img = 'bg_under_status_yellow.png';
    }

    return [
      const SizedBox(
        height: 12,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(R.imagePath('under/$img',
                  package: ComponentManager.MANAGER_BASE_ROOM))),
        ),
        constraints: const BoxConstraints(minWidth: 140),
        height: 40,
        alignment: Alignment.center,
        child: Text(
          statusStr,
          style: R.textStyle.title.copyWith(color: Colors.white),
        ),
      )
    ];
  }

  ///状态说明-'X号 玩家正在发言'
  List<Widget> _buildStatusTip() {
    return [
      const SizedBox(
        height: 8,
      ),
      Container(
        constraints: const BoxConstraints(maxWidth: 180),
        child: UnderUtil.getUnderStateTip(widget.room),
      )
    ];
  }

  ///倒计时
  List<Widget> _buildTimer() {
    int timer = widget.room.config!.counter - widget.room.timestamp;
    if (timer <= 0) return [];

    RoomPosition? roomPosition = widget.room.positionForCurrentUser;
    bool isCurrent = roomPosition != null &&
        widget.room.config?.underData?.gameUnderCurrent ==
            roomPosition.position;
    return [
      const SizedBox(
        height: 30,
      ),
      UnderTimerWidget(room: widget.room),
      if (isCurrent)
        const SizedBox(
          height: 19,
        ),
      if (isCurrent)
        TextButton(
          onPressed: () {
            UnderRepository.endDesc(widget.room.rid, roomPosition.uid);
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFFFA125),
          ),
          child: Text(
            '结束发言',
            style: R.textStyle.body1.copyWith(color: Colors.white),
          ),
        )
    ];
  }

  ///投票结果
  List<Widget> _buildVoteResult() {
    Map? data = widget.room.config?.underData?.dataMap;

    if (data == null || data.isEmpty) {
      return [];
    }

    Map<int, List<int>> votes =
        ChatRoomUtil.convertListMap(data['votes']) ?? {}; //投票信息
    return [
      const SizedBox(
        height: 19,
      ),
      UnderVoteResultWidget(voteResult: votes)
    ];
  }

  List<Widget> _buildDeadInfo() {
    Map? data = widget.room.config?.underData?.dataMap;
    if (data == null || data.isEmpty) {
      return [];
    }

    List<int> loser =
        Util.parseList(data['data'], (e) => Util.parseInt(e)); //谁被淘汰
    RoomPosition? loserPosition;
    if (loser.isNotEmpty) {
      loserPosition = widget.room.positions
          .firstWhereOrNull((element) => element.position == loser.first);
    }
    return [
      const SizedBox(
        height: 33,
      ),
      UnderDeadPositionWidget(
        roomPosition: loserPosition,
      )
    ];
  }

  ///倒计时、投票结果、死亡信息
  List<Widget> _buildTimerOrResult() {
    List<Widget> widgets = [];

    GameUnderState? state = widget.room.config?.underData?.gameUnderState;
    if (state == GameUnderState.Desc || state == GameUnderState.Vote) {
      widgets = _buildTimer();
    } else if (state == GameUnderState.VoteResult) {
      widgets = _buildVoteResult();
    } else if (state == GameUnderState.PublishDead) {
      widgets = _buildDeadInfo();
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(_buildWord());
    widgets.addAll(_buildStatus());
    widgets.addAll(_buildStatusTip());
    widgets.addAll(_buildTimerOrResult());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }
}
