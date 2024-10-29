import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat_room/src/mic_link/model/generated/connector_bar.pb.dart';
import 'package:get/get.dart';

import '../model/mic_link_repo.dart';

class LabelEditLogic extends GetxController
    with StateMixin<List<PosLabelInfo>> {
  final int rid;

  /// 标签审核状态：0-审核中 1-已通过
  RxInt auditStatus = 1.obs;

  LabelEditLogic(this.rid);

  @override
  void onReady() {
    super.onReady();
    load();
  }

  void load() async {
    RespConnectorBarLabelList rsp = await MicLinkRepo.getLabelList(rid);
    // List<PosLabelInfo> data = [
    //   PosLabelInfo(pos: 0, label: '超级主播'),
    //   PosLabelInfo(pos: 1, label: '超级主播'),
    //   PosLabelInfo(pos: 2, label: '超级主播'),
    //   PosLabelInfo(pos: 3, label: '超级主播'),
    //   PosLabelInfo(pos: 4, label: ''),
    //   PosLabelInfo(pos: 5, label: ''),
    // ];
    // change(data, status: RxStatus.success());
    // return;

    if (rsp.success) {
      change(rsp.data, status: RxStatus.success());
      auditStatus.value = rsp.auditStatus;
    } else {
      change(rsp.data, status: RxStatus.error(rsp.msg));
    }
  }

  Future<bool> saveLabel() async {
    if (auditStatus.value == 0) {
      Fluttertoast.showToast(msg: '标签审核中，请稍候再试');
      return false;
    }
    List<PosLabelInfo> data = state!;
    String value = json.encode(data.map((e) => e.toProto3Json()).toList());
    Log.d('saveLabel:$value');
    NormalNull rsp = await MicLinkRepo.saveLabel(rid, value);
    if (rsp.success) {
      return true;
    } else {
      Fluttertoast.showToast(msg: rsp.msg);
      return false;
    }
  }
}
