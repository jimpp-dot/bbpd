import 'package:gift/k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:auto_size_text_field/auto_size_text_field.dart';
import '../gift_api.dart';

class SlpGiftTopInputText extends StatefulWidget {
  final String? text;

  const SlpGiftTopInputText({Key? key, this.text}) : super(key: key);

  @override
  SlpGiftTopInputTextState createState() => SlpGiftTopInputTextState();
}

class SlpGiftTopInputTextState extends State<SlpGiftTopInputText> {
  FocusNode? _focusNode;
  final TextEditingController _textController = TextEditingController(text: '');

  Timer? _cancelTimer;

  static String lastText = '';

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    if (!Util.isStringEmpty(lastText, trim: true)) {
      _textController.text = lastText;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode?.dispose();
  }

  _onSubmitted(String value) async {
    if (mounted) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
    _postTimer(value, duration: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      child: Container(
        height: 44.0,
        decoration: BoxDecoration(
          color: const Color(0xFF171621).withOpacity(0.7),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 12),
        child: Row(
          children: <Widget>[
            Text(
              K.gitf_bless_words,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildInput(),
            ),
            _buildCommitBtn(),
          ],
        ),
      ),
    );
  }

  Widget _buildCommitBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onSubmitted(_textController.value.text),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 12, start: 8),
        child: Container(
          width: 58,
          height: 28,
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: BorderRadius.circular(15.5),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            BaseK.K.sure,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      height: 30,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Colors.white.withOpacity(0.12),
      ),
      child: AutoSizeTextField(
        controller: _textController,
        focusNode: _focusNode,
        style: const TextStyle(color: Colors.white, fontSize: 13),
        keyboardType: TextInputType.text,
        maxLength: 22,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.done,
        enableInteractiveSelection: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: widget.text ?? '',
          isDense: true,
          border: InputBorder.none,
          counterText: '',
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.3),
            fontSize: 13,
            fontFamily: Util.fontFamily,
          ),
          isCollapsed: true,
        ),
        autofocus: false,
        autocorrect: false,
        readOnly: false,
        onSubmitted: _onSubmitted,
        onChanged: _onTextChanged,
      ),
    );
  }

  void _onTextChanged(String text) {
    lastText = text;
    _postTimer(text);
  }

  void _postTimer(String text, {int duration = 800}) {
    _cancelTimer?.cancel();
    _cancelTimer = Timer(Duration(milliseconds: duration), () => _check(text));
  }

  /// 敏感词检测
  void _check(String text) {
    if (Util.isStringEmpty(text, trim: true)) return;
    GiftApi.checkWords(text);
  }

  String getText() {
    return (!Util.isStringEmpty(_textController.text, trim: true)
            ? _textController.text
            : widget.text) ??
        '';
  }
}
