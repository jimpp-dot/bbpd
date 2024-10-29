import 'package:shared/shared.dart';
import 'package:vip/src/pb/generated/vip_api_pretend.pb.dart';

export 'package:vip/src/pb/generated/vip_api_pretend.pb.dart';
export 'package:vip/src/pb/generated/vip_rpc_pretend.pb.dart';

class VipDressRepo {
  static const dressPageSize = 48;

  /// 获取装扮分类列表
  static Future<ResPretendCateList> getCateList() async {
    String url = '${System.domain}go/yy/pretend/cateList';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResPretendCateList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPretendCateList(msg: e.toString(), success: false);
    }
  }

  /// 某一分类下的装扮列表
  static Future<ResGroupList> getDressList(int cateId, int page) async {
    String url = '${System.domain}go/yy/pretend/groupList';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, queryParameters: {
        'cate_id': cateId.toString(),
        'page': page.toString(),
        'limit': dressPageSize
      });
      return ResGroupList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGroupList(msg: e.toString(), success: false);
    }
  }

  /// 我的装扮信息（碎片，等级..）
  static Future<ResPretendMy> getMyInfo() async {
    String url = '${System.domain}go/yy/pretend/my';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResPretendMy.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPretendMy(msg: e.toString(), success: false);
    }
  }

  /// 续期装扮
  static Future<ResPretend> renewalDress(
      int cateId, int groupId, int days) async {
    String url = '${System.domain}go/yy/pretend/recharge';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'cate_id': cateId.toString(),
            'group_id': groupId.toString(),
            'days': days.toString()
          },
          pb: true);
      return ResPretend.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPretend(msg: e.toString(), success: false);
    }
  }

  /// 升级装扮
  static Future<ResPretend> levelUpDress(int cateId, int groupId) async {
    String url = '${System.domain}go/yy/pretend/upgrade';
    try {
      XhrResponse response = await Xhr.post(
          url, {'cate_id': cateId.toString(), 'group_id': groupId.toString()},
          pb: true);
      return ResPretend.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPretend(msg: e.toString(), success: false);
    }
  }

  /// 使用装扮
  static Future<ResPretend> useDress(
      int cateId, int groupId, int sex, int star) async {
    String url = '${System.domain}go/yy/pretend/use';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'cate_id': cateId.toString(),
            'group_id': groupId.toString(),
            'sex': sex.toString(),
            'star_num': star.toString()
          },
          pb: true);
      return ResPretend.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPretend(msg: e.toString(), success: false);
    }
  }

  /// 取消装扮
  static Future<ResPretend> cancelDress(int cateId, int groupId) async {
    String url = '${System.domain}go/yy/pretend/cancel';
    try {
      XhrResponse response = await Xhr.post(
          url, {'cate_id': cateId.toString(), 'group_id': groupId.toString()},
          pb: true);
      return ResPretend.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPretend(msg: e.toString(), success: false);
    }
  }
}
