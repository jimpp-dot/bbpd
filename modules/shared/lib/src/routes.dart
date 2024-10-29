class Routes {
  static final List<RegExp> _allowedOuterPathRegExpList = [RegExp(r'^￥/room/')];

  static bool checkOuterPathValid(String path) {
    for (RegExp regExp in _allowedOuterPathRegExpList) {
      if (regExp.hasMatch(path)) {
        return true;
      }
    }
    return false;
  }
}
