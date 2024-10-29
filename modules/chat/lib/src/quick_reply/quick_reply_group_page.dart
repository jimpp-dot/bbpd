import 'package:shared/shared.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:chat/src/quick_reply/quick_reply_page.dart';
import 'package:chat/src/quick_reply/model/quick_reply_repository.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../../k.dart';
import 'model/quick_reply_edit_model.dart';
import 'quick_reply_event.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/util/response_utils.dart';

/// 快速回复组列表界面
class QuickReplyGroupPage extends StatefulWidget {
  const QuickReplyGroupPage({super.key});

  static Future<dynamic> launch(BuildContext context) {
    return Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const QuickReplyGroupPage()));
  }

  @override
  _QuickReplyGroupPageState createState() => _QuickReplyGroupPageState();
}

class _QuickReplyGroupPageState extends State<QuickReplyGroupPage> {
  List<QuickReplyGroup>? _replyGroups;
  bool _loading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventQuickReply, _onEvent);
    _loadGroups();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventQuickReply, _onEvent);
    super.dispose();
  }

  void _onEvent(String type, Object? value) {
    if (type != EventConstant.EventQuickReply) return;
    if (value is! QuickReplyEvent) return;
    QuickReplyEvent event = value;
    if ((event.id) <= 0) {
      _loadGroups();
      return;
    }
    switch (event.event) {
      case QuickReplyEvent.GROUP_DELETE:
        {
          _onGroupDelete(event);
          break;
        }
      case QuickReplyEvent.GROUP_RENAME:
        {
          _onGroupRename(event);
          break;
        }
      default:
        {
          Log.d('QuickReplyGroupPage#_onEvent, unnecessary event: $event');
          break;
        }
    }
  }

  void _onGroupDelete(QuickReplyEvent event) {
    for (var i = 0, size = _replyGroups?.length ?? 0; i < size; i++) {
      if (_replyGroups![i].id == event.id) {
        _replyGroups!.removeAt(i);
        if (mounted) setState(() {});
        return;
      }
    }
  }

  void _onGroupRename(QuickReplyEvent event) {
    _replyGroups?.forEach((element) {
      if (element.id == event.id) {
        element.name = event.text ?? '';
        if (mounted) setState(() {});
        return;
      }
    });
  }

  /// 新增分组
  Future<void> _createGroup() async {
    int index = FormScreen.config(
      title: K.chat_quick_reply_group_create,
      value: '',
      type: FormTypes.input,
      allowEmpty: false,
      maxLength: quickReplyGroupNameMaxLen,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (!mounted) return;
    if (value?.isEmpty ?? true) return;
    BaseResponse resp = await QuickReplyRepository.createGroup(value!);
    if (ResponseUtils.handleBaseResponseError(resp, state: this)) return;
    eventCenter.emit(EventConstant.EventQuickReply,
        QuickReplyEvent.of(QuickReplyEvent.GROUP_CREATE, 0, value));
    if (!mounted) return;
    _loadGroups();
  }

  /// 加载快速回复分组
  void _loadGroups() async {
    _loading = true;
    _errorMessage = null;
    _replyGroups?.clear();
    DataRsp<QuickGroups> groupResp =
        await QuickReplyRepository.loadGroups(showContent: 0);
    _loading = false;
    if (!mounted) return;
    if ((groupResp.success) != true) {
      _errorMessage = groupResp.msg ?? BaseK.K.base_net_error;
      setState(() {});
      return;
    }
    _errorMessage = null;
    setState(() {
      _replyGroups = groupResp.data?.groups;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// super.build(context);
    return Scaffold(
        backgroundColor: R.colors.homeSecondModuleBgColor,
        appBar: _buildAppBar(),
        body: _buildPageContentArea(),
        bottomNavigationBar: _createQuickReplyGroupButton());
  }

  /// 构建标题栏
  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar(
      statusBrightness: R.colors.statusBarTheme,
      K.chat_quick_reply,
      backgroundColor: R.colors.homeSecondModuleBgColor,
      titleColor: R.colors.mainTextColor,
      backColor: R.colors.mainTextColor,
    );
  }

  /// 构建页面内容区
  Widget _buildPageContentArea() {
    if (_loading) return const Loading(label: '');
    if (_errorMessage?.isNotEmpty == true) {
      return ErrorData(
          fontColor: R.colors.mainTextColor,
          error: _errorMessage,
          onTap: () => _loadGroups());
    }
    if (_replyGroups?.isEmpty ?? true) {
      return Center(
          child: ImageEmptyWidget('bb_null.webp',
              text: K.chat_quick_reply_group_empty,
              textColor: R.colors.mainTextColor));
    }
    return _buildQuickReplyGroupList();
  }

  /// 构建快速回复分组列表
  Widget _buildQuickReplyGroupList() {
    return ListView.separated(
        padding: const EdgeInsetsDirectional.only(
            start: 20, top: 0, end: 20, bottom: 0),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _replyGroups?.length ?? 0,
        separatorBuilder: (context, index) {
          return Container(color: R.colors.dividerColor, height: 1);
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildQuickReplyGroupItem(_replyGroups![index]);
        });
  }

  /// 构建快速回复列表Item
  Widget _buildQuickReplyGroupItem(QuickReplyGroup item) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          await QuickReplyPage.launch(context, item.id, item.name);
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.only(top: 15, bottom: 15),
                child: Text(item.name,
                    style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
              _buildQuickReplyGroupItemAction(item.replyCount)
            ]));
  }

  /// 构建快速回复分组右侧的Action控件
  Widget _buildQuickReplyGroupItemAction(int replyCount) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(K.chat_quick_reply_num(['$replyCount']),
              style: TextStyle(
                color: R.colors.secondTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          R.img(Assets.chat$ic_next_svg,
              width: 16,
              color: R.colors.secondTextColor,
              package: ComponentManager.MANAGER_CHAT)
        ]);
  }

  /// "新增分组"按钮
  Widget _createQuickReplyGroupButton() => GestureDetector(
      onTap: () async {
        await _createGroup();
      },
      child: Container(
        height: 52,
        margin: EdgeInsetsDirectional.only(
            top: 12, bottom: 12 + Util.iphoneXBottom, start: 20, end: 20),
        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(colors: R.colors.mainBrandGradientColors),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(K.chat_quick_reply_group_create,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: R.colors.brightTextColor,
                      fontWeight: FontWeight.w500))
            ]),
      ));
}
