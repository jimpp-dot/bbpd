import 'package:shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'url_msg_item.g.dart';

class UrlMsgItemWidget extends StatelessWidget {
  final UrlMsgItem msgItem;

  const UrlMsgItemWidget({super.key, required this.msgItem});

  List<TextSpan> parseSpan(String? str, List<HighLightInfo>? hlList) {
    if (str == null || str.isEmpty) return [];
    if (hlList == null || hlList.isEmpty) {
      return [
        TextSpan(
          text: str,
          style: TextStyle(
              fontSize: 16,
              color: R.colors.mainTextColor,
              fontFamily: Util.fontFamily),
        )
      ];
    }

    List<TextSpan> spans = [];
    HighLightInfo hlInfo = hlList[0];
    List<String> subStrs = str.split(hlInfo.key ?? '');

    for (int j = 0; j < subStrs.length; j++) {
      spans.addAll(parseSpan(subStrs[j], hlList.sublist(1)));
      if (j < subStrs.length - 1) {
        spans.add(TextSpan(
          text: hlInfo.content,
          style: TextStyle(
              fontSize: 16,
              color: R.colors.highlightColor,
              fontFamily: Util.fontFamily),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (hlInfo.url == null || hlInfo.url!.isEmpty) return;
              BaseWebviewScreen.show(System.context, url: hlInfo.url!);
            },
        ));
      }
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    if (msgItem.extra?.hlList == null) {
      return Text(
        msgItem.content ?? '',
        style: TextStyle(
            fontSize: 16,
            color: R.colors.mainTextColor,
            fontFamily: Util.fontFamily),
      );
    } else if (msgItem.extra?.hlList.length == 1) {
      return GestureDetector(
        onTap: () {
          HighLightInfo hlInfo = msgItem.extra!.hlList[0];
          if (hlInfo.url == null || hlInfo.url!.isEmpty) return;
          BaseWebviewScreen.show(System.context, url: hlInfo.url!);
        },
        child: Text.rich(TextSpan(
            children: parseSpan(msgItem.content, msgItem.extra?.hlList))),
      );
    } else {
      return Text.rich(TextSpan(
          children: parseSpan(msgItem.content, msgItem.extra?.hlList)));
    }
  }
}

@JsonSerializable(createToJson: false)
class HighLightInfo {
  String? url;
  String? key;
  String? content;

  HighLightInfo(this.url, this.key, this.content);

  factory HighLightInfo.fromJson(Map<String, dynamic> json) =>
      _$HighLightInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class UrlMsgExtra {
  String? type;

  @JsonKey(name: 'highlight_list')
  List<HighLightInfo> hlList;

  UrlMsgExtra(this.type, this.hlList);

  factory UrlMsgExtra.fromJson(Map<String, dynamic> json) =>
      _$UrlMsgExtraFromJson(json);
}

@JsonSerializable(createToJson: false)
class UrlMsgItem {
  String? content;
  UrlMsgExtra? extra;

  UrlMsgItem(this.content, this.extra);

  factory UrlMsgItem.fromJson(Map<String, dynamic> json) =>
      _$UrlMsgItemFromJson(json);
}
