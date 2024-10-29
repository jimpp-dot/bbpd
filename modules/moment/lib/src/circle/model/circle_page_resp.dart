import 'package:shared/shared.dart';

class CirclePageData {
  List<CircleActivity> activityList;
  List<CircleFriendsActivity> friendsActivityList;
  List<MyCircle> myCircleList;
  List<RecommendCircle> recommendList;

  bool activityExposure = false;
  bool friendExposure = false;
  bool myCircleExposure = false;
  bool recommendExposure = false;

  CirclePageData.fromJson(Map<String, dynamic> json)
      : activityList =
            Util.parseList(json['activity'], (e) => CircleActivity.fromJson(e)),
        friendsActivityList = Util.parseList(
            json['hubFriends'], (e) => CircleFriendsActivity.fromJson(e)),
        myCircleList =
            Util.parseList(json['myHub'], (e) => MyCircle.fromJson(e)),
        recommendList = Util.parseList(
            json['recommend'], (e) => RecommendCircle.fromJson(e));
}

class CircleActivity {
  int id;
  String? name;
  String? circleName;
  String? icon;

  CircleActivity.fromJson(Map<String, dynamic> json)
      : id = Util.parseInt(json['id']),
        name = Util.parseStr(json['name']),
        circleName = Util.parseStr(json['hubName']),
        icon = Util.parseStr(json['icon']);
}

class CircleFriendsActivity {
  int uid;
  String? name;
  String? roomTag;
  int isOnline;
  String? icon;
  int isInRoom = 0;
  int rid;
  int sex;

  CircleFriendsActivity.fromJson(Map<String, dynamic> json)
      : uid = Util.parseInt(json['uid']),
        name = Util.parseStr(json['name']),
        roomTag = Util.parseStr(json['roomTag']),
        isOnline = Util.parseInt(json['isOnline']),
        icon = Util.parseStr(json['icon']),
        rid = Util.parseInt(json['rid']),
        sex = Util.parseInt(json['sex']) {
    isInRoom = rid > 0 ? 1 : 0;
  }
}

class MyCircle {
  int id;
  String? name;
  int joinedNumber;
  String? icon;
  int hasNew;

  MyCircle.fromJson(Map<String, dynamic> json)
      : id = Util.parseInt(json['id']),
        name = Util.parseStr(json['name']),
        joinedNumber = Util.parseInt(json['nums']),
        icon = Util.parseStr(json['icon']),
        hasNew = Util.parseInt(json['has_new'] ?? 0);
}

class RecommendCircle {
  int id = 0;
  String? name;
  int joinedNumber = 0;
  List<String> avatarList = [];
  List<ImageBean> imageList = [];
  bool joined = false;

  RecommendCircle.fromJson(Map<String, dynamic> json) {
    id = Util.parseInt(json['id']);
    name = Util.parseStr(json['name']);
    joinedNumber = Util.parseInt(json['nums']);
    List? avatarData = json['avatar'];
    List? imageData = json['image'];
    joined = Util.parseBool(json['joined']);
    avatarData?.forEach((element) {
      avatarList.add(element);
    });
    imageData?.forEach((element) {
      if (!element.startsWith(RegExp(r'http(s?)://'))) {
        element = System.imageDomain + element;
      }

      String url = element;
      double width = 0.0;
      double height = 0.0;

      // 分割宽高
      List<String> strs = element.split('?');
      if (strs.length == 2) {
        url = strs[0];
        String extra = strs[1];
        List<String> size = extra.split('*');
        if (size.length >= 2) {
          width = Util.parseDouble(size[0]);
          height = Util.parseDouble(size[1]);
        }
      }
      imageList.add(ImageBean(url: url, width: width, height: height));
    });
  }
}
