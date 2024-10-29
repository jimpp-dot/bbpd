import 'package:shared/shared.dart';

///邀请上麦，邀请信息

class MicInviter {
  int rid;
  int position;
  int vrid;
  int inviterUid;
  int uid;
  String inviterName;

  MicInviter(this.rid, this.position, this.vrid, this.inviterUid, this.uid,
      this.inviterName);

  factory MicInviter.fromJson(Map<String, dynamic> json) {
    int rid = Util.parseInt(json["rid"]);
    int position = Util.parseInt(json["position"]);
    int vrid = Util.parseInt(json["vrid"]);
    int inviterUid = Util.parseInt(json["inviter_uid"]);
    int uid = Util.parseInt(json["uid"]);
    String inviterName = Util.notNullStr(json["inviter_name"]);
    return MicInviter(rid, position, vrid, inviterUid, uid, inviterName);
  }
}
