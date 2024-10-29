class WaveProgressRepository {
  static final WaveProgressRepository _instance = WaveProgressRepository._();

  factory WaveProgressRepository() => _instance;

  WaveProgressRepository._();

  Map<int, double> waveProgressMap = {};

  Future loadWaveProgressData(List<int> rids) async {
    // try {
    //   if (rids == null || rids.isEmpty) {
    //     return;
    //   }
    //   String url = "${System.domain}go/room/wave/progress";
    //   XhrResponse response = await Xhr.postPb(url, {'rids': rids.join(',')}, throwOnError: true);
    //   ApiWaveProgressResponse res = ApiWaveProgressResponse.fromBuffer(response.bodyBytes);
    //   if (res.success) {
    //     res.data?.progress?.forEach((key, value) {
    //       waveProgressMap[key] = value;
    //     });
    //   }
    // } catch (e) {}
  }

  double getWaveProgress(int roomId) {
    if (waveProgressMap.isNotEmpty &&
        roomId > 0 &&
        waveProgressMap.containsKey(roomId)) {
      return waveProgressMap[roomId]!;
    }
    return 0;
  }
}
