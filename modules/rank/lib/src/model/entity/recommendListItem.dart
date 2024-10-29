import 'package:shared/shared.dart';

import 'package:shared/model/liveListRsp.dart';

class RecommendListItem {
  RecommendType? type;
  ListItem? userItem;
  RecommendBannerItem? bannerItem;

  RecommendListItem({this.type, this.userItem, this.bannerItem});
}

enum RecommendType {
  user,
  banner,
}
