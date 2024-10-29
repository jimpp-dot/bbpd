import 'package:flutter/material.dart';

import '../shared.dart';

/// 网络数据Response工具类
class ResponseUtils {
  ResponseUtils._();

  /// 处理[BaseResponse]错误
  static bool handleBaseResponseError(BaseResponse? resp, {State? state}) {
    if (resp == null) return true;
    if (resp.success == true) return false;
    if (state != null && state.mounted && resp.msg?.isNotEmpty == true) {
      Toast.showCenter(state.context, resp.msg);
    }
    return true;
  }

  /// 构建错误的[BaseResponse]
  static BaseResponse buildErrorBaseResponse(e) {
    return BaseResponse(success: false, msg: e.toString());
  }

  /// 构建错误的[DataRsp]
  static DataRsp<T> buildErrorDataRsp<T>(e) {
    return DataRsp<T>(success: false, msg: e.toString());
  }

  /// 构造[BaseResponse]
  static BaseResponse buildBaseResponse(XhrResponse response) {
    return BaseResponse.parse(response);
  }
}
