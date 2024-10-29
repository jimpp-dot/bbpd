import 'generated/slp_gs.pb.dart';

extension GsChatMsgAction on GsChatMsg {
  bool get hasData => content.isNotEmpty;

  bool get isText => type == 1 && hasData;

  bool get isVoice => type == 2 && hasData;

  bool get isImage => type == 3 && hasData;
}
