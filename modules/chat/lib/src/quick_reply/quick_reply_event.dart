/// 快速回复事件
class QuickReplyEvent {
  QuickReplyEvent._(this.event, this.id, this.text);

  /// 创建分组
  static const String GROUP_CREATE = 'group_create';

  /// 重命名分组
  static const String GROUP_RENAME = 'group_rename';

  /// 删除分组
  static const String GROUP_DELETE = 'group_delete';

  /// 创建回复
  static const String REPLY_CREATE = 'reply_create';

  /// 编辑回复
  static const String REPLY_EDIT = 'reply_edit';

  /// 删除回复
  static const String REPLY_DELETE = 'reply_delete';

  /// 事件名称，取值范围：[GROUP_CREATE]、[GROUP_RENAME]、[GROUP_DELETE]、[REPLY_CREATE]、[REPLY_EDIT]、[REPLY_DELETE]
  final String event;

  /// 当[event]属于[GROUP_CREATE]、[GROUP_RENAME]、[GROUP_DELETE]之一，则[id]表示分组的id；
  /// 当[event]属于[REPLY_CREATE]、[REPLY_EDIT]、[REPLY_DELETE]之一，则[id]表示回复的id；
  final int id;

  /// 与[id]同理
  final String? text;

  QuickReplyEvent.of(this.event, this.id, this.text);

  @override
  String toString() {
    return '{event: $event, id: $id, text: $text}';
  }
}
