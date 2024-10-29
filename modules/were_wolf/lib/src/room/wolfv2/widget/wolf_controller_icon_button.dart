import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

class WolfControllerIconButton extends StatefulWidget {
  final bool disabled;
  final bool selected;
  final String? normalIcon;
  final String? selectedIcon;
  final String? disabledIcon;
  final String? type;
  final ControllerButtonClick? onClick;
  final VoidCallback? onDisabledClick;
  final ControllerOpenBagPannel? onOpenBag;

  final bool isNewStyle;
  final Color? backgroundColor;
  final int buttonType; //0-图标按钮,1-文字按钮
  final String? buttonText;
  final double textSize;
  final Color? normalIconColor;

  const WolfControllerIconButton(
      {super.key,
      this.normalIcon,
      this.disabledIcon,
      this.selectedIcon,
      this.disabled = false,
      this.selected = false,
      this.isNewStyle = false,
      this.backgroundColor,
      this.buttonType = 0,
      this.buttonText,
      this.textSize = 11,
      this.normalIconColor,
      this.onClick,
      this.onDisabledClick,
      this.type,
      this.onOpenBag});

  @override
  _State createState() => _State();
}

class _State extends State<WolfControllerIconButton> {
  bool _disabled = false;
  bool _selected = false;

  @override
  void initState() {
    _disabled = widget.disabled;
    _selected = widget.selected;
    super.initState();

    if (widget.type == 'gift') {
      eventCenter.addListener('BagPannel.Open', _onBagOpen);
    }
  }

  @override
  void dispose() {
    super.dispose();

    if (widget.type == 'gift') {
      eventCenter.removeListener('BagPannel.Open', _onBagOpen);
    }
  }

  _onBagOpen(String type, dynamic value) async {
    if (widget.type == 'gift' && widget.onOpenBag != null) {
      widget.onOpenBag!(context);
    }
  }

  @override
  void didUpdateWidget(WolfControllerIconButton old) {
    super.didUpdateWidget(old);
    if (old.disabled != widget.disabled || old.selected != widget.selected) {
      setState(() {
        _disabled = widget.disabled;
        _selected = widget.selected;
      });
    }
  }

  void _onTap() {
    if (_disabled) {
      if (widget.onDisabledClick != null) {
        widget.onDisabledClick!();
      }
      return;
    }
    if (widget.onClick != null) {
      widget.onClick!(context, _selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    String? icon = widget.normalIcon;
    Color? color;
    if (_disabled && widget.disabledIcon != null) {
      icon = widget.disabledIcon!;
    } else if (_selected && widget.selectedIcon != null) {
      icon = widget.selectedIcon!;
    } else {
      color = widget.normalIconColor;
    }
    return Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(34),
            onTap: widget.onClick != null ? _onTap : null,
            child: widget.buttonType == 0
                ? _renderIconButton(icon!, iconColor: color)
                : _renderTextButton()));
  }

  Widget _renderIconButton(String icon, {Color? iconColor}) {
    return widget.isNewStyle
        ? Container(
            width: 34,
            height: 34,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.backgroundColor ?? Colors.white.withOpacity(0.2)),
            child: Center(
                child: _icon(icon,
                    width: 24,
                    height: 24,
                    color:
                        _disabled ? Colors.white.withOpacity(0.2) : iconColor)),
          )
        : Center(
            child: _icon(icon, width: 34, height: 34),
          );
  }

  Widget _renderTextButton() {
    return Container(
        width: 34,
        height: 34,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.backgroundColor ?? Colors.white.withOpacity(0.2)),
        child: Stack(
          children: <Widget>[
            R.img('controller_text_btn_bg.svg',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 34,
                height: 34),
            Center(
              child: Text(
                widget.buttonText!,
                style: messageTextStyle.copyWith(
                    fontSize: widget.textSize, color: Colors.white),
              ),
            )
          ],
        ));
  }

  Widget _icon(String file, {double? width, double? height, Color? color}) {
    if (file.endsWith('.svg')) {
      return SvgPicture.asset(
        file,
        width: width,
        height: height,
        fit: BoxFit.fill,
        color: color,
      );
    } else {
      return Image.asset(
        file,
        width: width,
        height: height,
        color: color,
      );
    }
  }
}
