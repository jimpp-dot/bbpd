import 'package:shared/shared.dart';
import 'package:moment/moment.dart';

class CircleMomentData {
  final int more;
  final List<Moment> momentList;

  CircleMomentData(this.more, this.momentList);

  factory CircleMomentData.fromJson(Map<String, dynamic> json) =>
      CircleMomentData(
        Util.parseInt(json['more']),
        Util.parseList(json['output'], (e) => Moment.fromJson(e['info'])),
      );
}
