import 'dart:convert';

class KillerActivityPackResp {
  KillerActivityPackResp({
    this.success,
    this.data,
  });

  final bool? success;
  final ActivityPackData? data;

  factory KillerActivityPackResp.fromRawJson(String str) =>
      KillerActivityPackResp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KillerActivityPackResp.fromJson(Map<String, dynamic> json) =>
      KillerActivityPackResp(
        success: json["success"],
        data: json["data"] == null
            ? null
            : ActivityPackData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class ActivityPackData {
  ActivityPackData({
    this.title,
    this.leftSeconds = 0,
    this.packages,
  });

  final String? title;
  final int leftSeconds;
  final List<BGPackageItem>? packages;

  factory ActivityPackData.fromRawJson(String str) =>
      ActivityPackData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActivityPackData.fromJson(Map<String, dynamic> json) =>
      ActivityPackData(
        title: json["title"],
        leftSeconds: json["left_seconds"],
        packages: json["packages"] == null
            ? null
            : List<BGPackageItem>.from(
                json["packages"].map((x) => BGPackageItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "left_seconds": leftSeconds,
        "packages": packages == null
            ? null
            : List<dynamic>.from(packages!.map((x) => x.toJson())),
      };
}

class BGPackageItem {
  BGPackageItem({
    this.id = 0,
    this.name,
    this.bought = false,
    this.commoditys,
    this.icon,
    this.image,
    this.price,
  });

  final int id;
  final String? name;
  bool bought;
  final List<BGPackCommodityItem>? commoditys;
  final String? icon;
  final String? image;
  final String? price;

  factory BGPackageItem.fromRawJson(String str) =>
      BGPackageItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BGPackageItem.fromJson(Map<String, dynamic> json) => BGPackageItem(
        id: json["id"],
        name: json["name"],
        bought: json["bought"],
        commoditys: json["commoditys"] == null
            ? null
            : List<BGPackCommodityItem>.from(
                json["commoditys"].map((x) => BGPackCommodityItem.fromJson(x))),
        icon: json["icon"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bought": bought,
        "commoditys": commoditys == null
            ? null
            : List<dynamic>.from(commoditys!.map((x) => x.toJson())),
        "icon": icon,
        "image": image,
        "price": price,
      };
}

class BGPackCommodityItem {
  BGPackCommodityItem({
    this.cid,
    this.num = 0,
    this.name,
    this.image,
    this.period,
    this.periodHour,
    this.type,
  });

  final String? cid;
  final int num;
  final String? name;
  final String? image;
  final String? period;
  final String? periodHour;
  final String? type;

  factory BGPackCommodityItem.fromRawJson(String str) =>
      BGPackCommodityItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BGPackCommodityItem.fromJson(Map<String, dynamic> json) =>
      BGPackCommodityItem(
        cid: json["cid"],
        num: json["num"],
        name: json["name"],
        image: json["image"],
        period: json["period"],
        periodHour: json["period_hour"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "num": num,
        "name": name,
        "image": image,
        "period": period,
        "period_hour": periodHour,
        "type": type,
      };
}
