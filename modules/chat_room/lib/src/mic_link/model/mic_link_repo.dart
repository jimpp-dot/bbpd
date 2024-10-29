import 'package:shared/shared.dart';

import 'generated/connector_bar.pb.dart';

class MicLinkRepo {
  MicLinkRepo._();

  /// 标签列表
  static Future<RespConnectorBarLabelList> getLabelList(int rid) async {
    String url = '${System.domain}go/room/connectorBar/labelList?rid=$rid';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      RespConnectorBarLabelList rsp =
          response.formatProtobuf(RespConnectorBarLabelList.create());
      Log.d('getLabelList:$rsp');
      return rsp;
    } catch (e) {
      return RespConnectorBarLabelList(success: false, msg: e.toString());
    }
  }

  /// 保存座位标签
  static Future<NormalNull> saveLabel(int rid, String data) async {
    String url = '${System.domain}go/room/connectorBar/saveLabel';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': '$rid', 'data': data});

      NormalNull rsp = response.formatProtobuf(NormalNull.create());
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 断连
  static Future<NormalNull> disconnectLink(int rid, int toUid) async {
    Log.d('disconnectLink:$toUid');
    String url = '${System.domain}go/room/connectorBar/disconnect';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': '$rid', 'toUid': '$toUid'});
      NormalNull rsp = response.formatProtobuf(NormalNull.create());
      return rsp;
    } catch (e) {
      Fluttertoast.showToast(msg: '断连失败');
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 接待抱人上大头麦位
  static Future<NormalNull> joinUpper(int rid, int toUid) async {
    Log.d('joinUpper');
    String url = '${System.domain}go/room/connectorBar/upper';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': '$rid', 'toUid': '$toUid'});
      NormalNull rsp = response.formatProtobuf(NormalNull.create());
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 获取连麦送礼的用户列表
  static Future<RespConnectorBarPresentsList> getPresentsList(int rid) async {
    String url = '${System.domain}go/room/connectorBar/presentsList?rid=$rid';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      RespConnectorBarPresentsList rsp =
          response.formatProtobuf(RespConnectorBarPresentsList.create());
      return rsp;
    } catch (e) {
      return RespConnectorBarPresentsList(success: false, msg: e.toString());
    }
  }

  /// 清空统计
  static Future<NormalNull> clearStatistics(int rid) async {
    Log.d('clearStatistics');
    String url = '${System.domain}go/room/connectorBar/clearPresents';
    try {
      XhrResponse response = await Xhr.postPb(url, {'rid': '$rid'});
      NormalNull rsp = response.formatProtobuf(NormalNull.create());
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
