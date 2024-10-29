typedef ChannelCallBackSuccess = Function(dynamic data);
typedef ChannelCallBackError = Function(Object error);

class ChannelCallBack {
  final int index;
  final ChannelCallBackSuccess? onSuccess;
  final ChannelCallBackError? onError;
  ChannelCallBack({this.onSuccess, this.onError, required this.index});
}
