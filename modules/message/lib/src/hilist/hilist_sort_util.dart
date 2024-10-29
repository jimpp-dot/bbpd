import 'package:message/src/hilist/hilist_filter_panel.dart';
import 'package:message/src/model/private_hilist_model.dart';
import 'package:shared/shared.dart';

class HiListSortUtil {
  static List<PrivateHiListModel> sortAndFilter(
      HiListFilterData data, List<PrivateHiListModel> originalData) {
    if (Util.isCollectionEmpty(originalData)) {
      return [];
    }

    List<PrivateHiListModel> resultList = [];

    for (int i = 0; i < originalData.length; i++) {
      PrivateHiListModel model = originalData[i];
      if (model.userInfo == null) {
        if (data.isAll()) {
          Log.d("HiListSortUtil ----add by all....");
          resultList.add(model);
        }
        continue;
      }

      if (data.onlyNewUser && !model.userInfo!.newUser) {
        continue;
      }

      if (data.sex == HiListFilterData.SEX_MALE &&
          model.userInfo!.sex != HiListFilterData.SEX_MALE) {
        continue;
      }

      if (data.sex == HiListFilterData.SEX_FEMALE &&
          model.userInfo!.sex != HiListFilterData.SEX_FEMALE) {
        continue;
      }
      resultList.add(model);
    }

    resultList.sort((a, b) {
      if (data.sort == HiListFilterData.SORT_TIME) {
        return b.conversation.sentTime.compareTo(a.conversation.sentTime);
      } else if (data.sort == HiListFilterData.SORT_VIP) {
        return b.userInfo!.vip.compareTo(a.userInfo!.vip);
      } else if (data.sort == HiListFilterData.SORT_POPULAR) {
        return b.userInfo!.popularity.compareTo(a.userInfo!.popularity);
      } else if (data.sort == HiListFilterData.SORT_ACTIVE) {
        return b.userInfo!.onlineDateline.compareTo(a.userInfo!.onlineDateline);
      }
      return 1;
    });

    return resultList;
  }

  static const LIMIT = 50;

  static List<List<String>> groupIds(List<String> uids) {
    List<List<String>> groupIds = [];
    while (uids.length > LIMIT) {
      groupIds.add(uids.sublist(0, LIMIT));
      uids = uids.sublist(LIMIT);
    }

    if (uids.isNotEmpty) {
      groupIds.add(uids);
    }

    for (var element in groupIds) {
      Log.d("groupIds for hilist and item = $element");
    }
    return groupIds;
  }
}
