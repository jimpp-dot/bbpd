import 'dart:io';

import 'package:shared/src/pbModel/generated/banban_popup.pb.dart';
import 'package:shared/src/pbModel/generated/sy_uploads.pb.dart';
import 'package:dio/dio.dart';

import '../shared.dart';

///如果部分接口会在不同的模块使用，建议放在这里
class BaseApi {
  ///图片上传配置
  static String UPLOAD_CONFIG = "${System.domain}/upload/getUploadPromise";

  static String CONTENT_TYPE_IMAGE = 'image/jpeg';

  static String CONTENT_TYPE_AUDIO = 'audio/mp3';

  static String EXT_JPG = 'jpg';

  static String EXT_MP3 = 'mp3';

  /// 充值页接口
  static Future<XhrResponse> requestChargeProduct() async {
    try {
      final url = '${System.domain}recharge/product?version=11';
      final response = await Xhr.getJson(url);
      return response;
    } catch (e) {
      return XhrResponse({'success': false}, XhrError(XhrErrorCode.Unknown, e.toString()), null);
    }
  }

  /// 充值页接口 - 皮队友
  static Future<DataRsp> mateRequestChargeProduct() async {
    try {
      final url = '${System.domain}go/mate/charge/product?version=${Constant.versionCode}';
      final response = await Xhr.getJson(url, formatJson: true);
      return DataRsp.fromXhrResponse(response, (json) => json);
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 查询当前用户是否在房间接口
  static Future<DataRsp<String?>> mateRequestUserInRoom({int? rid, required int uid}) async {
    try {
      final url = '${System.domain}go/mate/room/jump';
      final response = await Xhr.getJson(url,
          params: {
            if (rid != null) 'rid': '$rid',
            'uid': '$uid',
          },
          formatJson: true);
      return DataRsp<String?>.fromXhrResponse(response, (json) {
        if (json is Map) {
          return Util.parseStr(json['jump']);
        }
        return null;
      });
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 获取本机公网IP（加密的）
  static Future<DataRsp<int?>> getDevicePublicIP() async {
    try {
      final url = 'https://${System.ipCheckDomain}/ip/query';
      final response = await Xhr.getJson(url, formatJson: true);
      return DataRsp<int?>.fromXhrResponse(response, (json) {
        if (json is int) {
          return json;
        }
        return 0;
      });
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  static Future<ResHomePopUpAuth> loadFaceAuth() async {
    String url = '${System.domain}go/yy/popup/auth';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      return ResHomePopUpAuth.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHomePopUpAuth(success: false, msg: e.toString());
    }
  }

  static Future<RspSyUploadPromise> _getFileUploadConfig(String contentType, String ext, String uploadType) async {
    XhrResponse response = await Xhr.postPb(UPLOAD_CONFIG, {
      'content_type': contentType,
      'ext': ext,
      'upload_type': uploadType,
    });
    try {
      return response.formatProtobuf(RspSyUploadPromise.create());
    } catch (e) {
      return RspSyUploadPromise(msg: e.toString(), success: false);
    }
  }

  static Future<String> uploadImage(String filePath, String uploadType) async {
    return _uploadFile(filePath, CONTENT_TYPE_IMAGE, EXT_JPG, uploadType);
  }

  static Future<String> uploadAudio(String filePath, String uploadType) async {
    return _uploadFile(filePath, CONTENT_TYPE_AUDIO, EXT_MP3, uploadType);
  }

  static Future<String> _uploadFile(String filePath, String contentType, String ext, String uploadType) async {
    String resultUrl = '';
    RspSyUploadPromise rspSyUploadPromise = await _getFileUploadConfig(contentType, ext, uploadType);
    if (rspSyUploadPromise.success && rspSyUploadPromise.path.isNotEmpty && rspSyUploadPromise.signUrl.isNotEmpty) {
      Response response = await Dio().put(
        rspSyUploadPromise.signUrl,
        data: Stream.fromIterable(File(filePath).readAsBytesSync().map((e) => [e])),
        options: Options(contentType: contentType),
      );
      if (response.statusCode == 200) {
        resultUrl = rspSyUploadPromise.path;
      }
    }
    return resultUrl;
  }
}
