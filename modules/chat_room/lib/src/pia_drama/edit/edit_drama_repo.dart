import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import '../pia_drama_repo.dart';

class EditDramaRepository extends LoadingMoreBase<PiaJuBen> {
  final int rid;
  final int uid;
  final int type;
  int _page = 1;
  bool _hasMore = true;

  EditDramaRepository({
    required this.rid,
    required this.uid,
    required this.type,
  });

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      ResPiaJuBenList res =
          await PiaDramaRepo.getJuben(rid: rid, uid: uid, type: type);
      if (res.success && _page == 1) {
        clear();
      }

      /// 服务端未做分页
      _hasMore = false;

      addAll(res.data.list);
      _page++;
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}
