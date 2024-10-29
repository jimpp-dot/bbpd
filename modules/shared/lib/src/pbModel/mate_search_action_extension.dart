import 'package:shared/shared.dart';

extension MateSearchJointItemAction on MateSearchJointItem {
  bool get isUserType => type == 1;

  bool get isFleetType => type == 2;

  bool get isUnionType => type == 3;

  bool get isGroupType => type == 4;

  bool get isBagType => type == 5;

  bool get isRoomType => type == 6;

  bool get isTourType => type == 7;

  bool get isEggType => type == 8;

  bool get isEncounter => type == 9;
}

extension MateSearchJointUserItemAction on MateSearchJointUserItem {
  static int FollowTypeNotFollow = 0;
  static int FollowTypeFollow = 1;
  static int FollowTypeFriends = 2;

  bool get isNotFollow => follow == FollowTypeNotFollow;

  bool get isFollowed => follow == FollowTypeFollow;

  bool get isFriend => follow == FollowTypeFriends;
}

extension MateSearchJointEggItemAction on MateSearchJointEggItem {
  bool get isCardDisplayAfterVideo => cardDisplayType == 1;

  bool get isCardDisplayContinues => cardDisplayType == 0;

  bool get isRedirectTypePersonalPage => redirectType == 0;

  bool get isRedirectTypeRoom => redirectType == 1;

  bool get isRedirectTypePrivateChat => redirectType == 2;

  bool get isRedirectTypeDrama => redirectType == 3;

  bool get isRedirectTypeDrawAndGuess => redirectType == 4;

  bool get isRedirectTypeTurtleSoup => redirectType == 5;

  bool get isRedirectTypeWolfKiller => redirectType == 6;

  bool get isRedirectTypeUndercover => redirectType == 7;
}
