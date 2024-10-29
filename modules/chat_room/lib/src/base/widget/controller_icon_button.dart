import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:flutter/material.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';

class ControllerIconButton extends StatefulWidget {
  final bool disabled;
  final bool selected;
  final String? normalIcon;
  final String? normalIconUrl; // 由后台下发的图片链接，优先使用
  final int offset; // 礼物图标由于在视觉上显示超出其父布局，需要设置一个y轴偏移
  final String? selectedIcon;
  final String? disabledIcon;
  final String? type;
  final ControllerButtonClick? onClick;
  final VoidCallback? onDisabledClick;
  final ControllerOpenBagPannel? onOpenBag;

  final bool isNewStyle;
  final Color? backgroundColor; //背景色
  final Color? textColor; //文本颜色
  final int buttonType; // 0-图标按钮, 1-文字按钮, 2-图标 文字按钮
  final String? buttonText;
  final double textSize;
  final double? size;
  final Color? normalIconColor;
  final bool? isOval;
  final bool? isStatic;
  final bool iconShowRedPoint;
  final List<Color>? bgGradientColors;

  const ControllerIconButton({
    super.key,
    this.normalIcon,
    this.normalIconUrl,
    this.offset = 0,
    this.disabledIcon,
    this.selectedIcon,
    this.disabled = false,
    this.isStatic = false,
    this.isOval = true,
    this.selected = false,
    this.isNewStyle = false,
    this.backgroundColor,
    this.buttonType = 0,
    this.buttonText,
    this.textSize = 11,
    this.size,
    this.normalIconColor,
    this.onClick,
    this.onDisabledClick,
    this.type,
    this.onOpenBag,
    this.iconShowRedPoint = false,
    this.textColor,
    this.bgGradientColors,
  });

  @override
  _State createState() => _State();
}

class _State extends State<ControllerIconButton> {
  bool _disabled = false;
  bool _selected = false;

  double get _borderRadius => widget.size ?? 32;

  double get _size => widget.size ?? 32;

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
  void didUpdateWidget(ControllerIconButton old) {
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
    if (widget.type == 'gift' && widget.normalIconUrl != null && widget.normalIconUrl!.isNotEmpty) {
      // 首充礼包，礼物Icon由后台下发
      return _buildRemoteGift();
    }

    String icon = widget.normalIcon ?? '';
    int offset = widget.offset;
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
        borderRadius: BorderRadius.circular(_borderRadius),
        onTap: widget.onClick != null ? _onTap : null,
        child: _renderButton(widget.buttonType, icon: icon, color: color, offset: offset),
      ),
    );
  }

  Widget _renderButton(int buttonType, {required String icon, Color? color, required int offset}) {
    if (buttonType == 0) {
      return _renderIconButton(icon, iconColor: color, offset: offset);
    } else if (buttonType == 1) {
      return _renderTextButton();
    } else if (buttonType == 2) {
      return _renderIconTextButton(icon);
    } else if (buttonType == 3) {
      return _renderTextButtonWithLinearGradient();
    }

    return const SizedBox.shrink();
  }

  Widget _buildRemoteGift() {
    return InkWell(
      onTap: widget.onClick != null ? _onTap : null,
      child: CachedNetworkImage(
        imageUrl: widget.normalIconUrl,
        width: 40,
        height: 40,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _renderIconButton(String icon, {Color? iconColor, int offset = 0}) {
    return widget.isNewStyle
        ? SizedBox(
            width: _size,
            height: _size + offset * 2,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                widget.isStatic == true
                    ? const SizedBox.shrink()
                    : Container(
                        width: _size,
                        height: _size,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.backgroundColor ?? Colors.white.withOpacity(0.12),
                        )),
                PositionedDirectional(
                    bottom: widget.isStatic == true ? 0 : offset.dp,
                    child: _icon(icon,
                        width: _size,
                        height: _size + offset * 2,
                        color: _disabled ? Colors.white.withOpacity(0.2) : iconColor,
                        iconShowRedPoint: widget.iconShowRedPoint))
              ],
            ))
        : Center(
            child: _icon(icon, width: _size, height: _size, iconShowRedPoint: widget.iconShowRedPoint),
          );
  }

  Widget _renderTextButton() {
    return Container(
      width: widget.buttonText != null && widget.buttonText!.length == 3 ? _size + 24 : _size,
      height: _size,
      alignment: AlignmentDirectional.center,
      decoration: commonBoxDecorationWithParamsBeginAndEnd([Color(0xFFA6A6A6).withOpacity(0.2),Color(0xFF515151).withOpacity(0.2)], 12, Alignment.topCenter, Alignment.bottomCenter),
      child: Center(
        child: Text(
          widget.buttonText ?? '',
          style: messageTextStyle.copyWith(fontSize: widget.textSize, color: widget.textColor ?? Colors.white),
        ),
      ),
    );
  }

  Widget _renderTextButtonWithLinearGradient() {
    return Container(
      width: widget.buttonText != null && (widget.buttonText!.length == 3 || widget.isOval == false) ? _size + 20 : _size,
      height: _size,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(_size)),
        gradient: LinearGradient(
          colors: R.colors.darkGradientColors,
        ),
      ),
      child: Center(
        child: Text(
          widget.buttonText ?? '',
          style: messageTextStyle.copyWith(fontSize: widget.textSize, color: widget.textColor ?? Colors.white),
        ),
      ),
    );
  }

  Widget _icon(String file, {required double width, required double height, Color? color, bool iconShowRedPoint = false}) {
    if (iconShowRedPoint) {
      return Stack(children: [
        R.img(file, width: width, height: height, color: color, package: ComponentManager.MANAGER_BASE_ROOM, fit: BoxFit.contain),
        PositionedDirectional(
          end: 0,
          child: R.img(
            'redpoint.png',
            package: ComponentManager.MANAGER_BASE_CORE,
            width: 8 * Util.ratio,
            height: 8 * Util.ratio,
          ),
        ),
      ]);
    }
    return R.img(file, width: width, height: height, color: color, package: ComponentManager.MANAGER_BASE_ROOM, fit: BoxFit.contain);
  }

  Widget _renderIconTextButton(String? icon) {
    return Container(
      width: 24 + _size,
      height: _size,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        gradient: LinearGradient(
          colors: widget.bgGradientColors ?? [const Color(0XFFF4D238), const Color(0XFFEEAA35)],
        ),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && icon.isNotEmpty) _icon(icon, width: 18, height: 18),
            Text(
              widget.buttonText ?? '',
              style: messageTextStyle.copyWith(fontSize: widget.textSize, color: widget.textColor ?? Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
