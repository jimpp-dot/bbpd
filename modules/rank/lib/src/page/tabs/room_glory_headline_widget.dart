import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/page/tabs/room_glory_headline_center_page.dart';

/// 荣耀头条
class RoomGloryHeadlineWidget extends StatefulWidget {
  final AwakeFrontPageRsp_Data? gloryHeadlineData;
  const RoomGloryHeadlineWidget({super.key, this.gloryHeadlineData});

  @override
  State<RoomGloryHeadlineWidget> createState() =>
      _RoomGloryHeadlineWidgetState();
}

class _RoomGloryHeadlineWidgetState extends State<RoomGloryHeadlineWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gloryHeadlineData == null ||
        widget.gloryHeadlineData!.list.isEmpty) {
      return const SizedBox.shrink();
    }

    List<Widget> rows = [];
    for (int i = 0; i < widget.gloryHeadlineData!.list.length; i++) {
      AwakeFrontPageRsp_Data_Item item = widget.gloryHeadlineData!.list[i];
      rows.add(_buildContentWidget(item));
      rows.add(const SizedBox(
        width: 80,
      ));
      rows.add(_buildContentWidget(item));
      if (i != widget.gloryHeadlineData!.list.length - 1) {
        rows.add(const SizedBox(
          width: 80,
        ));
      }
    }

    return GestureDetector(
      onTap: () {
        RoomGloryHeadlineCenterPage.show(context);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          R.img(
            darkMode
                ? Assets.rank$glory_headline_bg_dark_webp
                : Assets.rank$glory_headline_bg_webp,
            width: 343.dp,
            height: 36.dp,
          ),
          PositionedDirectional(
            start: 72.dp,
            top: 0,
            end: 0,
            bottom: 0,
            child: MarqueeWidget(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: rows,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentWidget(AwakeFrontPageRsp_Data_Item item) {
    TextStyle style = TextStyle(
      color: darkMode
          ? Colors.white.withOpacity(0.9)
          : Colors.black.withOpacity(0.9),
      fontSize: 13.dp,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${K.congratulation}【',
          style: style,
        ),
        Text(
          '${item.name}】',
          style: style,
        ),
        Text(
          K.gift_awake_success,
          style: style,
        ),
        Text(
          '【${item.giftName}】',
          style: style,
        ),
        CachedNetworkImage(
            imageUrl: Util.giftImgUrl(item.gid),
            width: 20,
            height: 20,
            suffix: Util.squareResizeSuffix(60)),
      ],
    );
  }
}
