const int quickReplyGroupNameMaxLen = 6; // 快捷回复分组命名最多5个字符

class QuickReplyEditResult {
  final String title;
  final String? content;
  final String? image;
  final int? imgWidth;
  final int? imgHeight;
  final String? audio;
  final int? duration;

  QuickReplyEditResult(this.title,
      {this.content,
      this.image,
      this.imgWidth,
      this.imgHeight,
      this.audio,
      this.duration});
}
