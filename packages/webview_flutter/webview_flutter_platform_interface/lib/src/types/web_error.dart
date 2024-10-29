class WebError{
  String? url;
  String? msg;
  int? code;

  WebError({this.code, required this.url,this.msg});

  @override
  String toString() {
    return 'url=$url msg=$msg code=$code';
  }
}