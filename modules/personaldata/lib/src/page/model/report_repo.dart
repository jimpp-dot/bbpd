import 'package:shared/shared.dart';
import 'package:personaldata/src/model/pb/generated/slp_report.pb.dart';

class ReportRepo {
  static Future<ResReportList> getReportList() async {
    String url = '${System.domain}go/yy/report/list';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResReportList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResReportList(msg: e.toString(), success: false);
    }
  }
}
