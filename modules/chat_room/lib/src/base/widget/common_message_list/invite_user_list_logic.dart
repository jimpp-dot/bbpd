import 'package:get/get.dart';

/// msgList和msgItem之间，共享数据
class InviteUserListLogic extends GetxController {
  List<int> welcomeList = []; //已经快捷欢迎的用户
  List<int> inviteList = []; //已经快捷邀请的用户

  addWelcome(int uid) {
    welcomeList.add(uid);
    update();
  }

  addInvite(int uid) {
    inviteList.add(uid);
    update();
  }
}
