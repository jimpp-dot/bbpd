import 'package:shared/shared.dart';

import 'package:shared/model/liveListRsp.dart';
import 'homeTab.dart';

class HomeMainRsp {
  bool success = false;
  bool isVerify = false;
  bool more = false;
  List<HomeTab> tabs = [];
  List<ListItem> recommendItems = [];
  List<BannerItemData> banners = [];
  int bannerPosition = 0;

  HomeMainRsp.fromJson(Map json) {
    success = Util.parseBool(json['success']);
    isVerify = Util.parseBool(json['ok']);
    more = Util.parseBool(json['more']);
    tabs = Util.parseList(json['tab'], (e) => HomeTab.fromJson(e));

    if (json.containsKey('data')) {
      List? dataList = json['data'];

      dataList?.forEach((dataItem) {
        Map itemMap = dataItem as Map;
        String tpl = Util.parseStr(itemMap['tpl']) ?? '';
        if (tpl == 'user') {
          List? listData = itemMap['data'];
          listData?.forEach((element) {
            ListItem item = ListItem.fromJson(element);
            recommendItems.add(item);
          });
        } else if (tpl == 'banner') {
          List? bannerList = itemMap['data'];
          bannerPosition = Util.parseInt(itemMap['position']);
          bannerList?.forEach((element) {
            BannerItemData banner = BannerItemData.fromJson(element);
            banners.add(banner);
          });
        }
      });
    }
  }
}

class HomeMainXhrRsp {
  HomeMainRsp? homeMainRsp;
  XhrError? xhrError;

  HomeMainXhrRsp(this.homeMainRsp, this.xhrError);
}
