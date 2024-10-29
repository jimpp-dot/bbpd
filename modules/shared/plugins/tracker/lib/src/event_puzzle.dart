import 'event.dart';

/// 海龟汤埋点
class TrackEventPuzzle extends TrackEvent {
  const TrackEventPuzzle(String name) : super(name);
}

class PuzzleEventProperties {
  static Map<String, dynamic> puzzleHelpNormalProperties(
      int videoId, String helpFrom) {
    Map<String, dynamic> properties = <String, dynamic>{
      'video_id': videoId,
      'help_from': helpFrom
    };
    return properties;
  }
}
