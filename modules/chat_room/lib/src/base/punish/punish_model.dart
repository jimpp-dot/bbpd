import 'package:shared/shared.dart';
import 'package:equatable/equatable.dart';

class PunishModel extends Equatable {
  final int id;
  final int type;
  final String name;
  final String content;

  const PunishModel({
    this.id = 0,
    this.type = 0,
    this.name = '',
    this.content = '',
  });

  factory PunishModel.fromJson(Map<String, dynamic> json) {
    return PunishModel(
      id: Util.parseInt(json["id"]),
      type: Util.parseInt(json["type"]),
      name: Util.notNullStr(json["name"]),
      content: Util.notNullStr(json["content"]),
    );
  }

  @override
  String toString() {
    return 'PunishModel{id:$id, type: $type, name: $name, content: $content}';
  }

  @override
  List<Object> get props => [id, type, name, content];
}
