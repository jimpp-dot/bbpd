/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Description: Num Util.
 * @Date: 2018/9/18
 */

/// Num Util.
class NumUtil {
  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  // static num? getNumByValueStr(String? valueStr, {int? fractionDigits}) {
  //   if (valueStr == null) return null;
  //   double? value = double.tryParse(valueStr);
  //   return fractionDigits == null ? value : getNumByValueDouble(value, fractionDigits);
  // }

  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  static num getNumByValueDouble(double value, int fractionDigits) {
    String valueStr = value.toStringAsFixed(fractionDigits);
    return (fractionDigits == 0 ? int.tryParse(valueStr) : double.tryParse(valueStr)) ?? 0;
  }

  /// get int by value str.
  static int getIntByValueStr(String valueStr, {int defValue = 0}) {
    return int.tryParse(valueStr) ?? defValue;
  }

  /// get double by value str.
  static double getDoubleByValueStr(String valueStr, {double defValue = 0}) {
    return double.tryParse(valueStr) ?? defValue;
  }

  ///isZero
  static bool isZero(num value) {
    return value == 0;
  }
}
