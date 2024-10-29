import 'package:profile/k.dart';
import 'package:shared/shared.dart';
import 'package:profile/src/model/pb/generated/api_tone.pb.dart';

/// 启动音相关Api
class LaunchAudioApi {
  /// 启动音系列列表
  static Future<ResToneGroupList> getGroupList() async {
    var url = '${System.domain}go/yy/tone/groupList';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return ResToneGroupList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResToneGroupList(msg: e.toString(), success: false);
    }
  }

  /// 启动音列表
  static Future<ResToneAudioList> getAudioList(int groupId, int page) async {
    var url =
        '${System.domain}go/yy/tone/audioList?group_id=$groupId&page=$page';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return ResToneAudioList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResToneAudioList(msg: e.toString(), success: false);
    }
  }

  /// 使用启动音
  static Future<bool> use(int audioId, bool isSelect) async {
    NormalNull normalNull;
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}/go/yy/tone/change',
        {'audio_id': '$audioId', 'is_select': '$isSelect'},
        throwOnError: true,
      );
      normalNull = NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      normalNull = NormalNull(msg: e.toString(), success: false);
    }
    if (normalNull.success) {
      Fluttertoast.showCenter(
          msg: isSelect ? K.profile_select_success : K.profile_already_cancel);
    } else {
      Fluttertoast.showCenter(msg: normalNull.msg);
    }
    return normalNull.success;
  }
}
