import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class WidgetUtils {
  WidgetUtils._();

  static Widget buildIconListTile(
      {Widget? title,
      Widget? leading,
      String subTitle = '',
      bool hasArrow = true,
      GestureTapCallback? onTap,
      EdgeInsetsGeometry? contentPadding,
      Widget? subTitleWidget}) {
    return ListTile(
      leading: leading,
      contentPadding: contentPadding != null
          ? EdgeInsets.symmetric(
              horizontal: contentPadding.horizontal,
              vertical: contentPadding.vertical)
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      dense: false,
      title: title,
      onTap: onTap,
      trailing: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            subTitleWidget ??
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 140),
                  child: Text(
                    subTitle,
                    style: R.textStyle.trailing,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
            Center(
              child: hasArrow
                  ? Icon(
                      Icons.keyboard_arrow_right,
                      color: R.color.thirdTextColor,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  /// 列表普通item
  static Widget buildListTile(String title,
      {Widget? leading,
      String subTitle = '',
      bool hasArrow = true,
      GestureTapCallback? onTap,
      EdgeInsetsGeometry? contentPadding,
      Widget? subTitleWidget}) {
    return buildIconListTile(
        title: Text(title, style: R.textStyle.subhead, maxLines: 1),
        contentPadding: contentPadding,
        onTap: onTap,
        subTitle: subTitle,
        hasArrow: hasArrow,
        leading: leading,
        subTitleWidget: subTitleWidget);
  }

  /// 带switch 的列表item
  static Widget buildSwitchListTile(
    String title,
    bool value, {
    ValueChanged<bool>? onChanged,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return MergeSemantics(
      child: ListTileTheme.merge(
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        selectedColor: R.color.mainBrandColor,
        child: ListTile(
          title: Text(title, style: R.textStyle.subhead),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            inactiveTrackColor: R.color.switchInActiveColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          dense: false,
          enabled: onChanged != null,
          onTap: onChanged != null
              ? () {
                  onChanged(!value);
                }
              : null,
          selected: value,
        ),
      ),
    );
  }

  static Widget buildDivider({EdgeInsetsGeometry? margin, double? height}) {
    return Container(
      height: height ?? 1.0,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      color: R.color.dividerColor,
    );
  }

  static Widget wrapperWithPadding(
      {Widget? child, EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }

  static Widget buildUserListIcon(String icon,
      {double? width, double? height, GestureTapCallback? onTap}) {
    return CommonAvatar(
        path: icon, size: width ?? 56, shape: BoxShape.circle, onTap: onTap);
  }

  static Widget buildUserName(String name, String uid) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
              maxWidth: Util.width - 30.5 - 18 - 40 - 35 - 10 - 200),
          child: Text(
            name,
            maxLines: 1,
            style: TextStyle(fontSize: 17.0, color: R.color.mainTextColor),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 3),
            child: IDWidget(
              uid: Util.parseInt(uid),
              fontSize: 14,
              fontColor: R.color.thirdTextColor,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}

class ListSectionWrapper extends StatelessWidget {
  final List<Widget> children;
  final bool isEnd;

  const ListSectionWrapper(
      {super.key, required this.children, this.isEnd = false});

  @override
  Widget build(BuildContext context) {
    if (isEnd) {
      children.add(WidgetUtils.buildDivider());
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
