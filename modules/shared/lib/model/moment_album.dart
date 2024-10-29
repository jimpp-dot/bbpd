abstract class IMomentAlbum {
  String? url;
}

abstract class MomentAlbumOutput {
  bool get success;
  List<IMomentAlbum> get momentAlbumList;
  int get momentCount;
}
