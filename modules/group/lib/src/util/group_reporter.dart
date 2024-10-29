import 'package:shared/shared.dart';

class GroupReporter {
  static createdGroup() {
    Tracker.instance.track(TrackEvent.created_group,
        properties: {"popularity_level": Session.popularityLevel});
  }

  static inviteInGroup(bool isCreator) {
    Tracker.instance.track(TrackEvent.invite_in_group,
        properties: {"role": isCreator ? "groupowner" : "groupmember"});
  }

  static acceptGroupInvitation() {
    Tracker.instance.track(TrackEvent.accept_group_invitation);
  }

  static applyInGroup() {
    Tracker.instance.track(TrackEvent.apply_in_group);
  }

  static dealWithGroupApply(bool agree) {
    Tracker.instance.track(TrackEvent.deal_with_group_apply,
        properties: {'is_agreed': agree});
  }
}
