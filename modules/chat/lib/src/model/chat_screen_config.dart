class ChatScreenConfig {
  bool showAppBar = true; // 是否显示 AppBar
  bool canModify = true; // 是否响应长按操作手势
  bool useCustomDataSource = false; // 使用自定义的数据源

  int pageNum = 20; // 一次分页拉取消息的数量
  String? editingTitle; // 编辑时显示的自定义 title
}
