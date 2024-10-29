import 'dart:convert';

import 'package:moment/moment.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/report_type.dart';
import 'package:flutter/material.dart';
import 'package:moment/assets.dart';
import 'package:moment/k.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

import '../model/circle_mood_bean.dart';
import '../model/circle_mood_reply_bean.dart';
import 'small_mood_kindly_reminder_dialog.dart';

/// 小心情主页面

class SmallMoodScreen extends StatefulWidget {
  const SmallMoodScreen({Key? key}) : super(key: key);

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SmallMoodScreen(),
      settings: const RouteSettings(name: '/SmallMoodScreen'),
    ));
  }

  @override
  State<SmallMoodScreen> createState() => _SmallMoodScreenState();
}

class _SmallMoodScreenState extends State<SmallMoodScreen> {
  late FocusNode _focusNode;
  late TextEditingController _textController;
  late ScrollController _listScrollController;

  CircleMoodData? _data;
  String _errorMessage = '';
  bool _isLoading = false;

  String get value {
    return _textController.value.text.trim();
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _listScrollController = ScrollController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);
    _checkShowKindlyReminderDialog();

    _loadData(initial: true);
  }

  void _loadData({bool initial = false}) async {
    if (mounted && initial) {
      setState(() {
        _isLoading = true;
      });
    }
    CircleMoodResp resp = await Api.getCircleMoodResponse();
    _errorMessage = '';
    _isLoading = false;
    if (mounted) {
      if (resp.success && resp.data != null) {
        _data = resp.data;
        if (Util.parseInt(_data?.leftNum) == 0) {
          eventCenter.emit('refresh_small_mood_entry');
        }
        if (initial) {
          _reportTrack('entrance');
        }
      } else {
        _errorMessage = resp.msg ?? K.moment_net_error;
      }
      setState(() {});
    }
  }

  _onFocus() {
    if (_focusNode.hasFocus) {
      Future.delayed(const Duration(seconds: 1), () {
        _onScrollToBottom();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return HideKeyboard(
      child: AnimatedPadding(
        padding: EdgeInsetsDirectional.only(
          bottom: keyboardHeight,
        ),
        duration: Duration.zero,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xFFFEECFF), Color(0xFFCFF5FF)],
            ),
          ),
          child: Stack(
            children: [
              PositionedDirectional(
                top: 0,
                start: 0,
                child: R.img(
                  Assets.moment$small_mood_ic_top_bg_decoration_webp,
                  width: 185,
                  height: 252,
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                end: 0,
                child: R.img(
                  Assets.moment$small_mood_ic_bottom_bg_decoration_webp,
                  width: 216,
                  height: 280,
                ),
              ),
              Column(
                children: [
                  BaseAppBar.custom(
                    backgroundColor: Colors.transparent,
                    leading: _buildBackButton(),
                    statusBrightness: Brightness.light,
                    title: Text(
                      K.moment_small_mood,
                      style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ...[_buildContent()]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildContent() {
    if (_isLoading) {
      return const Expanded(
        child: Loading(),
      );
    } else if (Util.validStr(_errorMessage)) {
      return Expanded(
        child: Container(
          alignment: AlignmentDirectional.center,
          child: ErrorData(
            error: _errorMessage,
            onTap: () {
              _loadData();
            },
          ),
        ),
      );
    } else if (_data != null) {
      return Expanded(
        child: Column(
          children: [
            _buildSmallMoodBar(),
            Expanded(
              child: (_data?.leftNum ?? 0) > 0
                  ? ListView(
                      padding: EdgeInsets.zero,
                      controller: _listScrollController,
                      children: [
                        _buildSmallMoodCardWidget(),
                        const SizedBox(height: 8),
                        _buildReplyCardWidget(),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: _buildEmptyWidget(),
                        ),
                        Container(
                          height: MediaQuery.of(context).padding.bottom + 12,
                        )
                      ],
                    ),
            ),
          ],
        ),
      );
    }
    return Expanded(child: Container());
  }

  /// 返回键
  Widget _buildBackButton() {
    return IconButton(
      padding: const EdgeInsets.all(0.0),
      icon: Container(
        width: 36.0,
        height: 36.0,
        margin: const EdgeInsetsDirectional.only(start: 0, top: 2),
        alignment: Alignment.center,
        child: Center(
          child: R.img(
            "ic_titlebar_profile_back.svg",
            width: 24,
            height: 24,
            color: R.color.mainTextColor,
            package: ComponentManager.MANAGER_PERSONALDATA,
          ),
        ),
      ),
      onPressed: () {
        _checkShowExitReminderDialog();
      },
    );
  }

  /// xxx条心情
  Widget _buildSmallMoodBar() {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Text(
              '${_data?.leftNum ?? 0}',
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 44,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 12),
              child: SizedBox(
                height: 64,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      K.moment_few_mood,
                      style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 4),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            SmallMoodKindlyReminderDialog.show(
                                context, SmallMoodDialogType.KindlyReminder);
                          },
                          child: R.img(
                            'mall/ic_question_mark.svg',
                            color: const Color(0xFF5B5B5B).withOpacity(0.4),
                            width: 20,
                            height: 20,
                            package: ComponentManager.MANAGER_VIP,
                          ),
                        ),
                        const SizedBox(height: 4)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            if (_data != null && (_data?.leftNum ?? 0) > 0)
              GestureDetector(
                onTap: () {
                  _checkShowTradeOffReminderDialog();
                  _reportTrack('change');
                },
                child: Container(
                  width: 74,
                  height: 32,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF303232), width: 1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    K.moment_change_a_change,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  /// 空页面
  Widget _buildEmptyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(
              Assets.moment$small_mood_empty_webp,
              width: 102,
              height: 102,
            ),
            const SizedBox(height: 16),
            Text(
              K.moment_small_mood_empty_desc,
              style: TextStyle(
                  color: R.color.mainTextColor.withOpacity(0.4), fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  /// 小心情详情卡片
  Widget _buildSmallMoodCardWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 12),
              child: SizedBox(
                height: 72,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CommonAvatar(
                          path: _data?.topic?.icon ?? '',
                          size: 40,
                          shape: BoxShape.circle,
                          onTap: () {
                            if (Util.parseInt(_data?.topic?.uid) > 0) {
                              IPersonalDataManager personalDataManager =
                                  ComponentManager.instance.getManager(
                                      ComponentManager.MANAGER_PERSONALDATA);
                              personalDataManager.openImageScreen(
                                  context, _data?.topic?.uid ?? 0);
                            }
                          },
                        ),
                        if (Util.parseInt(_data?.topic?.isOnline) > 0)
                          PositionedDirectional(
                            bottom: 0,
                            end: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4DEAA5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _data?.topic?.name ?? '',
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (Util.parseInt(_data?.room?.rid) > 0)
                      GestureDetector(
                        onTap: () {
                          IRoomManager roomManager = ComponentManager.instance
                              .getManager(ComponentManager.MANAGER_BASE_ROOM);
                          roomManager.openChatRoomScreenShow(
                              context, (_data?.room?.rid ?? 0),
                              refer: 'small_mood');
                        },
                        child: Container(
                          width: 82,
                          height: 32,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: R.color.mainBrandGradientColors,
                              )),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              R.img(
                                'in_room_status.webp',
                                package: ComponentManager.MANAGER_BASE_CORE,
                                width: 18,
                                height: 18,
                              ),
                              Text(
                                K.moment_partying,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (Util.parseInt(_data?.topic?.uid) > 0 &&
                        Util.parseInt(_data?.topic?.topicId) > 0)
                      GestureDetector(
                        onTap: () => _onMoreTaped(context),
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 0, top: 10, end: 12, bottom: 10),
                          child: R.img(
                            'ic_more.svg',
                            package: ComponentManager.MANAGER_BASE_CORE,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: DottedDecoration(
                  color: const Color(0xFFF4F4F4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, top: 12, bottom: 8),
              child: Text(
                _data?.topic?.content ?? '',
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, bottom: 12),
              child: Container(
                // height: 260,
                decoration: BoxDecoration(
                  // color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _data != null && _data?.topic != null
                    ? MomentMediaWidget(
                        moment: _data!.topic!,
                        page: MomentFlowPage.SmallMood,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 回复小心情
  Widget _buildReplyCardWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.send,
                  textAlign: TextAlign.start,
                  style: R.textStyle.regular14,
                  focusNode: _focusNode,
                  controller: _textController,
                  autocorrect: true,
                  autofocus: false,
                  // maxLength: 1000,
                  onSubmitted: (value) {
                    _onSendTapped();
                  },
                  onChanged: _onChanged,
                  maxLines: 10,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: K.moment_reply_hint_text,
                      hintStyle: TextStyle(
                          color: R.color.mainTextColor.withOpacity(0.4),
                          fontSize: 16)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: false,
                      child: GestureDetector(
                        onTap: () {},
                        child: R.img(
                          Assets.moment$small_mood_ic_emojifq_webp,
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _onSendTapped,
                      child: Container(
                        width: 60,
                        height: 32,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              colors: R.color.mainBrandGradientColors,
                            )),
                        child: Text(
                          K.comment_send,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 举报选项
  void _onMoreTaped(BuildContext context) async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }
    List<SheetItem> res = [];
    res.add(SheetItem(K.moment_report, "report"));

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (result.value?.key == 'report') {
      IPersonalDataManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      manager.openReportScreen(context,
          uid: (_data?.topic?.uid ?? 0),
          reportType: ReportType.Moment,
          reportId: (_data?.topic?.topicId ?? 0));
    }
  }

  void _onSendTapped() async {
    if (!Util.validStr(value)) {
      Fluttertoast.showCenter(msg: K.moment_reply_is_empty_tip);
      return;
    }
    if (_data == null || _data?.topic == null) return;
    Moment moment = _data!.topic!;

    String type = ConversationType.Private;

    // 发送打招呼的消息
    MessageContent content1 = MessageContent(
        'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
    content1.content = K.moment_say_hi_v2;
    content1.extra = json.encode(MomentUtils.getShareExtra(moment));
    int targetUid = moment.uid;

    // 发送回复的内容消息
    MessageContent content2 = MessageContent(
        'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
    content2.content = value;

    bool canSendMsgWhenSayHi =
        await BaseRequestManager.checkCanSendMsgWhenSayHi(targetUid, type);

    // 判断是否可以给指定用户发消息
    if (canSendMsgWhenSayHi) {
      int topicId = Util.parseInt(_data?.topic?.topicId);
      int tpuid = Util.parseInt(_data?.topic?.uid);
      String content = value;
      CircleMoodReplyResp resp =
          await Api.circleMoodReply(topicId, tpuid, content);
      if (resp.success && resp.data != null) {
        _reportTrack('reply_succeed');
        Fluttertoast.showCenter(
            msg: Util.validStr(resp.data?.msg)
                ? resp.data?.msg
                : K.moment_reply_success);
        await Im.sendMessage(type, targetUid.toString(), content1,
            supportVersion:
                ImSupportSDKVersions.MOMENT_MESSAGE_SUPPORT_VERSION);
        await Im.sendMessage(type, targetUid.toString(), content2);
        _textController.clear();
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
        }
      } else {
        Fluttertoast.showCenter(msg: resp.msg ?? K.moment_reply_fail);
      }
      Future.delayed(const Duration(seconds: 1), () {
        _loadData();
      });
    } else {
      _textController.clear();
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
      Fluttertoast.showCenter(msg: K.moment_check_send_exception);
      _loadData();
    }
  }

  void _onChanged(String value) {}

  void _onScrollToBottom() {
    if (_listScrollController.hasClients) {
      final position = _listScrollController.position.maxScrollExtent;
      _listScrollController.animateTo(position,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    }
  }

  /// 检查是否需要弹温馨提示弹框，首次提示一次，之后不再提示
  void _checkShowKindlyReminderDialog() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      String key = '${Session.uid}_show_small_mood_kindly_reminder_dialog';
      if (!Config.getBool(key, false)) {
        Config.setBool(key, true);
        if (!mounted) return;
        SmallMoodKindlyReminderDialog.show(
            context, SmallMoodDialogType.KindlyReminder);
      }
    });
  }

  /// 检查点击退出按钮时是否需要弹提示弹框，首次提示一次，之后不再提示
  void _checkShowExitReminderDialog() {
    String key = '${Session.uid}_show_small_mood_exit_reminder_dialog';
    if (!Config.getBool(key, false) && Util.parseInt(_data?.leftNum) != 0) {
      Config.setBool(key, true);
      SmallMoodKindlyReminderDialog.show(
          context, SmallMoodDialogType.ExitReminder, onConfirmTap: () {
        Navigator.of(context).pop();
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  /// 检查点击换一换按钮时是否需要弹提示弹框，每日首次提示一次
  void _checkShowTradeOffReminderDialog() {
    int today = Utility.getToday();
    String key = '${Session.uid}_has_show_trade_off_today_$today';
    if (!Config.getBool(key)) {
      Config.setBool(key, true);
      SmallMoodKindlyReminderDialog.show(
          context, SmallMoodDialogType.TradeOffReminder, onConfirmTap: () {
        _loadData();
      });
    } else {
      _loadData();
    }
  }

  /// 埋点上报
  void _reportTrack(String page) {
    Tracker.instance.track(TrackEvent.small_mood_click, properties: {
      'page': page,
      'gsID': '${Util.parseInt(_data?.topic?.uid)}',
      'quantity': Util.parseInt(_data?.leftNum),
    });
  }
}
