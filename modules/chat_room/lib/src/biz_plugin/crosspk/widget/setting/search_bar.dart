import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';

/// 搜索栏
class CrossPKSearch extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const CrossPKSearch({super.key, this.onChanged, this.onSubmitted});

  @override
  _CrossPKSearchState createState() {
    return _CrossPKSearchState();
  }
}

class _CrossPKSearchState extends State<CrossPKSearch> {
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
    widget.onChanged?.call(_textEditingController.text);
  }

  _onSubmitted(String value) {
    _focusNode.unfocus();
    widget.onSubmitted?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: const Color(0xFFF6F7F9),
      ),
      height: 36,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
            child: R.img(
              RoomAssets.chat_room$live_live_pk_search_webp,
              width: 16,
              height: 16,
              color: const Color(0xFF8A8A8A),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              focusNode: _focusNode,
              style: const TextStyle(color: Color(0xFF313131), fontSize: 15),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintStyle:
                    const TextStyle(color: Color(0xFFCECFD1), fontSize: 15),
                hintText: K.room_input_name_or_id_to_search,
              ),
              autofocus: false,
              autocorrect: false,
              maxLines: 1,
              onChanged: (text) {
                widget.onChanged?.call(_textEditingController.text);
              },
              onSubmitted: _onSubmitted,
            ),
          ),
          _buildClear(),
        ],
      ),
    );
  }

  Widget _buildClear() {
    if (_hasText) {
      return IconButton(
        padding: const EdgeInsets.all(0),
        icon: R.img(
          'ic_delete_small.svg',
          width: 16,
          height: 16,
          package: ComponentManager.MANAGER_BASE_CORE,
        ),
        onPressed: _onClearText,
      );
    }
    return const SizedBox.shrink();
  }
}
