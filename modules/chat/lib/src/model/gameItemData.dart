class GameItemData {
  String? id;
  String? icon;
  String? name;
  String? type;

  GameItemData.fromJson(jsonRes) {
    id = jsonRes['id'].toString();
    icon = jsonRes['icon'];
    name = jsonRes['name'];
    type = jsonRes['type'];
  }
}
