/// 动态公开类型
class GroupItem {
  String? id;
  String? title;
  String? tips;

  GroupItem({this.id, this.title, this.tips});

  get authType {
    switch (id) {
      case '0':
        return 'public';
      case '1':
        return 'friend';
      case '2':
        return 'private';
      default:
        return 'public';
    }
  }
}
