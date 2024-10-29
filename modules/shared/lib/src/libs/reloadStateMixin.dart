mixin ReloadStateMixin {
  final int maxReloadDurationInMilliSecs = 60 * 1000;

  void reload({bool force = true, animated = true}) {
    scrollToTop(animated: animated);
  }

  void scrollToTop({bool animated = true});

  int nowMilliSecs() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
