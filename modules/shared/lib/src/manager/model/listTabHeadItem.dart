import 'package:shared/shared.dart';

class ListTabHeadItem {
  int cid = 0;
  String? name;
  String? icon;
  List<TabItem>? tabs;

  ListTabHeadItem(this.cid, this.name, this.icon, this.tabs);

  ListTabHeadItem.fromJson(Map json) {
    cid = Util.parseInt(json['cid']);
    name = json['name'];
    String? iconUrl = json['icon'];
    if (iconUrl != null && iconUrl.startsWith('http')) {
      icon = iconUrl;
    } else {
      icon = System.imageDomain + json['icon'];
    }

    List? tabList = json['tabs'];
    tabs = [];
    tabList?.forEach((element) {
      TabItem tabItem = TabItem.fromJson(element);
      tabs!.add(tabItem);
    });
  }
}
