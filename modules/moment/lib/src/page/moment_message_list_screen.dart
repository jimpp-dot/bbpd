import 'dart:async';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:shared/k.dart' as BaseK;
import 'package:shared/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:provider/provider.dart';

/// 动态、互动通知
class MomentMessageListScreen extends StatefulWidget {
  static Future openMessageListScreen(BuildContext context, {Key? key}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MomentMessageListScreen(key: key);
        },
        settings: const RouteSettings(name: '/moment_message_list'),
      ),
    );
  }

  const MomentMessageListScreen({super.key});

  @override
  _MomentMessageListScreenState createState() =>
      _MomentMessageListScreenState();
}

class _MomentMessageListScreenState extends State<MomentMessageListScreen> {
  final ScrollController _customScrollViewController = ScrollController();
  String? _errorMessage;

  List<MessageBean> _data = [];

  int _next = 0;
  bool _hasMore = false;
  bool _loading = true;
  bool _showDeleteUserTips = false;

  @override
  void initState() {
    super.initState();

    _customScrollViewController.addListener(_onScroll);
    _loadData(firstLoad: true);
  }

  @override
  void dispose() {
    _customScrollViewController.removeListener(_onScroll);
    _customScrollViewController.dispose();
    super.dispose();
  }

  _loadData({bool firstLoad = false}) async {
    DataRsp<MessagePage> response = await Api.getMessageList(_next);
    if (!mounted) return;
    if (response.success == true) {
      MessagePage? messagePage = response.data;
      if (messagePage != null) {
        if (messagePage.msgs.isNotEmpty) {
          _data.addAll(messagePage.msgs);
          // 记录最新的一条message id
          if (_next == 0 && messagePage.msgs.isNotEmpty) {
            Config.set('$MESSAGE_ID_KEY${Session.uid}',
                messagePage.msgs[0].id.toString());
          }
        }
        if (firstLoad) {
          _showDeleteUserTips = messagePage.showForbidTips;
        }
        _next = messagePage.next;
        if (_next != 0) {
          _hasMore = true;
        } else {
          _hasMore = false;
        }
      }
      context.read<ProfilePayload>().resetMomentMessage();
    } else {
      _errorMessage = response.msg;
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  _loadMore() async {
    if (!mounted) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
    });
    _loadData();
  }

  Future<void> _onRefresh() async {
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
    _next = 0;
    _errorMessage = null;
    await _loadData(firstLoad: true);
  }

  _onClearTaped() async {
    bool? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.message_tips,
            content: K.message_clear_all,
          );
        });
    if (result != null && result) {
      _clear();
    }
  }

  _clear() async {
    DataRsp response = await Api.clearMessage();
    if (response.success == true) {
      _data = [];
      _next = 0;
      _hasMore = false;
      if (mounted) {
        setState(() {});
      }
    } else {
      Fluttertoast.showToast(
          msg: response.msg ?? K.clear_message_failed,
          gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        title: Text(K.moment_message, style: R.textStyle.title),
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        actions: <Widget>[
          if (_data.isNotEmpty)
            InkWell(
              onTap: () => _onClearTaped(),
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                alignment: Alignment.center,
                child: Text(
                  K.message_clear,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainBrandColor,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading && _data.isEmpty) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: _onRefresh,
      );
    }

    if (_data.isEmpty) {
      return EmptyWidget(
          desc: K.no_message, textColor: R.colors.secondTextColor);
    }

    return CustomScrollView(
      controller: _customScrollViewController,
      slivers: [
        if (_showDeleteUserTips) const DeletedUserTips(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _buildMessages,
            childCount: _data.length,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _buildLoadMore(),
          ]),
        )
      ],
    );
  }

  Widget _buildMessages(BuildContext context, int index) {
    return MessageItem(bean: _data[index]);
  }

  _onScroll() {
    if (!_customScrollViewController.hasClients) return;

    if (_customScrollViewController.offset >=
            _customScrollViewController.position.maxScrollExtent - 40.0 &&
        _hasMore &&
        _loading == false) {
      _loadMore();
    }
  }

  /// 加载更多
  Widget _buildLoadMore() {
    Widget more;
    if (_errorMessage != null) {
      more = InkWell(
        onTap: _loadMore,
        child: Center(
          child: Text(
            "${_errorMessage!}, ${BaseK.K.click_to_retry}",
            style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
          ),
        ),
      );
    } else if (_hasMore) {
      more = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CupertinoActivityIndicator(animating: _loading),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 6.0),
            child: Text(
              BaseK.K.waitting_load,
              style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
            ),
          )
        ],
      );
    } else {
      more = Text(
        BaseK.K.not_any_more,
        style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
      );
    }

    return Container(
      height: 50.0,
      width: Util.width,
      alignment: Alignment.center,
      child: more,
    );
  }
}

/// 消息item
class MessageItem extends StatelessWidget {
  final MessageBean bean;

  const MessageItem({super.key, required this.bean});

  void _onMessageTaped(BuildContext context) {
    Tracker.instance.track(TrackEvent.interaction_message, properties: {
      'click_message': bean.type,
      'moment_id': bean.topicId,
    });
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentDetailScreen(context,
        parentPage: MomentFlowPage.InteractionMessage,
        topicId: bean.topicId,
        topicUid: bean.topicUid);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onMessageTaped(context),
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
        padding: const EdgeInsetsDirectional.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: R.color.dividerColor)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAvatar(
              path: bean.userIcon,
              size: 52,
              onTap: () => _gotoImageScreen(context),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            bean.displayName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: R.color.mainTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        if (bean.getMessageType == MessageType.Comment)
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 6.0),
                            child: Text(
                              bean.displayText,
                              style: TextStyle(
                                  color: R.color.thirdTextColor, fontSize: 13),
                            ),
                          ),
                      ],
                    ),
                    _buildContent(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        bean.publishTime,
                        style: TextStyle(
                            color: R.color.thirdTextColor, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildTrailing(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (bean.getMessageType == MessageType.Liked ||
        bean.getMessageType == MessageType.CommentLiked) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 8),
        child: Row(
          children: [
            R.img(
              'moment/ic_rush_like.webp',
              width: 20,
              height: 20,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
            const SizedBox(width: 4),
            Text(
              bean.displayText,
              style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
            ),
          ],
        ),
      );
    } else if (bean.getMessageType == MessageType.AtUser) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 8),
        child: Text(
          bean.displayText,
          style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 7.0),
        child: Text(
          bean.commentContent ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
        ),
      );
    }
  }

  Widget _buildTrailing() {
    if (bean.topicType == MomentType.picture ||
        bean.topicType == MomentType.video) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CachedNetworkImage(
          imageUrl: bean.getCover,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
      );
    } else if (bean.topicType == MomentType.audio) {
      return Container(
        width: 64,
        height: 64,
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            R.img(
              'ic_audio_yellow.svg',
              width: 64,
              height: 64,
              package: ComponentManager.MANAGER_MOMENT,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4.0, bottom: 2),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  bean.durationText,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (bean.topicType == MomentType.text) {
      return Container(
        width: 64,
        height: 64,
        padding: const EdgeInsetsDirectional.only(
            start: 6, end: 6, top: 4, bottom: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: R.color.secondBgColor,
        ),
        alignment: Alignment.center,
        child: Text(
          bean.topicContent ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          softWrap: true,
          style: TextStyle(
            color: R.color.thirdTextColor,
            fontSize: 13,
          ),
        ),
      );
    }
    return Container();
  }

  _gotoImageScreen(BuildContext context) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, bean.uid,
        refer: const PageRefer('MomentMessageListScreen'));
  }
}
