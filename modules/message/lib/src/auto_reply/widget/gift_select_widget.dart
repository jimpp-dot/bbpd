import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:message/src/auto_reply/model/auto_reply_item.dart';
import 'package:message/src/auto_reply/widget/gift_select_dialog.dart';

class GiftSelectWidget extends StatefulWidget {
  final AutoReplyItem item;

  const GiftSelectWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GiftSelectWidgetState();
  }
}

class _GiftSelectWidgetState extends State<GiftSelectWidget> {
  final int maxCount = 5;

  @override
  Widget build(BuildContext context) {
    int count = widget.item.giftIds != null ? widget.item.giftIds!.length : 0;
    double giftWidth = 48;
    if (count == 1) {
      giftWidth = 48;
    } else if (count == 2) {
      giftWidth = 48 * 2 + 5;
    } else if (count > 2) {
      giftWidth = 48 * 3 + 5 * 2;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        var data =
            await GiftSelectDialog.show(context, widget.item.giftIds, maxCount);
        if (data is List) {
          widget.item.giftIds = data as List<int>;
          setState(() {});
        }
      },
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                K.msg_selected_gift_num(['$count']),
                style: TextStyle(
                  fontSize: 14,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                K.msg_max_select_gift_num(['$maxCount']),
                style: TextStyle(
                  fontSize: 11,
                  color: R.colors.secondTextColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: giftWidth,
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return _buildGiftItem(widget.item.giftIds![index]);
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  width: 5,
                );
              },
              itemCount: count > 3 ? 3 : count,
            ),
          ),
          R.img(
            'ic_next.svg',
            color: R.colors.mainTextColor.withOpacity(0.2),
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_PROFILE,
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  Widget _buildGiftItem(int giftId) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: R.colors.secondBgColor,
        borderRadius: BorderRadiusDirectional.circular(9.6),
      ),
      alignment: AlignmentDirectional.center,
      child: CachedNetworkImage(
        placeholder: const CupertinoActivityIndicator(),
        imageUrl: '${System.imageDomain}static/$giftSubDir/$giftId.png',
        width: 40,
        height: 40,
        fit: BoxFit.contain,
        fadeInDuration: const Duration(microseconds: 0),
        fadeOutDuration: const Duration(microseconds: 0),
      ),
    );
  }
}
