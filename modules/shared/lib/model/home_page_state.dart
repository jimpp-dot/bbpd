/// App HomePage展示情况
abstract class HomePageState {
  /// 首页是否正在展示
  bool get isHomePageShowing;

  void onPageInit();

  void onAppVisible();

  void onAppInvisible();
}
