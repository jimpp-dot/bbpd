import 'package:shared/shared.dart';
import 'package:vip/src/pb/generated/vip_rpc_pretend.pb.dart';

extension PretendGroupDetailExt on PretendGroupDetail {
  PretendInfo? itemFor(int star, bool male) {
    for (var element in pretendList) {
      if (element.starNum == star) {
        if (!hasSex || element.sex == (male ? 1 : 2)) {
          return element;
        }
      }
    }
    return null;
  }

  PretendInfo? itemFoUnlockedTopStar(bool male) {
    List<PretendInfo> list = pretendListForSex(male);
    for (var element in list) {
      if (!element.isLock && (!hasSex || element.sex == (male ? 1 : 2))) {
        return element;
      }
    }
    return null;
  }

  List<PretendInfo> pretendListForSex(bool male) {
    if (!hasSex) {
      pretendList.sort((a, b) => a.starNum.compareTo(b.starNum));
      return pretendList;
    } else {
      List<PretendInfo> sexList = pretendList
          .where((element) => element.sex == (male ? 1 : 2))
          .toList();
      sexList.sort((a, b) => a.starNum.compareTo(b.starNum));
      return sexList;
    }
  }

  int starValue(int starNum) {
    switch (starNum) {
      case 1:
        return groupInfo.oneStarScore;
      case 2:
        return groupInfo.twoStarScore;
      case 3:
        return groupInfo.threeStarScore;
      default:
        return 0;
    }
  }

  PretendInfo? get usingState {
    if (!groupInfo.isUse) {
      // 没有在使用
      return null;
    }

    return itemFor(groupInfo.useStarNum, groupInfo.useSex == 1);
  }

  bool get hasSex {
    return groupInfo.sexState == 1;
  }

  bool get usingMale {
    if (groupInfo.sexState == 0) {
      // 没有在使用，使用用户的性别
      return Session.sex == 1;
    }
    return groupInfo.useSex == 1;
  }

  /// 已过期
  bool get isExpired {
    if (groupInfo.periodEnd == 0) {
      return false;
    }
    return groupInfo.periodEnd < DateTime.now().secondsSinceEpoch;
  }
}
