import 'package:chat/k.dart';
import 'package:chat/src/quick_reply/model/quick_reply_edit_model.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:chat/src/quick_reply/quick_reply_text_page.dart';
import 'package:chat/src/quick_reply/widget/quick_reply_voice_widget.dart';
import 'package:shared/shared.dart';
import 'package:chat/src/quick_reply/model/quick_reply_repository.dart';
import 'package:chat/src/quick_reply/quick_reply_voice_page.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import 'quick_reply_event.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/util/response_utils.dart';

/// 快速回复列表界面
class QuickReplyPage extends StatefulWidget {
  final int groupId;
  final String groupName;

  const QuickReplyPage(this.groupId, this.groupName, {Key? key})
      : super(key: key);

  @override
  _QuickReplyPageState createState() => _QuickReplyPageState();

  static Future<dynamic> launch(
      BuildContext context, int groupId, String groupName) {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuickReplyPage(groupId, groupName)));
  }
}

class _QuickReplyPageState extends State<QuickReplyPage> {
  late String _groupName;
  List<QuickReply>? _replies;
  bool _loading = false;
  String? _errorMessage;

  @override
  void initState() {
    _groupName = widget.groupName;
    super.initState();
    _loadReplies();
  }

  /// 加载快速回复列表
  void _loadReplies() async {
    _loading = true;
    _errorMessage = null;
    _replies?.clear();
    DataRsp<GroupReplies> resp =
        await QuickReplyRepository.loadReplies(widget.groupId);
    _loading = false;
    if (!mounted) return;
    if ((resp.success) != true) {
      _errorMessage = resp.msg ?? BaseK.K.base_net_error;
      setState(() {});
      return;
    }
    _errorMessage = null;
    setState(() {
      _replies = resp.data?.replies;
    });
  }

  /// 新增回复
  Future<void> _createReply(int type) async {
    BaseResponse? resp;
    String? value;
    dynamic result;
    if (type == 0) {
      result = await QuickReplyTextPage.open(context);
    } else {
      result = await QuickReplyVoicePage.open(context);
    }
    if (!mounted) return;
    if (result != null && result is QuickReplyEditResult) {
      value = result.title;
      resp = await QuickReplyRepository.createReply(widget.groupId, result);
    }
    if (ResponseUtils.handleBaseResponseError(resp, state: this)) return;
    eventCenter.emit(EventConstant.EventQuickReply,
        QuickReplyEvent.of(QuickReplyEvent.REPLY_CREATE, 0, value));
    if (!mounted) return;
    _loadReplies();
  }

  /// 点击屏幕右上方"..."菜单弹出的sheet
  Future<void> _showBottomSheetOnMenuClick() async {
    await _showBottomSheet(false);
  }

  /// 点击快速回复列表Item弹出的sheet
  Future<void> _showBottomSheetOnItemLongPressed(int replyId) async {
    await _showBottomSheet(true, replyId: replyId);
  }

  /// 显示"分组重命名"、"删除分组"底部菜单
  Future<void> _showBottomSheet(bool deleteReply, {int? replyId}) async {
    List<SheetItem> sheets = [];
    if (!deleteReply) {
      sheets.add(SheetItem(K.chat_quick_reply_group_rename, 'option_rename'));
    }
    sheets.add(SheetItem(
        deleteReply
            ? K.chat_quick_reply_delete
            : K.chat_quick_reply_group_delete,
        'option_delete'));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.chat_select_option, data: sheets);
        });
    String? key = result?.value?.key;
    if (key?.isNotEmpty == true) {
      switch (key) {
        case 'option_rename':
          _renameGroup();
          break;
        case 'option_delete':
          if (deleteReply) {
            _deleteReply(replyId!);
          } else {
            _deleteGroupAlertDialog();
          }
          break;
        default:
          break;
      }
    }
  }

  /// 弹出确认删除分组对话框
  _deleteGroupAlertDialog() async {
    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(content: K.chat_quick_reply_group_delete_confirm);
      },
    );
    if (result ?? false) _deleteGroup();
  }

  /// 重命名快速回复分组
  void _renameGroup() async {
    int? index = FormScreen.config(
      title: K.chat_quick_reply_group_rename,
      value: _groupName,
      type: FormTypes.input,
      maxLength: quickReplyGroupNameMaxLen,
      allowEmpty: false,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (!mounted) return;
    if (value?.isEmpty ?? true) return;
    if (value == _groupName) return;

    /// 没修改
    BaseResponse resp =
        await QuickReplyRepository.renameGroup(widget.groupId, value!);
    if (ResponseUtils.handleBaseResponseError(resp, state: this)) return;
    eventCenter.emit(
        EventConstant.EventQuickReply,
        QuickReplyEvent.of(
            QuickReplyEvent.GROUP_RENAME, widget.groupId, value));
    if (!mounted) return;
    _groupName = value;
    setState(() {});
  }

  /// 删除快速回复分组
  void _deleteGroup() async {
    BaseResponse resp = await QuickReplyRepository.deleteGroup(widget.groupId);
    if (ResponseUtils.handleBaseResponseError(resp, state: this)) return;
    eventCenter.emit(
        EventConstant.EventQuickReply,
        QuickReplyEvent.of(
            QuickReplyEvent.GROUP_DELETE, widget.groupId, _groupName));
    if (!mounted) return;
    Navigator.pop(context);
  }

  /// 删除快速回复
  void _deleteReply(int replyId) async {
    BaseResponse resp = await QuickReplyRepository.deleteReply(replyId);
    if (ResponseUtils.handleBaseResponseError(resp, state: this)) return;
    eventCenter.emit(EventConstant.EventQuickReply,
        QuickReplyEvent.of(QuickReplyEvent.REPLY_DELETE, replyId, ''));
    if (!mounted) return;
    _loadReplies();
  }

  /// 编辑快速回复
  Future<void> _editReply(QuickReply reply) async {
    BaseResponse? resp;
    dynamic result;
    if (reply.contentType == 0) {
      result = await QuickReplyTextPage.open(context,
          title: reply.title,
          content: reply.content,
          image: Util.getUserIconUrl(reply.img));
    } else {
      result = await QuickReplyVoicePage.open(context,
          audioDes: reply.title,
          audioUrl: reply.audio,
          audioDuration: reply.duration);
    }
    if (result == null || result is! QuickReplyEditResult) return;
    if (!mounted) return;
    resp = await QuickReplyRepository.editReply(reply.contentId, result);
    if (ResponseUtils.handleBaseResponseError(resp, state: this)) return;
    eventCenter.emit(
        EventConstant.EventQuickReply,
        QuickReplyEvent.of(
            QuickReplyEvent.REPLY_EDIT, reply.contentId, reply.content));
    if (!mounted) return;
    _loadReplies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeSecondModuleBgColor,
      appBar: _buildAppBar(),
      body: _buildPageContentArea(),
      bottomNavigationBar: Container(
        margin: EdgeInsetsDirectional.only(
            top: 12, bottom: 12 + Util.iphoneXBottom, start: 20, end: 20),
        child: Row(
          children: [
            _createReplyButton(0),
            const Spacer(),
            _createReplyButton(1),
          ],
        ),
      ),
    );
  }

  /// 构建标题栏
  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
        backgroundColor: R.colors.homeSecondModuleBgColor,
        statusBrightness: R.colors.statusBarTheme,
        backColor: R.colors.mainTextColor,
        title: Text(
          _groupName,
          style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: _showBottomSheetOnMenuClick,
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8, end: 16),
                  child: R.img(
                    Assets.chat$ic_list_more_svg,
                    package: ComponentManager.MANAGER_CHAT,
                    width: 24,
                    height: 24,
                    color: R.colors.mainTextColor,
                  ),
                ),
              ))
        ]);
  }

  /// 构建页面内容区
  Widget _buildPageContentArea() {
    if (_loading) return const Loading(label: '');
    if (_errorMessage?.isNotEmpty == true) {
      return ErrorData(
          error: _errorMessage,
          onTap: () => _loadReplies(),
          fontColor: R.colors.mainTextColor);
    }
    if (_replies?.isEmpty ?? true) {
      return Center(
          child: ImageEmptyWidget('bb_null.webp',
              text: K.chat_quick_reply_empty,
              textColor: R.colors.mainTextColor));
    }
    return _buildReplyList();
  }

  /// 构建快速回复列表
  Widget _buildReplyList() {
    return ListView.builder(
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 16, bottom: 0),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _replies?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return _buildReplyItem(_replies![index]);
        });
  }

  /// 构建快速回复列表Item
  Widget _buildReplyItem(QuickReply item) {
    return InkWell(
      onLongPress: () async {
        await _showBottomSheetOnItemLongPressed(item.contentId);
      },
      onTap: () async {
        if (item.verifyStatus == 0) {
          Fluttertoast.showCenter(msg: K.quick_reply_review_tip);
          return;
        }
        await _editReply(item);
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 12, bottom: 12),
        margin: const EdgeInsetsDirectional.only(bottom: 12),
        decoration: BoxDecoration(
          color: R.colors.tagBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: item.contentType == 1
            ? _renderVoiceItem(item)
            : (Util.isStringEmpty(item.img)
                ? _renderTextItem(item)
                : _renderImgItem(item)),
      ),
    );
  }

  /// 语言快捷回复
  Widget _renderVoiceItem(QuickReply item) {
    String? title;
    if (!Util.isStringEmpty(item.title)) {
      title = item.title;
    } else if (!Util.isStringEmpty(item.content)) {
      title = item.content;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            QuickReplyVoiceWidget(
              audioPlay: AudioPlay.instance(),
              audioUrl: Util.getRemoteImgUrl(item.audio ?? ''),
              audioLen: item.duration,
            ),
            const Spacer(),
            _renderVerifyStatus(item.verifyStatus),
          ],
        ),
        if (!Util.isStringEmpty(title))
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '${K.chat_quick_reply_title}: ',
                            style: TextStyle(
                                color: R.colors.mainTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: title,
                            style: TextStyle(
                                color: R.colors.mainTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// 纯文本快捷回复
  Widget _renderTextItem(QuickReply item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Util.isStringEmpty(item.title))
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    item.title ?? '',
                    style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _renderVerifyStatus(item.verifyStatus),
              ],
            ),
          ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(item.content ?? '',
                  style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  maxLines: Util.isStringEmpty(item.title) ? 2 : 1,
                  overflow: TextOverflow.ellipsis),
            ),
            if (Util.isStringEmpty(item.title))
              _renderVerifyStatus(item.verifyStatus),
          ],
        ),
      ],
    );
  }

  /// 带图片快捷回复
  Widget _renderImgItem(QuickReply item) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: Util.getUserIconUrl(item.img),
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      item.title ?? '',
                      style: TextStyle(
                          color: R.colors.mainTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _renderVerifyStatus(item.verifyStatus),
                ],
              ),
              if (!Util.isStringEmpty(item.content))
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8),
                  child: Text(item.content ?? '',
                      style: TextStyle(
                          color: R.colors.mainTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ),
            ],
          ),
        ),
      ],
    );
  }

  /// type: 0 文字回复 1 语音回复
  Widget _createReplyButton(int type) {
    return GestureDetector(
        onTap: () async {
          await _createReply(type);
        },
        child: Container(
          width: (Util.width - 51) / 2.0,
          height: 52,
          alignment: AlignmentDirectional.center,
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            gradient: LinearGradient(colors: R.colors.mainBrandGradientColors),
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    type == 0
                        ? K.chat_quick_reply_text_image_add
                        : K.chat_quick_reply_add_voice,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: R.colors.brightTextColor,
                        fontWeight: FontWeight.w500))
              ]),
        ));
  }

  /// 审核状态
  Widget _renderVerifyStatus(int status) {
    List<Widget> childList = [];
    if (status == 0) {
      childList.add(
          R.img(Assets.chat$ic_quick_reply_review_webp, width: 12, height: 12));
      childList.add(const SizedBox(width: 2));
      childList.add(Text(
        K.chat_quick_reply_review_ing,
        style: const TextStyle(
            color: Color(0xFF5ECAFB),
            fontWeight: FontWeight.w500,
            fontSize: 10),
      ));
    } else if (status == 1) {
      childList.add(R.img(Assets.chat$ic_quick_reply_review_fail_webp,
          width: 12, height: 12));
      childList.add(const SizedBox(width: 2));
      childList.add(Text(
        K.chat_quick_reply_review_fail,
        style: const TextStyle(
            color: Color(0xFFEB486C),
            fontWeight: FontWeight.w500,
            fontSize: 10),
      ));
    } else if (status == 2) {
      childList.add(R.img(Assets.chat$ic_quick_reply_review_ok_webp,
          width: 12, height: 12));
      childList.add(const SizedBox(width: 2));
      childList.add(Text(
        K.chat_quick_review_success,
        style: const TextStyle(
            color: Color(0xff66D15F),
            fontWeight: FontWeight.w500,
            fontSize: 10),
      ));
    }
    if (childList.isEmpty) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: childList,
    );
  }
}
