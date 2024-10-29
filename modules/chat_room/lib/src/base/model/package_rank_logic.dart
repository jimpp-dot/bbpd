import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/package_count_ranking.pb.dart';
import 'package:get/get.dart';

class PackageRankLogic extends GetxController {
  static final String BASE_PATH = '${System.domain}go/room/package/rank';
  RankData? data;

  void loadPackageRank(int uid, int rid) {
    getPackageRankData(uid, rid).then((value) {
      data = value.data;
      update();
    });
  }

  Future<PackageCountRankRsp> getPackageRankData(int uid, int rid) async {
    Log.d('getPackageRankData PATH=$BASE_PATH uid=$uid and rid=$rid');
    try {
      XhrResponse response = await Xhr.get(BASE_PATH,
          queryParameters: {'uid': uid, 'rid': rid, 'format': 'pb'},
          pb: true,
          throwOnError: false);

      PackageCountRankRsp result =
          PackageCountRankRsp.fromBuffer(response.bodyBytes);
      Log.d('getPackageRankData result=${result.toString()}');
      return result;
    } catch (e) {
      Log.d('getPackageRankData error e=${e.toString()}');
      return PackageCountRankRsp(msg: e.toString(), success: false);
    }
  }
}
