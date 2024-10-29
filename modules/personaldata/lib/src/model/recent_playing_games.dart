import 'package:shared/shared.dart';

class RecentPlayingGamesRepository {
  static const String SOURCE_PROFILE = 'profile';
  static const String SOURCE_LIST = 'often_list';

  static Future<List<HomeProfileGameItem>> getRecentPlayingGames(int uid,
      {String source = RecentPlayingGamesRepository.SOURCE_LIST}) async {
    String url =
        '${System.domain}go/yy/profile/game?uid=$uid&version=1&source=$source';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      ResHomeProfileGame data =
          ResHomeProfileGame.fromBuffer(response.bodyBytes);
      if (data.success) {
        return data.data;
      }
    } catch (e) {
      Log.d('Request $url with error: ${e.toString()}');
    }
    return [];
  }
}
