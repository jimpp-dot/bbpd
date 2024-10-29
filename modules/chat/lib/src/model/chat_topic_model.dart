// 皮小妹话题消息
import 'package:shared/shared.dart';

class ChatTopicModel {
  final int tagId; // 话题ID，可空
  final String? image; // 顶部图片，可空
  final String? title; // 标题
  final String? desc; // 描述
  final String? navUrl; // h5跳转链接，可空
  final String? appletName; //小程序跳转名字，可空
  final String? appletUrl; //小程序跳转链接，可空
  final String? tag; // 标题左边标签，可空
  final String? rightTopTag;

  ChatTopicModel(
      {required this.tagId,
      this.image,
      this.title,
      this.desc,
      this.navUrl,
      this.appletName,
      this.appletUrl,
      this.tag,
      this.rightTopTag}); // 图片右上角标签

  factory ChatTopicModel.fromJson(Map<String, dynamic>? json) {
    String? appletName;
    String? appletUrl;
    try {
      appletName = Util.parseStr(json?['wechat_applet']['program_name']);
      appletUrl = Util.parseStr(json?['wechat_applet']['program_path']);
    } catch (e) {
      appletName = null;
      appletUrl = null;
    }

    return ChatTopicModel(
      tagId: Util.parseInt(json?['tagId']),
      image: Util.parseStr(json?['image']),
      title: Util.parseStr(json?['title']),
      desc: Util.parseStr(json?['desc']),
      navUrl: Util.parseStr(json?['navUrl']),
      appletName: appletName,
      appletUrl: appletUrl,
      tag: Util.parseStr(json?['tag']),
      rightTopTag: Util.parseStr(json?['rightTopTag']),
    );
  }
}
