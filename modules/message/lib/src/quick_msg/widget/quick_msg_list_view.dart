import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:message/src/quick_msg/model/quick_msg_item.dart';
import 'package:message/src/quick_msg/quick_msg_page.dart';

class QuickMsgListView extends StatefulWidget {
  final ValueChanged<Map> onSend;

  const QuickMsgListView({Key? key, required this.onSend}) : super(key: key);

  @override
  _QuickMsgListViewState createState() => _QuickMsgListViewState();
}

class _QuickMsgListViewState extends State<QuickMsgListView> {
  List<QuickMsgItem>? _msgList;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    DataRsp<List<QuickMsgItem>> response =
        await MessageRepo.quickMsgList(false);
    if (response.success == true) {
      _msgList = response.data;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Util.isCollectionEmpty(_msgList)) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 6, bottom: 6),
      child: _buildListRow(),
    );
  }

  Widget _buildListRow() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: _msgList!.length,
              itemBuilder: (ctx, index) {
                return _buildItem(_msgList![index]);
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await QuickMsgPage.show(context);
            _load();
          },
          child: Container(
            width: 68,
            height: 28,
            margin: const EdgeInsetsDirectional.only(start: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: R.colors.mainBrandGradientColors,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                R.img(
                  'ic_quick_msg_edit.svg',
                  package: ComponentManager.MANAGER_MESSAGE,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  K.msg_edit,
                  style: TextStyle(
                      fontSize: 12,
                      color: R.colors.brightTextColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(QuickMsgItem item) {
    if (item.isVoice) {
      String url = '';
      int duration = 0;
      try {
        Uri uri = Uri.parse(item.content ?? '');
        url = '${uri.origin}${uri.path}';
        duration = int.parse(uri.queryParameters['duration'] ?? '0');
      } catch (e) {}
      return _buildVoiceItem(url, duration);
    }
    return GestureDetector(
      onTap: () {
        widget.onSend({'type': 'text', 'text': item.content});
      },
      child: Container(
        height: 28,
        padding: const EdgeInsetsDirectional.only(
          start: 8,
          end: 8,
        ),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: R.colors.thirdBgColor,
            width: 1,
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 100,
          ),
          child: Text(
            item.content ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: R.colors.mainTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVoiceItem(String url, int duration) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.onSend({'type': 'voice', 'base64': url, 'duration': duration});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: R.colors.thirdBgColor,
          ),
        ),
        height: 28,
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 4),
            ClipOval(
              child: Container(
                width: 20,
                height: 20,
                color: R.colors.mainBgColor,
                child: R.img(
                  'home/sound_normal.svg',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  color: R.colors.mainBrandColor,
                ),
              ),
            ),
            const SizedBox(width: 9),
            Text(
              '${duration}s',
              textScaleFactor: 1.0,
              style: TextStyle(
                  fontSize: 12.0,
                  color: R.colors.mainBrandColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
