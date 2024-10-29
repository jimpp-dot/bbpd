class CheckGsOnHookState {
  /// 标题
  String title = '';

  /// 内容
  String content = '';

  /// 按钮文案
  String buttonText = '';

  /// 倒计时，默认为0
  int countDown = 0;

  /// 记录从服务端传过来的倒计时是否为0，如果为0，则不显示倒计时文案及倒计时自动关闭弹框
  bool isShowCountDown = false;

  CheckGsOnHookState() {
    ///Initialize variables
  }
}
