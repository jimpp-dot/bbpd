import 'package:chat/k.dart';
import 'package:chat/src/quick_reply/model/quick_reply_repository.dart';
import 'package:chat/src/quick_reply/quick_reply_group_page.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:chat/src/quick_reply/widget/quick_reply_voice_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class QuickReplyEtcFilterPanel extends StatefulWidget {
  final List<QuickReply>? cacheList;
  final ValueChanged<List<QuickReply>> onCacheChanged;

  const QuickReplyEtcFilterPanel(
      {super.key, this.cacheList, required this.onCacheChanged});

  @override
  _QuickReplyEtcFilterPanelState createState() =>
      _QuickReplyEtcFilterPanelState();

  static Future show(BuildContext context, List<QuickReply>? cacheList,
      ValueChanged<List<QuickReply>> onCacheChanged) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      builder: (BuildContext context) {
        return QuickReplyEtcFilterPanel(
            cacheList: cacheList, onCacheChanged: onCacheChanged);
      },
    );
  }
}

class _QuickReplyEtcFilterPanelState extends State<QuickReplyEtcFilterPanel> {
  bool _loading = true;
  String _err = '';
  final List<QuickReply> _replies = [];

  @override
  void initState() {
    super.initState();
    if (Util.validList(widget.cacheList)) {
      _replies.addAll(widget.cacheList!);
      _loading = false;
    } else {
      _loadData();
    }
  }

  void _loadData() async {
    DataRsp<QuickGroups> res = await QuickReplyRepository.loadGroups();
    _loading = false;
    if (res.success == true) {
      _replies.clear();
      for (var item in res.data?.groups ?? []) {
        _replies.addAll(item.replies);
      }
      if (_replies.isNotEmpty) {
        widget.onCacheChanged(_replies);
      }
    } else {
      _err = res.msg ?? '';
    }
    refresh();
  }

  void _reload() {
    _loading = true;
    _err = '';
    refresh();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: Util.height * 0.48,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.horizontal(
                    start: Radius.circular(16), end: Radius.circular(16)),
                color: R.color.mainBgColor,
              ),
              margin: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, bottom: 12),
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
              child: Column(
                children: [
                  Container(
                    height: 46,
                    alignment: AlignmentDirectional.center,
                    child: Text(K.chat_tag_filter,
                        style: TextStyle(
                            fontSize: 14, color: R.color.thirdTextColor)),
                  ),
                  Container(
                      width: Util.width - 48,
                      height: 0.5,
                      color: R.color.dividerColor),
                  Expanded(child: _buildBody()),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: Util.width - 24,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: R.color.mainBgColor),
              alignment: AlignmentDirectional.center,
              child: Text(K.chat_cancel_button, style: R.textStyle.regular16),
            ),
          ),
          SizedBox(height: 12 + Util.iphoneXBottom),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    } else if (_err.isNotEmpty) {
      return ErrorData(error: _err, onTap: _reload);
    } else if (_replies.isEmpty) {
      return EmptyWidget(
        paddingBottom: 0,
        size: 120,
        desc: K.chat_not_has_quickreply,
        onTap: _toAddReply,
      );
    } else {
      return ListView.separated(
        itemCount: _replies.length + 1,
        separatorBuilder: (context, index) => Container(
            width: Util.width, height: 0.5, color: R.color.dividerColor),
        itemBuilder: (context, index) =>
            index == 0 ? _buildAll() : _buildItem(_replies[index - 1]),
        padding: EdgeInsetsDirectional.zero,
      );
    }
  }

  void _toAddReply() async {
    await QuickReplyGroupPage.launch(context);
    _reload();
  }

  Widget _buildAll() {
    String str = K.chat_all;
    return InkWell(
      onTap: () => Navigator.pop(context, [0, str]),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
        child: Text(str,
            style: TextStyle(color: R.color.mainTextColor, fontSize: 14)),
      ),
    );
  }

  Widget _buildItem(QuickReply item) {
    return InkWell(
      onTap: () => Navigator.pop(context, [item.contentId, item.title]),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
        child: _renderItem(item),
      ),
    );
  }

  Widget _renderItem(QuickReply item) {
    String title;
    if (!Util.isStringEmpty(item.title)) {
      title = '${K.chat_quick_reply_title}: ${item.title}';
    } else {
      title = item.content ?? '';
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (item.contentType == 1)
          Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: Util.isStringEmpty(title) ? 0 : 8),
            child: QuickReplyVoiceWidget(
              audioPlay: AudioPlay.instance(),
              audioUrl: Util.getRemoteImgUrl(item.audio ?? ''),
              audioLen: item.duration,
              canDark: false,
            ),
          ),
        if (!Util.isStringEmpty(item.img))
          Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: Util.isStringEmpty(title) ? 0 : 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: Util.getUserIconUrl(item.img),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        if (!Util.isStringEmpty(title))
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: R.color.mainTextColor, fontSize: 14),
          ),
      ],
    );
  }
}
