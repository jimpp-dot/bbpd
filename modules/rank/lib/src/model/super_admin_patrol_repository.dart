import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';

class SuperAdminPatrolRepository extends LoadingMoreBase<RoomItemModel> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  final int firstId;
  final int secondId;

  SuperAdminPatrolRepository(this.firstId, this.secondId);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      String url =
          '${System.domain}chatroom/superPatrolRooms?page=$page&first_id=$firstId&second_id=$secondId';
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      Map result = response.value();

      if (result['success'] == true &&
          result['data'] is Map &&
          result['data']['list'] is List) {
        if (page == 1) {
          clear();
        }

        List? list = result['data']['list'];

        list?.forEach((element) {
          RoomItemModel model = RoomItemModel.fromJson(element);
          add(model);
        });

        _hasMore = (list?.length == 20 ? true : false);
        page++;
      }
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }

    return isSuccess;
  }
}
