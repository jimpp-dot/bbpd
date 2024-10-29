import 'package:shared/shared.dart';

class ServiceItem {
  String type; //normal 普通客服 vip 专属客服
  String label;
  int targetId;

  ServiceItem(this.type, this.label, this.targetId);

  ServiceItem.fromJson(Map<String, dynamic> json)
      : type = Util.notNullStr(json['type']),
        label = Util.notNullStr(json['name']),
        targetId = Util.parseInt(json['uid']);
}
