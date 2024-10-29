import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:search/assets.dart';
import 'package:search/k.dart';

/// 搜索栏
class SearchBar extends StatefulWidget {
  final ValueChanged<String>? onTextChange;
  final bool editable;
  final bool suppDark;
  final VoidCallback? onTap;

  const SearchBar(this.onTextChange,
      {super.key, this.editable = true, this.suppDark = false, this.onTap});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _textEditingController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get _hasText => _textEditingController.text.isNotEmpty;

  Widget _buildClear() {
    if (!_hasText) return const SizedBox.shrink();

    return IconButton(
      padding: const EdgeInsets.all(0),
      icon: R.img(BaseAssets.shared$ic_delete_small_svg, width: 16, height: 16),
      onPressed: () {
        _textEditingController.clear();
        widget.onTextChange?.call(_textEditingController.text);
      },
    );
  }

  Widget _buildActionButton() {
    if (!widget.editable) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
          Navigator.pop(context);
        },
        child: Text(
          BaseK.K.cancel,
          style: TextStyle(
            color: widget.suppDark
                ? R.colors.mainTextColor
                : R.color.mainTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: widget.suppDark
                    ? R.colors.dividerColor
                    : Theme.of(context).inputDecorationTheme.fillColor,
              ),
              height: 36,
              alignment: Alignment.center,
              child: Material(
                type: MaterialType.transparency,
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Row(
                    children: <Widget>[
                      R.img(
                        Assets.search$icon_search_svg,
                        width: 16,
                        height: 16,
                        color: widget.suppDark
                            ? R.colors.thirdTextColor
                            : R.color.thirdTextColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: widget.editable
                            ? TextField(
                                controller: _textEditingController,
                                focusNode: _focusNode,
                                style: TextStyle(
                                    color: widget.suppDark
                                        ? R.colors.mainTextColor
                                        : R.color.mainTextColor,
                                    fontSize: 15,
                                    height: 1.1),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                enableInteractiveSelection: true,
                                decoration: InputDecoration(
                                  hintText: K.search_hint_keyword,
                                  isDense: true,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    color: widget.suppDark
                                        ? R.colors.thirdTextColor
                                        : R.color.thirdTextColor,
                                    fontSize: 13,
                                  ),
                                ),
                                autofocus: widget.editable,
                                autocorrect: false,
                                readOnly: !widget.editable,
                                onChanged: widget.onTextChange,
                              )
                            : Text(
                                K.search_hint_keyword,
                                style: TextStyle(
                                  color: widget.suppDark
                                      ? R.colors.thirdTextColor
                                      : R.color.thirdTextColor,
                                  fontSize: 13,
                                ),
                              ),
                      ),
                      _buildClear()
                    ],
                  ),
                ),
              ),
            ),
          ),
          _buildActionButton(),
        ],
      ),
    );
  }
}
