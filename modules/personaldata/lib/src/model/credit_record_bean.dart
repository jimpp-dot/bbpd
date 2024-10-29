// To parse this JSON data, do
//
//     final creditRecord = creditRecordFromJson(jsonString);

import 'dart:convert';

import 'package:shared/shared.dart';

CreditRecord creditRecordFromJson(String str) =>
    CreditRecord.fromJson(json.decode(str));

String creditRecordToJson(CreditRecord data) => json.encode(data.toJson());

class CreditRecord {
  CreditRecord({
    this.creditScore = 0,
    this.runInfo,
    this.success = false,
    this.data,
  });

  int creditScore;
  Map? runInfo;
  bool success;
  List<CreditRecordItem>? data;

  factory CreditRecord.fromJson(Map<String, dynamic> json) => CreditRecord(
        creditScore: json["credit_score"],
        runInfo: json["run_info"],
        success: json["success"],
        data: List<CreditRecordItem>.from(
            json["data"].map((x) => CreditRecordItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "credit_score": creditScore,
        'run_info': runInfo,
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CreditRecordItem {
  CreditRecordItem({
    this.uid,
    this.gameType,
    this.changeScore,
    this.changeDiamond,
    this.description,
    this.dateline = 0,
  });

  String? uid;
  String? gameType;
  String? changeScore;
  String? changeDiamond;
  String? description;
  int dateline;

  factory CreditRecordItem.fromJson(Map<String, dynamic> json) =>
      CreditRecordItem(
        uid: json["uid"],
        gameType: json["game_type"],
        changeScore: json["change_score"],
        changeDiamond: json["change_diamond"],
        description: json["description"],
        dateline: Util.parseInt(json["dateline"]),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "game_type": gameType,
        "change_score": changeScore,
        "change_diamond": changeDiamond,
        "description": description,
        "dateline": dateline,
      };
}
