import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared/shared.dart';

import '../k.dart';

/// 搜索栏
class SearchBar extends StatefulWidget {
  final bool editable;
  final ValueChanged<String> onTextChange;
  final VoidCallback? onTap;
  final String? hintText;
  final bool showCancel;
  final VoidCallback? onCancelTap;
  final double height;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? searchIconColor;
  final int maxLength;
  final Widget? searchIcon;
  final Widget? deleteIcon;
  final bool showSearchIcon;
  final bool showLeftTextNum;
  final bool autoFocus;
  final ValueChanged<String>? onSubmitted;
  final EdgeInsetsGeometry padding;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? initialText;
  final BorderRadius? borderRadius;
  final bool suppDark;

  const SearchBar(
    this.onTextChange, {
    super.key,
    this.editable = true,
    this.onTap,
    this.hintText,
    this.showCancel = false,
    this.onCancelTap,
    this.height = 46,
    this.hintStyle,
    this.textStyle,
    this.bgColor,
    this.searchIconColor,
    this.maxLength = 30,
    this.searchIcon,
    this.deleteIcon,
    this.showSearchIcon = true,
    this.showLeftTextNum = false,
    this.autoFocus = false,
    this.onSubmitted,
    this.padding = EdgeInsetsDirectional.zero,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.initialText,
    this.borderRadius,
    this.suppDark = false,
  });

  @override
  SearchBarState createState() {
    return SearchBarState();
  }
}

class SearchBarState extends State<SearchBar> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  late StreamSubscription<bool> keyboardSubscription;

  int inputLength = 0;

  close() {
    _focusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      Log.d(visible);
      if (visible == false) {
        close();
      }
    });

    if (widget.initialText != null && widget.initialText!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        inputLength = widget.initialText!.length;
        setText(widget.initialText!);
      });
    }
  }

  @override
  void dispose() {
    close();
    _textEditingController.dispose();
    _focusNode.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  bool get _hasText {
    return _textEditingController.text.isNotEmpty;
  }

  void clearText() {
    setState(() {
      _textEditingController.clear();
    });
  }

  void setText(String text) {
    _textEditingController.text = text;
    _textEditingController.selection = TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: text.length));
    widget.onTextChange(_textEditingController.text);
    setState(() {});
  }

  void _onClearText() {
    setState(() {
      _textEditingController.clear();
    });
    widget.onTextChange(_textEditingController.text);
  }

  Widget buildActionButton() {
    if (!widget.editable) {
      return Container();
    } else if (widget.showLeftTextNum) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 8),
        child: Text(
          '$inputLength/${widget.maxLength}',
          style: TextStyle(
            fontSize: 13,
            color: widget.suppDark ? R.colors.thirdTextColor : R.color.thirdTextColor,
          ),
        ),
      );
    } else if (_hasText) {
      return IconButton(
        icon: widget.deleteIcon ?? R.img('ic_delete_small.svg', width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE),
        onPressed: _onClearText,
      );
    } else {
      if (widget.showCancel) {
        return Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              _focusNode.unfocus();

              if (widget.onCancelTap != null) {
                widget.onCancelTap!();
              } else {
                Navigator.pop(context);
              }
            },
            borderRadius: BorderRadius.circular(45),
            child: Container(
              height: widget.height,
              constraints: const BoxConstraints(minWidth: 46),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Center(
                child: Text(
                  K.cancel,
                  style: TextStyle(color: widget.suppDark ? R.colors.mainBrandColor : R.color.mainBrandColor, fontSize: 15),
                ),
              ),
            ),
          ),
        );
      }
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.showSearchIcon ? const EdgeInsetsDirectional.only(start: 10, end: 0) : widget.padding,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(widget.height / 2),
        color: widget.bgColor ?? (widget.suppDark ? R.colors.moduleBgColor : R.color.secondBgColor),
      ),
      height: widget.height,
      alignment: Alignment.center,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: widget.onTap,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.showSearchIcon)
                widget.searchIcon ??
                    R.img(
                      'icon_search.svg',
                      width: 18,
                      height: 18,
                      color: widget.searchIconColor ?? (widget.suppDark ? R.colors.thirdTextColor : R.color.thirdTextColor),
                      package: ComponentManager.MANAGER_SEARCH,
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: IgnorePointer(
                    ignoring: !widget.editable,
                    child: TextField(
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      keyboardType: widget.keyboardType ?? TextInputType.text,
                      textInputAction: widget.textInputAction ?? TextInputAction.done,
                      enableInteractiveSelection: true,
                      decoration: InputDecoration(
                        hintText: widget.hintText ?? '',
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: widget.hintStyle ??
                            TextStyle(color: widget.suppDark ? R.colors.thirdTextColor : R.color.thirdTextColor, fontSize: 15),
                        counterText: '',
                      ),
                      style: widget.textStyle ??
                          (widget.hintStyle ??
                              TextStyle(color: widget.suppDark ? R.colors.thirdTextColor : R.color.thirdTextColor, fontSize: 15)),
                      autofocus: widget.autoFocus,
                      autocorrect: false,
                      readOnly: !widget.editable,
                      onChanged: (String text) {
                        widget.onTextChange(text);
                        inputLength = text.length;
                        if (inputLength > widget.maxLength) {
                          inputLength = widget.maxLength;
                        }
                        if (widget.showLeftTextNum) {
                          setState(() {});
                        }
                      },
                      onSubmitted: (text) {
                        if (widget.onSubmitted != null) widget.onSubmitted!(text);
                      },
                      maxLength: widget.maxLength,
                    ),
                  ),
                ),
              ),
              buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
