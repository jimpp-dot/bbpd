import 'package:shared/K.dart';
import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

class _CommonNotifyItem {
  final int type; // 0:text 1:图片
  final String text; // 图片地址/文本内容
  final Color color; // 色值
  final int width; // 图片宽度
  final int height; // 图片高度
  final bool isBold; // 是否加粗

  _CommonNotifyItem({
    required this.type,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
    required this.isBold,
  });

  bool get isImage => type == 1;
}

class _CommonNotifyData {
  final String? schema;
  final List<_CommonNotifyItem> list;

  _CommonNotifyData(this.schema, this.list);

  _CommonNotifyData.from(Map map)
      : schema = map['schema'],
        list = Util.parseList(
          map['content'],
          (e) => _CommonNotifyItem(
            type: Util.parseInt(e['type']),
            text: Util.parseStr(e['text']) ?? '',
            color: Util.parseColor(e['color'], Colors.white)!,
            width: Util.parseInt(e['width']),
            height: Util.parseInt(e['height']),
            isBold: Util.parseBool(e['isBold']),
          ),
        );
}

/// 通用的文本通知消息，文本列表 支持配置文本颜色
class CommonNotifyItemWidget extends StatefulWidget {
  final MessageContent message;

  const CommonNotifyItemWidget(this.message, {super.key});

  @override
  State<CommonNotifyItemWidget> createState() => _CommonNotifyItemWidgetState();
}

class _CommonNotifyItemWidgetState extends State<CommonNotifyItemWidget> {
  late _CommonNotifyData _data;

  @override
  void initState() {
    super.initState();
    _data = _CommonNotifyData.from(widget.message.extra?['data'] ?? {});
  }

  Future _onTap() async {
    if (_data.schema == null || _data.schema!.isEmpty) {
      return;
    }
    String schema = _data.schema!;
    try {
      Uri uri = Uri.parse(schema);
      Map<String, String> qps = uri.queryParameters;
      int rid = Util.parseInt(qps['rid']);
      bool confirm = Util.parseBool(qps['confirm']);
      String page = Util.parseStr(qps['page']) ?? '';
      if (rid > 0 && page == 'room') {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        if (roomManager.getRid() == rid) return;
        if (confirm && roomManager.isMic()) {
          bool? result = await _showOnMicDialog();
          if (result != true) {
            return;
          }
        }
      }
      SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, schema);
    } catch (e) {
      Log.d(e);
    }
  }

  Future<bool?> _showOnMicDialog() async {
    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(
            title: K.room_exit_to_new_room,
            negativeButton: NegativeButton(text: K.app_review_feedback_not));
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> spanList = [];
    for (_CommonNotifyItem item in _data.list) {
      if (item.text.isNotEmpty) {
        spanList.add(_parseSpan(item));
      }
    }
    if (spanList.isEmpty) return const SizedBox.shrink();
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Text.rich(TextSpan(children: spanList)),
    );
  }

  InlineSpan _parseSpan(_CommonNotifyItem item) {
    if (item.isImage) {
      int height = item.height > 0 ? item.height : 14;
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(item.text),
            width: item.width > 0 ? item.width.toDouble() : null,
            height: height.toDouble(),
            fit: item.width > 0 ? null : BoxFit.fitHeight,
          ),
        ),
      );
    } else {
      TextStyle style = messageTextStyle.copyWith(color: item.color);
      if (item.isBold) {
        style = style.copyWith(fontWeight: FontWeight.w600);
      }
      String text = item.text;
      return TextSpan(text: text.toCharacterBreakStr(), style: style);
    }
  }
}
