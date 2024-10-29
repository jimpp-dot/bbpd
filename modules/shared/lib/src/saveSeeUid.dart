class SaveSeeUid {
  static SaveSeeUid? _instance;

  static SaveSeeUid instance() {
    return _instance ??= SaveSeeUid();
  }

  SaveSeeUid();

  final List<int> _uids = [];

  add(int uid) {
    _uids.add(uid);
  }

  List<int> get uids {
    return _uids;
  }

  clear() {
    _uids.clear();
  }
}
