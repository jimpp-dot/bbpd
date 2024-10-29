import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_beans.dart';

/// 点唱礼物设置
mixin JukeGiftListMixin<T extends StatefulWidget> on State<T> {
  List<JukeMusicGiftSetting>? giftList;
  JukeMusicGiftSetting? selectItem; // 选择的礼物
  int count = 0; // 选择礼物个数

  void setGiftData(List<JukeMusicGiftSetting> giftListData) {
    giftList = giftListData;
    if (giftList != null && giftList!.isNotEmpty) {
      for (JukeMusicGiftSetting item in giftList!) {
        if (item.giftCount > 0) {
          selectItem = item;
          break;
        }
      }
      selectItem ??= giftList![0];
      count = selectItem!.giftCount;
      if (count == 0) count = selectItem!.min;
    }
  }

  void addOne() {
    if (count >= selectItem!.max) {
      Fluttertoast.showToast(msg: K.room_juke_max_limit_tip);
      return;
    }
    setState(() {
      count++;
    });
  }

  void reduceOne() {
    if (count <= selectItem!.min) {
      Fluttertoast.showToast(
          msg: '${K.room_juke_min_limit_tip}${selectItem!.min}');
      return;
    }
    setState(() {
      count--;
    });
  }

  /// 选择礼物
  _switchGift(JukeMusicGiftSetting item) {
    if (item.giftId == selectItem?.giftId) {
      return;
    }
    selectItem = item;
    count = selectItem!.giftCount;
    if (count == 0) count = selectItem!.min;
    setState(() {});
  }

  Widget renderGiftList() {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 12.dp, end: 12.dp),
      scrollDirection: Axis.horizontal,
      itemBuilder: _renderGiftItem,
      itemCount: giftList?.length ?? 0,
    );
  }

  /// 礼物item
  Widget _renderGiftItem(BuildContext context, int index) {
    JukeMusicGiftSetting item = giftList![index];
    bool isSelected = item.giftId == selectItem?.giftId;
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 6.dp, end: 6.dp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _switchGift(item);
            },
            child: Container(
              width: 58.dp,
              height: 58.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: R.color.secondBgColor,
                borderRadius: BorderRadius.circular(12.dp),
              ),
              child: Stack(
                fit: StackFit.expand,
                alignment: AlignmentDirectional.center,
                children: [
                  if (isSelected)
                    Positioned.fill(
                      child: Container(
                        width: 58.dp,
                        height: 58.dp,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(12.dp),
                          border: Border.all(
                              color: const Color(0xFF60C8FF), width: 1.dp),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                      color: const Color(0xFF23CAFF),
                                      offset: Offset(0, 1.dp),
                                      blurRadius: 2.dp)
                                ]
                              : null,
                        ),
                      ),
                    ),
                  PositionedDirectional(
                    bottom: 0,
                    start: 0,
                    end: 0,
                    child: Container(
                      width: 58.dp,
                      height: 16.dp,
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsetsDirectional.only(bottom: 1.dp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12.dp),
                            top: Radius.circular(3.dp)),
                        color: Colors.black.withOpacity(0.2),
                      ),
                      child: Text(item.giftName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.dp,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  PositionedDirectional(
                      top: 4.dp,
                      width: 40.dp,
                      height: 40.dp,
                      child: CachedNetworkImage(
                        imageUrl: item.giftIcon,
                        width: 40.dp,
                        height: 40.dp,
                        fit: BoxFit.contain,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: 3.dp),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.giftPrice > 0 ? '${item.giftPrice}' : K.free,
                style: const TextStyle(
                    color: Color(0xFF62CAFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              if (item.giftPrice > 0) ...[
                SizedBox(width: 2.dp),
                R.img(MoneyConfig.moneyIcon, width: 12.dp, height: 12.dp),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
