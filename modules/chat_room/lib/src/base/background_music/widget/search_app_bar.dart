import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const SearchAppBar({super.key, this.onChanged});

  @override
  State<SearchAppBar> createState() => _MusicSearchBarState();
}

class _MusicSearchBarState extends State<SearchAppBar> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onClearText() {
    _textEditingController.clear();
    widget.onChanged?.call('');
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: <Widget>[
          _buildSimpleLeading(context),
          _renderSearch(),
          const SizedBox(width: 3),
        ],
      ),
    );
  }

  Widget _buildSimpleLeading(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).maybePop();
      },
      child: Container(
        width: 32,
        height: kToolbarHeight,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(end: 8),
        child: R.img(
          'ic_titlebar_back.svg',
          package: ComponentManager.MANAGER_BASE_CORE,
          width: 24,
          height: 24,
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  Widget _renderSearch() {
    return Expanded(
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: R.color.secondBgColor,
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 15),
            R.img(
              RoomAssets.chat_room$music_icon_search_svg,
              width: 16,
              height: 16,
              color: R.color.thirdTextColor,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _textEditingController,
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  hintText: K.room_search_music,
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 2),
                ),
                autofocus: false,
                autocorrect: false,
                onChanged: widget.onChanged,
              ),
            ),
            const SizedBox(width: 8),
            _renderClearButton()
          ],
        ),
      ),
    );
  }

  Widget _renderClearButton() {
    if (_textEditingController.text.isNotEmpty) {
      return IconButton(
        iconSize: 16,
        icon: Icon(
          Icons.clear,
          color: R.color.thirdTextColor,
        ),
        onPressed: _onClearText,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
