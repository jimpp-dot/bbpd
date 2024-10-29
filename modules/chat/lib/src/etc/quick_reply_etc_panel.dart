import 'package:chat/k.dart';
import 'package:chat/assets.dart';
import 'package:chat/src/quick_reply/model/quick_reply_repository.dart';
import 'package:chat/src/quick_reply/quick_reply_group_page.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:chat/src/quick_reply/widget/quick_reply_voice_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class QuickReplyEtcPanel extends StatefulWidget {
  final List<QuickReply>? cacheList;
  final ValueChanged<List<QuickReply>> onCacheChanged;

  const QuickReplyEtcPanel(
      {super.key, this.cacheList, required this.onCacheChanged});

  @override
  _QuickReplyEtcPanelState createState() => _QuickReplyEtcPanelState();

  static Future show(BuildContext context, List<QuickReply>? cacheList,
      ValueChanged<List<QuickReply>> onCacheChanged) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      builder: (BuildContext context) {
        return QuickReplyEtcPanel(
            cacheList: cacheList, onCacheChanged: onCacheChanged);
      },
    );
  }
}

class _QuickReplyEtcPanelState extends State<QuickReplyEtcPanel> {
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
    return Container(
      width: Util.width,
      height: Util.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.horizontal(
            start: Radius.circular(16), end: Radius.circular(16)),
        color: R.color.mainBgColor,
      ),
      padding: EdgeInsetsDirectional.only(bottom: 20 + Util.iphoneXBottom),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 46,
                alignment: AlignmentDirectional.center,
                child: Text(K.chat_tag_list,
                    style:
                        TextStyle(fontSize: 14, color: R.color.mainTextColor)),
              ),
              PositionedDirectional(
                end: 12,
                child: GestureDetector(
                  onTap: _toAddReply,
                  child: R.img(Assets.chat$ic_add_reply_webp,
                      width: 26, height: 26),
                ),
              ),
            ],
          ),
          Container(
              width: Util.width - 24, height: 0.5, color: R.color.dividerColor),
          Expanded(child: _buildBody()),
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
        itemCount: _replies.length,
        separatorBuilder: (context, index) => Container(
            width: Util.width, height: 0.5, color: R.color.dividerColor),
        itemBuilder: (context, index) => _buildItem(_replies[index]),
      );
    }
  }

  void _toAddReply() async {
    await QuickReplyGroupPage.launch(context);
    _reload();
  }

  Widget _buildItem(QuickReply item) {
    return InkWell(
      onTap: () => Navigator.pop(context, item.contentId),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(12),
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
