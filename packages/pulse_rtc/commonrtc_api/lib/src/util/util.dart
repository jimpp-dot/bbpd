import 'log.dart';

class Util {
  Util._();

  static int parseInt(dynamic value, [int defaultValue = 0]) {
    if (value == null) return defaultValue;
    if (value is String) {
      try {
        return int.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    if (value is int) return value;
    if (value is double) return value.toInt();
    return defaultValue;
  }

  static List<int> parseIntList(dynamic ids) {
    List<int> value = [];
    if (ids != null && ids is List) {
      for (var val in ids) {
        try {
          int id = Util.parseInt(val);
          value.add(id);
        } catch (e) {
          rtcLog("------------ $val, ${e.toString()}");
        }
      }
    }
    return value;
  }

  static List<T> parseList<T>(dynamic list, T Function(dynamic e) f) {
    if (list == null) return <T>[];
    if (list is List) {
      return list.map((e) => f(e)).toList();
    } else {
      return <T>[];
    }
  }

  static double parseDouble(dynamic value, [double defaultValue = 0.0]) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  static String parseStr(dynamic value) {
    if (value == null) return '';
    return '$value';
  }
}
