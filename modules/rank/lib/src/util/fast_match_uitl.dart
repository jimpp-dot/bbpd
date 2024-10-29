import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

class FastMatchUtil {
  static toFastMatch(BuildContext context, String type, String title,
      {bool noPartyType = false}) async {
    bool teammateHandleVerify =
        await Util.teammateHandleVerify(context, type, null);
    if (!teammateHandleVerify) {
      return;
    }

    Tracker.instance.track(TrackEvent.friend_partytype_click, properties: {
      'display': title,
    });

    IRoomManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    manager.openStartParty(context, type,
        refer: 'home', noPartyType: noPartyType);
  }
}
