import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moment/k.dart';

import '../../moment.dart';

/// 动态评论输入
class CommentInput extends StatefulWidget {
  final String? hintText;
  final Comment? comment; // 回复的某一条评论，如果直接回复为 null
  final Moment moment;
  final MomentFlowPage page; // 页面来源
  final String? topicName;

  static Future<Comment?> showCommentInput(
    BuildContext context, {
    Key? key,
    required Moment moment,
    required String? hintText,
    required MomentFlowPage page,
    Comment? comment,
    String? topicName,
  }) {
    return displayModalBottomSheet(
      defineBarrierColor: Colors.black.withOpacity(0.01),
      context: context,
      builder: (BuildContext context) {
        return CommentInput(
          key: key,
          hintText: hintText,
          comment: comment,
          page: page,
          moment: moment,
          topicName: topicName,
        );
      },
    );
  }

  const CommentInput({
    super.key,
    required this.hintText,
    required this.moment,
    required this.page,
    this.comment,
    this.topicName,
  });

  @override
  _CommentInputState createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  static const int MAX_LENGTH = 300;
  static const int MAX_LINES = 30;

  late FocusNode _focusNode;
  final TextEditingController _textController = TextEditingController(text: '');

  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);

    String? last = CachedComment.instance.getComment(_getKey());
    if (last != null && last.isNotEmpty) {
      _textController.text = last;
    }
  }

  String _getKey() {
    if (widget.comment != null) {
      return '${widget.moment.topicId}_${widget.comment?.commentId ?? 0}';
    } else {
      return '${widget.moment.topicId}';
    }
  }

  @override
  void dispose() {
    _cacheComment();
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  _cacheComment() {
    String keyword = _textController.value.text;
    if (keyword.trim().isNotEmpty) {
      CachedComment.instance.putCachedComment(_getKey(), keyword);
    } else {
      CachedComment.instance.remove(_getKey());
    }
  }

  _onFocus() {
    Log.d("focus --------------- ${_focusNode.hasFocus}");
  }

  _onSubmitted(String? value) async {
    if (value == null || value.isEmpty) return;
    _sendText();
  }

  void _sendText() async {
    if (_sending) {
      return;
    }

    String keyword = _textController.value.text;
    if (keyword.isEmpty || keyword.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: K.comment_empty, gravity: ToastGravity.CENTER);
      return;
    }

    /// 敏感词效验
    bool hasSensitiveWords = trie.search(keyword);
    if (hasSensitiveWords) {
      Fluttertoast.showToast(
          msg: K.sensitive_words_warning, gravity: ToastGravity.CENTER);
      return;
    }

    _sending = true;
    DataRsp<Comment> response = await Api.postComment(
      widget.moment.topicId.toString(),
      widget.moment.uid,
      keyword,
      toUid: widget.comment?.uid,
    );
    _sending = false;
    if (response.success == true && response.data != null) {
      trackerReport(
          moment: widget.moment,
          page: widget.page,
          clickType: 'comment_success',
          topicName: widget.topicName);

      _textController.clear();
      response.data!.topicId = widget.moment.topicId;
      response.data!.content = keyword;
      response.data!.toName = widget.comment?.name;
      response.data!.toUid = widget.comment?.uid;

      CachedComment.instance.remove(_getKey());

      if (!mounted) {
        return;
      }

      Fluttertoast.showToast(
          msg: K.comment_success, gravity: ToastGravity.CENTER);
    } else {
      Fluttertoast.showToast(
          msg: response.msg ?? K.comment_faild, gravity: ToastGravity.CENTER);
    }

    if (mounted && Navigator.canPop(context)) {
      Navigator.of(context).pop(response.data);
    }
  }

  _onValueChanged(String value) {
    Log.d(value);
  }

  @override
  Widget build(BuildContext context) {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;

    String hintText = K.comment_hint;
    if (widget.hintText != null && widget.hintText!.isNotEmpty) {
      hintText = '${K.moment_reply} ${widget.hintText}:';
    }

    return GestureDetector(
      onTap: () {},
      child: Container(
        color: R.colors.mainBgColor,
        constraints: const BoxConstraints(maxHeight: 120, minHeight: 60),
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        margin: EdgeInsets.only(
          bottom: keyboard + ((keyboard == 0.0 && Util.isIphoneX) ? 34.0 : 0.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  color: R.colors.moduleBgColor,
                ),
                child: TextField(
                  onChanged: _onValueChanged,
                  cursorColor: R.colors.mainBrandColor,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: R.colors.thirdTextColor,
                        fontSize: 16,
                        fontFamily: Util.fontFamily),
                    isDense: true,
                    counterText: '',
                  ),
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: R.colors.mainTextColor,
                      fontFamily: Util.fontFamily),
                  focusNode: _focusNode,
                  controller: _textController,
                  autocorrect: false,
                  autofocus: true,
                  maxLength: MAX_LENGTH,
                  maxLines: MAX_LINES,
                  minLines: 1,
                  textInputAction: TextInputAction.newline,
                  onSubmitted: _onSubmitted,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(MAX_LENGTH)
                  ],
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  keyboardAppearance: Brightness.light,
                ),
              ),
            ),
            const SizedBox(width: 12),
            InkWell(
              onTap: _sendText,
              child: Container(
                width: 64,
                height: 30,
                decoration: BoxDecoration(
                  color: R.colors.mainBrandColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.comment_send,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 缓存评论
class CachedComment {
  final Map<String, String> _cachedComment = HashMap();

  static CachedComment? _instance;

  factory CachedComment() => _getInstance();

  static CachedComment get instance => _getInstance();

  CachedComment._internal();

  static CachedComment _getInstance() {
    _instance ??= CachedComment._internal();
    return _instance!;
  }

  void putCachedComment(String key, String value) {
    _cachedComment[key] = value;
  }

  String? getComment(String key) {
    if (_cachedComment.containsKey(key)) {
      return _cachedComment[key];
    }
    return null;
  }

  void remove(String key) {
    if (_cachedComment.containsKey(key)) {
      _cachedComment.remove(key);
    }
  }
}
