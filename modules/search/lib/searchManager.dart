import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:search/src/search_bar.dart';

import 'slp_src/slp_search_repo.dart';
import 'slp_src/slp_search_screen.dart';

class SearchManager extends ISearchManager {
  @override
  Widget buildSearchBar(BuildContext context, bool suppDark) {
    return SearchBar(
      null,
      onTap: () => showSearch(context),
      editable: false,
      suppDark: suppDark,
    );
  }

  /// 打开搜索页
  /// 默认调用快乐星球接口
  @override
  Future showSearch(BuildContext context) {
    return SlpSearchScreen.showSearchScreen(context);
  }

  static Future showLogin(BuildContext context) {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    return loginManager.show(context);
  }

  static showRoom(BuildContext context, int rid, String searchString,
      {String? refer}) {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    return roomManager.openChatRoomScreenShow(context, rid,
        refer: refer ?? 'search', searchString: searchString);
  }

  /// 搜索用户
  /// 默认调用快乐星球接口
  @override
  Future<List<Map<String, dynamic>>> apiSearchUser(String key) async {
    List<Map<String, dynamic>> result = [];
    JointSearchResp rsp = await SlpSearchRepo.searchUser(key);
    if (rsp.success) {
      for (var e in rsp.data) {
        if (e.type == JointSearchItemType.ItemTypeUser) {
          result.add({
            'uid': e.id,
            'name': e.name,
            'icon': e.icon,
          });
        }
      }
    }

    return result;
  }

  @override
  Widget getHiSongSearchBar(ValueChanged<String> onChanged) {
    return SearchBar(onChanged);
  }
}
