import 'package:shared/shared.dart';

class OperateConfig {
  final String label;
  final String display;
  final int rid;
  final int deleted; // 1 代表房间关闭，
  final int deletedSeconds;
  final String icon;
  final int num;
  final String name;

  OperateConfig(this.label, this.display, this.rid, this.deleted,
      this.deletedSeconds, this.icon, this.num, this.name);

  factory OperateConfig.fromJson(Map data) => OperateConfig(
        data['label'] ?? '',
        data['display'] ?? '',
        Util.parseInt(data['rid']),
        Util.parseInt(data['deleted']),
        Util.parseInt(data['deletedSeconds']),
        data['icon'] ?? '',
        Util.parseInt(data['num']),
        data['name'] ?? '',
      );
}

class OperateConfigRsp {
  final bool success;
  final String msg;
  final List<OperateConfig>? data;
  final bool? isVerify;
  final int? needVerifyNew;

  OperateConfigRsp(
      {required this.success,
      required this.msg,
      this.data,
      this.isVerify,
      this.needVerifyNew});

  factory OperateConfigRsp.fromJson(Map data) => OperateConfigRsp(
        success: Util.parseBool(data['success']),
        msg: data['msg'] ?? '',
        data: Util.parseList(data['data'], (e) => OperateConfig.fromJson(e)),
        isVerify: Util.parseBool(data['isVerify']),
        needVerifyNew: Util.parseInt(data['need_verify_new']),
      );
}
