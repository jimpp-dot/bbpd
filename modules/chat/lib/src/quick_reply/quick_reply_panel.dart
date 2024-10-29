import 'package:chat/src/quick_reply/quick_reply_group_page.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:chat/src/quick_reply/widget/quick_reply_voice_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat/src/quick_reply/quick_reply_group_selector.dart';

import '../../k.dart';

typedef OnQuickReplyItemClick = Function(QuickReply reply);

class QuickReplyPanel extends StatefulWidget {
  final QuickGroups? quickReplyData;
  final OnQuickReplyItemClick onQuickReplyItemClick;

  const QuickReplyPanel(
      {super.key, this.quickReplyData, required this.onQuickReplyItemClick});

  @override
  _QuickReplyPanelState createState() => _QuickReplyPanelState();
}

class _QuickReplyPanelState extends State<QuickReplyPanel> {
  int _selectedGroupIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.quickReplyData == null) return const SizedBox.shrink();
    return _buildQuickReplyPanel();
  }

  Widget _buildQuickReplyPanel() {
    List<String> tags = [];

    if (widget.quickReplyData != null &&
        !Util.isCollectionEmpty(widget.quickReplyData!.groups)) {
      for (var item in widget.quickReplyData!.groups) {
        tags.add(item.name);
      }
    }
    tags.add('-1');
    bool isGroupEmpty = tags.length == 1;
    bool isSelectGroupEmpty = false;

    if (_selectedGroupIndex > widget.quickReplyData!.groups.length - 1) {
      _selectedGroupIndex = 0;
    }

    if (!isGroupEmpty) {
      isSelectGroupEmpty = Util.isCollectionEmpty(
          widget.quickReplyData!.groups[_selectedGroupIndex].replies);
    }

    return SizedBox(
      height: Util.height * 0.36,
      child: Column(
        children: [
          Container(
            height: 0.5,
            color: R.colors.dividerColor,
          ),
          QuickReplyGroupSelector(
            onGroupSelected: _onGroupSelected,
            tags: tags,
            selectedIndex: _selectedGroupIndex,
          ),
          Expanded(
              child: isGroupEmpty || isSelectGroupEmpty
                  ? EmptyWidget(
                      paddingBottom: 0,
                      size: 120,
                      desc: isGroupEmpty
                          ? K.chat_not_has_quickreply
                          : K.chat_not_has_quickreply_group,
                      onTap: () {
                        QuickReplyGroupPage.launch(context);
                      },
                    )
                  : ListView.builder(
                      itemBuilder: _buildQuickReplyItem,
                      itemCount: widget.quickReplyData!
                          .groups[_selectedGroupIndex].replies.length))
        ],
      ),
    );
  }

  Widget _buildQuickReplyItem(BuildContext context, int index) {
    QuickReply item =
        widget.quickReplyData!.groups[_selectedGroupIndex].replies[index];
    return InkWell(
        onTap: () {
          widget.onQuickReplyItemClick(item);
        },
        child: Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 12),
          child: _renderItem(item, index),
        ));
  }

  Widget _renderItem(QuickReply item, int index) {
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
        if (index > 0) Container(height: 1, color: R.colors.dividerColor),
        const SizedBox(height: 11),
        if (item.contentType == 1)
          Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: Util.isStringEmpty(title) ? 0 : 8),
            child: QuickReplyVoiceWidget(
              audioPlay: AudioPlay.instance(),
              audioUrl: Util.getRemoteImgUrl(item.audio ?? ''),
              audioLen: item.duration,
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
            style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }

  void _onGroupSelected(int index) {
    if (_selectedGroupIndex != index) {
      _selectedGroupIndex = index;
      setState(() {});
    }
  }
}
