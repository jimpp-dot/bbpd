// ignore_for_file: import_of_legacy_library_into_null_safe

/// @Author bobzhou
/// @Description
/// @Date 2023-04-24 18:02

class HttpReqLogItem {
  final String url;
  bool logRespBody = false;

  HttpReqLogItem(this.url, {this.logRespBody = false});
}
