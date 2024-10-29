import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  bool _isSimple = true;

  // for simple AppBar
  String? _title = '';
  String _actionTitle = '';
  VoidCallback? _onPressed;
  VoidCallback? _onBackPressedCallback;
  bool _showBack = true;

  // for custom AppBar
  double? _leadingWidth;
  Widget? _leading;
  double? _titleSpacing;
  Widget? _titleWidget;
  List<Widget>? _actions;

  PreferredSizeWidget? _bottom;

  Color? _backgroundColor;

  Brightness? _statusBrightness;
  Color? _actionColor;
  Color? _backColor;
  Color? _titleColor;
  TextStyle? _actionStyle;
  double _toolbarHeight = kToolbarHeight;
  bool suppDark;

  BaseAppBar(
    this._title, {
    super.key,
    String actionTitle = '',
    VoidCallback? onPressed,
    PreferredSizeWidget? bottom,
    VoidCallback? onBackPressedCallback,
    bool showBack = true,
    Color? actionColor,
    Color? backgroundColor,
    Color? backColor,
    Color? titleColor,
    Brightness? statusBrightness,
    TextStyle? actionStyle,
    double? toolbarHeight,
    this.suppDark = false,
  }) {
    _actionTitle = actionTitle;
    _onPressed = onPressed;
    _onBackPressedCallback = onBackPressedCallback;
    if (bottom != null) {
      _bottom = bottom;
    }
    _showBack = showBack;
    _backgroundColor = backgroundColor ?? (suppDark ? R.colors.homeBgColor : R.color.mainBgColor);
    _statusBrightness = statusBrightness ?? (suppDark ? (darkMode ? Brightness.dark : Brightness.light) : R.color.statusBarTheme);
    _actionColor = actionColor;
    _backColor = backColor;
    _titleColor = titleColor;
    _actionStyle = actionStyle;
    if (toolbarHeight != null && toolbarHeight > 0) {
      _toolbarHeight = toolbarHeight;
    }
  }

  BaseAppBar.custom({
    super.key,
    Widget? leading,
    double? leadingWidth,
    double? titleSpacing,
    Widget? title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Color? backgroundColor,
    bool showBack = true,
    bool showShape = true,
    VoidCallback? onBackPressedCallback,
    Brightness? statusBrightness,
    Color? backColor,
    double? toolbarHeight,
    this.suppDark = false,
  }) {
    _isSimple = false;
    _leadingWidth = leadingWidth;
    _leading = leading;
    _titleSpacing = titleSpacing;
    _titleWidget = title;
    _actions = <Widget>[];
    if (actions != null) {
      for (Widget widget in actions) {
        _actions?.add(DefaultTextStyle(
          style: TextStyle(fontFamily: Util.fontFamily, color: (suppDark ? R.colors.mainTextColor : null)),
          child: widget,
        ));
      }
    }
    _bottom = bottom;
    _showBack = showBack;
    _backgroundColor = backgroundColor ?? (suppDark ? R.colors.homeBgColor : R.color.mainBgColor);
    _statusBrightness = statusBrightness ?? (suppDark ? (darkMode ? Brightness.dark : Brightness.light) : R.color.statusBarTheme);
    _onBackPressedCallback = onBackPressedCallback;
    _backColor = backColor;
    if (toolbarHeight != null && toolbarHeight > 0) {
      _toolbarHeight = toolbarHeight;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _BaseAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (_bottom?.preferredSize.height ?? 0.0));
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget._toolbarHeight,
      titleSpacing: widget._titleSpacing,
      leadingWidth: widget._leadingWidth,
      leading: widget._isSimple || widget._leading == null ? _buildSimpleLeading(context) : widget._leading!,
      centerTitle: true,
      systemOverlayStyle: widget._statusBrightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      backgroundColor: widget._backgroundColor,
      title: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: widget._titleColor ?? (widget.suppDark ? R.colors.mainTextColor : R.color.mainTextColor)),
          child: widget._isSimple || widget._titleWidget == null
              ? Text(
                  widget._title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : widget._titleWidget!),
      actions: widget._isSimple || widget._actions == null ? _buildSimpleSingleTextAction() : widget._actions,
      bottom: widget._bottom,
      elevation: 0, //去掉Appbar底部阴影
    );
  }

  List<Widget> _buildSimpleSingleTextAction() {
    return <Widget>[
      Offstage(
        offstage: widget._actionTitle.isEmpty,
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(0.0)),
            child: ButtonTheme(
              minWidth: 36,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              buttonColor: R.color.mainBrandColor,
              disabledColor: R.color.thirdBgColor,
              child: TextButton(
                  onPressed: widget._onPressed,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontFamily: Util.fontFamily,
                      ),
                      child: Text(
                        widget._actionTitle,
                        style: widget._actionStyle ??
                            ((widget._actionColor != null)
                                ? R.textStyle.appBarAction.copyWith(color: widget._actionColor, fontFamily: Util.fontFamily)
                                : R.textStyle.appBarAction.apply(fontFamily: Util.fontFamily)),
                      ),
                    ),
                  )),
            )),
      )
    ];
  }

  Widget _buildSimpleLeading(BuildContext context) {
    if (!widget._showBack) {
      return Container();
    }

    return InkWell(
      onTap: () {
        if (widget._onBackPressedCallback != null) {
          widget._onBackPressedCallback!();
          return;
        }
        Navigator.of(context).pop();
      },
      child: Container(
        width: kToolbarHeight,
        height: kToolbarHeight,
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: R.img(
            'ic_titlebar_back.svg',
            package: ComponentManager.MANAGER_BASE_CORE,
            width: 24,
            height: 24,
            color: widget._backColor ?? (widget.suppDark ? R.colors.mainTextColor : R.color.mainTextColor),
          ),
        ),
      ),
    );
  }
}

class BaseAppBarBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  final Color? color;

  const BaseAppBarBackButton({super.key, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        onTap: () {
          if (onTap != null) {
            onTap!();
            return;
          }
          Navigator.of(context).pop();
        },
        child: Container(
          width: kToolbarHeight,
          height: kToolbarHeight,
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: R.img(
              'ic_titlebar_back.svg',
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 24,
              height: 24,
              color: color ?? R.color.mainTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
