import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 动态自定义主题
class MomentThemeConfig {
  late TextStyle labelStyle; // tab 选中文字样式
  late TextStyle unselectedLabelStyle; // tab 非选中文字样式
  late Color unselectedLabelColor; // tab 非选中文字颜色

  late Color likeColor; //点赞后数字颜色
  late Color tagBackground; //标签背景色
  late Color tagTextColor; //标签文字色
  late Color replyColor; //评论回复俩字的颜色
  late Color audioProgressColor; //发布页语音录入进度条颜色

  bool showComment = true; // 动态列表是否展现评论
  bool showCommentMore = false; //是否显示更多评论

  bool showSayHiV2 = false;
  bool showNormalTag = false;

  bool showGroupSelect = true;
  bool sendMomentMustWithText = false; //发送动态是否必须带文字(图片/音频/视频)

  MomentThemeConfig({
    TextStyle? labelStyle,
    TextStyle? unselectedLabelStyle,
    Color? unselectedLabelColor,
    Color? likeColor,
    Color? tagBackground,
    Color? tagTextColor, //标签文字色
    Color? replyColor, //评论回复俩字的颜色
    Color? audioProgressColor, //发布页语音录入进度条颜色
    Color? unselectedTagTextColor,
    this.showComment = true,
    this.showCommentMore = false,
    this.showSayHiV2 = false,
    this.showNormalTag = true,
    this.showGroupSelect = true,
    this.sendMomentMustWithText = false,
  }) {
    this.labelStyle = labelStyle ??
        TextStyle(
            color: R.color.mainTextColor,
            fontSize: 22,
            fontWeight: FontWeight.w600);
    this.unselectedLabelStyle = unselectedLabelStyle ??
        TextStyle(color: R.color.mainTextColor, fontSize: 16);
    this.unselectedLabelColor = unselectedLabelColor ?? R.color.mainTextColor;
    this.likeColor = likeColor ?? R.color.secondTextColor;
    this.tagBackground =
        tagBackground ?? const Color(0xFF313131).withOpacity(0.04);
    this.tagTextColor = tagTextColor ?? R.color.mainTextColor;
    this.replyColor = replyColor ?? R.color.mainBrandColor;
    this.audioProgressColor = audioProgressColor ?? R.color.thirdBrightColor;
  }
}
