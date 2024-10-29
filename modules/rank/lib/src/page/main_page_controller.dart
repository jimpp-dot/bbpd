import 'package:shared/shared.dart';
import 'package:get/get.dart';
import 'package:rank/src/page/tabs/room_tab_sex_filter_widget.dart';

class MainPageController extends GetxController {
  final String HOME_ROOM_LIST_STYLE_KEY = 'HOME_ROOM_LIST_STYLE';

  @override
  void onInit() {
    super.onInit();
    listStyle = Config.getBool(HOME_ROOM_LIST_STYLE_KEY, true);
  }

  @override
  void onClose() {
    RoomTabSexFilterWidget.dismiss();
    super.onClose();
  }

  /// true：单列显示（默认）；false-双列显示
  bool listStyle = true;

  /// 直播Tab性别过滤
  RxBool isFilterShowing = false.obs;

  /// 改变房间列表样式
  void changeListStyle() {
    listStyle = !listStyle;
    Config.setBool(HOME_ROOM_LIST_STYLE_KEY, listStyle);
    update(['listStyle']);
    Tracker.instance.track(
      TrackEvent.common_operate,
      properties: {
        'operate_name': 'room_list_style',
        'operate_content': listStyle ? '1' : '2'
      },
    );
  }

  String matchFilter = ''; // 首页快速匹配filter

  void setMatchFilter(String filter) {
    if (filter != matchFilter) {
      matchFilter = filter;
      update(['quick_match']);
    }
  }
}
