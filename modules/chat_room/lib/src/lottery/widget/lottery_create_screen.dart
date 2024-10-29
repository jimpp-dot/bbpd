import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/lottery/model/lottery_model.dart';
import '../lottery_repository.dart';
import 'lottery_records_screen.dart';

/// 创建公屏抽奖
class LotteryCreateScreen extends StatefulWidget {
  final ChatRoomData room;

  ///
  /// [content] 编辑框默认文本
  const LotteryCreateScreen(this.room, {super.key});

  @override
  _LotteryCreateScreenState createState() => _LotteryCreateScreenState();

  static Future<dynamic> launch(BuildContext context, ChatRoomData room) {
    return Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LotteryCreateScreen(room)));
  }
}

class _LotteryCreateScreenState extends State<LotteryCreateScreen> {
  /// 抽奖次数开关（暂时关闭，以后可能要打开）
  static const bool roundNumEnabled = false;

  late TextEditingController _textController;
  late FocusNode _focusNode;

  /// 单次抽奖时长
  String? _roundTimeSubtitle;

  /// 抽奖次数
  String? _roundNumSubtitle;

  /// 单次中奖人数
  String? _winnerNumSubtitle;

  /// 抽奖间隔时长
  String? _roundIntervalSubtitle;

  /// 单次抽奖时长
  String get roundTimeSubtitle => _roundTimeSubtitle?.isNotEmpty == true
      ? _roundTimeSubtitle!
      : K.room_lottery_round_time_subtitle;

  /// 抽奖次数
  String get roundNumSubtitle => _roundNumSubtitle?.isNotEmpty == true
      ? _roundNumSubtitle!
      : K.room_lottery_round_num_subtitle;

  /// 单次中奖人数
  String get winnerNumSubtitle => _winnerNumSubtitle?.isNotEmpty == true
      ? _winnerNumSubtitle!
      : K.room_lottery_winner_num_subtitle;

  /// 抽奖间隔时长
  String get roundIntervalSubtitle => _roundIntervalSubtitle?.isNotEmpty == true
      ? _roundIntervalSubtitle!
      : K.room_lottery_round_interval_subtitle;

  late LotteryOption option;

  LotteryType _lotteryType = LotteryType.types[0];

  SelectGiftInfo? _selectGift;

  @override
  void initState() {
    super.initState();
    option = LotteryOption.createDefault(widget.room.rid);
    _textController = TextEditingController(text: option.words);
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.color.mainBgColor,
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _createBottomButton());
  }

  /// 构建标题栏
  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
        title: Text(
          K.room_public_speech,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [_buildAction()]);
  }

  Widget _buildAction() {
    return GestureDetector(
        onTap: _onShowRecords,
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsetsDirectional.only(end: 20),
            child: Text(K.room_open_lottery_records,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainBrandColor,
                    fontWeight: FontWeight.w500))));
  }

  Widget _buildBody() {
    List<Widget> widgets = [];
    Widget divider = Container(color: R.color.dividerColor, height: 1);

    widgets.add(
        _formItem(K.room_lottery_join_type, _lotteryType.name, _onSelectType));
    widgets.add(divider);
    widgets.addAll(_getTypeContent());
    widgets.add(_formItem(
        K.room_lottery_round_title, roundTimeSubtitle, _onSelectRoundTime));
    widgets.add(divider);
    widgets.add(_formItem(K.room_lottery_winner_num_title, winnerNumSubtitle,
        _onSelectWinnerNumber));
    widgets.add(divider);
    if (roundNumEnabled) {
      widgets.add(_formItem(K.room_lottery_round_num_title, roundNumSubtitle,
          _onSelectRoundNumber));
      widgets.add(divider);
      if ((option.roundNum) > 1) {
        widgets.add(_formItem(K.room_lottery_round_interval_title,
            roundIntervalSubtitle, _onSelectRoundInterval));
        widgets.add(divider);
      }
    }
    return GestureDetector(
        onTap: () {
          /// 点页面其他的地方，收起软键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 12, start: 20, end: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: widgets),
        ));
  }

  List<Widget> _getTypeContent() {
    List<Widget> widgets = [];
    if (_lotteryType.type == LotteryType.TYPE_TEXT) {
      widgets.add(const SizedBox(height: 24));
      widgets.add(Text(K.room_join_speech_content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w400,
          )));
      widgets.add(const SizedBox(height: 4));
      widgets.add(_buildContent());
    } else {
      widgets.add(_formItem(
          K.room_lottery_join_gift,
          _selectGift != null ? _selectGift!.name : K.room_choose_gift,
          _onSelectGift));
      widgets.add(Container(color: R.color.dividerColor, height: 1));
    }

    return widgets;
  }

  void _onSelectGift() async {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    double maxHeight = 410.0;
    SelectGiftInfo? selectGiftInfo = await giftManager.showChooseGiftPanel(
        context,
        room: widget.room,
        maxHeight: maxHeight,
        title: K.room_choose_gift,
        showNum: false);
    if (selectGiftInfo != null) {
      _selectGift = selectGiftInfo;
      option.giftId = _selectGift!.id;
      setState(() {});
    }
  }

  /// 抽奖类型
  void _onSelectType() async {
    List<SheetItem> res = [];

    for (var item in LotteryType.types) {
      res.add(SheetItem(item.name, item.type));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.room_lottery_join_type, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    String key = result.value?.key ?? '';
    _lotteryType =
        LotteryType.types.firstWhere((element) => element.type == key);
    option.joinWay = _lotteryType.type;
    setState(() {});
  }

  /// 发言内容输入框
  Widget _buildContent() {
    return Container(
      height: 144,
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsetsDirectional.only(
        top: 0.0,
        start: 12.0,
        end: 12.0,
        bottom: 12.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: TextField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.send,
          textAlign: TextAlign.start,
          style: R.textStyle.regular14,

          /// focusNode: this._focusNode,
          controller: _textController,
          autocorrect: true,
          autofocus: true,
          maxLength: 20,
          onSubmitted: _onSubmitted,
          onChanged: _onTextChanged,
          maxLines: 10,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: K.room_public_speech_hit),
        ),
      ),
    );
  }

  Widget _formItem(String title, String subtitle, GestureTapCallback onTap) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 52,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        color: R.color.mainTextColor,
                        fontWeight: FontWeight.w400)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              color: R.color.thirdTextColor,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(width: 1),
                      R.img('ic_next_small.svg',
                          width: 16,
                          color: R.color.thirdTextColor,
                          package: ComponentManager.MANAGER_BASE_ROOM)
                    ])
              ]),
        ));
  }

  /// "开启抽奖"按钮
  Widget _createBottomButton() => GestureDetector(
      onTap: _createLotteryOption,
      child: Container(
        height: 52,
        margin: const EdgeInsetsDirectional.only(
            top: 12, bottom: 46, start: 20, end: 20),
        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(K.room_open_lottery,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500))
            ]),
      ));

  final int maxRoundTime = 180;
  final int minRoundTime = 10;

  void _onSelectRoundTime() async {
    var v = option.roundTime > 0 ? '${option.roundTime}' : '';
    var placeholder =
        K.room_input_number_limit(['$minRoundTime', '$maxRoundTime']);

    /// 单次抽奖时长
    int index = FormScreen.config(
        title: K.room_lottery_round_time_subtitle,
        value: v,
        type: FormTypes.input,
        allowEmpty: false,
        placeholder: placeholder,
        keyboardType: TextInputType.number,
        filter: (String value) {
          String text = value.trim();
          if (text.isEmpty) return true;
          int num = Util.parseInt(text);
          return num < minRoundTime || num > maxRoundTime;
        });
    String? value = await FormScreen.openFormScreen(context, index);
    if (!mounted) return;
    if (value?.isNotEmpty != true) {
      FocusScope.of(context).requestFocus(FocusNode());
      return;
    }
    int num = Util.parseInt(value);
    if (num < minRoundTime || num > maxRoundTime) {
      Toast.showCenter(context, placeholder);
      return;
    }
    option.roundTime = num;
    _roundTimeSubtitle = '${option.roundTime}';
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  final int maxWinnerNumber = 30;
  final int minWinnerNumber = 1;

  /// 单次中奖人数
  void _onSelectWinnerNumber() async {
    var v = option.winnerNum > 0 ? '${option.winnerNum}' : '';
    var placeholder =
        K.room_input_number_limit(['$minWinnerNumber', '$maxWinnerNumber']);
    int index = FormScreen.config(
        title: K.room_lottery_winner_num_subtitle,
        value: v,
        type: FormTypes.input,
        allowEmpty: false,
        placeholder: placeholder,
        keyboardType: TextInputType.number,
        filter: (String value) {
          String text = value.trim();
          if (text.isEmpty) return true;
          int num = Util.parseInt(text);
          return num < minWinnerNumber || num > maxWinnerNumber;
        });
    String? value = await FormScreen.openFormScreen(context, index);
    if (!mounted) return;
    if (value?.isNotEmpty != true) {
      FocusScope.of(context).requestFocus(FocusNode());
      return;
    }
    int num = Util.parseInt(value);
    if (num < minWinnerNumber || num > maxWinnerNumber) {
      Toast.showCenter(context, placeholder);
      return;
    }
    option.winnerNum = num;
    _winnerNumSubtitle = '${option.winnerNum}';
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  /// 抽奖次数
  void _onSelectRoundNumber() async {
    var v = option.roundNum > 0 ? '${option.roundNum}' : '';
    int index = FormScreen.config(
        title: K.room_lottery_round_num_subtitle,
        value: v,
        type: FormTypes.input,
        allowEmpty: false,
        keyboardType: TextInputType.number);
    String? value = await FormScreen.openFormScreen(context, index);
    if (!mounted) return;
    if (value?.isNotEmpty != true) {
      FocusScope.of(context).requestFocus(FocusNode());
      return;
    }
    option.roundNum = Util.parseInt(value);
    _roundNumSubtitle = '${option.roundNum}';
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  /// 抽奖间隔时长
  void _onSelectRoundInterval() async {
    var v = option.roundInterval > 0 ? '${option.roundInterval}' : '';
    int index = FormScreen.config(
        title: K.room_lottery_round_interval_subtitle,
        value: v,
        type: FormTypes.input,
        allowEmpty: false,
        keyboardType: TextInputType.number);
    String? value = await FormScreen.openFormScreen(context, index);
    if (!mounted) return;
    if (value?.isNotEmpty != true) {
      FocusScope.of(context).requestFocus(FocusNode());
      return;
    }
    option.roundInterval = Util.parseInt(value);
    _roundIntervalSubtitle = '${option.roundInterval}';
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  void _onFocus() {
    Log.d("PublicScreenSpeech, focus --------------- ${_focusNode.hasFocus}");
  }

  /// 跳转到"抽奖记录"页面
  void _onShowRecords() async {
    await LotteryRecordsScreen.launch(context, widget.room.rid);
  }

  bool _creating = false;

  void _createLotteryOption() async {
    if (_creating) return;

    if (option.joinWay == LotteryType.TYPE_TEXT) {
      if (option.words.isEmpty) {
        /// 抽奖关键字，必须不为空
        Toast.showCenter(context, K.room_public_speech_hit);
        return;
      }
    } else if (option.joinWay == LotteryType.TYPE_GIFT) {
      if ((option.giftId) == 0) {
        /// 抽奖关键字，必须不为空
        Toast.showCenter(context, K.room_choose_gift);
        return;
      }
    }

    if ((option.roundTime) <= 0) {
      /// 抽奖时长，必须大于0
      Toast.showCenter(context, K.room_lottery_round_time_subtitle);
      return;
    }
    if ((option.winnerNum) <= 0) {
      /// 抽奖人数，必须大于0
      Toast.showCenter(context, K.room_lottery_winner_num_subtitle);
      return;
    }
    if (roundNumEnabled) {
      int roundNum = option.roundNum;
      if (roundNum <= 0) {
        /// 抽奖次数，必须大于0
        Toast.showCenter(context, K.room_lottery_round_num_subtitle);
        return;
      }
      if (roundNum > 1 && (option.roundInterval) <= 0) {
        /// 抽奖次数大于1，必须设置两次抽奖之间的间隔
        Toast.showCenter(context, K.room_lottery_round_interval_subtitle);
        return;
      }

      /// 当抽奖次数小于等于1时，抽奖间隔为0
      if (roundNum <= 1) option.roundInterval = 0;
    } else {
      option.roundNum = 1;
      option.roundInterval = 0;
    }
    _creating = true;
    BaseResponse resp = await LotteryRepository.createLotteryRecord(option);
    _creating = false;
    if (!mounted) return;
    if (resp.success == false) {
      Fluttertoast.showToast(msg: resp.msg ?? '', gravity: ToastGravity.CENTER);
      return;
    }
    Navigator.of(context).pop(true);
  }

  void _onSubmitted(String value) {
    Log.d("PublicScreenSpeech, _onSubmitted --------------- $value");
  }

  void _onTextChanged(String value) {
    option.words = value;
    Log.d("PublicScreenSpeech, _onTextChanged: $value");
  }
}
