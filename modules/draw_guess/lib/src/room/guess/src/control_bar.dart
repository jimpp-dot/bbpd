import 'package:shared/shared.dart' hide Config;
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

import 'base_painter.dart';
import 'config.dart';
import 'popup_selector.dart';
import 'selector_route.dart';

/// 控制条
class ControlBar extends StatefulWidget {
  final bool drawing;
  final String? prompt;
  final bool needBorder;

  const ControlBar(
      {super.key, this.drawing = false, this.prompt, this.needBorder = true});

  @override
  _ControlBarState createState() => _ControlBarState();
}

class _ControlBarState extends State<ControlBar> {
  final GlobalKey _penKey = GlobalKey();
  final GlobalKey _colorKey = GlobalKey();

  final Color _highlightColor = const Color(0xFF05BCFF);

  bool _penShowing = false;
  bool _paletteShowing = false;

  Config? _config;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _config = ShareConfig.of(context)?.config;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showPen() async {
    RenderBox? renderBox =
        _penKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    _penShowing = true;
    refresh();
    Offset position = renderBox.localToGlobal(Offset.zero);
    double width = 200;
    double height = 80;
    double left = 25;
    double top = position.dy - height - 12;
    await Navigator.of(context).push(SelectorRoute(
      child: PopupSelector(
        offset: Offset(left, top),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFFEFFBFF),
            borderRadius: BorderRadius.circular(6),
          ),
          child: _buildPens(),
        ),
      ),
    ));
    _penShowing = false;
    refresh();
  }

  void _showPalette() async {
    RenderBox? renderBox =
        _penKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    _paletteShowing = true;
    refresh();
    Offset position = renderBox.localToGlobal(Offset.zero);

    double width = 220;
    double height = 120;
    double left = 25;
    double top = position.dy - height - 12;
    await Navigator.of(context).push(SelectorRoute(
      child: PopupSelector(
        offset: Offset(left, top),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFFEFFBFF),
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: _buildPalette(),
        ),
      ),
    ));
    _paletteShowing = false;
    refresh();
  }

  Widget _buildPens() {
    List<Widget> widgets = [];
    strokeWidths.forEach((name, width) {
      bool selected = _config?.strokeWidth == width;
      widgets.add(
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (_config == null) return;
              UpdateConfigNotification(_config!.copyWith(strokeWidth: width))
                  .dispatch(context);
              Navigator.of(context).pop();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: selected
                        ? Border.all(
                            width: 2,
                            color: _highlightColor,
                          )
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: width,
                    height: width,
                    decoration: const BoxDecoration(
                      color: Color(0xFF242528),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: selected ? _highlightColor : const Color(0xFF242528),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Row(children: widgets);
  }

  Widget _buildPalette() {
    return GridView.count(
      crossAxisCount: 6,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: palette.map((color) {
        bool selected = _config?.paintColor == color;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (_config == null) return;
            UpdateConfigNotification(_config!.copyWith(paintColor: color))
                .dispatch(context);
            Navigator.of(context).pop();
          },
          child: Center(
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: selected
                    ? Border.all(width: 2, color: _highlightColor)
                    : null,
              ),
              alignment: Alignment.center,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 10, right: 10),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        border: widget.needBorder
            ? const Border(top: BorderSide(color: Color(0xFFEDEDED), width: 1))
            : null,
      ),
      child: Row(
        children: <Widget>[
          Visibility(
            visible: widget.drawing,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: GestureDetector(
                    onTap: _showPen,
                    child: R.img(
                      _penShowing
                          ? RoomAssets.chat_room$guess_ic_pen_highlight_png
                          : RoomAssets.chat_room$guess_ic_pen_png,
                      key: _penKey,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: GestureDetector(
                    onTap: _showPalette,
                    child: R.img(
                      _paletteShowing
                          ? RoomAssets.chat_room$guess_ic_color_highlight_png
                          : RoomAssets.chat_room$guess_ic_color_png,
                      key: _colorKey,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: GestureDetector(
                    onTap: () {
                      if (_config == null) return;
                      UpdateConfigNotification(
                        _config!.copyWith(
                            op: _config?.op == Operation.draw
                                ? Operation.erase
                                : Operation.draw),
                      ).dispatch(context);
                    },
                    child: R.img(
                      _config?.op == Operation.draw
                          ? RoomAssets.chat_room$guess_ic_eraser_png
                          : RoomAssets.chat_room$guess_ic_eraser_highlight_png,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: GestureDetector(
                    onTap: () => UndoNotification().dispatch(context),
                    child: R.img(RoomAssets.chat_room$guess_ic_undo_png,
                        width: 24, height: 24),
                  ),
                ),
              ],
            ),
          ),
          if (!Util.isStringEmpty(widget.prompt))
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  widget.prompt!,
                  style: const TextStyle(
                      color: Color(0xFF05BCFF), fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ].toList(),
      ),
    );
  }
}
