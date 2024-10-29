import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chat/k.dart';
import 'package:chat/src/model/chat_group_msg.dart';
import 'package:chat/src/page/custom_gift_page.dart';
import 'package:chat/src/page/packageScreen.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:chat/src/quick_reply/model/quick_reply_repository.dart';
import 'package:chat/src/quick_reply/quick_reply_event.dart';
import 'package:chat/src/quick_reply/quick_reply_panel.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/assets.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:shared/widget/compatible_editable_text.dart';

import 'emote.dart';
import 'emotePanel.dart';
import 'im_at_bean.dart';
import 'recorderPanel.dart';
import 'tacit_dialog.dart';

mixin ChatStateMixin {
  void close();

  void sendText({String text});
}

/// 聊天底部输入框
class ChatInput extends StatefulWidget {
  /// 会话类型，私聊:private, 群聊:group
  final String type;
  final String targetId;
  final bool enabled;
  final bool isAutoService;
  final String reason;
  final bool hidePic; // 隐藏发送图片
  final BoolCallback onQuickReplayShow;
  final CloudProfileData? chatGroupConfig;
  final CloudProfileData? chatCloudProfile;
  final List<int>? tails;
  final String? extType; //拓展字段
  final int meDanger;
  final bool needSendTacitTips;

  /// 双方初次回复消息后需要发一条默契问答通知（对方给我发过消息，我未给对方发过消息，我地磁回消息的时候发一条默契问题通知）
  final VoidCallback callbackBySend;

  const ChatInput({
    super.key,
    required this.type,
    required this.targetId,
    this.isAutoService = false,
    required this.enabled,
    required this.reason,
    this.extType,
    this.hidePic = false,
    required this.onQuickReplayShow,
    this.chatGroupConfig,
    this.chatCloudProfile,
    this.tails,
    this.meDanger = 0,
    this.needSendTacitTips = false,
    required this.callbackBySend,
  });

  @override
  ChatInputState createState() => ChatInputState();
}

class ChatInputState extends State<ChatInput> with ChatStateMixin {
  final FocusNode _focusNode = FocusNode();
  final CompatibleTextEditingController _textController = CompatibleTextEditingController(text: '');

  /// 有效的文本
  String validText = '';
  String _extend = '';
  bool hasText = false;

  ImageStreamCompleter? _imageStream;
  ImageStreamListener? _imageStreamListener;
  File? _lastSwitchImage;

  bool _isSystemUser = false;
  bool _isVipCustomerService = false;
  bool _lock = false;

  bool _showGiftRedPoint = false;
  final String _giftKey = 'has_click_chat_gift_btn';

  final String _atStr = "@";
  ATSpecialTextSpanBuilder? _textSpanBuilder;
  List<ImAtBean> _atBeans = [];
  TextSelection? _textSelection;

  /// 专属权，群昵称
  String _groupNickName = '';

  bool hasClickExtendAfterAddTacit = true;

  /// 更多红点（IM默契问答）
  bool hasClickTacitButton = true;

  /// 每日问答入口红点
  bool hasSendTacitTips = false;

  QuickGroups? _quickReplyData;
  static const _EX_QUICK_REPLY = 'quick_reply';

  @override
  close() {
    FocusScope.of(context).requestFocus(FocusNode());
    _closeExtend();
  }

  @override
  void initState() {
    super.initState();
    hasClickExtendAfterAddTacit = Config.getBool('hasClickExtendAfterAddTacit', false);
    hasClickTacitButton = Config.getBool('hasClickTacitButton', false);

    _isSystemUser = ChatUtil.isSystemUser(Util.parseInt(widget.targetId)) && widget.type == ConversationType.Private ||
        ChatUtil.isVipCustomerService(Session.uid); //对方是系统用户 或者 自己是专属客服用户
    _focusNode.addListener(_onFocus);

    _showGiftRedPoint = Config.getInt(_giftKey, 0) == 0;
    _isVipCustomerService = ChatUtil.isVipCustomerService(Util.parseInt(widget.targetId)) && widget.type == ConversationType.Private ||
        ChatUtil.isVipCustomerService(Session.uid); //对方是专属客服 或者 自己是专属客服用户

    eventCenter.addListener(EventConstant.SessionChange, _onSessionChange);
    eventCenter.addListener(IGroupManager.EVENT_NICK_NAME_CHANGED, _onGroupNickNameChanged);
    eventCenter.addListener(EventConstant.EventQuickReply, _onQuickReplyChanged);

    /// 工会用户，显示快速回复按钮
    if (widget.type == ConversationType.Private && _isSystemUser == false && _isVipCustomerService == false && Session.joinBroker) {
      _loadQuickReply();
    }
  }

  void _initAtTextSpanBuilder() {
    if (_textSpanBuilder == null) {
      _textSpanBuilder = ATSpecialTextSpanBuilder();
      _textSpanBuilder!.atTextAttach = () => _atBeans;
      _textSpanBuilder!.updateATTextAttach = (List<ATTextRange> atTextAttach) => _atBeans = List.from(atTextAttach);
    }
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(EventConstant.SessionChange, _onSessionChange);
    eventCenter.removeListener(IGroupManager.EVENT_NICK_NAME_CHANGED, _onGroupNickNameChanged);
    eventCenter.removeListener(EventConstant.EventQuickReply, _onQuickReplyChanged);
    _focusNode.removeListener(_onFocus);
  }

  void _loadQuickReply() async {
    DataRsp<QuickGroups> resp = await QuickReplyRepository.loadGroups();
    if (resp.success == true) {
      _quickReplyData = resp.data;
      if (mounted) setState(() {});
    }
  }

  _onSessionChange(String type, dynamic field) {
    String key = field;

    //刷新 首充礼包是否显示
    if (key == 'first_pay') {
      if (mounted) {
        setState(() {});
      }
    }
  }

  /// 修改了自己的群昵称
  _onGroupNickNameChanged(String type, dynamic data) {
    if (data != null && data is String) {
      _groupNickName = data;
    }
  }

  _onQuickReplyChanged(String type, dynamic data) {
    if (data is QuickReplyEvent) {
      _loadQuickReply();
    }
  }

  @override
  @protected
  void didUpdateWidget(ChatInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reason != widget.reason || oldWidget.enabled != widget.enabled) {
      setState(() {});
    }
  }

  bool get _isPartyGroup => widget.chatGroupConfig?.type == ChatGroupTypes.PARTY;

  String get _senderName => _isPartyGroup
      ? (!Util.isStringEmpty(_groupNickName)
          ? _groupNickName
          : (widget.chatGroupConfig != null && widget.chatGroupConfig!.hasNickName())
              ? widget.chatGroupConfig!.nickName
              : Session.name)
      : Session.name;

  _onFocus() {
    if (_focusNode.hasFocus) {
      _closeExtend();
    } else {
      _textSelection = _textController.value.selection.copyWith();
    }
  }

  void _onInputSubmit(String keyword) {
    if (Platform.isIOS) {
      /// 这个地方有个bug，软键盘会收起，出现列表抖动，后续等升级flutter版本，升级extended_text_field 库可以解决
      /// 先保证绝大部分聊天场景没问题
      if (_isPartyGroup) {
        Future.delayed(const Duration(microseconds: 1), () {
          FocusScope.of(context).requestFocus(_focusNode);
        });
      } else {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    }
    _sendText();
  }

  void _onTextChanged(String text) {
    setState(() {
      hasText = text.isNotEmpty;
    });
    _handleAtInput(text);
  }

  /// 是否禁言状态
  Future<bool> get _isBanStatus async {
    int lastTime = (await HiveUtil.get<int>('${Session.uid}_ChatBanTime', defaultValue: 0)) ?? 0;
    if (!ChatUtil.isCustomerService(Util.parseInt(widget.targetId)) && DateTime.now().secondsSinceEpoch < lastTime) {
      Fluttertoast.showCenter(msg: K.chat_ban_tips);
      return true;
    }
    return false;
  }

  void _sendText({String? text}) async {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_send_text',
    });
    if (Session.privateChatCountReachUpperLimit(dangerUser: widget.meDanger)) {
      _textController.clear();
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.openHighRiskUsersInterceptDialog(context);
      return;
    }
    String keyword = text ?? _textController.value.text;
    if (keyword.isEmpty) {
      return;
    }

    int length = utf8.encode(keyword).length;

    if (length > 2048) {
      Fluttertoast.showToast(msg: K.chat_msg_too_long);
      return;
    }

    _textController.clear();
    bool hasSensitiveWords = trie.search(keyword);
    if (hasSensitiveWords) {
      Fluttertoast.showToast(msg: K.sensitive_words_warning, gravity: ToastGravity.CENTER);
      return;
    }

    bool hasAt = !Util.isCollectionEmpty(_atBeans);
    MessageContent content =
        MessageContent(hasAt ? MessageType.Mention : MessageType.Text, SendUser(Session.uid.toString(), _senderName, Session.icon));
    content.content = keyword;
    if (hasAt) {
      content.extra = _getAtExtraStr();
    } else if (Util.validList(widget.tails)) {
      content.extra = _getTailExtraStr();
    }
    try {
      if (await _isBanStatus) return;
      await Im.sendMessage(widget.type, widget.targetId, content, supportVersion: _getSupportVersion());
      widget.callbackBySend.call();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }

    /// 统计私信事件
    IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.trackEvent(AppsFlyerEvent.SEND_MESSAGE,
        eventValue: {AppsFlyerParameter.CONTENT_TYPE: widget.type.toString(), AppsFlyerParameter.TARGET_ID: widget.targetId});
  }

  void _sendHttpImage(String? imageUrl, int width, int height) async {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_send_image',
    });
    if (Session.privateChatCountReachUpperLimit(dangerUser: widget.meDanger)) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.openHighRiskUsersInterceptDialog(context);
      return;
    }
    if (imageUrl == null || imageUrl.isEmpty) {
      return;
    }
    MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), _senderName, Session.icon));
    content.imageUrl = Util.getRemoteImgUrl(imageUrl);
    content.thumb = Util.getUserIconUrl(imageUrl);
    content.content = '[${K.chat_photo}]';
    content.extra = json.encode({
      'w': width,
      'h': height,
    });
    try {
      await Im.sendImageMessage(widget.type, widget.targetId, content, null);
      widget.callbackBySend.call();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }

    /// 统计私信事件
    IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.trackEvent(AppsFlyerEvent.SEND_MESSAGE,
        eventValue: {AppsFlyerParameter.CONTENT_TYPE: widget.type.toString(), AppsFlyerParameter.TARGET_ID: widget.targetId});
  }

  int _getSupportVersion() {
    if (!Util.isCollectionEmpty(_atBeans)) {
      return ImSupportSDKVersions.AT_MESSAGE_SUPPORT_VERSION;
    }
    return 0;
  }

  void _sendEmote(EmoteItem config) async {
    String emoteKey = config.key;
    String emoteType = config.emoteType ?? 'emoji';
    int emoteWidth = config.width;
    int emoteHeight = config.height;

    if (config.key == 'add' || config.key == 'edit') {
      return;
    } else if (config.key == 'custom') {
      emoteKey = config.source;
      emoteType = 'custom';
      emoteWidth = 200;
      emoteHeight = 200;
    } else if (config.key == 'yellow.16.gif' || config.key == 'yellow.17.gif' || config.key == 'yellow.18.gif') {
      int num = 0;
      if (config.key == 'yellow.16.gif') {
        num = 6;
      } else if (config.key == 'yellow.17.gif') {
        num = 8;
      } else {
        num = 3;
      }
      emoteKey = config.key.replaceFirstMapped(RegExp(r'\.([\d]+)\.'), (Match match) {
        var random = Random();
        return '.${match[1]!}_${random.nextInt(num)}.';
      });
    }

    _closeExtend();
    MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), _senderName, Session.icon));
    content.content = '[${K.chat_emoji}]';
    content.extra = json.encode({
      "icon": emoteKey,
      "width": emoteWidth,
      "height": emoteHeight,
      "type": emoteType,
      'remote': config.remote ?? '',
    });
    try {
      // 普通消息，加离线PUSH跳转和上报参数
      if (await _isBanStatus) return;
      await Im.sendMessage(
        widget.type,
        widget.targetId,
        content,
        pushContent: '',
        pushData: 'page=home&tab=message&push_type_id=100001&content_id=1&push_type=message',
        isEmoji: true,
      );
      widget.callbackBySend.call();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }

    if (emoteKey.startsWith("magic.")) {
      eventCenter.emit("UserChat.PlayEmoji", emoteKey);
    }

    PulseLog.instance.event('click_event', properties: {'click_tag': 'chat_input_send_emote_${config.key}'});
  }

  void _sendVoice(Map voice) async {
    MessageContent content = MessageContent(MessageType.Voice, SendUser(Session.uid.toString(), _senderName, Session.icon));
    try {
      var voiceUri = voice.containsKey('uri') ? voice['uri'] : '';
      await Im.sendVoiceMessage(
          widget.type, widget.targetId, content, voice['base64'], voice['duration'].toInt(), voiceUri, K.chat_friend_send_a_voice);
      widget.callbackBySend.call();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_input_send_audio',
    });

    /// 统计私信事件
    IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.trackEvent(AppsFlyerEvent.SEND_MESSAGE,
        eventValue: {AppsFlyerParameter.CONTENT_TYPE: widget.type.toString(), AppsFlyerParameter.TARGET_ID: widget.targetId});
  }

  void _switchImage() async {
    _closeExtend();
    if (_lock) return;
    Log.d('_switchImage==$_lock');
    try {
      //PhotoSelected asset = await PhotoPicker.show(context);
      //_lastSwitchImage = asset.file;
      _lock = true;
      _lastSwitchImage = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080.0,
        maxHeight: 1080.0,
      );
      _lock = false;
      if (_lastSwitchImage != null) {
        FileImage image = FileImage(_lastSwitchImage!);
        _imageStream = image.loadImage(image, PaintingBinding.instance.instantiateImageCodecWithSize);
        _imageStreamListener = ImageStreamListener(_onImageLoaded);
        _imageStream!.addListener(_imageStreamListener!);
      }
    } catch (e, s) {
      _lock = false;
      Fluttertoast.showToast(msg: BaseK.K.select_photo_error_retry, gravity: ToastGravity.CENTER);
      Log.e(e, stackTrace: s);
    }
  }

  void _onInvite() async {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_input_Invite',
    });
    FocusScope.of(context).requestFocus(FocusNode());
    if (_extend == 'light') {
      _closeExtend();
      return;
    }

    setState(() {
      _extend = 'light';
    });
  }

  void _onChangeGift() {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_input_ChangeGift',
    });
    CustomGiftPage.show(context);
  }

  void _onTrueWord() async {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_input_trueWord',
    });
    List<SheetItem> res = [];
    res.add(SheetItem(K.classic_truth_word, "true_word_normal"));
    // res.add(SheetItem(K.private_truth_word, "true_word_private")); //去除，目前有审核风险
    res.add(SheetItem(K.open_truth_word, "true_word_open"));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            title: K.choose_truth_word_type,
            data: res,
            suppDarkTheme: true,
          );
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    String? state;
    if (result.value?.key == "true_word_open") {
      state = await Im.sendTruewordOpenMessage(widget.type, widget.targetId, result.value?.key ?? '');
    } else {
      state = await Im.sendTruewordMessage(widget.type, widget.targetId, result.value?.key ?? '');
    }
    Toast.showCenter(context, state);

    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_input_send_${result.value?.key}',
    });
  }

  void _onImageLoaded(ImageInfo info, bool isCache) {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_input_send_image',
    });

    if (_lastSwitchImage == null) {
      _removeImageListener();
      return;
    }
    Log.d("_onImageLoaded $info");
    MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), _senderName, Session.icon));
    content.content = '[${K.chat_photo}]';
    content.extra = json.encode({
      'w': info.image.width.toInt(),
      'h': info.image.height.toInt(),
    });
    Im.sendImageMessage(widget.type, widget.targetId, content, _lastSwitchImage);
    widget.callbackBySend.call();

    _removeImageListener();
  }

  void _removeImageListener() async {
    await Future.delayed(const Duration(milliseconds: 1));
    if (_imageStreamListener != null) {
      _imageStream?.removeListener(_imageStreamListener!);
    }
    _imageStream = null;
  }

  void _closeExtend() {
    if (_quickReplyData != null) {
      widget.onQuickReplayShow(false);
    }
    setState(() {
      _extend = '';
    });
  }

  Widget _renderBottomPanel(BuildContext context, bool showTrueWord) {
    Widget child;
    switch (_extend) {
      case 'emote':
        child = EmotePanel(onEmoteClick: _sendEmote);
        break;
      case 'audio':
        child = RecorderPanel(onRecordSuccess: _sendVoice);
        break;
      case 'extend':
        child = _buildExtend(showTrueWord);
        break;
      case _EX_QUICK_REPLY:
        child = QuickReplyPanel(
          quickReplyData: _quickReplyData,
          onQuickReplyItemClick: _onQuickReplyItemClick,
        );
        break;
      default:
        child = Container(height: 0);
    }
    return AnimatedSize(
      duration: const Duration(
        milliseconds: 350,
      ),
      curve: Curves.fastOutSlowIn,
      child: child,
    );
  }

  void _onQuickReplyItemClick(QuickReply reply) {
    FocusScope.of(context).requestFocus(FocusNode());
    _closeExtend();

    if (reply.contentType == 0) {
      if (!Util.isStringEmpty(reply.img)) {
        _sendHttpImage(Util.getRemoteImgUrl(reply.img ?? ''), reply.imgWidth, reply.imgHeight);
        if (!Util.isStringEmpty(reply.content)) {
          _sendText(text: reply.content);
        }
      } else {
        _sendText(text: reply.content);
      }
    } else if (reply.contentType == 1) {
      Map<String, dynamic> map = {
        'base64': reply.audio,
        'duration': reply.duration,
        'uri': '',
      };
      _sendVoice(map);
    }
  }

  Widget _buildExtend(bool showTrueWord) {
    List<Widget> res = [];

    ///是否展示红包入口
    bool displayPackage = widget.chatGroupConfig != null && widget.chatGroupConfig!.groupPackage == 1;
    if (displayPackage) {
      res.add(
        ExtendItemWidget(
          icon: R.imagePath(darkMode ? 'chat_bottom_more_extend_package_dark.webp' : 'chat_bottom_more_extend_package.webp',
              package: ComponentManager.MANAGER_CHAT),
          title: K.red_envelope,
          onTapCallback: _onSendPackage,
        ),
      );
    }

    if (showTrueWord) {
      res.add(
        ExtendItemWidget(
          icon: R.imagePath(darkMode ? 'chat_bottom_more_extend_true_word_dark.webp' : 'chat_bottom_more_extend_true_word.webp',
              package: ComponentManager.MANAGER_CHAT),
          title: K.chat_true_word,
          onTapCallback: _onTrueWord,
        ),
      );
    }

    if ((widget.type == ConversationType.Private)) {
      res.add(
        ExtendItemWidget(
          icon: R.imagePath(darkMode ? 'chat_bottom_more_extend_tacit_dark.webp' : 'chat_bottom_more_extend_tacit.webp',
              package: ComponentManager.MANAGER_CHAT),
          title: K.chat_tacit,
          onTapCallback: () {
            _onTacit();
            if (!hasClickTacitButton) {
              hasClickTacitButton = true;
              Config.setBool('hasClickTacitButton', true);
            }
          },
          showRedPoint: !hasClickTacitButton,
        ),
      );
    }

    // 更换礼物
    bool giftSetEnable = (widget.chatCloudProfile?.giftSetEnable ?? 0) == 1 ? true : false;
    if (giftSetEnable) {
      res.add(
        ExtendItemWidget(
          icon: R.imagePath(darkMode ? 'chat_bottom_more_extend_change_gift_dark.webp' : 'chat_bottom_more_extend_change_gift.webp',
              package: ComponentManager.MANAGER_CHAT),
          title: K.chat_change_gift,
          onTapCallback: _onChangeGift,
        ),
      );
    }

    return Wrap(
      spacing: 8.0,
      runSpacing: 12.0,
      children: res,
    );
  }

  /// 默契问答
  void _onTacit() {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_input_Tacit',
    });
    TacitDialog.show(context, widget.targetId);
    Tracker.instance.track(TrackEvent.questions_click_entrance, properties: {
      'questions_click_entrance': 1,
    });
  }

  ///发红包
  _onSendPackage() {
    _closeExtend();
    PackageScreen.openPackageScreen(context, type: widget.type, targetId: widget.targetId);
  }

  _onSendGift() {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_input_gift',
    });
    _closeExtend();
    int uid = Util.parseInt(widget.targetId);
    IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    GiftScene giftScene = GiftScene.private;

    giftManager.showPrivateGiftPanel(context, uid: uid, fromChat: true, giftScene: giftScene);

    if (_showGiftRedPoint) {
      _showGiftRedPoint = false;
      Config.set(_giftKey, '1');
    }
  }

  _onClickSuggest() {
    if (mounted) {
      FocusScope.of(context).requestFocus(FocusNode());
      _textController.clear();
    }
  }

  Widget _renderBody() {
    bool displayAudio = true;
    bool displayTrueLove = true;
    bool displayGift = true;
    bool displayInvite = true;
    bool displayTrueWords = false; //真心话外显
    // bool showMore = !_isSystemUser;
    bool showMore = false;

    if (_isVipCustomerService) {
      //高级VIP专属客服
      displayTrueLove = false;
      displayGift = false;
      displayInvite = false;
      displayTrueWords = false;
    } else if (_isSystemUser) {
      displayAudio = false;
      displayTrueLove = false;
      displayGift = false;
      displayInvite = false;
      displayTrueWords = false;
    } else if (widget.type != ConversationType.Private) {
      displayTrueLove = false;
      displayGift = false;
      displayInvite = false;
    }

    if (Util.isAndroidVerify) {
      displayGift = false;
      displayInvite = false;
    }

    if (_isPartyGroup) _initAtTextSpanBuilder();

    IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    if (!Session.showSkill || chatManager.displayInvite() == false) {
      displayInvite = false;
    }
    int targetId = Util.parseInt(widget.targetId);
    String keyword = _textController.validText;
    // bool isGroup = ConversationType.isGroup(widget.type);
    bool isKeywordNotEmpty = keyword.isNotEmpty;
    // bool isFirstChat = widget.emtPresenter?.isFirstChat == true;
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0),
        if (widget.isAutoService && isKeywordNotEmpty)
          AutoChatServiceSuggest(service: targetId, keyword: keyword, onComplete: _onClickSuggest),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 100.0),
          child: Container(
              constraints: const BoxConstraints(minHeight: 48.0, maxHeight: 100.0),
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: darkMode ? Colors.transparent : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: darkMode ? const Color(0x33FFFFFF) : Colors.white, width: 0.5)),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                Expanded(
                  child: _isPartyGroup ? _buildExtendedTextField() : _buildNormalTextField(),
                ),
                _buildTrailButton()
              ])),
        ),
        Row(
          children: <Widget>[
            InputIconButton(
                icon: R.imagePath(
                    darkMode
                        ? 'chat_bottom_emote${_extend == 'emote' ? '_select' : ''}_dark.webp'
                        : 'chat_bottom_emote${_extend == 'emote' ? '_select' : ''}.webp',
                    package: ComponentManager.MANAGER_CHAT),
                selected: _extend == 'emote',
                width: 32.0,
                height: 32.0,
                onTap: () {
                  PulseLog.instance.event('click_event', properties: {
                    'click_tag': 'chat_input_emote',
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_extend == 'emote') {
                    _closeExtend();
                    return;
                  }

                  setState(() {
                    _extend = 'emote';
                  });
                }),
            if (widget.hidePic == false)
              InputIconButton(
                icon: R.imagePath(darkMode ? 'chat_bottom_pic_dark.webp' : 'chat_bottom_pic.webp', package: ComponentManager.MANAGER_CHAT),
                width: 32.0,
                height: 32.0,
                onTap: () {
                  PulseLog.instance.event('click_event', properties: {
                    'click_tag': 'chat_input_image',
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (Session.privateChatCountReachUpperLimit(dangerUser: widget.meDanger)) {
                    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
                    loginManager.openHighRiskUsersInterceptDialog(context);
                    return;
                  }
                  _switchImage();
                },
              ),
            if (displayAudio)
              InputIconButton(
                  selected: _extend == 'audio',
                  icon: R.imagePath(
                      darkMode
                          ? 'chat_bottom_voice${_extend == 'audio' ? '_select' : ''}_dark.webp'
                          : 'chat_bottom_voice${_extend == 'audio' ? '_select' : ''}.webp',
                      package: ComponentManager.MANAGER_CHAT),
                  width: 32.0,
                  height: 32.0,
                  onTap: () {
                    PulseLog.instance.event('click_event', properties: {
                      'click_tag': 'chat_input_audio',
                    });
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_extend == 'audio') {
                      _closeExtend();
                      return;
                    }
                    setState(() {
                      _extend = 'audio';
                    });
                  }),
            if (displayInvite)
              InputIconButton(
                icon: R.imagePath('chat_bottom_light.svg', package: ComponentManager.MANAGER_CHAT),
                selected: _extend == 'light',
                width: 32.0,
                height: 32.0,
                onTap: _onInvite,
              ),
            if (displayTrueWords)
              InputIconButton(
                icon: R.imagePath(darkMode ? 'chat_bottom_true_word_dark.webp' : 'chat_bottom_true_word.webp',
                    package: ComponentManager.MANAGER_CHAT),
                width: 32.0,
                height: 32.0,
                onTap: _onTrueWord,
              ),
            if (displayGift)
              InputIconButton(
                icon: Session.firstPay == 0
                    ? R.imagePath('ic_chat_first_charge.webp', package: ComponentManager.MANAGER_CHAT)
                    : R.imagePath(darkMode ? 'chat_bottom_gift_dark.webp' : 'chat_bottom_gift.webp',
                        package: ComponentManager.MANAGER_CHAT),
                width: 32.0,
                height: 32.0,
                showRedPoint: Session.firstPay == 0 ? false : _showGiftRedPoint,
                onTap: _onSendGift,
              ),
            if (showMore)
              InputIconButton(
                selected: _extend == 'extend',
                icon: R.imagePath(
                  _extend == 'extend'
                      ? (darkMode ? 'chat_bottom_more_close_dark.webp' : 'chat_bottom_more_close.webp')
                      : (darkMode ? 'chat_bottom_more_add_dark.webp' : 'chat_bottom_more_add.webp'),
                  package: ComponentManager.MANAGER_CHAT,
                ),
                width: 32.0,
                height: 32.0,
                showRedPoint: !hasClickExtendAfterAddTacit,
                onTap: () {
                  PulseLog.instance.event('click_event', properties: {
                    'click_tag': 'chat_input_extend_${_extend == 'extend'}',
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    _extend = _extend == 'extend' ? '' : 'extend';
                    if (!hasClickExtendAfterAddTacit) {
                      hasClickExtendAfterAddTacit = true;
                      Config.setBool('hasClickExtendAfterAddTacit', true);
                    }
                  });
                },
              )
          ],
        ),
        _renderBottomPanel(context, (displayTrueLove && !displayTrueWords)),
      ],
    );
  }

  /// partyGroup 支持@功能
  ExtendedTextField _buildExtendedTextField() {
    return ExtendedTextField(
      decoration: InputDecoration(
        hintText: _initTextFieldText(),
        border: InputBorder.none,
        hintStyle: TextStyle(color: R.colors.thirdTextColor, fontSize: 16),
        isDense: true,
        contentPadding: const EdgeInsetsDirectional.only(start: 16.0, end: 12.0),
      ),
      onAppPrivateCommand: (String action, Map map) {},
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 16.0, color: R.colors.mainTextColor),
      focusNode: _focusNode,
      controller: _textController,
      specialTextSpanBuilder: _isPartyGroup ? _textSpanBuilder : null,
      autocorrect: false,
      autofocus: false,
      maxLines: null,
      textInputAction: Platform.isIOS ? TextInputAction.send : TextInputAction.newline,
      onSubmitted: _onInputSubmit,
      onChanged: _onTextChanged,
      keyboardAppearance: Brightness.light,
    );
  }

  /// 常规输入框
  Widget _buildNormalTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: _initTextFieldText(),
        border: InputBorder.none,
        hintStyle: TextStyle(color: R.colors.thirdTextColor, fontSize: 16),
        isDense: true,
        contentPadding: const EdgeInsetsDirectional.only(start: 16.0, end: 12.0),
      ),
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 16.0, color: R.colors.mainTextColor),
      focusNode: _focusNode,
      controller: _textController,
      autocorrect: false,
      autofocus: false,
      maxLines: null,
      textInputAction: Platform.isIOS ? TextInputAction.send : TextInputAction.newline,
      onSubmitted: _onInputSubmit,
      onChanged: _onTextChanged,
      keyboardAppearance: Brightness.light,
    );
  }

  Widget _buildSendButton() {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 12.0),
      child: InkWell(
        onTap: _sendText,
        child: Container(
          width: 58.0,
          height: 32.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: R.colors.mainBrandGradientColors,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Text(
            K.chat_send,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _buildTrailButton() {
    bool hasText = !Util.isStringEmpty(_textController.value.text);

    bool joinBroker = Session.joinBroker;

    if (Platform.isIOS) {
      if (joinBroker) {
        return _buildQuickReplyButton();
      } else {
        return _buildPlaceholder();
      }
    } else if (Platform.isAndroid) {
      if (joinBroker) {
        if (hasText) {
          return _buildSendButton();
        } else {
          return _buildQuickReplyButton();
        }
      } else {
        if (hasText) {
          return _buildSendButton();
        } else {
          return _buildPlaceholder();
        }
      }
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return SizedBox(
      width: Platform.isAndroid ? 58.0 : 0,
      height: 32.0,
    );
  }

  Widget _buildQuickReplyButton() {
    if (_quickReplyData != null) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _onQuickReplyClick();
        },
        child: Container(
          height: 36,
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          margin: const EdgeInsetsDirectional.only(end: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: R.colors.mainBrandGradientColors,
            ),
          ),
          child: Center(
            child: Text(
              K.chat_quick_reply,
              style: TextStyle(
                color: R.colors.brightTextColor,
                fontSize: 13,
              ),
            ),
          ),
        ),
      );
    } else {
      return _buildPlaceholder();
    }
  }

  void _onQuickReplyClick() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_extend == _EX_QUICK_REPLY) {
      _closeExtend();
      return;
    }

    widget.onQuickReplayShow(true);

    setState(() {
      _extend = _EX_QUICK_REPLY;
    });
  }

  String _initTextFieldText() {
    if (ChatUtil.isVipCustomerService(Util.parseInt(widget.targetId)) || ChatUtil.isCustomerService(Util.parseInt(widget.targetId))) {
      ///客服咨询
      return K.chat_input_service_hintext;
    }

    return K.chat_input_hintext;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [_renderBody()];
    if (widget.enabled == false) {
      res.add(PositionedDirectional(
        start: 0.0,
        end: 0.0,
        top: 0.0,
        bottom: 0.0,
        child: Container(
          color: R.colors.mainBgColor,
          constraints: BoxConstraints(
            minWidth: Util.width,
          ),
          child: Center(
            child: Text(
              widget.reason,
              style: TextStyle(color: R.colors.secondTextColor),
            ),
          ),
        ),
      ));
    }
    res.add(const PositionedDirectional(start: 0.0, end: 0.0, top: 0.0, bottom: 0.0, child: Warning()));
    return Stack(
      children: res,
    );
  }

  void _handleAtInput(String text) async {
    if (_isPartyGroup && text.endsWith(_atStr)) {
      IGroupManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);
      ImGroupMember? member = await manager.openAtUserScreen(context, Util.parseInt(widget.targetId));
      if (member != null) {
        List<ImAtBean> atList = [ImAtBean(name: member.name ?? '', uid: member.uid)];
        String replaceAt = '';
        TextSelection textSelection = _textSelection!;
        final TextEditingValue value = _textController.value;
        String newText = value.text.replaceRange(textSelection.end - 1, textSelection.end, replaceAt);
        final textLength = replaceAt.length;
        _textSelection = textSelection.copyWith(
          baseOffset: textSelection.end - 1 + textLength,
          extentOffset: textSelection.end - 1 + textLength,
        );
        _textController.value = value.copyWith(text: newText, selection: _textSelection);
        insertATBeans(atList);
      }
    }
  }

  void insertATBeans(List<ImAtBean> atBeans) {
    _atBeans.addAll(atBeans);
    if (_atBeans.isEmpty) return;

    final text = atBeans.map((e) => e.atNameString()).toList().reduce((value, element) => value + element);
    final TextEditingValue value = _textController.value;
    final int start = value.selection.baseOffset;
    int end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = '';
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.safeSubstring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.safeSubstring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
        end = start;
      }
      _textController.value = value.copyWith(
          text: newText, selection: value.selection.copyWith(baseOffset: end + text.length, extentOffset: end + text.length));
    } else if (!_focusNode.hasFocus && _textSelection != null) {
      TextSelection textSelection = _textSelection!;
      String newText = value.text.replaceRange(textSelection.start, textSelection.end, text);
      final textLength = text.length;
      _textController.value = value.copyWith(
          text: newText,
          selection: textSelection.copyWith(
            baseOffset: textSelection.start + textLength,
            extentOffset: textSelection.start + textLength,
          ));
    } else {
      final allText = value.text + text;
      _textController.value = TextEditingValue(text: allText, selection: TextSelection.fromPosition(TextPosition(offset: allText.length)));
    }
  }

  String _getTailExtraStr() {
    Map extra = {'bubble_tail': widget.tails};
    return json.encode(extra);
  }

  String _getAtExtraStr() {
    if (Util.isCollectionEmpty(_atBeans)) {
      return '';
    }

    List<int> uids = [];
    for (var item in _atBeans) {
      uids.add(item.uid);
    }

    /// uid 包含-1表示@所有人
    bool atAll = uids.contains(-1);

    Map extra = {'userList': atAll ? [] : uids, 'mtype': atAll ? MentionType.MENTION_TYPE_ALL : MentionType.MENTION_TYPE_USERS};
    if (Util.validList(widget.tails)) {
      extra['bubble_tail'] = widget.tails;
    }
    return json.encode(extra);
  }

  @override
  void sendText({String? text}) {
    _sendText(text: text);
  }
}

class InputIconButton extends StatelessWidget {
  final String icon;
  final double width;
  final double height;
  final VoidCallback onTap;
  final bool selected;
  final bool showRedPoint;

  const InputIconButton({
    super.key,
    required this.icon,
    required this.width,
    required this.height,
    this.selected = false,
    required this.onTap,
    this.showRedPoint = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48.0,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: showRedPoint
                ? Stack(
                    alignment: AlignmentDirectional.center,
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Positioned(
                        child: renderIcon(),
                      ),
                      PositionedDirectional(
                        end: -2,
                        top: -2,
                        child: R.img(
                          BaseAssets.shared$redpoint_png,
                          width: 12.0,
                          height: 12.0,
                          package: ComponentManager.MANAGER_BASE_CORE,
                        ),
                      )
                    ],
                  )
                : renderIcon(),
          ),
        ),
      ),
    );
  }

  Widget renderIcon() {
    return R.img(icon, width: width, height: height);
  }
}

class ExtendItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTapCallback;
  final bool showRedPoint;

  const ExtendItemWidget({super.key, required this.icon, required this.title, required this.onTapCallback, this.showRedPoint = false});

  @override
  Widget build(BuildContext context) {
    if (showRedPoint) {
      return Stack(
        children: [
          buildBody(),
          PositionedDirectional(
            end: 13,
            top: 13,
            child: R.img(
              BaseAssets.shared$redpoint_png,
              width: 12.0,
              height: 12.0,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ],
      );
    }

    return buildBody();
  }

  Widget buildBody() {
    double itemWidth = (Util.width - 30) / 4.0;
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: itemWidth,
          height: itemWidth * (78 / 86.0),
          child: GestureDetector(
            child: R.img(icon, width: itemWidth, height: itemWidth * (66.0 / 86.0)),
            onTap: () {
              onTapCallback();
            },
          ),
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 2,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: R.colors.secondTextColor, height: 1),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class AutoChatServiceSuggest extends StatefulWidget {
  final int service;
  final String keyword;
  final VoidCallback onComplete;

  const AutoChatServiceSuggest({super.key, required this.service, required this.keyword, required this.onComplete});

  @override
  _AutoState createState() => _AutoState();
}

class _AutoState extends State<AutoChatServiceSuggest> {
  List _data = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  @protected
  void didUpdateWidget(AutoChatServiceSuggest oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.keyword != oldWidget.keyword) {
      if (_timer != null) {
        _timer?.cancel();
      }
      _timer = Timer(const Duration(milliseconds: 500), _load);
    }
  }

  _load() async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}auto/list?version=1",
          {
            'keyword': widget.keyword,
            'service': widget.service.toString(),
          },
          throwOnError: true);
      Map res = response.value();
      if (mounted && res['keyword'] == widget.keyword) {
        setState(() {
          _data = res['data'];
        });
      }
    } catch (e) {
      Log.d("load auto-server error");
      Log.d(e);
    }
  }

  Widget _renderText(String subject) {
    int start = subject.indexOf(widget.keyword);
    int end = start + widget.keyword.length;

    if (start == -1) {
      return Text(subject);
    }
    return Text.rich(
      TextSpan(children: <TextSpan>[
        TextSpan(text: subject.safeSubstring(0, start), style: TextStyle(fontFamily: Util.fontFamily)),
        TextSpan(text: subject.safeSubstring(start, end), style: TextStyle(color: const Color(0xFF05BCFF), fontFamily: Util.fontFamily)),
        TextSpan(text: subject.safeSubstring(end), style: TextStyle(fontFamily: Util.fontFamily))
      ]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_data.isEmpty) {
      return Container();
    }
    double showSize = _data.length <= 6 ? (0.0 + _data.length) : 5.5;
    return SizedBox(
      height: 30.0 * showSize,
      child: ListView(
        padding: const EdgeInsetsDirectional.only(start: 10.0),
        children: _data.map((dynamic val) {
          Map value = val;
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: GestureDetector(
              child: InkWell(
                onTap: () async {
                  int id = Util.parseInt(value['id']);
                  try {
                    await Xhr.postJson(
                        "${System.domain}auto/multiReply",
                        {
                          'id': id.toString(),
                          'service': widget.service.toString(),
                        },
                        throwOnError: true);
                  } catch (e) {
                    if (mounted) Toast.showCenter(context, e.toString());
                    return;
                  }
                  MessageContent content = MessageContent('text', SendUser(Session.uid.toString(), Session.name, Session.icon));
                  content.content = value['subject'];
                  content.extra = json.encode({
                    'type': 'auto-chat-reply',
                    'id': id,
                  });
                  content.sentStatus = 'SENT';
                  content.messageDirection = MessageDirection.Send;
                  content.objectName = MessageType.toObjectName(MessageType.Text);
                  content.sentTime = DateTime.now().millisecondsSinceEpoch;
                  MessageContent? localContent = await Im.insertMessage(ConversationType.Private, widget.service.toString(), content);
                  if (localContent != null) {
                    eventCenter.emit(Im.EventMessageSent, {'messageId': localContent.messageId, 'left': 1});
                  }
                  widget.onComplete();
                },
                child: Container(
                  height: 30.0,
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
                  child: _renderText(value['subject']),
                ),
              ),
            ),
          );
        }).toList(growable: false),
      ),
    );
  }
}

int _lastNum = 0;
int _lastRole = 0;
int _lastType = 0;
String _lastText = '';

class Warning extends StatefulWidget {
  const Warning({super.key});

  @override
  _WarningState createState() => _WarningState();
}

class _WarningState extends State<Warning> {
  int _num = _lastNum;
  int _role = _lastRole;
  int _type = _lastType;
  String _text = _lastText;
  bool _display = false;
  Timer? _timer;

  @override
  void initState() {
    eventCenter.addListener(Im.EventCmd, _onEvent);
    if (_num > 0) {
      _display = true;
      _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
    }
    super.initState();
  }

  @override
  void dispose() {
    eventCenter.removeListener(Im.EventCmd, _onEvent);
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }

  _onEvent(String type, dynamic data) {
    Map res = data;
    if (mounted && res.containsKey('name') && res.containsKey('data')) {
      if (res['name'] == 'chat.warning') {
        setState(() {
          _display = true;
          _num = 30;
          _role = Util.parseInt(res['data']['god']);
          _type = Util.parseInt(res['data']['type']);
          _text = Util.parseStr(res['data']['text']) ?? '';
          _lastNum = _num;
          _lastRole = _role;
          _lastType = _type;
          _lastText = _text;
        });
        if (_timer != null) {
          _timer?.cancel();
          _timer = null;
        }
        FocusScope.of(context).requestFocus(FocusNode());
        _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
      }
    }
  }

  _onTimer(Timer timer) {
    if (!mounted) return;
    if (_num <= 1) {
      if (_timer != null) {
        _timer?.cancel();
        _timer = null;
      }
      setState(() {
        _display = false;
        _num = 0;
        _role = 0;
        _type = 0;
        _text = '';
        _lastNum = _num;
        _lastRole = _role;
        _lastType = _type;
        _lastText = _text;
      });
    } else {
      setState(() {
        _num--;
        _lastNum = _num;
      });
    }
  }

  _onTap() {
    String page = _role > 0 ? 'k3' : 'k12';
    String title = K.help;
    BaseWebviewScreen.show(
      context,
      url: Util.getHelpUrlWithQStr(page),
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_display == false) {
      return Container();
    }
    String message = _role > 0 ? K.chat_skill_auth_user : K.chat_user_code_of_onduct;
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        color: R.colors.secondBgColor,
        padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Util.validStr(_text)
                  ? _buildWeChatTips(_text)
                  : _type == 1
                      ? _buildWeChatTips(K.chat_wechat_swindle_waring)
                      : _buildRichText(message),
            ),
            SizedBox(
              width: 40.0,
              child: Center(
                child: Text(
                  "${_num}s",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: R.colors.mainBrandColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRichText(String message) {
    return RichText(
      maxLines: 3,
      text: TextSpan(
          text: K.chat_content_notice([(Util.appName)]),
          style: TextStyle(
            color: R.colors.mainTextColor,
            fontSize: 14.0,
            fontFamily: Util.fontFamily,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "《$message》",
              style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                fontFamily: Util.fontFamily,
              ),
            ),
            TextSpan(
              text: "，${K.chat_maintain_platform_order}",
              style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 14.0,
                fontFamily: Util.fontFamily,
              ),
            )
          ]),
    );
  }

  Widget _buildWeChatTips(String text) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: R.colors.mainTextColor,
        fontSize: 14.0,
        fontFamily: Util.fontFamily,
      ),
    );
  }
}
