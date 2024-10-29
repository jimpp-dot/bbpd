mixin TabStateMixin {
  bool _isCurrentTab = true;

  set isCurrentTab(bool isCurrent) {
    _isCurrentTab = isCurrent;

    onTabChanged();
  }

  bool get isCurrentTab => _isCurrentTab;

  void onTabChanged() {}
}
