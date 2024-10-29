import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  bool success;
  String? msg;

  BaseResponse({this.success = false, this.msg});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  /// 用于简单的接口解析
  static BaseResponse parse(XhrResponse? xhrResponse) {
    bool success = false;
    String? msg;
    if (xhrResponse != null) {
      if (xhrResponse.error != null) {
        success = false;
        msg = xhrResponse.error.toString();
      } else {
        try {
          Map map = xhrResponse.value();
          success = Util.parseBool(map['success']);
          msg = Util.parseStr(map['msg']);
        } catch (e) {
          Log.d(e);
        }
      }
    }
    return BaseResponse(success: success, msg: msg);
  }

  static void toast(BaseResponse? rsp) {
    if (rsp?.success != true && rsp?.msg?.isNotEmpty == true) {
      Fluttertoast.showToast(msg: rsp?.msg, gravity: ToastGravity.CENTER);
    }
  }
}

@JsonSerializable(genericArgumentFactories: true)
class DataRsp<T> extends BaseResponse {
  T? data;

  DataRsp({success, msg, this.data}) : super(success: success, msg: msg);

  factory DataRsp.fromJson(
          Map<String, dynamic> json, T Function(Object json) fromJsonT) =>
      _$DataRspFromJson(json, fromJsonT);

  factory DataRsp.fromXhrResponse(
      XhrResponse? response, T Function(Object json)? fromJsonT) {
    if (response == null) {
      return DataRsp<T>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }

    if (response.error != null) {
      return DataRsp<T>(msg: response.error.toString(), success: false);
    }

    try {
      Map<String, dynamic> res = response.value() as Map<String, dynamic>;
      if (res['success'] != true) {
        return DataRsp<T>(msg: res['msg'], success: false);
      }

      if (res['success'] == true && fromJsonT == null) {
        return DataRsp<T>(success: true, msg: res['msg'], data: null);
      }

      if (res['data'] == null ||
          ((res['data'] is Map) && (res['data'] as Map).isEmpty)) {
        return DataRsp<T>(msg: res['msg'], success: res['success'], data: null);
      }
      DataRsp<T> responseData = DataRsp<T>.fromJson(res, fromJsonT!);
      return responseData;
    } catch (e) {
      Log.d('DataRsp:$e');
      return DataRsp<T>(
          msg: R.array('xhr_error_type_array')[5], success: false);
    }
  }

  bool get isEmpty =>
      data == null || (data is Iterable && (data as Iterable).isEmpty);
}

enum Sex {
  Male,
  Female,
}
