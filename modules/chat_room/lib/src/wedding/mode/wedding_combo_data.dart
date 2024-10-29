import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wedding_combo_data.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class WeddingComboConfig {
  final String notice;

  /// 连击持续时间 秒
  final int duration;

  /// 连击一次价格
  final int unitPrice;

  /// 动画间隔时间 毫秒
  final int effectIntervalTime;

  /// 动画时长 毫秒
  final int effectDuration;
  final List<String> mediumImage;
  final List<String> bigImage;
  final List<String> smallImages;

  WeddingComboConfig(
      this.notice,
      this.duration,
      this.unitPrice,
      this.mediumImage,
      this.bigImage,
      this.smallImages,
      this.effectIntervalTime,
      this.effectDuration);

  factory WeddingComboConfig.fromJson(Map<String, dynamic> json) {
    return _$WeddingComboConfigFromJson(json);
  }

  List<String> get mediumImageUrls {
    if (mediumImage.isEmpty) return [];

    return mediumImage.map((e) => Util.getRemoteImgUrl(e)).toList();
  }

  List<String> get bigImageUrls {
    if (bigImage.isEmpty) return [];

    return bigImage.map((e) => Util.getRemoteImgUrl(e)).toList();
  }

  List<String> get smallImageUrls {
    if (smallImages.isEmpty) return [];
    return smallImages.map((e) => Util.getRemoteImgUrl(e)).toList();
  }
}

/// 连击玩家
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class WeddingComboUser {
  int hitNum = 0;
  final String icon;
  final int uid;
  final String message;
  final String name;
  final int vipLevel;

  WeddingComboUser(this.uid,
      {required this.icon,
      required this.message,
      required this.name,
      required this.vipLevel});

  factory WeddingComboUser.fromJson(Map<String, dynamic> json) {
    return _$WeddingComboUserFromJson(json);
  }
}

/// 连击礼物
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class WeddingComboGift {
  ///普通气球small 中型气球束 medium 大型气球束 big
  final String type;
  final List<WeddingComboGiftItem> giftList;

  WeddingComboGift(this.type, this.giftList);

  factory WeddingComboGift.fromJson(Map<String, dynamic> json) {
    return _$WeddingComboGiftFromJson(json);
  }
}

int _giftAnimateId = 0;

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class WeddingComboGiftItem {
  /// 动画通道位置
  final int position;

  /// small动画的图片资源下标
  final int index;
  final double w;
  final double h;
  int id;
  String imageUrl;
  String type;

  WeddingComboGiftItem(this.position, this.index, this.w, this.h, this.id,
      this.imageUrl, this.type);

  factory WeddingComboGiftItem.fromJson(Map<String, dynamic> json) {
    _giftAnimateId += 1;
    WeddingComboGiftItem item = _$WeddingComboGiftItemFromJson(json);
    item.id = _giftAnimateId;
    return item;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is WeddingComboGiftItem && other.id == id;
  }
}
