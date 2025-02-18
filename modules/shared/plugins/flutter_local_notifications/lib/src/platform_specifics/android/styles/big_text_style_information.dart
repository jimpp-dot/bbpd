part of flutter_local_notifications;

/// Used to pass the content for an Android notification displayed using the big text style
class BigTextStyleInformation extends DefaultStyleInformation {
  /// Provide the longer text to be displayed in the big form of the template in place of the content text.
  final String bigText;

  /// Overrides ContentTitle in the big form of the template.
  final String? contentTitle;

  /// Set the first line of text after the detail section in the big form of the template.
  final String? summaryText;

  /// Specifies if formatting should be applied to the longer text through HTML markup
  final bool htmlFormatBigText;

  /// Specifies if the overridden ContentTitle should have formatting applies through HTML markup
  final bool htmlFormatContentTitle;

  /// Specifies if formatting should be applied to the first line of text after the detail section in the big form of the template.
  final bool htmlFormatSummaryText;

  BigTextStyleInformation(this.bigText,
      {this.htmlFormatBigText = false,
      this.contentTitle,
      this.htmlFormatContentTitle = false,
      this.summaryText,
      this.htmlFormatSummaryText = false,
      bool htmlFormatContent = false,
      bool htmlFormatTitle = false})
      : super(htmlFormatContent, htmlFormatTitle);

  @override
  Map<String, dynamic> toMap() {
    var styleJson = super.toMap();

    var bigTextStyleJson = <String, dynamic>{
      'bigText': bigText,
      'htmlFormatBigText': htmlFormatBigText,
      'contentTitle': contentTitle,
      'htmlFormatContentTitle': htmlFormatContentTitle,
      'summaryText': summaryText,
      'htmlFormatSummaryText': htmlFormatSummaryText
    };
    styleJson.addAll(bigTextStyleJson);
    return styleJson;
  }
}
