import 'package:shared/shared.dart';
import 'package:stack_trace/stack_trace.dart';

class StackTraceUtil {
  static StackTrace? get currentStackTrace => System.debug ? StackTrace.current : null;

  static bool _needFilter(Frame frame) => frame.isCore || frame.package == 'flutter' || frame.location.contains('stack_trace_util');

  static void printStackTrace({String? tag, String? url, StackTrace? trace}) {
    if (!System.debug) return;

    trace ??= currentStackTrace;

    List<String> traceList = [];
    for (var trace in Chain.forTrace(trace!).traces) {
      traceList.addAll(
        trace.frames.where((frame) => !_needFilter(frame)).map((frame) => ' ${frame.location}\n'),
      );
    }
    _formatPrint(tag, url, traceList);
  }

  static void _formatPrint(String? tag, String? url, List<String> traceList) {
    Uri uri = Uri.parse(url!);
    String path = uri.path;

    Log.w('''
      Download image failed : 
      https://${uri.host}$path''');

    Log.w('''
      Download image failed : 
      $url 
      $path''');
  }
}
