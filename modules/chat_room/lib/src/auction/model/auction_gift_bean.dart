import 'package:shared/shared.dart';

class AuctionGiftBean {
  final int rid;
  final int uid;
  final String name;
  final int sex;
  final String icon;
  final int cid;
  final String c_name;
  final int c_num;
  final String c_url;

  AuctionGiftBean.fromJson(Map json)
      : rid = Util.parseInt(json['rid']),
        uid = Util.parseInt(json['uid']),
        name = Util.parseStr(json['name']) ?? '',
        sex = Util.parseInt(json['sex']),
        icon = Util.parseStr(json['icon']) ?? '',
        cid = Util.parseInt(json['cid']),
        c_name = Util.parseStr(json['c_name']) ?? '',
        c_num = Util.parseInt(json['c_num']),
        c_url = Util.parseStr(json['c_url']) ?? '';
}
