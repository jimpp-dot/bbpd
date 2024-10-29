import 'package:chat_room/src/biz_plugin/sweet_album/model/sweet_album_repo.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:loading_more_list/loading_more_list.dart';

class SweetAlbumUserSource extends LoadingMoreBase<SweetImprintUser> {
  final int rid;
  int _page = 0;
  bool _hasMore = true;

  SweetAlbumUserSource(this.rid);

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _page = 0;
    _hasMore = true;

    clear();

    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    ApiSweetAlbumCompanionListResponse res =
        await SweetAlbumRepo.companionList(_page, rid);
    if (!res.success) return false;

    if (_page == 0) {
      clear();
    } else {
      _page++;
    }

    addAll(res.data.companions);
    _hasMore = res.data.more > 0;

    return true;
  }
}
