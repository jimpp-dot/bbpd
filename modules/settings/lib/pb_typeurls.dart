import 'package:shared/any_pb_parse.dart';
import 'package:settings/src/model/pb/generated/law.pb.dart';
import 'package:settings/src/model/pb/generated/banner_info.pb.dart';

/// ProtoBuffer Any type urls mapping
class PbTypeUrls {
  static PbInstanceBuilder? get(String typeUrl) {
    return typeUrls[typeUrl];
  }

  static Map<String, PbInstanceBuilder> typeUrls = {
    'type.googleapis.com/pb.CollectInfo': () => CollectInfo.create(),
    'type.googleapis.com/pb.ResCollectInfo': () => ResCollectInfo.create(),
    'type.googleapis.com/pb.ResRecommendDesc': () => ResRecommendDesc.create(),
    'type.googleapis.com/pb.SettingChargeGiftResp': () =>
        SettingChargeGiftResp.create(),
    'type.googleapis.com/pb.SettingFormatCommodity': () =>
        SettingFormatCommodity.create(),
    'type.googleapis.com/pb.SettingChargeGiftItem': () =>
        SettingChargeGiftItem.create(),
    'type.googleapis.com/pb.SettingChargeGiftDetail': () =>
        SettingChargeGiftDetail.create(),
    'type.googleapis.com/pb.SettingBannerDetail': () =>
        SettingBannerDetail.create(),
  };
}
