import '../shared.dart';

/// 带尺寸的图片链接信息
class ImageBean {
  final String? url;
  double width;
  double height;

  String? heroTag;

  ImageBean({this.url, this.width = 0, this.height = 0});

  String? get cover375 {
    String? result = url;
    if (result == null || result.isEmpty) {
      return result;
    }

    if (!result.startsWith(RegExp(r'http(s?):\/\/'))) {
      result = System.imageDomain + result;
    }

    if (!result.contains(RegExp(r'!cover(\d+)')) &&
        !result.contains(RegExp(r'!head(\d+)'))) {
      result = '$result!cover375';
    }

    return result;
  }

  String? get head100 {
    String? result = url;
    if (result == null || result.isEmpty) {
      return result;
    }

    if (!result.startsWith(RegExp(r'http(s?):\/\/'))) {
      result = System.imageDomain + result;
    }

    if (!result.contains(RegExp(r'!cover(\d+)')) &&
        !result.contains(RegExp(r'!head(\d+)'))) {
      result = '$result!head100';
    }

    return result;
  }
}
