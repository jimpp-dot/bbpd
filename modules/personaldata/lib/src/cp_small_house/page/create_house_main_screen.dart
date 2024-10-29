import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';

import 'create_house_invite_me_page.dart';
import 'create_house_send_invite_page.dart';

class CreateHouseMainScreen extends StatefulWidget {
  final int uid;
  final int initialIndex;
  final String refer;

  const CreateHouseMainScreen(
      {Key? key, required this.uid, this.initialIndex = 0, this.refer = 'chat'})
      : super(key: key);

  @override
  State<CreateHouseMainScreen> createState() => _CreateHouseMainScreenState();

  static Future show(BuildContext context,
      {required int uid, int initialIndex = 0, String refer = 'chat'}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateHouseMainScreen(
            uid: uid, initialIndex: initialIndex, refer: refer),
      ),
    );
  }
}

class _CreateHouseMainScreenState extends State<CreateHouseMainScreen>
    with TickerProviderStateMixin {
  late ExtendedTabController _controller;

  final GlobalKey<CreateHouseSendInvitePageState> _sendInviteKey = GlobalKey();
  final GlobalKey<CreateHouseInviteMePageState> _inviteMeKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = ExtendedTabController(
        length: 2, vsync: this, initialIndex: widget.initialIndex);

    Tracker.instance
        .track(TrackEvent.create_house_show, properties: {'uid': Session.uid});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(K.personal_create_small_house, style: R.textStyle.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SubTabScrollWidget(
              controller: _controller,
              tabLabels: [
                K.personaldata_send_invite_tab,
                K.personaldata_invite_me_tab,
              ],
              redDotIndex: null,
            ),
            Expanded(
              child: ExtendedTabBarView(
                controller: _controller,
                children: [
                  KeepAliveWrapper(
                      child: CreateHouseSendInvitePage(key: _sendInviteKey)),
                  KeepAliveWrapper(
                      child: CreateHouseInviteMePage(widget.refer,
                          key: _inviteMeKey)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
