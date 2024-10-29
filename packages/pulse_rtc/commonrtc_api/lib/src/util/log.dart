import '../rtc_engine.dart';

void rtcLog(Object? msg) {
  if (msg == null) return;
  if (RtcEngine.debug) {
    var tag = RtcEngine.TAG;
    StringBuffer sb = StringBuffer();
    sb
      ..write(DateTime.now().toString())
      ..write(" ")
      ..write(tag)
      ..write(': ')
      ..write(msg);
    print(sb.toString());
  }
}
