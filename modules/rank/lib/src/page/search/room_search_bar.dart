import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';

/// 搜索栏
class RoomSearchBar extends StatefulWidget {
  final bool editable;
  final ValueChanged<String> onTextChange;
  final VoidCallback? onTap;

  const RoomSearchBar(this.onTextChange,
      {super.key, this.editable = true, this.onTap});

  @override
  _RoomSearchBarState createState() {
    return _RoomSearchBarState();
  }
}

class _RoomSearchBarState extends State<RoomSearchBar> {
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
        icon: R.img(BaseAssets.ic_delete_small_svg,
            width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE),
        onPressed: _onClearText,
      );
    }

    return Container();
  }

  Widget buildActionButton() {
    if (!widget.editable) {
      return Container();
    } else {
      return Padding(
          padding: const EdgeInsets.only(left: 14),
          child: InkWell(
            onTap: () {
              _focusNode.unfocus();
              Navigator.pop(context);
            },
            child: Text(
              R.string('cancel'),
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              color: Theme.of(context).inputDecorationTheme.fillColor,
            ),
            height: 36,
            alignment: Alignment.center,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: widget.onTap,
                child: Row(
                  children: <Widget>[
                    R.img(
                      Assets.ic_search_svg,
                      width: 16,
                      height: 16,
                      color: R.color.thirdTextColor,
                      package: ComponentManager.MANAGER_RANK,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: IgnorePointer(
                          ignoring: !widget.editable,
                          child: TextField(
                            controller: _textEditingController,
                            focusNode: _focusNode,
                            style: TextStyle(
                                color: R.color.mainTextColor, fontSize: 15),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            enableInteractiveSelection: true,
                            decoration: InputDecoration(
                              hintText: K.room_search_hint,
                              isDense: true,
                              border: InputBorder.none,
                            ),
                            autofocus: widget.editable,
                            autocorrect: false,
                            readOnly: !widget.editable,
                            onChanged: widget.onTextChange,
                          ),
                        ),
                      ),
                    ),
                    _buildClear()
                  ],
                ),
              ),
            ),
          )),
          buildActionButton(),
        ],
      ),
    );
  }
}
