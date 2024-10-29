import 'package:shared/shared.dart';

class RushCircleRedPoint {
  final int newNum;

  RushCircleRedPoint(this.newNum);

  factory RushCircleRedPoint.fromJson(Map<String, dynamic> json) =>
      RushCircleRedPoint(Util.parseInt(json['has_new']));
}
