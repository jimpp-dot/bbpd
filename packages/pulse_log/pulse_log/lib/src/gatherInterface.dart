import 'package:pulse_log/src/model/log_body.dart';

const kDefaultLogSize = 3 * 1024 * 1024;
const kMinLogSize = 3 * 1024 * 1024;
const kMaxLogSize = 6 * 1024 * 1024;
const kFileHeadST = '''{"version":1,"sembast":1}\n''';
const kMaxFileCount = 5;

abstract class GatherInterface {
  Future saveErrorLog(ExceptionBody logBody);

  Future saveLog(LogBody logBody);

  void clean();

  void disable();

  Future flush();

  Future<bool> haveCrash();
}
