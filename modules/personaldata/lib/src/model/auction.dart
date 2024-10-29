// import 'package:shared/shared.dart';
// import 'package:shared/k.dart' as BaseK;
// import 'package:shared/model/base_response.dart';
// import 'package:shared/model/defend_bean.dart';
// import 'package:flutter/material.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:personaldata/k.dart';

// part 'auction.g.dart';
//
// @JsonSerializable(createToJson: false)
// class ImageAuctionInfo {
//   @JsonKey(name: 'attendant_count')
//   int totalCount;
//
//   @JsonKey(name: 'attendant')
//   List<DefendRelationModel> auctionUsers;
//
//   ImageAuctionInfo(this.auctionUsers);
//
//   factory ImageAuctionInfo.fromJson(Map<String, dynamic> json) => _$ImageAuctionInfoFromJson(json);
// }

// @JsonSerializable(createToJson: false)
// class AuctionListRsp extends BaseResponse {
//
//   @JsonKey(name: 'data')
//   List<DefendRelationModel> items;
//
//   AuctionListRsp({bool success, String msg, this.items}) : super(success: success, msg: msg);
//
//   factory AuctionListRsp.fromJson(Map<String, dynamic> json) => _$AuctionListRspFromJson(json);
// }

// class AuctionRepository {
//
//   static Future<AuctionListRsp> getAuctionList(int uid, int page) async {
//
//     String url = '${System.domain}auction/attendant?page=$page';
//     try {
//       XhrResponse response = await Xhr.postJson(url, {
//         'uid' : '$uid',
//       }, throwOnError: false);
//       if (response.error != null) {
//         Log.d(response.error.toString());
//         return AuctionListRsp(msg: response.error.toString(), success: false);
//       }
//
//       Map res = response.response;
//       if (!(res['success']??false)) {
//         return AuctionListRsp(msg: res['msg'], success: false);
//       }
//       try {
//         AuctionListRsp responseData = AuctionListRsp.fromJson(res);
//         return responseData;
//       } catch (e) {
//         return AuctionListRsp(msg: R.array('xhr_error_type_array')[6], success: false);
//       }
//     } catch (e) {
//       return AuctionListRsp(msg: e.toString(), success: false);
//     }
//   }
//
// }
