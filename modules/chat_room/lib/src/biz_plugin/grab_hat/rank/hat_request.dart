import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat.pb.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat_rank.pb.dart';
import 'package:flutter/cupertino.dart';

class HatRequest {
  static bool get _usePb => true;

  /// 帽子图鉴
  static Future<ApiHatActivityAtlasResponse> getHandbookData() async {
    ApiHatActivityAtlasResponse data;
    try {
      XhrResponse response = await Xhr.get('${System.domain}go/yy/hat/atlas',
          pb: _usePb, throwOnError: true);
      data = response.formatProtobuf(ApiHatActivityAtlasResponse.create());
      debugPrint(data.toString());
    } catch (e) {
      data = ApiHatActivityAtlasResponse(success: false, message: '请求错误');
    }
    return data;
  }

  /// 排行榜分类信息
  static Future<ApiHatActivityRankIndexResponse> getRankTabsData() async {
    //1-日榜，2-周榜, 3-总榜
    ApiHatActivityRankIndexResponse data;
    try {
      XhrResponse response = await Xhr.get(
          '${System.domain}go/yy/hat/rankIndex',
          pb: _usePb,
          throwOnError: true);
      data = response.formatProtobuf(ApiHatActivityRankIndexResponse.create());
    } catch (e) {
      data = ApiHatActivityRankIndexResponse(success: false, message: '请求错误');
    }
    return data;
  }

  /// 排行榜
  static Future<ApiHatActivityRankResponse> getRankData(
      int token, int page) async {
    ApiHatActivityRankResponse data;
    try {
      XhrResponse response = await Xhr.get('${System.domain}go/yy/hat/rank',
          queryParameters: {'type': token, 'page': page},
          pb: _usePb,
          throwOnError: true);
      data = response.formatProtobuf(ApiHatActivityRankResponse.create());
      debugPrint(data.toString());
    } catch (e) {
      data = ApiHatActivityRankResponse(success: false, message: '请求错误');
    }

    return data;
  }

  static Future<ApiHatActivityHelpResponse> getHelperData() async {
    ApiHatActivityHelpResponse data;
    try {
      XhrResponse response = await Xhr.get('${System.domain}go/yy/hat/help',
          pb: _usePb, throwOnError: true);
      data = response.formatProtobuf(ApiHatActivityHelpResponse.create());
      debugPrint(data.toString());
    } catch (e) {
      data = ApiHatActivityHelpResponse(success: false, message: '请求错误');
    }

    return data;
  }

  static Future<ResHatMerge> mergeHatPicture(String category) async {
    ResHatMerge data;
    try {
      XhrResponse response = await Xhr.get('${System.domain}go/yy/hat/merge',
          queryParameters: {'category': category},
          pb: _usePb,
          throwOnError: true);
      data = response.formatProtobuf(ResHatMerge.create());
      debugPrint(data.toString());
    } catch (e) {
      data = ResHatMerge(success: false, message: '请求错误');
    }

    return data;
  }
}
