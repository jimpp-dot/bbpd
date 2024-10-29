import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';
import '../../../chat_room.dart';
import '../lottery_manager.dart';
import '../lottery_repository.dart';
import '../model/lottery_model.dart';
import 'package:shared/k.dart' as BaseK;

import 'lottery_ui_helper.dart';

class LotteryOneKeyJoinDialog extends StatefulWidget {
  /// 房间信息
  final ChatRoomData room;

  const LotteryOneKeyJoinDialog(this.room, {super.key});

  @override
  _LotteryOneKeyJoinDialogState createState() =>
      _LotteryOneKeyJoinDialogState();

  static Future show(BuildContext context, ChatRoomData room) {
    return LotteryUiHelper.showLotteryDialog(
      context,
      LotteryOneKeyJoinDialog(room),
    );
  }
}

class _LotteryOneKeyJoinDialogState extends State<LotteryOneKeyJoinDialog> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        RoomConstant.Event_Room_Lottery_Count_Down, _onEvent);
    eventCenter.addListener(RoomConstant.Event_Room_Lottery_End, _onEvent);
    _loadJoinInfo();
  }

  void _onEvent(String name, dynamic data) {
    if (!mounted) return;
    if (RoomConstant.Event_Room_Lottery_End == name &&
        (ModalRoute.of(context)?.isCurrent ?? false)) {
      Navigator.of(context).pop();
      return;
    }
    if (RoomConstant.Event_Room_Lottery_Count_Down == name) {
      refresh();
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        RoomConstant.Event_Room_Lottery_Count_Down, _onEvent);
    eventCenter.removeListener(RoomConstant.Event_Room_Lottery_End, _onEvent);
    super.dispose();
  }

  /// 倒计时时间
  String get _time {
    int remain = LotteryManager.instance.remainTime;
    if (remain <= 0) return K.room_lottery_opening;
    return K.room_lottery_open_time([remain < 10 ? '0$remain' : '$remain']);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: double.infinity,
        height: 455,
        child: Column(
          children: [
            Container(
              height: 395,
              decoration: BoxDecoration(
                color: R.color.mainBgColor,
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(16)),
              ),
              child: _buildBody(context),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: R.img('ic_detail_close.webp',
                  width: 48,
                  height: 48,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_loading) return const Loading(label: '');
    if (_errorMessage?.isNotEmpty == true)
      return ErrorData(error: _errorMessage, onTap: () => _loadJoinInfo());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildTitle(),
            _buildCountDownTitle(),
          ],
        ),
        _buildInitiator(),
        _buildJoinConditions(),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 16, top: 15),
          child: Text(
            K.room_join_members,
            style: TextStyle(
                fontSize: 13,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
            width: double.infinity, height: 70, child: _buildMembersArea()),
        _buildOnkeyJoinButton(context),
      ],
    );
  }

  /// "限时抽奖"标题
  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, top: 12),
      child: YouSheText(
        K.room_lottery_time_limited,
        style: TextStyle(
            fontSize: 24,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w500),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// "6s后开奖"
  Widget _buildCountDownTitle() {
    return Container(
        padding: const EdgeInsetsDirectional.only(
            top: 4, bottom: 4, start: 6, end: 6),
        margin: const EdgeInsetsDirectional.only(end: 16, top: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(13),
              topEnd: Radius.circular(13),
              bottomStart: Radius.circular(4),
              bottomEnd: Radius.circular(13)),
          gradient: LinearGradient(colors: _joinButtonColor),
        ),
        child: Text(
          _time,
          style: const TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ));
  }

  /// 接待/房主昵称 发起了公屏发言抽奖
  Widget _buildInitiator() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, top: 16),
      child: Text(
        K.room_lottery_initiator([_info?.name ?? '']),
        style: TextStyle(
            fontSize: 16,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w500),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 参与条件
  Widget _buildJoinConditions() {
    if (_info == null) {
      return const SizedBox.shrink();
    }

    String conditionText;
    if (_info!.joinWay == LotteryType.TYPE_GIFT) {
      conditionText = K.room_lottery_gift_condition([_info!.giftName]);
    } else {
      conditionText = K.room_lottery_send_join_code([_info?.condition ?? '']);
    }

    return Container(
      padding:
          const EdgeInsetsDirectional.only(start: 8, end: 8, top: 8, bottom: 8),
      margin: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 15),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            K.room_join_condition,
            style: TextStyle(
                fontSize: 13,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            conditionText,
            style: const TextStyle(
                fontSize: 16,
                color: Color(0XFFFF5F7D),
                fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  /// 构建抽奖参与成员区域
  Widget _buildMembersArea() {
    if (_info?.members.isEmpty ?? true) return _buildMembersEmpty();
    return _buildMembers();
  }

  /// 无人参与
  Widget _buildMembersEmpty() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            K.room_lottery_no_members,
            style: TextStyle(
                color: R.color.thirdTextColor,
                fontSize: 13,
                fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  /// 有人参与
  Widget _buildMembers() {
    Widget separator = const SizedBox(width: 12);
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(start: 16),
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: _info?.members.length ?? 0,
      separatorBuilder: (context, index) => separator,
      itemBuilder: (BuildContext context, int index) =>
          _buildMemberItem(_info?.members[index]),
    );
  }

  Widget _buildMemberItem(LotteryWinner? item) {
    return SizedBox(
      width: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: (item?.icon.isNotEmpty ?? false)
                ? CachedNetworkImage(
                    imageUrl: item!.icon,
                    errorWidgetType: ErrorWidgetType.defaultUserIcon,
                    suffix: '!head150',
                    width: 48.0,
                    height: 48.0)
                : R.img(
                    BaseAssets.shared$ic_user_none_png,
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 48.0,
                    height: 48.0,
                  ),
          ),
          const SizedBox(height: 4),
          Text(item?.name ?? '',
              style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }

  /// 房间抽奖（未参与），中奖弹框，底部按钮，渐变颜色
  final List<Color> _joinButtonColor = [
    const Color(0XFFF71C6F),
    const Color(0XFFFA9E61)
  ];

  /// 房间抽奖（已参与），中奖弹框，底部按钮，渐变颜色
  final List<Color> _joinedButtonColor = [
    const Color(0XFFE4E7EE),
    const Color(0XFFD5D8E0)
  ];

  /// "一键参与"按钮
  Widget _buildOnkeyJoinButton(BuildContext context) => GestureDetector(
      onTap: (_info?.isJoined ?? false) ? null : _onKeyJoin,
      child: Container(
        height: 48,
        margin: const EdgeInsetsDirectional.only(
            top: 18, bottom: 24, start: 24, end: 24),
        padding: const EdgeInsetsDirectional.fromSTEB(0, 14, 0, 13),
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
              colors: (_info?.isJoined ?? false)
                  ? _joinedButtonColor
                  : _joinButtonColor),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  (_info?.isJoined ?? false)
                      ? K.room_joined
                      : K.room_lottery_onekey_join,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500))
            ]),
      ));

  /// 抽奖活动已结束
  bool get isLotteryEnd {
    if (LotteryManager.instance.isLotteryOnGoing(widget.room.rid)) return false;

    /// 抽奖已结束
    Toast.showCenter(context, K.room_lottery_end);
    return true;
  }

  void _onKeyJoin() {
    if (isLotteryEnd) {
      return;
    }
    if (_info?.joinWay == LotteryType.TYPE_GIFT) {
      Navigator.of(context).pop();
      IGiftManager giftManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      giftManager.showRoomGiftPanel(context,
          room: widget.room, defaultId: _info!.giftId);
    } else {
      _sendText();
    }
  }

  /// 一键参与
  void _sendText() async {
    if (isLotteryEnd) {
      return;
    }
    bool success = await OperateUtil.checkAuth(
        context, widget.room, 'room:lottery_one_key_join');
    if (!success) return;
    if (isLotteryEnd) {
      return;
    }
    String words = LotteryManager.instance.words;
    if (words.isNotEmpty != true) return;
    success = await OperateUtil.sendText(context, widget.room, words);
    if (!mounted) return;
    if (success) Navigator.of(context).pop();
  }

  bool _loading = false;
  String? _errorMessage;

  LotteryInfo? _info;

  /// 加载"一键参与"界面信息
  void _loadJoinInfo() async {
    _loading = true;
    _errorMessage = null;
    _info = null;
    DataRsp<LotteryInfo> resp =
        await LotteryRepository.loadLotteryInfo(widget.room.rid);
    _loading = false;
    if (!mounted) return;
    if (!(resp.success == true)) {
      _errorMessage = resp.msg ?? BaseK.K.base_net_error;
      refresh();
      return;
    }
    _errorMessage = null;
    _info = resp.data;
    refresh();
  }
}
