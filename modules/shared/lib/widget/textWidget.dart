// 封装的文本组件Widget
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final TextStyle? style;

  // 接收一个Key
  const TextWidget(Key? key, {this.style}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TextWidgetState();
}

class TextWidgetState extends State<TextWidget> {
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: widget.style,
    );
  }

  void onChanged(final String content) {
    if (!mounted) return;
    setState(() => _text = content);
  }
}
