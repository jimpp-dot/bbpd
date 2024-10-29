import 'package:shared/any_pb_parse.dart';
import 'package:group/src/model/pb/generated/account.pb.dart';

/// ProtoBuffer Any type urls mapping
class PbTypeUrls {
  static PbInstanceBuilder? get(String typeUrl) {
    return typeUrls[typeUrl];
  }

  static Map<String, PbInstanceBuilder> typeUrls = {
    'type.googleapis.com/pb.AccountInfoVideo': () => AccountInfoVideo.create(),
    'type.googleapis.com/pb.AccountInfoHeader': () =>
        AccountInfoHeader.create(),
    'type.googleapis.com/pb.AccountSexInfo': () => AccountSexInfo.create(),
    'type.googleapis.com/pb.AccountCardTag': () => AccountCardTag.create(),
    'type.googleapis.com/pb.AccountDialog': () => AccountDialog.create(),
    'type.googleapis.com/pb.AccountVideo': () => AccountVideo.create(),
    'type.googleapis.com/pb.AccountInfoColor': () => AccountInfoColor.create(),
    'type.googleapis.com/pb.AccountInfoCard': () => AccountInfoCard.create(),
    'type.googleapis.com/pb.AccountTags': () => AccountTags.create(),
    'type.googleapis.com/pb.AccountInfo': () => AccountInfo.create(),
    'type.googleapis.com/pb.ResAccountInfo': () => ResAccountInfo.create(),
  };
}
