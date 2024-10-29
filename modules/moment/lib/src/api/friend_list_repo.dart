import 'package:shared/shared.dart';
import 'package:shared/model/friend_bean.dart';
import 'package:loading_more_list/loading_more_list.dart';

class FriendListRepo extends LoadingMoreBase<FriendItem> {
  final String listType;

  int _next = 1;
  bool _hasMore = true;
  String? searchKey;
  static const pageSize = 20;

  FriendListRepo({this.searchKey = '', this.listType = FriendsListType.Follow});

  Future<List<FriendItem>?> getFriends(int page) async {
    String url = '${System.domain}go/yy/friend/data';
    final Map<String, String> params = {
      "type": listType,
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "query": searchKey ?? '',
    };

    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true, formatJson: true);
      Map res = response.value();
      List? list = res['data'];
      List<FriendItem> friendList = [];
      if (list != null && list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Map item = list[i];
          try {
            FriendItem friend = FriendItem.fromJson(item);
            if ((friend.uid ?? 0) > 0) {
              friendList.add(friend);
            }
          } catch (e) {
            Log.d(e);
          }
        }
      }
      return friendList;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  Future<bool> _loadFriend(int next, {bool first = false}) async {
    bool success = false;

    List<FriendItem>? friendList = await getFriends(next);
    if (friendList != null) {
      if (first) {
        clear();
      }
      addAll(friendList);
      _hasMore = friendList.length == pageSize;
      if (_hasMore) {
        _next += 1;
      }
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _next = 1;
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  bool get hasMore {
    return _hasMore;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isLoadMore = isloadMoreAction;
    if (isLoadMore) {
      // 防止上拉回弹
      await Future.delayed(const Duration(milliseconds: 500));
    }
    return _loadFriend(isLoadMore ? _next : 1, first: !isLoadMore);
  }
}
