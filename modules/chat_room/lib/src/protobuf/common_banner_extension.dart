import 'dart:convert';

import 'package:shared/shared.dart' hide BannerItem;
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

import 'generated/common_banner.pb.dart';

class BannerItemEntity {
  bool hasReport = false;
  final BannerItem item;
  final String? page;
  final String? jumpUrl;
  final Map? params;

  BannerItemEntity(this.item, this.hasReport,
      {this.page, this.jumpUrl, this.params});

  static BannerItemEntity? formatBanner(BannerItem item, {int? rid}) {
    if (item.type == 'app') {
      String jumpUrl = SchemeUrlHelper.instance().concatSchemeUrl(
          item.url, SchemeUrlHelper.scheme_path_common_redirect);
      // Log.d('formatBanner app-jumpUrl:$jumpUrl');
      return BannerItemEntity(item, false, jumpUrl: jumpUrl);
    } else if (item.type == 'web') {
      var content = const Utf8Encoder().convert(Session.uid.toString());
      var digest = md5.convert(content);
      String uid = hex.encode(digest.bytes).toLowerCase();
      String url = item.url;
      if (url.contains("?")) {
        url = '$url&uid=$uid';
      } else {
        url = '$url?uid=$uid';
      }
      url = '$url&rid=$rid';
      Map params = {'title': item.title};
      if (item.data.isNotEmpty) {
        try {
          params = json.decode(item.data);
        } catch (e) {
          Log.d(e.toString());
        }
      }
      if (!params.containsKey('title')) {
        params['title'] = Util.appName;
      }
      String jumpUrl = SchemeUrlHelper.instance()
          .concatSchemeUrlByH5(url, title: item.title);
      // Log.d('formatBanner web-jumpUrl:$jumpUrl');
      return BannerItemEntity(item, false, jumpUrl: jumpUrl, params: params);
    }
    return null;
  }
}
