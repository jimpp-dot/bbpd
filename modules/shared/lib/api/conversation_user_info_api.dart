import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/protobuf/lan/generated/people_info_industry.pb.dart';
import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConversationUserInfoApi {
  /// 获取用户基本信息&状态信息
  static Future<ResImCloudAll> loadAll(
      {required Map<int, int> users,
      required Map<int, int> groups,
      String? from}) async {
    String url = '${System.domain}go/yy/cloud/imAll';
    List<Map<String, dynamic>> data = [];
    if (users.isNotEmpty) {
      users.forEach((key, value) {
        data.add({'id': key, 'time': value, 'type': 0});
      });
    }

    if (groups.isNotEmpty) {
      groups.forEach((key, value) {
        data.add({'id': key, 'time': value, 'type': 1});
      });
    }
    try {
      Map<String, String> body = {
        'list': jsonEncode(data),
        'from': from ?? '',
      };
      XhrResponse response = await Xhr.postPb(url, body, throwOnError: true);
      ResImCloudAll resp = ResImCloudAll.fromBuffer(response.bodyBytes);
      if (resp.success) {
        // 私聊彩蛋称号
        {
          SharedPreferences pref = await SharedPreferences.getInstance();
          for (var user in resp.data.users) {
            int oldChatEggTitle = pref.getInt(
                    '${BaseRequestManager.ChatEggTitlePrefix}_${user.uid}_${Session.uid}') ??
                0;

            pref.setInt(
                '${BaseRequestManager.ChatEggTitlePrefix}_${user.uid}_${Session.uid}',
                user.chatEggTitle);

            // 嗨歌新增逻辑 做通用处理
            if (!Util.isStringEmpty(user.chatEggTitleName)) {
              pref.setString(
                  '${BaseRequestManager.ChatEggTitleTextPrefix}_${user.uid}_${Session.uid}',
                  user.chatEggTitleName);
            }
            if (!Util.isStringEmpty(user.chatEggTitleColor)) {
              pref.setString(
                  '${BaseRequestManager.ChatEggTitleTextColorPrefix}_${user.uid}_${Session.uid}',
                  user.chatEggTitleColor);
            }
            if (!Util.isCollectionEmpty(user.chatEggTitleBolder)) {
              pref.setStringList(
                  '${BaseRequestManager.ChatEggTitleBorderColorPrefix}_${user.uid}_${Session.uid}',
                  user.chatEggTitleBolder);
            }

            if (oldChatEggTitle != user.chatEggTitle) {
              eventCenter.emit(BaseRequestManager.ChatEggTitleChangedEvent);
            }
          }
        }
      }
      return resp;
    } catch (e) {
      Log.d(e);
      return ResImCloudAll(success: false, msg: e.toString());
    }
  }

  /// 获取个人信息中的行业选项
  static Future<ResAccountIndustryList> getIndustrySelections() async {
    String url = 'go/yy/account/industryList';
    try {
      XhrResponse response =
          await Xhr.get('${System.domain}$url', throwOnError: false, pb: true);
      return ResAccountIndustryList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAccountIndustryList(success: false, msg: e.toString());
    }
  }

  /// 获取个人信息中的教育选项
  static List<String> getEducationSelections() {
    return ['保密', '高中或以下', '专科', '本科', '硕士', '博士'];
  }
}
