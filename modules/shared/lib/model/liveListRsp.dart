import 'package:shared/shared.dart';

class LiveListRsp {
  bool? success;
  LiveListData? data;

  LiveListRsp.fromJson(Map json) {
    success = Util.parseBool(json['success']);
    data = LiveListData.fromJson(json['data']);
  }
}

class HomeRecommend {
  bool? success;
  List<RoomItemModel>? data = [];

  HomeRecommend.fromJson(Map json) {
    success = Util.parseBool(json['success']);
    List? dataList = json['data'];
    dataList?.forEach((element) {
      try {
        data?.add(RoomItemModel.fromJson(element));
      } catch (e) {
        Log.d(e);
      }
    });
  }
}

class LiveListData {
  int page = 0;
  bool hasMore = false;
  List<RoomItemModel> items = [];
  List<RankerItem> rankers = [];
  List<BannerItemData> banners = [];
  int bannerPosition = 0;
  String? emptyDataTip;

  LiveListData.fromJson(Map json) {
    page = Util.parseInt(json['page']);
    hasMore = Util.parseInt(json['more']) > 0;
    List? itemList = json['list'];
    itemList?.forEach((element) {
      try {
        items.add(RoomItemModel.fromJson(element));
      } catch (e) {
        Log.d(e);
      }
    });

    List? rankerList = json['ranker'];
    rankerList?.forEach((element) {
      RankerItem rankerItem = RankerItem.fromJson(element);
      rankers.add(rankerItem);
    });

    var bannerMap = json['banner'];
    if (bannerMap != null && bannerMap is Map) {
      List? bannerList = bannerMap['data'];
      bannerPosition = Util.parseInt(bannerMap['position']);
      bannerList?.forEach((element) {
        BannerItemData banner = BannerItemData.fromJson(element);
        banners.add(banner);
      });
    }

    if (json.containsKey('tip')) {
      emptyDataTip = Util.parseStr(json['tip']);
      emptyDataTip = emptyDataTip?.replaceAll('\\n', '\n');
    }
  }
}

class RankerItem {
  String? uid;
  String? icon;

  RankerItem.fromJson(Map json) {
    uid = Util.parseStr(json['uid']);
    icon = Util.parseStr(json['icon']);
  }
}

class BannerItemData {
  final String? title;
  final String? image;
  final String? url;
  final String? position;
  final String? id;
  bool hasReport = false;

  BannerItemData({this.title, this.image, this.url, this.position, this.id});

  BannerItemData.fromJson(Map data)
      : title = data['title'] ?? '',
        image = data['image'] ?? '',
        url = data['url'] ?? '',
        position = data['position'] ?? 'live',
        id = Util.parseStr(data['id']);
}

class LiveListItem {
  LiveType? type;
  RoomItemModel? roomItem;
  RecommendBannerItem? bannerItem;

  LiveListItem({
    this.type,
    this.roomItem,
    this.bannerItem,
  });
}

enum LiveType {
  room,
  banner,
}

class RecommendBannerItem {
  List<BannerItemData>? banners;
  RecommendBannerItem({this.banners});
}
