class FriendsListType {
  static const String Follow = 'follow';
  static const String Fan = 'fans';
  static const String Friend = 'friend';
  static const String Room = 'room';
  static const String Group = 'group';
  static const String Companion = 'companion';

  static toInt(String type) {
    Map map = {
      FriendsListType.Follow: 0,
      FriendsListType.Fan: 1,
      FriendsListType.Friend: 2,
      FriendsListType.Group: 3,
      FriendsListType.Room: 4,
      FriendsListType.Companion: 5,
    };

    return map[type] ?? 0;
  }
}
