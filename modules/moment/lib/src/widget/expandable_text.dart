import 'dart:math';

import 'package:shared/shared.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/moment_notice_people.dart';

import '../../k.dart';

typedef OnNoticeUserTaped = void Function(MomentNoticePeople user);

/// 可展开文字
class ExpandableText extends StatefulWidget {
  final String? text;

  final int? maxLines;

  final TextStyle? style;

  final bool? expand;
  final bool showTag;

  final List<MomentNoticePeople>? atUsers;

  final GestureTapCallback? onTagTap;
  final OnNoticeUserTaped? onUserTaped;

  final MomentFlowPage? page; // 页面来源,数据上报
  final List<NormalTag>? tags;

  const ExpandableText({
    super.key,
    this.text,
    this.maxLines,
    this.style,
    this.expand,
    this.showTag = false,
    this.tags,
    this.onTagTap,
    this.onUserTaped,
    this.atUsers,
    this.page,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  String? get text => widget.text;

  int? get maxLines => widget.maxLines;

  TextStyle? get style => widget.style;

  late bool expand;

  List<InlineSpan> _spanItems = [];

  @override
  void initState() {
    super.initState();
    expand = widget.expand ?? true;
    _initTextSpan();
  }

  @override
  void didUpdateWidget(ExpandableText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text ||
        widget.atUsers != oldWidget.atUsers ||
        widget.tags != oldWidget.tags ||
        widget.style != oldWidget.style) {
      _initTextSpan();
    }
  }

  void _initTextSpan() {
    _spanItems = [];
    // 标签
    if (widget.showTag && _firstTag.isNotEmpty) {
      _spanItems.add(TextSpan(
        text: _firstTag,
        style: TextStyle(color: R.colors.tagTextV2Color, fontSize: 16),
        recognizer: TapGestureRecognizer()..onTap = widget.onTagTap,
      ));
    }

    List<int> chars = [];
    if (text != null && text!.isNotEmpty) {
      chars = text!.runes.toList();
    }

    if (widget.atUsers != null && widget.atUsers!.isNotEmpty) {
      bool hasSelf = false;
      int startPos = 0;
      for (MomentNoticePeople item in widget.atUsers!) {
        if (item.uid == Session.uid) {
          hasSelf = true;
        }

        int endPost = min(item.pos, chars.length);
        if (endPost > startPos) {
          List<int> subTextRunes = chars.sublist(startPos, endPost);
          String subString = String.fromCharCodes(subTextRunes);
          _spanItems.add(TextSpan(text: subString, style: style));
        }

        _spanItems.add(_buildNoticeUser(item));

        startPos = min(item.pos, chars.length);
      }

      if (chars.length > startPos) {
        List<int> subTextRunes = chars.sublist(startPos, chars.length);
        String subString = String.fromCharCodes(subTextRunes);
        _spanItems.add(TextSpan(text: subString, style: style));
      }

      if (hasSelf) {
        _spanItems.add(TextSpan(
          text: K.moment_notice_you,
          style: TextStyle(color: R.colors.mainBrandColor, fontSize: 14),
        ));
      }
    } else {
      _spanItems.add(TextSpan(text: text ?? '', style: style));
    }
  }

  InlineSpan _buildNoticeUser(MomentNoticePeople user) {
    TapGestureRecognizer recognizer = TapGestureRecognizer();
    recognizer.onTap = () {
      _onUserTaped(user);
    };
    return TextSpan(
      text: '@${user.name}',
      style: TextStyle(color: R.colors.tagTextV2Color, fontSize: 16),
      recognizer: recognizer,
    );
  }

  _onUserTaped(MomentNoticePeople user) {
    if (widget.onUserTaped != null) {
      widget.onUserTaped!(user);
    }
  }

  String get _firstTag {
    if (widget.tags != null && widget.tags!.isNotEmpty) {
      NormalTag normalTag = widget.tags![0];
      if (normalTag.tag != null && normalTag.tag!.isNotEmpty) {
        return '#${normalTag.tag}#';
      }
    }

    return '';
  }

  String get wholeWord {
    String wholeText = '';
    // 第一个标签
    if (widget.showTag) {
      wholeText += _firstTag;
    }

    // 文字内容
    wholeText += text ?? '';

    if (widget.atUsers != null && widget.atUsers!.isNotEmpty) {
      for (MomentNoticePeople item in widget.atUsers!) {
        wholeText += '@${item.name}';
      }
    }

    return wholeText;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(text: wholeWord, style: style);
        final tp = TextPainter(
            text: span, maxLines: maxLines, textDirection: TextDirection.ltr);
        tp.layout(maxWidth: size.maxWidth);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildRichText(expand),
            if (tp.didExceedMaxLines)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    expand = !expand;
                  });
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                      top: 4, start: 0, end: 8),
                  child: Text(
                    expand ? K.moment_fold : K.moment_expand,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: R.colors.mainBrandColor, fontSize: 14),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildRichText(bool expand) {
    if (_spanItems.isEmpty) return const SizedBox.shrink();
    if (expand) {
      return ExtendedText.rich(
        TextSpan(
          style: style,
          children: _spanItems,
        ),
      );
    }
    return ExtendedText.rich(
      TextSpan(
        style: style,
        children: _spanItems,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
