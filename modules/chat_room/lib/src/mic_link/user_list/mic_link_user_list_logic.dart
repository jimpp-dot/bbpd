import 'package:shared/shared.dart';
import 'package:get/get.dart';

import '../model/generated/connector_bar.pb.dart';
import '../model/mic_link_repo.dart';

class MicLinkUserListLogic extends GetxController
    with StateMixin<List<PresentsUserInfo>> {
  final int rid;

  MicLinkUserListLogic(this.rid);

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    RespConnectorBarPresentsList rsp = await MicLinkRepo.getPresentsList(rid);
    Log.d('getPresentsList:$rsp');
    if (rsp.success) {
      if (rsp.data.isEmpty) {
        change(rsp.data, status: RxStatus.empty());
      } else {
        change(rsp.data, status: RxStatus.success());
      }
    } else {
      change(rsp.data, status: RxStatus.error(rsp.msg));
    }
  }

  void onBtnTaped(PresentsUserInfo item) async {
    if (item.pos > 0) {
      NormalNull rsp = await MicLinkRepo.joinUpper(rid, item.uid);
      if (rsp.success) {
        Fluttertoast.showToast(msg: '连线成功');
        load();
      } else {
        Fluttertoast.showToast(msg: rsp.msg);
      }
    }
  }

  void onClearTaped() async {
    NormalNull rsp = await MicLinkRepo.clearStatistics(rid);
    if (rsp.success) {
      Fluttertoast.showToast(msg: '清空统计成功');
      load();
    } else {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }
}
