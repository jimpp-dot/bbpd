import 'package:shared/shared.dart';
import 'package:get/get.dart';
import 'package:rank/rank.dart';

const dataReady = 'DATA_READY';

class HomeFollowUpSubPageController extends GetxController {
  /// 最近加入派对
  final List<HistoryPartyModel> _recentPartyList = [];

  List<HistoryPartyModel> get recentPartyList => _recentPartyList;

  /// 最近活跃
  final List<HomeActiveFriendItemData> _activeFriendList = [];

  List<HomeActiveFriendItemData> get activeFriendList => _activeFriendList;

  /// 好友在玩
  final List<HomeFriendItem> _friendPlayingList = [];

  List<HomeFriendItem> get friendPlayingList => _friendPlayingList;

  ScreenStatus status = ScreenStatus.Loading;

  /// 是否有好友在玩
  bool get hasFriendPlaying => friendPlayingList.isNotEmpty;

  String? _errorMsg;

  String get errorMsg =>
      _errorMsg ?? XhrError(XhrErrorCode.Unknown, '').toString();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    status = ScreenStatus.Loading;
    _errorMsg = null;

    String url = "${System.domain}go/yy/home/homeFollow?version=1";
    try {
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      ResHomeTabFollow resp = ResHomeTabFollow.fromBuffer(response.bodyBytes);
      if (resp.success) {
        _resetData();
        _recentPartyList.addAll(
            resp.data.historyList.map((e) => HistoryPartyModel.fromPb(e)));
        _activeFriendList.addAll(resp.data.recentList
            .map((e) => HomeActiveFriendItemData.fromPb(e)));
        _friendPlayingList
            .addAll(resp.data.friendList.map((e) => HomeFriendItem.fromPb(e)));

        if (_recentPartyList.isEmpty || !_recentPartyList.first.isMine) {
          // 判断是否添加【我的派对】
          // _recentPartyList.insert(0, HistoryPartyModel(extra: 'create'));
        }

        _errorMsg = null;
        status = ScreenStatus.Ready;
      } else {
        _errorMsg = resp.msg;
        status = ScreenStatus.Error;
      }
    } catch (e) {
      status = ScreenStatus.Error;
      if (e is XhrError) {
        _errorMsg = e.toString();
      }
    }

    update([dataReady]);
  }

  void _resetData() {
    _recentPartyList.clear();
    _activeFriendList.clear();
    _friendPlayingList.clear();
  }
}
