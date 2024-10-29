import 'event.dart';

/// 真实迷案/互动故事 埋点
class TrackEventTrueCase extends TrackEvent {
  const TrackEventTrueCase(String name) : super(name);

  /// 故事点击结束
  static const case_library_story_end =
      TrackEventTrueCase('case_library_story_end');
}

class TrackEventTrueCaseProperties {
  static Map<String, dynamic> trueCaseNormalProperties(int caseId) {
    Map<String, dynamic> properties = <String, dynamic>{
      'true_case_id': caseId,
    };
    return properties;
  }

  static Map<String, dynamic> trueLibraryNormalProperties(int storyID) {
    Map<String, dynamic> properties = <String, dynamic>{
      'story_id': storyID,
    };
    return properties;
  }

  static Map<String, dynamic> trueLibraryAnswerProperties(
      int storyID, int questionId, String result) {
    Map<String, dynamic> properties = <String, dynamic>{
      'story_id': storyID,
      'question_id': questionId,
      'result': result,
    };
    return properties;
  }

  static Map<String, dynamic> trueLibraryAnswerUnlockProperties(
      int storyID, int questionId) {
    Map<String, dynamic> properties = <String, dynamic>{
      'story_id': storyID,
      'question_id': questionId,
    };
    return properties;
  }
}
