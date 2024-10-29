import 'package:shared/shared.dart';
import '../model/intimate_interact_create_invite_data.dart';
import '../model/intimate_interact_task_data.dart';

class IntimateInteractRepo {
  /// 发起亲密互动弹窗数据
  static Future<DataRsp<IntimateInteractCreateInviteData>> createInviteDialog(
      int rid) async {
    String url = '${System.domain}go/mate/intimate/invite_form?rid=$rid';
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: false, formatJson: true);
      return DataRsp<IntimateInteractCreateInviteData>.fromXhrResponse(
          response,
          (json) => IntimateInteractCreateInviteData.fromJson(
              json != null ? json as Map<String, dynamic> : {}));
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 获取用户任务列表 list_type(1.发送任务列表  2.接收任务列表)
  static Future<DataRsp<List<IntimateInteractTaskData>>> taskList(
      int listType) async {
    String url =
        '${System.domain}go/mate/intimate/get_task_list?list_type=$listType';
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: false, formatJson: true);
      return DataRsp<List<IntimateInteractTaskData>>.fromXhrResponse(
        response,
        (object) =>
            Util.parseList(object, (e) => IntimateInteractTaskData.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<IntimateInteractTaskData>>(
          success: false, msg: e.toString());
    }
  }

  /// 更新任务状态
  static Future<DataRsp> changeTaskStatus(int status, int taskId) async {
    String url = '${System.domain}mate/intimate/changeStatus';
    try {
      XhrResponse response = await Xhr.postJson(url, {
        'status': '$status',
        'task_id': '$taskId',
      });
      return DataRsp.fromXhrResponse(response, null);
    } catch (e) {
      return DataRsp(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
