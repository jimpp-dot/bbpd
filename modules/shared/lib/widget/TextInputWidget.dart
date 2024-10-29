import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final String? content;
  final Color? focusColor;
  final ValueChanged<String>? contentChanged;
  final String? hintText;
  final TextInputType? textInputType;

  const TextInputWidget(
      {super.key,
      this.content,
      this.focusColor,
      this.contentChanged,
      this.hintText,
      this.textInputType = TextInputType.text});

  @override
  State<StatefulWidget> createState() {
    return _TextInputState();
  }
}

class _TextInputState extends State<TextInputWidget> {
  bool _focus = false;
  late TextEditingController _controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.content ?? '');
    focusNode = FocusNode();
    _controller.addListener(() {
      if (widget.contentChanged != null)
        widget.contentChanged!(_controller.text);
      setState(() {});
    });
    focusNode.addListener(() {
      setState(() {
        _focus = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 303,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(28)),
            border: Border.all(
                color: _focus ? R.color.mainBrandColor : R.color.dividerColor,
                width: 2)),
        child: TextField(
          controller: _controller,
          focusNode: focusNode,
          style: R.textStyle.body1
              .copyWith(color: R.color.mainTextColor, fontSize: 16),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              suffix: _buildClear(),
              hintText: widget.hintText,
              hintStyle: R.textStyle.inputHint
                  .copyWith(color: R.color.thirdTextColor, fontSize: 16)),
          textInputAction: TextInputAction.next,
          keyboardType: widget.textInputType ?? TextInputType.text,
          autofocus: true,
        ));
  }

  _buildClear() {
    bool isEmpty = _controller.text.isEmpty;
    return isEmpty
        ? null
        : GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: R.img('ic_clear.svg',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
            onTap: () => _controller.text = '',
          );
  }
}
