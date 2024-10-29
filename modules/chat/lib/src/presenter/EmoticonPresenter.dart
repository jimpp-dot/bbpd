import 'dart:async';
import 'package:shared/shared.dart';
import 'package:chat/src/model/pbModel/generated/emoticon.pb.dart';
import 'package:chat/src/repo/emoticon_repo.dart';
import 'package:chat/src/util/chat_msg_util.dart';

/// 输入框上方表情功能实现Presenter
class EmoticonPresenter {
  /// 关键字最多只能是4个字
  final int keywordMaxSize = 4;

  /// 表情图片数据库仓库
  late EmoticonRepo _repo;

  /// 关键字传入N毫秒之后，发起加载表情请求
  final Duration taskDuration = const Duration(milliseconds: 210);

  /// 上一次请求，是否请求到数据
  bool _hasData = false;

  EmoticonPresenter() {
    _repo = EmoticonRepo(_dataCallback, _firstChatDataCallback);
  }

  /// 输入关键字，查询回调
  void _dataCallback(List<EmoticonSearchListItem>? images) {
    _hasData = (images?.isNotEmpty ?? false);
    if (_firstChat && _hasData) {
      _firstChat = false;
    }
    if (_callback != null) _callback!(images);
  }

  /// 推荐表情回调
  void _firstChatDataCallback(List<EmoticonSearchListItem>? images) {
    _hasData = (images?.isNotEmpty ?? false);
    if (_callback != null) _callback!(images);
  }

  OnResultCallback? _callback;

  /// 结果回调
  void setOnResultCallback(OnResultCallback callback) {
    _callback = callback;
  }

  bool _init = false;

  /// 初始化
  void init() {
    if (!_init) {
      _init = true;
      _repo.init();
    }
  }

  Timer? _timer;
  String _keyword = '';

  /// 加载表情，其中具体策略：
  /// 1、本次传入的关键字，与上一次传入的关键字一致，终止加载行为；
  /// 2、关键字传入N毫秒之后，发起加载
  void load(String? keyword) {
    if ((keyword?.length ?? 0) > keywordMaxSize) {
      _keyword = '';

      /// 清空表情列表
      _dataCallback([]);
      return;
    }
    if (_keyword == (keyword ?? '')) {
      return;
    }
    _keyword = keyword ?? '';
    if (_keyword == '') {
      /// 清空表情列表
      _dataCallback([]);
      return;
    }
    _cancelTimer();
    _timer = Timer(taskDuration, _request);
  }

  /// 加载第一次聊天表情数据（以前没给对方发过消息）
  void loadFirstChat() {
    if (_firstChat && !_hasData) {
      _cancelTimer();
      _timer = Timer(taskDuration, _requestFirstChat);
    }
  }

  /// 取消Timer
  void _cancelTimer() {
    if (_timer != null) {
      if (_timer!.isActive) _timer!.cancel();
      _timer = null;
    }
  }

  /// 请求表情
  void _request() {
    _repo.load(_keyword);
  }

  /// 请求推荐表情
  void _requestFirstChat() {
    _repo.loadFirst();
  }

  void clear() {
    _callback = null;
    _keyword = '';
    _cancelTimer();
  }

  /// 释放无用的资源
  void release() {
    _cancelTimer();
    _repo.release();
  }

  /// 表情列表右上方关闭按钮，显示/隐藏控制开关
  bool _shouldShowing = true;

  /// 表情列表右上方关闭按钮被点击后，需要出发本方法
  void closeShow() => _shouldShowing = false;

  /// 是否应该展示输入框上方的表情
  static bool _shouldShowEmoticonList(int targetId) {
    return ChatMsgUtil.is1V1(targetId);
  }

  /// 是否要展示表情列表控件
  bool shouldShow(int targetId) {
    /// 1、"不推荐动态表情"开关是关闭的；
    /// 2、没有点击表情列表右上方的关闭按钮；
    /// 3、用户符合私聊条件
    return !_closeEmoticon &&
        _shouldShowing &&
        _shouldShowEmoticonList(targetId);
  }

  /// 是否在设置中打开了"不推荐动态表情"开关
  bool _closeEmoticon = false;
  void setCloseEmoticon(bool closeEmoticon) {
    _closeEmoticon = closeEmoticon;
  }

  /// 是否为第一次聊天，true，表示第一次聊天（我没给对方发过消息）；false，非第一次聊天（以前发过消息）
  bool _firstChat = false;

  /// 设置为第一次聊天
  void setFirstChat() => _firstChat = true;

  /// 获取是否为第一次聊天标志
  bool get isFirstChat => _firstChat;

  /// 是否为小屏幕手机
  static bool get isSmallScreen => Util.height < 700;

  // bool _isEmoticonListShowing = false;

  /// 设置表情列表是否正在显示
  void emoticonListShowing(bool showing) {
    // _isEmoticonListShowing = showing;
  }

  /// 小屏手机，在表情列表上方是否隐藏"小心心"
  bool get shouldHideAboveGif => stateActive && _hasData && (Util.height < 667);

  bool stateActive = false;

  int? targetId;

  int? sex;

  void setTargetIdAndSex(int targetId, int sex) {
    this.targetId = targetId;
    this.sex = sex;
  }
}
