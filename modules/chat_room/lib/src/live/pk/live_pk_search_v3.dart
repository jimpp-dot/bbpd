import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';

/// 搜索栏
class LivePkSearch extends StatefulWidget {
  final bool editable;
  final ValueChanged<String> onTextChange;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? clearText;

  const LivePkSearch(
    this.onTextChange, {
    Key? key,
    this.editable = true,
    this.onSubmitted,
    this.clearText,
  }) : super(key: key);

  @override
  State<LivePkSearch> createState() => _LivePkSearchState();
}

class _LivePkSearchState extends State<LivePkSearch> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

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

  bool get _hasText {
    return _textEditingController.text.isNotEmpty;
  }

  void _onClearText() {
    setState(() {
      _textEditingController.clear();
    });
    widget.onTextChange(_textEditingController.text);
  }

  Widget _buildClear() {
    if (_hasText) {
      return IconButton(
        padding: const EdgeInsets.all(0),
        icon: R.img('ic_delete_small.svg',
            width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE),
        onPressed: _onClearText,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildActionButton() {
    if (!widget.editable) {
      return const SizedBox.shrink();
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 8),
        child: InkWell(
          onTap: () {
            _focusNode.unfocus();
            if (_hasText) {
              widget.onSubmitted?.call(_textEditingController.text);
            }
          },
          child: Text(
            K.room_search,
            style: TextStyle(
              color: const Color(0xFF151516).withOpacity(0.6),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
  }

  _onSubmitted(String value) async {
    _focusNode.unfocus();
    widget.onSubmitted?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 4, end: 4, top: 10, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF6F7F9),
              ),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 12),
                  R.img(
                    RoomAssets.chat_room$live_live_pk_search_webp,
                    width: 16,
                    height: 16,
                    color: const Color(0xFF8A8A8A),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      style: const TextStyle(
                          color: Color(0xFF313131), fontSize: 15),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      enableInteractiveSelection: true,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Color(0xFF313131), fontSize: 13),
                      ),
                      autofocus: false,
                      autocorrect: false,
                      readOnly: !widget.editable,
                      // onChanged: _searchAction,
                      onSubmitted: _onSubmitted,
                    ),
                  ),
                  _buildClear(),
                ],
              ),
            ),
          ),
          _buildActionButton(),
        ],
      ),
    );
  }
}
