// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:pulse_log/pulse_log.dart';
import 'package:logger/logger.dart';

class ConsoleBodyWithLevel extends ConsoleBody {
  Level level;

  ConsoleBodyWithLevel(String content, this.level) : super(content);

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map['level'] = level.name;
    return map;
  }
}
