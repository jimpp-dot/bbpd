import 'package:pulse_im/src/network/http_util.dart';
import 'package:pulse_im/src/socket/local_user_data.dart';
import '../../pulse_im.dart';
import '../util/im_util.dart';
import 'package:path/path.dart' as path;

class APIService {
  static const String GET_UPLOAD_URL = '/v1/get_upload_url';
  static const String UPLOAD_AUDIO = '/v1/upload_audio';

  static Future<Map<String, String>> getUploadUrl(String userid, String appid, String filename,
      {String? md5, String method = 'PUT'}) async {
    Map<String, Object> params = {};
    params['filename'] = filename;
    params['method'] = 'PUT';
    if (md5 != null) params["md5"] = md5;

    Map<String, String> retMap = <String, String>{};
    String ossUrl;
    String contentType;
    try {
      var response = await HttpReqUtil.getInstance().postJson(LocalUserData.imDomain + GET_UPLOAD_URL, params);
      Map data = (response.data);
      //IMLog.d('getUploadUrl', 'data = ${response.toString()}');
      ossUrl = data['data']['upload_url'];
      print('oss_url: $ossUrl');
      contentType = data['data']['content_type'];
      print('content_type: $contentType');
    } catch (e) {
      print('[getUploadUrl error] $e');
      return retMap;
    }

    retMap['ossUrl'] = ossUrl;
    retMap['contentType'] = contentType;
    return retMap;
  }

  static Future<Map<String, String>?> uploadFile(
      String? ossUrl, String? contentType, String? filePath, String md5) async {
    //filePath : 'C:/hzx/2.jpg'
    if (ossUrl == null || ossUrl == '' || filePath == null || filePath == '') {
      print('[uploadFile] param error!');
      return null;
    }

    try {
      var response = await HttpReqUtil.getInstance().uploadFile(ossUrl, contentType, filePath, md5);
      //print("返回数据：${response.toString()}");

      String url = response.data['url'];
      String thumbUrl = response.data['thumb_url'];

      Map<String, String> retMap = <String, String>{};
      retMap['url'] = url;
      retMap['thumbUrl'] = thumbUrl;
      return retMap;
    } catch (e) {
      print('[uploadFile error] $e');
      return null;
    }
  }

  /// 包装上传文件
  /// 上传成功返回Map: {'url': '', 'thumbUrl': ''}
  static Future<Map<String, String>> uploadImageFile(String imagePath) async {
    String md5 = await IMUtil.fmd5AndBase64(imagePath);
    String fileName = path.basename(imagePath);
    final urlRetMap =
        await APIService.getUploadUrl(LocalUserData.senderUserId, IMConfig.APP_ID, fileName, md5: md5) ?? {};
    if (urlRetMap['ossUrl'] == null || urlRetMap['contentType'] == null) {
      return {};
    }

    final uploadRetMap = await APIService.uploadFile(urlRetMap['ossUrl'], urlRetMap['contentType'], imagePath, md5);
    return uploadRetMap ?? {};
  }

  /// 上传语音
  static Future<String?> uploadAudioData(String audioData) async {
    Map<String, Object> params = {};
    params['data'] = audioData;
    //IMLog.d('uploadAudioData', '${LocalUserData.imDomain + UPLOAD_AUDIO}');
    try {
      var response = await HttpReqUtil.getInstance().postJson(LocalUserData.imDomain + UPLOAD_AUDIO, params);
      String url = response.data['data']['url'];
      //IMLog.d('uploadAudioData', 'response = ${response.toString()} data = ${response.data} ,and url = $url');
      return url;
    } catch (e) {
      print('[uploadAudioData error] $e');
    }
    return null;
  }
}
