import 'package:shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared/src/pbModel/generated/gift_handbook.pb.dart';
import 'package:personaldata/src/api/gift_wall_api.dart';

enum SelectionArgs { star, wealth, num }

enum SelectionOpt {
  starUp,
  starDown,
  starNone,
  wealthUp,
  wealthDown,
  wealthNone,
  numUp,
  numDown,
  numNone,
  none
}

class GiftWallController extends GetxController {
  static const String _tag = "GiftWallController";
  static const String ID_UPDATE_ALL = "id_update_all"; //全量刷新
  static const String ID_UPDATE_LIST = "id_update_list"; //刷新礼物list
  static const String ID_UPDATE_SELECTION = "id_update_select"; //刷新筛选
  static const String ID_UPDATE_EXP_STATE = "id_update_level_state"; //刷新经验值状态
  static const String ID_UPDATE_HEADER = "id_update_header"; // 刷新titleBar
  static const String KEY_HAS_HANDBOOK_AWARD =
      "config_has_handbook_award"; // 有待领取的礼物
  static const String KEY_HAS_SHOW_REWARD_DIALOG =
      "config_has_show_reward_dialog"; //奖励弹窗是否弹出过
  static const String ID_UPDATE_INDEX_CHANGE =
      "id_update_index_change"; // 选中的index（模块）变化

  int index = 0;

  bool isExpExpanded = false; // 经验栏是否展开
  bool isSelectExpanded = false; // 筛选器是否展开
  bool isSelected = false; // 只看收集or只看收藏是否选中
  SelectionOpt? opt;
  double alpha = 0; // titleBar 透明度
  GiftHandbookHomeRsp? rsp;
  GiftHandbookGiftListRsp? listRsp;

  bool isListLoading = false;
  String? listSortType;
  String? listIsasc;

  @override
  void onReady() {}

  Future initData(int uid, {String? type}) async {
    rsp = await GiftWallApi.getGiftWallHome(uid, type: type);
    update();
  }

  void updateGiftList() {
    update([ID_UPDATE_LIST]);
  }

  void updateSelectExpandState() {
    isSelectExpanded = !isSelectExpanded;
    update([ID_UPDATE_SELECTION]);
  }

  void updateExpExpandState() {
    isExpExpanded = !isExpExpanded;
    update([ID_UPDATE_EXP_STATE]);
  }

  void updateSelectState() {
    isSelected = !isSelected;
    update([ID_UPDATE_SELECTION]);
  }

  void updateSelectionOpt(SelectionOpt selectOpt) {
    opt = selectOpt;
    update([ID_UPDATE_SELECTION]);
  }

  void updateHeader(double a) {
    alpha = a;
    update([ID_UPDATE_HEADER]);
  }

  void updateIndexChanged() {
    update([ID_UPDATE_INDEX_CHANGE]);
  }

  bool isLightAll(int index) {
    if (rsp == null) return false;
    return rsp!.data.seriesList[index].lightNum >=
            rsp!.data.seriesList[index].total &&
        rsp!.data.seriesList[index].total > 0;
  }

  Future<void> requestListData(int uid, String type, String seriesType,
      {int giftId = 0, bool isShowLoading = true}) async {
    if (isShowLoading) {
      isListLoading = true;
      updateGiftList();
    }
    listRsp = await GiftWallApi.getGiftList(
        uid, type, seriesType, listSortType ?? '', listIsasc ?? '',
        page: 1, pageSize: 200);
    isListLoading = false;
    updateGiftList();
  }

  @override
  void onClose() {}
}
