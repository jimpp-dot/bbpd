import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/gpk/widget/gpk_timer_picker.dart';
import 'package:chat_room/src/biz_plugin/vote/create/widget/vote_create_text_option_widget.dart';
import 'package:chat_room/src/biz_plugin/vote/create/widget/vote_create_user_option_widget.dart';
import 'package:chat_room/src/biz_plugin/vote/create/vote_create_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/vote_repos.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Selector;

/// 创建投票
class VoteCreatePage extends StatefulWidget {
  final ChatRoomData room;

  const VoteCreatePage({super.key, required this.room});

  static void open(BuildContext context, ChatRoomData room) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return VoteCreatePage(room: room);
        },
      ),
    );
  }

  @override
  _VoteCreatePageState createState() => _VoteCreatePageState();
}

class _VoteCreatePageState extends State<VoteCreatePage>
    with BaseScreenStateMixin<VoteCreatePage> {
  late TextEditingController _titleController;

  late VoteCreateViewModel _viewModel;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _viewModel = VoteCreateViewModel(widget.room);
    _titleController = TextEditingController();
    _titleController.addListener(() {
      _viewModel.info.title = _titleController.text;
    });
    _focusNode = FocusNode();
    _loadData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _loadData() async {
    await _viewModel.loadData();
    if (!mounted) return;
    if (_viewModel.voteConfig != null && _viewModel.voteRule != null) {
      setScreenReady();
    } else {
      setScreenEmpty();
    }
  }

  /// 创建投票
  void createVote() async {
    VoteCreateInfo info = _viewModel.info;
    if (info.title.isEmpty == true) {
      Fluttertoast.showToast(
          msg: K.vote_title_unvalid_tip, gravity: ToastGravity.CENTER);
      return;
    }
    if (info.time <= 0) {
      Fluttertoast.showToast(
          msg: K.vote_time_unvalid_tip, gravity: ToastGravity.CENTER);
      return;
    }
    if (_viewModel.optionType == VoteOptionType.text) {
      if (info.texts.length < 2) {
        Fluttertoast.showToast(
            msg: K.vote_option_unvalid_tip_1, gravity: ToastGravity.CENTER);
        return;
      }
      for (String text in info.texts) {
        if (text.trim().isEmpty) {
          Fluttertoast.showToast(
              msg: K.vote_option_unvalid_tip_2, gravity: ToastGravity.CENTER);
          return;
        }
      }
    } else {
      if (info.users.length < 2) {
        Fluttertoast.showToast(
            msg: K.vote_option_unvalid_tip_1, gravity: ToastGravity.CENTER);
        return;
      }
    }
    bool result =
        await VoteRepos.create(widget.room.rid, _viewModel.optionType, info);
    if (result) {
      Fluttertoast.showToast(
          msg: K.vote_create_success_tip, gravity: ToastGravity.CENTER);
      if (mounted) Navigator.pop(context);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(
        K.vote_create_vote,
      ),
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        child: buildStatusContent(),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding:
                EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 104.dp),
            child: _renderBody(),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          height: 104.dp + Util.iphoneXBottom,
          start: 0,
          end: 0,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(_focusNode);
              createVote();
            },
            child: Container(
              width: Util.width,
              height: double.infinity,
              alignment: AlignmentDirectional.topCenter,
              padding: EdgeInsetsDirectional.only(top: 40.dp),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    R.color.mainBgColor.withOpacity(0),
                    R.color.mainBgColor
                  ])),
              child: Container(
                height: 48.dp,
                width: Util.width - 16.dp * 2,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                  borderRadius: BorderRadius.circular(24.dp),
                ),
                child: Text(K.create,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderBody() {
    VoteOptionType? optionType = _viewModel.optionType;
    VoteCreateInfo info = _viewModel.info;
    VoteSettingRule voteRule = _viewModel.voteRule!;
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.dp),
        _renderNavItem(
            K.vote_rule,
            optionType == VoteOptionType.text
                ? K.vote_rule_by_text
                : K.vote_rule_by_user, () {
          _displayCounterSheet();
        }),
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: 12.dp, bottom: 8.dp, start: 16.dp, end: 16.dp),
          child: Text(K.vote_title,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          width: Util.width - 16.dp * 2,
          height: 48.dp,
          margin: EdgeInsetsDirectional.only(
              start: 16.dp, end: 16.dp, bottom: 12.dp),
          padding: EdgeInsetsDirectional.only(start: 12.dp, end: 12.dp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.dp),
            color: R.color.secondBgColor,
          ),
          child: TextField(
            style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
            controller: _titleController,
            maxLength: 20,
            textInputAction: optionType == VoteOptionType.text
                ? TextInputAction.next
                : TextInputAction.done,
            decoration: InputDecoration(
              hintText: K.vote_create_title_input_hint,
              hintStyle: TextStyle(color: R.color.thirdTextColor, fontSize: 15),
              border: InputBorder.none,
              counterText: '',
            ),
          ),
        ),
        if (optionType == VoteOptionType.user)
          VoteCreateUserOptionWidget(viewModel: _viewModel),
        if (optionType == VoteOptionType.text)
          VoteCreateTextOptionWidget(viewModel: _viewModel),
        _renderNavItem(K.room_gpk_settings_time, _viewModel.timeStr(),
            () async {
          GPKTimerResult? result = await showTimerPickerPopup(
            context: context,
            minSecond: 30,
            secondList: _viewModel.getTimerSecondSection(),
            minuteList: _viewModel.getTimerMinuteSection(),
          );
          if (!mounted) return;
          if (result == null) return;
          setState(() {
            info.time = result.minute * 60 + result.second;
          });
        }),
        // 允许多选
        if (voteRule.enableSelect)
          _renderSwitchItem(K.vote_support_multi_select, info.isMulti,
              (bool value) {
            setState(() {
              info.isMulti = value;
            });
          }),
        // 隐藏投票结果
        if (voteRule.enableResultShow)
          _renderSwitchItem(K.vote_hide_vote_result, !info.showResult,
              (bool value) {
            setState(() {
              info.showResult = !value;
            });
          }),
      ],
    );
  }

  /// 跳转选项
  Widget _renderNavItem(String title, String result, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: 12.dp, bottom: 12.dp, start: 16.dp, end: 16.dp),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          GestureDetector(
              onTap: onTap,
              child: Text('$result >',
                  style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 14,
                  ))),
        ],
      ),
    );
  }

  /// 开关选项
  Widget _renderSwitchItem(
      String title, bool isSelected, ValueChanged<bool> onChange) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: 12.dp, bottom: 12.dp, start: 16.dp, end: 16.dp),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          CupertinoSwitch(
              activeColor: R.color.mainBrandColor,
              trackColor: R.color.switchInActiveColor,
              value: isSelected,
              onChanged: (value) {
                onChange(value);
              })
        ],
      ),
    );
  }

  /// 投票规则选择
  void _displayCounterSheet() async {
    if (!mounted) return;
    List<SheetItem> res = [];
    res.add(SheetItem(
        K.vote_rule_by_user, 'vote-by-person', K.vote_rule_by_user_tip));
    res.add(SheetItem(
        K.vote_rule_by_text, 'vote-by-text', K.vote_rule_by_text_tip));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            title: K.vote_rule,
            data: res,
            showCancel: true,
            render: (BuildContext context, SheetItem? item, int index,
                {VoidCallback? callback}) {
              bool isSelected = (index == 0 &&
                      _viewModel.optionType == VoteOptionType.user) ||
                  (index == 1 && _viewModel.optionType == VoteOptionType.text);
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: R.color.dividerColor, width: 0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item?.label ?? '',
                      maxLines: 1,
                      style: TextStyle(
                          color: isSelected
                              ? R.color.mainBrandColor
                              : R.color.mainTextColor,
                          fontSize: 16),
                    ),
                    SizedBox(height: 4.dp),
                    Text(
                      '${item?.extra ?? ''}',
                      maxLines: 1,
                      style: TextStyle(
                          color: isSelected
                              ? R.color.mainBrandColor.withOpacity(0.4)
                              : R.color.thirdTextColor,
                          fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          );
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (!mounted) return;
    VoteOptionType optionTypeValue =
        result.index == 1 ? VoteOptionType.text : VoteOptionType.user;
    _viewModel.switchVoteRule(optionTypeValue);
    setState(() {});
  }
}
