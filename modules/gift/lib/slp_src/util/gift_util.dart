import 'package:shared/shared.dart';
import 'package:gift/k.dart';

class GiftUtil {
  /// 根据礼物id获取甄选礼盒信息
  static OutstandingBoxInfo_BoxInfoItem? getSelectBoxInfo(
      List<OutstandingBoxInfo_BoxInfoItem>? list, int giftId) {
    if (list == null || list.isEmpty || giftId <= 0) return null;
    return list.firstWhereOrNull((e) => e.boxId == giftId);
  }

  static bool isBoxGift(
      List<OutstandingBoxInfo_BoxInfoItem>? list, int giftId) {
    if (list == null || list.isEmpty) return false;
    return list.indexWhere((e) => e.boxId == giftId) >= 0;
  }

  static List<String> getBoxGiftIcons(List<int>? ids, int boxId) {
    if (ids == null || ids.isEmpty) return [Util.giftImgUrl(boxId)];
    return ids.map((e) => Util.giftImgUrl(e)).toList();
  }

  static int getMaybeMaxCost(int userNum, int giftNum,
      List<OutstandingBoxInfo_BoxInfoItem>? list, int giftId) {
    if (userNum == 0) {
      // 避免未选中送礼人时显示0
      userNum = 1;
    }
    return userNum * giftNum * (getSelectBoxInfo(list, giftId)?.price ?? 0);
  }

  static String getMaybeMaxCostText(int userNum, int giftNum, int price) {
    if (userNum == 0) {
      userNum = 1;
    }
    return K.gift_maybe_max_cost(['${userNum * giftNum * price}']);
  }
}
