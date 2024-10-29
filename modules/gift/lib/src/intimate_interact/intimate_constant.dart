import 'package:shared/shared.dart';

class IntimateConstant {
  static String specsUrl =
      '${System.getWebDomain("help")}/help?q=k81&package=${Constant.packageName}&lan=${Translations.getLan()}&ch=${Uri.encodeComponent(DeviceInfo.channel)}';

  static String helpUrl =
      '${System.getWebDomain("help")}/help?q=k80&package=${Constant.packageName}&lan=${Translations.getLan()}&ch=${Uri.encodeComponent(DeviceInfo.channel)}';
}
