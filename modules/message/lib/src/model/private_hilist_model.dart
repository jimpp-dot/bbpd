import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';

class PrivateHiListModel {
  Conversation conversation;

  ImUserData? userInfo;

  UserConfig? userConfig;

  PrivateHiListModel(this.conversation, this.userInfo, this.userConfig);

  int get uid => userInfo?.uid ?? 0;
}
