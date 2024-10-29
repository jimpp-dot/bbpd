import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/K.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:message/src/controller/message_page_controller.dart';
import 'package:get/get.dart';
import 'package:message/k.dart';
import 'package:message/src/messageItem.dart';

/// 消息搜索页
class MessageSearchPage extends StatefulWidget {
  static const routeName = '/MessageSearch';

  static bool showCategoryList = true;

  const MessageSearchPage({Key? key}) : super(key: key); //是否显示资质列表

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MessageSearchPage(),
      settings: const RouteSettings(name: MessageSearchPage.routeName),
    ));
  }

  @override
  _MessageSearchPageState createState() {
    return _MessageSearchPageState();
  }
}

class _MessageSearchPageState extends State<MessageSearchPage> {
  TextEditingController? _textEditingController;
  FocusNode? _focusNode;

  final CachedNames _cachedNames = CachedNames.instance();
  final MessagePageController messagePageController =
      Get.put<MessagePageController>(MessagePageController());

  final List<Conversation> _result = [];
  List<UserInfo> _totalUserInfo = [];

  bool _isLoading = false;
  Timer? _cancelTimer;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();

    _totalUserInfo = _cachedNames.data.values.toList();
    _init();
  }

  Future<void> _init() async {
    bool hasNew = false;
    for (var entry in messagePageController.normalData.entries) {
      if (!_cachedNames.data.containsKey(entry.key)) {
        hasNew = true;
        await _cachedNames.get(
            Util.parseInt(entry.value.targetId), entry.value.type,
            onlyCache: true);
      }
    }
    for (var entry in messagePageController.hiData.entries) {
      if (!_cachedNames.data.containsKey(entry.key)) {
        hasNew = true;
        await _cachedNames.get(
            Util.parseInt(entry.value.targetId), entry.value.type,
            onlyCache: true);
      }
    }
    for (var entry in messagePageController.accostData.entries) {
      if (!_cachedNames.data.containsKey(entry.key)) {
        hasNew = true;
        await _cachedNames.get(
            Util.parseInt(entry.value.targetId), entry.value.type,
            onlyCache: true);
      }
    }
    for (var entry in messagePageController.tempGroupData.entries) {
      if (!_cachedNames.data.containsKey(entry.key)) {
        hasNew = true;
        await _cachedNames.get(
            Util.parseInt(entry.value.targetId), entry.value.type,
            onlyCache: true);
      }
    }
    if (hasNew) {
      _totalUserInfo = _cachedNames.data.values.toList();
    }
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: R.colors.statusBarTheme == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Material(
        color: R.colors.homeBgColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildSearchBar(),
              _isLoading
                  ? const Padding(
                      padding: EdgeInsetsDirectional.only(top: 26.0),
                      child: Loading())
                  : _result.isEmpty
                      ? Padding(
                          padding: const EdgeInsetsDirectional.only(top: 120.0),
                          child: EmptyWidget(
                            textColor: R.colors.secondTextColor,
                          ))
                      : buildSearchResult(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(0.2),
              ),
              height: 40,
              alignment: Alignment.center,
              child: Material(
                type: MaterialType.transparency,
                child: Row(
                  children: <Widget>[
                    R.img(
                      'icon_search.svg',
                      width: 16,
                      height: 16,
                      color: R.colors.thirdTextColor,
                      package: ComponentManager.MANAGER_SEARCH,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        focusNode: _focusNode,
                        style: TextStyle(
                            color: R.colors.mainTextColor, fontSize: 15),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                          hintText: K.message_search_conversation_hint,
                          isDense: true,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: R.colors.thirdTextColor, fontSize: 13),
                        ),
                        autofocus: true,
                        autocorrect: false,
                        readOnly: false,
                        onChanged: _onQueryChanged,
                      ),
                    ),
                    _buildClear(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          buildActionButton(),
        ],
      ),
    );
  }

  Widget buildActionButton() {
    return InkWell(
      onTap: () {
        _focusNode?.unfocus();
        Navigator.maybePop(context);
      },
      child: Text(
        BaseK.K.cancel,
        style: TextStyle(
            color: R.colors.mainTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  bool get _hasText {
    return _textEditingController?.text.isNotEmpty == true;
  }

  Widget _buildClear() {
    if (_hasText) {
      return IconButton(
        padding: const EdgeInsets.all(0),
        icon: R.img('ic_delete_small.svg',
            width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE),
        onPressed: _onClearText,
      );
    }
    return const SizedBox();
  }

  void _onClearText() {
    _textEditingController?.clear();
    refresh();
    _search('');
  }

  Widget buildSearchResult(BuildContext context) {
    return Expanded(
      child: Listener(
        onPointerDown: (PointerDownEvent event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    List<Widget> widgets = _result.mapIndexed((i, conv) {
      bool isLast = (i == _result.length - 1);
      UserConfig? config = messagePageController.getUserConfig(conv);
      return MessageItem(
        key: ValueKey(conv.key),
        conv: conv,
        config: config,
        isLast: isLast,
        onChanged: messagePageController.onConversationOperate,
        onRemoveHiList: messagePageController.onRemoveHiList,
        onLongTap: () {},
        padding: 10.0,
        onHiTap: (type) {},
        onTap: () async {
          Navigator.pop(context);
          await Future.delayed(const Duration(milliseconds: 50));
        },
        refer: const PageRefer('MessagePageScreen'),
      );
    }).toList();

    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (context, index) => widgets[index],
      physics: const ClampingScrollPhysics(),
    );
  }

  void _onQueryChanged(String text) {
    Log.d("_onQueryChanged$text");
    _isLoading = true;
    refresh();
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  void _search(String query) {
    _result.clear();
    if (query.isEmpty) {
      _isLoading = false;
      refresh();
      return;
    }
    List<String> filterTargetIds = [];
    List<UserInfo> temps = [];
    temps.addAll(_totalUserInfo);
    for (var conv in temps) {
      if (conv.markName.contains(query) == true) {
        filterTargetIds.add('${conv.uid}');
      }
    }
    for (var uid in filterTargetIds) {
      String convKey = _getKey(ConversationType.Private, uid);
      Conversation? conv = messagePageController.normalData[convKey];
      conv ??= messagePageController.hiData[convKey];
      conv ??= messagePageController.accostData[convKey];
      if (conv == null) {
        convKey = _getKey(ConversationType.Group, uid);
        conv = messagePageController.tempGroupData[convKey];
      }
      if (conv != null) {
        _result.add(conv);
      }
    }
    _isLoading = false;
    refresh();
  }

  String _getKey(String type, String tId) {
    return '$type.$tId';
  }
}
