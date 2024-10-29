import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AtCupertinoTextSelectionControls extends CupertinoTextSelectionControls {
  final bool Function(String pastText)? shouldPast;
  final Function(String copyTexy)? copyText;

  AtCupertinoTextSelectionControls({this.shouldPast, this.copyText});

  @override
  void handleCut(TextSelectionDelegate delegate) {
    final TextEditingValue value = delegate.textEditingValue;
    final text = value.selection.textInside(value.text);
    if (text.isNotEmpty && copyText != null) copyText!(text);
    super.handleCut(delegate);
  }

  @override
  void handleCopy(TextSelectionDelegate delegate) {
    final TextEditingValue value = delegate.textEditingValue;
    final text = value.selection.textInside(value.text);
    if (text.isNotEmpty && copyText != null) copyText!(text);
    super.handleCopy(delegate);
  }

  @override
  Future<void> handlePaste(TextSelectionDelegate delegate) async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && shouldPast != null && !shouldPast!(data.text ?? '')) {
      delegate.hideToolbar();
      return;
    }

    super.handlePaste(delegate);
  }
}
