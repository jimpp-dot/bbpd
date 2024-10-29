import 'package:shared/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class SettingItemWidget extends StatefulWidget {
  final double height;
  final String title;
  final String? trailingText;
  final Color? trailingTextColor;
  final Widget? trailingWidget;
  final VoidCallback? onClicked;
  final VoidCallback? onLongPressed;
  final double startMargin;
  final double endMargin;
  final bool showNextIcon;
  final Color? nextIconColor;
  final String? subTitle;
  final double? space;
  final Color? focusColor; //可为空
  final bool inAudit;
  final bool supportDark;

  const SettingItemWidget(
      {super.key,
      required this.title,
      this.trailingText,
      this.onClicked,
      this.onLongPressed,
      this.trailingWidget,
      this.height = 56,
      this.startMargin = 20.0,
      this.endMargin = 20.0,
      this.trailingTextColor,
      this.showNextIcon = true,
      this.nextIconColor,
      this.subTitle,
      this.space,
      this.focusColor,
      this.inAudit = false,
      this.supportDark = false});

  @override
  _SettingItemWidgetState createState() => _SettingItemWidgetState();
}

class _SettingItemWidgetState extends State<SettingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: widget.focusColor,
      onTap: () async {
        if (widget.onClicked != null && widget.showNextIcon) {
          widget.onClicked!();
        }
      },
      onLongPress: () {
        if (widget.onLongPressed != null) {
          widget.onLongPressed!();
        }
      },
      child: Container(
        height: widget.height,
        margin: EdgeInsetsDirectional.only(
            start: widget.startMargin,
            end: widget.endMargin,
            top: 0.0,
            bottom: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTitle(),
            SizedBox(
              width: widget.space ?? 48,
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (widget.trailingWidget != null) widget.trailingWidget!,
                  if (widget.trailingText != null)
                    Flexible(
                      child: Text(
                        Util.getEllipsisStr(widget.trailingText),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.trailingTextColor ??
                              (widget.supportDark
                                  ? R.colors.secondTextColor
                                  : R.color.secondTextColor),
                        ),
                      ),
                    ),
                  if (widget.showNextIcon)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8.0),
                      child: R.img(
                        'ic_next.svg',
                        width: 16,
                        height: 16,
                        package: ComponentManager.MANAGER_PROFILE,
                        color: widget.nextIconColor ??
                            (widget.supportDark
                                ? R.colors.secondTextColor
                                : R.color.secondTextColor),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    if (widget.subTitle != null && widget.subTitle!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  color: widget.supportDark
                      ? R.colors.mainTextColor
                      : R.color.mainTextColor,
                ),
              ),
              if (widget.inAudit) _inAuditWidget()
            ],
          ),
          Flexible(
            child: Text(
              widget.subTitle!,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12.0,
                color: widget.supportDark
                    ? R.colors.thirdTextColor
                    : R.color.thirdTextColor,
              ),
            ),
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.0,
              color: widget.supportDark
                  ? R.colors.mainTextColor
                  : R.color.mainTextColor,
            ),
          ),
          if (widget.inAudit) _inAuditWidget()
        ],
      ),
    );
  }

  /// 审核中
  Widget _inAuditWidget() {
    return Text(
      K.core_in_auditing,
      style: TextStyle(
        fontSize: 13.0,
        color: widget.supportDark
            ? R.colors.thirdTextColor
            : R.color.thirdTextColor,
      ),
    );
  }
}
