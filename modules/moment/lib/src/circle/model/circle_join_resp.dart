import 'package:shared/shared.dart';

class CircleOpResult {
  final String? result;

  CircleOpResult(this.result);

  factory CircleOpResult.fromJson(Map<String, dynamic> json) =>
      CircleOpResult(Util.parseStr(json['result']));
}
