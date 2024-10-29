import 'package:shared/shared.dart';

import 'generated/common_attribution.pb.dart';

class PrettyIdRepo {
  /// 用户归因弹框奖励接口
  static Future<ResAttributionReward> attributionPopUpReward() async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/attribution/popUpReward',
        pb: true,
        throwOnError: true,
      );
      return ResAttributionReward.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAttributionReward(success: false, msg: e.toString());
    }
  }

  /// 用户归因弹框奖励领取接口
  static Future<ResClaimReward> attributionClaimReward(int rewardId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/attribution/claimReward',
        {
          'reward_id': rewardId.toString(),
          'api_version': '1',
        },
        pb: true,
      );
      return ResClaimReward.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResClaimReward(success: false, msg: e.toString());
    }
  }
}
