import 'package:shared/shared.dart';
import 'package:chat_room/src/invisible_man/models/generated/common_invisible.pb.dart';

import '../entity/invisible_open_request_entity.dart';

abstract class InvisibleManSuitRepository {
  /// 隐形侠落地页
  Future<ResInvisible> sendInvisibleIndexRequest();

  /// 打开权益
  Future<NormalNull> sendInvisibleOpenRequest(
      InvisibleOpenRequestEntity entity);
}

class InvisibleManSuitRepositoryImpl implements InvisibleManSuitRepository {
  static const _indexUrl = 'go/yy/invisible/index';
  static const _openUrl = 'go/yy/invisible/open';

  @override
  Future<ResInvisible> sendInvisibleIndexRequest() async {
    try {
      XhrResponse response = await Xhr.get(
        _indexUrl,
        pb: true,
        throwOnError: true,
      );
      return ResInvisible.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResInvisible(success: false, msg: e.toString());
    }
  }

  @override
  Future<NormalNull> sendInvisibleOpenRequest(
      InvisibleOpenRequestEntity entity) async {
    try {
      XhrResponse response = await Xhr.post(
        _openUrl,
        entity.toJson(),
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
