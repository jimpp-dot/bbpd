import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class LineSetting extends StatefulWidget {
  final String? label;
  final Widget? render;
  final String? message;
  final bool more;
  final VoidCallback? onTap;
  final bool borderBottom;
  final bool enabled;

  const LineSetting({
    super.key,
    this.label,
    this.message,
    this.more = false,
    this.borderBottom = true,
    this.onTap,
    this.render,
    this.enabled = true,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<LineSetting> {
  Widget _render() {
    if (widget.render == null) {
      return Expanded(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 12.0,
                ),
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  widget.message ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(height: 1.0, color: R.color.thirdTextColor),
                ),
              ),
            ),
            Container(
              child: Icon(
                Icons.keyboard_arrow_right,
                color: widget.onTap == null
                    ? R.color.thirdTextColor.withOpacity(0.5)
                    : R.color.thirdTextColor,
              ),
            )
          ],
        ),
      );
    } else {
      return Expanded(
        child: Container(
          alignment: AlignmentDirectional.centerEnd,
          child: widget.render,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
        ),
        constraints: const BoxConstraints(
          maxHeight: 50.0,
          minHeight: 50.0,
        ),
        decoration: widget.borderBottom
            ? BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                color: R.color.dividerColor,
                width: 0.0,
              )))
            : null,
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                widget.label ?? '',
                style: TextStyle(
                  fontSize: 14.0,
                  color: widget.enabled
                      ? R.color.mainTextColor
                      : R.color.thirdTextColor,
                ),
              ),
            ),
            _render()
          ],
        ),
      ),
    );
  }
}

typedef InputOnSubmit = Function(String value);

class LineInput extends StatefulWidget {
  final InputOnSubmit onSubmit;

  const LineInput({super.key, required this.onSubmit});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<LineInput> {
  late FocusNode _focusNode;
  final TextEditingController _textController =
      TextEditingController(text: K.base_holy_crap);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
  }

  _onFocus() {
    Log.d("focus --------------- ${_focusNode.hasFocus}");
  }

  _onSubmitted(String value) async {
    if (value.isEmpty) return;
    _textController.clear();
    widget.onSubmit(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 6.0,
        right: 6.0,
        bottom: 5.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: EditableText(
          textInputAction: TextInputAction.send,
          cursorColor: Theme.of(context).primaryColor,
          backgroundCursorColor: Theme.of(context).primaryColor,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 14.0, color: Colors.black, fontFamily: Util.fontFamily),
          textScaleFactor: 1.0,
          focusNode: _focusNode,
          controller: _textController,
          autocorrect: true,
          autofocus: true,
          onSubmitted: _onSubmitted,
          maxLines: 1,
        ),
      ),
    );
  }
}
