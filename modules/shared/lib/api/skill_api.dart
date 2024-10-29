import '../shared.dart';

class SkillApi {
  /// 获取主播筛选
  static Future<SkillCategoryResponse> getSkillListConfig(int pid) async {
    String url = '${System.domain}home/listConfig?pid=$pid';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      return SkillCategoryResponse.fromJson(
          response.value() as Map<String, dynamic>);
    } catch (e) {
      return SkillCategoryResponse(msg: e.toString(), success: false);
    }
  }
}
