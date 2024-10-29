import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class RoomUserProfileInfoItemWidget extends StatelessWidget {
  final String title;
  final double height;
  final List<Widget>? children;
  final IndexedWidgetBuilder? itemBuilder;
  final int itemCount;

  // 整个children统一点击处理
  final VoidCallback? childrenOnTap;

  const RoomUserProfileInfoItemWidget(
      {Key? key,
      required this.title,
      required this.height,
      this.children,
      this.itemBuilder,
      this.itemCount = 0,
      this.childrenOnTap})
      : super(key: key);

  Widget _buildTitle() {
    return Container(
      width: 71.0,
      height: height,
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsetsDirectional.only(start: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13.0,
          color: R.color.mainTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    if (children != null && children!.isNotEmpty) {
      return children!;
    } else if (itemBuilder != null && itemCount > 0) {
      return [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: itemBuilder!,
            itemCount: itemCount,
          ),
        )
      ];
    } else {
      return [const SizedBox()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTitle(),
          Expanded(
            child: Container(
              child: childrenOnTap == null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[..._buildContent()],
                    )
                  : GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: childrenOnTap,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[..._buildContent()],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
