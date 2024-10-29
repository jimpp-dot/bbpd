import 'package:shared/shared.dart';

import 'generated/ktv.pb.dart';

class KtvTaskRepo {
  /// /go/room/ktv/task [get] rid 就行
  /// KTV房间任务
  static Future<ApiKtvRoomTaskConfigResponse> getKtvTask(int rid) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/room/ktv/task?rid=$rid',
        pb: true,
        throwOnError: true,
      );
      return ApiKtvRoomTaskConfigResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiKtvRoomTaskConfigResponse(
          success: false, message: e.toString());
    }
  }

  /// /go/room/ktv/benefit [get] rid 就行
  /// KTV房间等级权益
  static Future<ApiKtvRoomBenefitResponse> getKtvBenefit(int rid) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/room/ktv/benefit?rid=$rid',
        pb: true,
        throwOnError: true,
      );
      return ApiKtvRoomBenefitResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiKtvRoomBenefitResponse(success: false, message: e.toString());
    }
  }

  /// /go/room/ktv/signIn [post] rid
  /// KTV房间任务签到
  static Future<NormalNull> postKtvSignIn(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/ktv/signIn',
        {'rid': rid.toString()},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// /go/room/ktv/receiveBenefit[post] req:rid. | resp:NormalNull
  /// 领取KTV房间等级权益
  static Future<NormalNull> postKtvReceiveBenefit(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/ktv/receiveBenefit',
        {'rid': rid.toString()},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
