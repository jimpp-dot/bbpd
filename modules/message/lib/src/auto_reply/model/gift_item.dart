import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gift_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GiftItem {
  final int id;
  final String? name;
  final int price;

  GiftItem(this.id, this.name, this.price);

  factory GiftItem.fromJson(Map<String, dynamic> json) =>
      _$GiftItemFromJson(json);
}
