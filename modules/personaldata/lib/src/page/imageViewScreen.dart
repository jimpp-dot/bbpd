import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:shared/shared.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moment/moment.dart';
import 'package:path/path.dart';
import 'package:video_player/video_player.dart';

import '../../k.dart';

enum SourceTypes { Video, Image }

class SourceItem {
  final String path;
  final SourceTypes type;

  SourceItem(this.type, this.path);

  static SourceTypes parseType(String type, String path) {
    switch (type) {
      case 'image':
        return SourceTypes.Image;
        break;

      case 'video':
        return SourceTypes.Video;
        break;
    }

    String url = path.toLowerCase();
    if (url.contains(".png") ||
        url.contains(".jpg") ||
        url.contains(".jpeg") ||
        url.contains(".gif") ||
        url.contains(".webp")) {
      return SourceTypes.Image;
    }
    return SourceTypes.Video;
  }

  SourceItem.fromJson(Map data)
      : path = data['path'].toString(),
        type = parseType(data['type'].toString(), data['path'].toString());
}

class SourceData {
  final List<SourceItem> _data = [];
  final Map<String, bool> _keys = {};

  SourceData();

  bool add(SourceItem item) {
    if (_keys.containsKey(item.path) == false) {
      _data.add(item);
      _keys[item.path] = true;
      return true;
    }
    return false;
  }

  SourceItem get(int index) {
    return _data.elementAt(index);
  }

  int get length {
    return _data.length;
  }

  static SourceData fromList(List res) {
    SourceData source = SourceData();
    for (int i = 0, len = res.length; i < len; i++) {
      if (res[i] is Map) {
        Map item = res[i];
        try {
          source.add(SourceItem.fromJson(item));
        } catch (e) {
          Log.d(e);
        }
      }
    }
    return source;
  }
}

/// 图片视频预览页
// ignore: must_be_immutable
class ImagesViewScreen extends StatefulWidget {
  // 正在播放的video widget
  static late GlobalObjectKey<_VideoPlayerState> keyVideoWidget;
  static bool isFront = true;

  static void pauseVideo() {
    Log.d('ImagesViewScreen pauseVideo');
    isFront = false;
    if (ImagesViewScreen.keyVideoWidget.currentState != null) {
      ImagesViewScreen.keyVideoWidget.currentState!.pause();
    }
  }

  final SourceData? source;
  final int index;
  final PersonInfo? info;
  final bool isFollowed;

  const ImagesViewScreen(
      {Key? key,
      this.source,
      this.index = 0,
      this.info,
      this.isFollowed = false})
      : super(key: key);

  static Future show(BuildContext context,
      {SourceData? source, int index = 0, PersonInfo? info}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return ImagesViewScreen(
          source: source,
          index: index,
          info: info,
        );
      },
      settings: const RouteSettings(name: '/person_images'),
      fullscreenDialog: true,
    ));
  }

  @override
  _States createState() => _States();
}

class _States extends State<ImagesViewScreen> {
  int swiperIndex = 0;

  @override
  initState() {
    eventCenter.removeListener("Navigator.Page.Pop", _onNavigatorChanged);
    eventCenter.addListener("Navigator.Page.Pop", _onNavigatorChanged);

    swiperIndex = widget.index;

    if (widget.info != null &&
        widget.info!.isGod &&
        (widget.info?.city == null || widget.info?.city!.isEmpty == true)) {
      _loadSkillInviteInfo();
    }

    super.initState();
  }

  @override
  dispose() {
    eventCenter.removeListener("Navigator.Page.Pop", _onNavigatorChanged);

    super.dispose();
  }

  _loadSkillInviteInfo() async {
    Log.d('_loadSkillInviteInfo');
    try {
      String url = '${System.domain}account/skillnum?uid=${widget.info?.uid}';
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);

      if (!mounted) return;
      Map res = response.value();
      if (res['success'] && res['data'] != null) {
        setState(() {
          widget.info?.city = res['data']['god_num'];
          widget.info?.position = res['data']['invite_num'];
        });
      }
    } catch (e) {
      Log.d('_loadSkillInviteInfo, error: $e');
    }
  }

  _onNavigatorChanged(String type, dynamic data) {
    Log.d("DEBUG: ImagesViewScreen._onNavigatorChanged, $type =====> $data");
    if (data is String) {
      if (type == "Navigator.Page.Pop" && data == '/person_images') {
        Log.d('_onNavigatorChanged back to ImagesViewScreen');
        ImagesViewScreen.isFront = true;
        if (ImagesViewScreen.keyVideoWidget.currentState != null) {
          ImagesViewScreen.keyVideoWidget.currentState!.play();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int? uid;
    if (widget.info != null) {
      uid = widget.info!.uid;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                SourceItem? value = widget.source?.get(index);
                if (value?.type == SourceTypes.Image) {
                  return ImageViewScreen(
                    image: value?.path ?? '',
                    toUid: uid ?? 0,
                  );
                } else {
                  return _VideoPlayer(
                    key: GlobalKey(),
                    video: value?.path ?? '',
                    toUid: uid ?? 0,
                  );
                }
              },
              itemCount: widget.source?.length ?? 0,
              index: swiperIndex,
              pagination: (widget.source?.length ?? 0) > 1
                  ? CommonSwiperPagination(
                      bgColor: Colors.black.withOpacity(0.6),
                      bgHeight: 24,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(
                        bottom: Util.iphoneXBottom,
                      ),
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.white,
                        color: Colors.white.withOpacity(0.4),
                        size: 7.0,
                        activeSize: 7.0,
                      ),
                    )
                  : null,
              autoplay: false,
              loop: false,
              autoplayDelay: 3000,
              autoplayDisableOnInteraction: false,
              onIndexChanged: (int index) {
                swiperIndex = index;
              },
            ),
            if (widget.info != null)
              Positioned(child: _TopPersonInfo(widget.info)),
          ],
        ),
      ),
    );
  }
}

class ImageViewScreen extends StatefulWidget {
  final String? image;
  final int toUid;
  final String? heroTag;

  static Future openImageViewScreen(BuildContext context, String image,
      {String? heroTag}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ImageViewScreen(image: image, heroTag: heroTag),
      settings: const RouteSettings(name: '/imageView'),
    ));
  }

  const ImageViewScreen({Key? key, this.image, this.toUid = 0, this.heroTag})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ImageViewScreen> {
  File? _image;
  File? _temp;
  double _progress = 0.0;
  Dio? _dio;

  double _dragEnd = 0.0;
  double _dragStart = 0.0;

  @override
  initState() {
    if (widget.image?.startsWith("http://") == true ||
        widget.image?.startsWith("https://") == true) {
      _load(widget.image ?? '');
    } else {
      _image = File(widget.image ?? '');
    }
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  _load(String image) async {
    Directory dir = Directory(Constant.temporaryDirectory.path);
    await dir.create(recursive: true);

    List<int> bytes = utf8.encode(image);
    Digest digest = sha1.convert(bytes);
    String key = digest.toString().toLowerCase();

    File imageFile = File(join(dir.path, '$key.v2.jpg'));
    if (await imageFile.exists() && mounted) {
      setState(() {
        _image = imageFile;
      });
      return;
    }

    _temp = File(join(dir.path, '$key.tmp'));

    _dio = Dio();
    (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cr, String host, int port) {
        return true;
      };
      client.findProxy = null;
    };
    try {
      await _dio!.download(image, _temp!.path,
          onReceiveProgress: (int received, int total) {
        if (!mounted) return;
        Log.d("download $received / $total");
        setState(() {
          _progress = received / total;
        });
      });
      await _temp!.rename(imageFile.path);
      if (!mounted) return;
      setState(() {
        _image = imageFile;
      });
      return;
    } catch (e) {
      Log.d("dio.download error");
      Log.d(e);
    }
    return;
  }

  _renderLoading() {
    return Center(
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Stack(
          children: <Widget>[
            Loading(progress: _progress),
            PositionedDirectional(
              start: 0.0,
              end: 0.0,
              bottom: 0.0,
              top: 0.0,
              child: Center(
                child: Text(
                  "${(_progress * 100).toInt()}%",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Image? _showingImage;

  _renderBody() {
    if (_image == null) {
      return _renderLoading();
    } else {
      _showingImage = Image.file(_image!,
          width: Util.width, height: Util.height, fit: BoxFit.contain);
      return _showingImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: max(0.0, _dragEnd - _dragStart)),
          child: Hero(
            tag: !Util.isStringEmpty(widget.heroTag)
                ? widget.heroTag ?? ''
                : widget.image ?? '',
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              onVerticalDragStart: (details) {
                _dragStart = details.globalPosition.dy;
                Log.d('onVerticalDragStart, _dragStart: $_dragStart');
              },
              onVerticalDragUpdate: (details) {
                _dragEnd = details.globalPosition.dy;
                setState(() {});
              },
              onVerticalDragEnd: (details) {
                Log.d(
                    'DEBUG: onVerticalDragEnd, deltaY: ${_dragEnd - _dragStart}, dy: ${details.velocity.pixelsPerSecond.dy}');

                if (_dragEnd - _dragStart > 150 ||
                    details.velocity.pixelsPerSecond.dy > 500) {
                  Navigator.of(context).pop();
                } else {
                  _dragEnd = _dragStart = 0;
                  setState(() {});
                }
              },
              behavior: HitTestBehavior.opaque,
              onLongPress: () async {
                List<SheetItem> res = [];
                res.add(SheetItem(K.save_photo, "save"));
                SheetCallback result = await displayModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return RadioBottomSheet(data: res);
                    });
                if (result.reason == SheetCloseReason.Active) {
                  return;
                }

                if (result.value?.key == 'save') {
                  ui.Image img = await MomentUtils.loadImageByProvider(
                      _showingImage!.image);
                  ByteData? byteData =
                      await img.toByteData(format: ui.ImageByteFormat.png);
                  Uint8List? pngBytes = byteData?.buffer.asUint8List();
                  if (pngBytes != null) {
                    String? result =
                        await ImagePicker.saveByteDataImageToGallery(pngBytes);
                    if (result != null) {
                      Fluttertoast.showToast(msg: K.save_success);
                    } else {
                      Fluttertoast.showToast(msg: result);
                    }
                  }
                }
              },
              child: _renderBody(),
            ),
          ),
        ),
      ],
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  final String? video;
  final int toUid;
  bool showFollow = false;

  _VideoPlayer({Key? key, this.video, this.toUid = 0}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController _controller;
  final double _aspectRatio = 0;
  double _width = 0.0;
  final double _videoHeight = 0.0;
  bool _display = false;
  String _errorDescription = '';

  double _dragEnd = 0.0;
  double _dragStart = 0.0;

  double _progress = 0.0;
  Timer? _timer;
  static const int initProgress = 50;
  static const int stepProgress = 20;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _cancelTimer();
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  _init() {
    _errorDescription = '';
    _controller = VideoPlayerController.network(
      widget.video ?? '',
    );

    _progress = (Random().nextInt(initProgress)) / 100;

    _controller.setLooping(true);
    _controller.addListener(_onChanged);
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer time) {
      _changeProgress();
    });
    _controller.initialize();
    if (ImagesViewScreen.isFront) {
      _controller.play();
    }

    ImagesViewScreen.keyVideoWidget = GlobalObjectKey(this);
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  _changeProgress() {
    if (!_display) {
      _progress += (Random().nextInt(stepProgress) / 100);
      if (_progress >= 1) {
        _progress = 0.99;
      }

      if (!mounted) return;

      setState(() {});
    }
  }

  play() async {
    Log.d('_VideoPlayerState play');
    if (!_controller.value.isPlaying) {
      await _controller.play();
    }
  }

  pause() async {
    Log.d('_VideoPlayerState pause');
    if (_controller.value.isPlaying) {
      await _controller.pause();
    }
  }

  _onChanged() {
    bool changed = false;
    VideoPlayerValue value = _controller.value;

    if (value.duration.inMilliseconds > 0) {
      changed = true;
      _width = Util.width *
          value.position.inMilliseconds /
          value.duration.inMilliseconds;
      if (!_display && value.isBuffering == false) {
        _display = true;
      }
    }

    if (_errorDescription == null && value.errorDescription != null) {
      Log.d("---------------------> error ${value.errorDescription}");
      _errorDescription = value.errorDescription ?? '';
      changed = true;
    }

    if (changed == true && mounted) {
      setState(() {});
    }

    Log.d("_aspectRatio $_aspectRatio");
  }

  _renderLoading() {
    return Center(
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Stack(
          children: <Widget>[
            Loading(progress: _progress),
            PositionedDirectional(
              start: 0.0,
              end: 0.0,
              bottom: 0.0,
              top: 0.0,
              child: Center(
                child: Text(
                  "${(_progress * 100).toInt()}%",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderBody() {
    if (_display) {
      return SizedBox(
        width: Util.width,
        height: _videoHeight,
        child: VideoPlayer(_controller),
      );
    } else {
      return _renderLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 0.0,
          bottom: 0.0,
          end: 0.0,
          top: max(0, _dragEnd - _dragStart),
          child: const Center(
            child: Loading(),
          ),
        ),
        Positioned(
          top: max(0, _dragEnd - _dragStart),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            onVerticalDragStart: (details) {
              _dragStart = details.globalPosition.dy;
              Log.d('onVerticalDragStart, _dragStart: $_dragStart');
            },
            onVerticalDragUpdate: (details) {
              _dragEnd = details.globalPosition.dy;
              setState(() {});
            },
            onVerticalDragEnd: (details) {
              Log.d(
                  'DEBUG: onVerticalDragEnd, deltaY: ${_dragEnd - _dragStart}, dy: ${details.velocity.pixelsPerSecond.dy}');

              if (_dragEnd - _dragStart > 150 ||
                  details.velocity.pixelsPerSecond.dy > 500) {
                Navigator.of(context).pop();
              } else {
                _dragEnd = _dragStart = 0;
                setState(() {});
              }
            },
            child: Container(
              color: Colors.black,
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: MediaQuery.of(context).size.width),
              child: Center(
                child: _renderBody(),
              ),
            ),
          ),
        ),
        PositionedDirectional(
          start: 0.0,
          bottom: 0.0,
          end: 0.0,
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              width: _width,
              height: 2.0,
              color: Colors.red.withOpacity(0.75),
            ),
          ),
        ),
      ],
    );
  }
}

class _TopPersonInfo extends StatelessWidget {
  final PersonInfo? _info;

  const _TopPersonInfo(this._info);

  _tapChatInvite() async {
    ImagesViewScreen.pauseVideo();

    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(System.context);
      return;
    }

    // 非主播跳转聊天页
    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    await chatManager.openUserChatScreen(System.context,
        type: 'private', targetId: _info?.uid ?? 0, title: _info?.nick);
  }

  _tapIcon() {
    ImagesViewScreen.pauseVideo();

    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(System.context, _info?.uid ?? 0,
        refer: const PageRefer('ImagesViewScreen'));
  }

  @override
  Widget build(BuildContext context) {
    if (_info == null) return const SizedBox.shrink();

    String skillInvite = '';
    if ((_info!.city != null && _info!.city!.isNotEmpty) ||
        (_info!.position != null && _info!.position!.isNotEmpty)) {
      String skill = (_info!.city != null && _info!.city!.isNotEmpty)
          ? '${_info!.city} '
          : '';
      String invite = (_info!.position != null && _info!.position!.isNotEmpty)
          ? '${_info!.position}'
          : '';
      skillInvite = '$skill$invite';
    }
    return Container(
      width: Util.width,
      height: 94 + (Util.isIphoneX ? 34.0 : 0.0),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _renderIcon(_info!.icon ?? ''),
          const SizedBox(width: 11),
          _renderInfo(skillInvite),
          const Spacer(),
          GestureDetector(
            onTap: _tapChatInvite,
            child: Container(
              height: 32,
              padding: const EdgeInsets.only(left: 14, right: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: R.color.mainBrandColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                _info?.isGod == true ? R.string('invite') : R.string('say_hi'),
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderIcon(String url) {
    return SizedBox.fromSize(
      size: const Size(48, 48),
      child: GestureDetector(
        onTap: _tapIcon,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            CommonAvatar(
              path: url,
              size: 48,
              borderRadius: BorderRadius.circular(24.0),
            ),
            PositionedDirectional(
              top: 2,
              end: 2,
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                  borderRadius: BorderRadius.circular(6.0),
                  color: const Color(0xFF00D747),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderInfo(String skillInvite) {
    return SizedBox(
      width: Util.width - 84 - 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Text(
                  _info?.nick ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFFFFFFFF),
                      shadows: [
                        BoxShadow(
                          color: Color(0x7F202020),
                          offset: Offset(1, 1),
                          blurRadius: 5,
                        ),
                      ]),
                ),
              ),
              if (_info?.sex != null) _renderSexAndAge(_info?.age, _info?.sex)
            ],
          ),
          Text(
            skillInvite,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
                color: Color(0xB2FFFFFF),
                fontSize: 12,
                shadows: [
                  BoxShadow(
                    color: Color(0x7F202020),
                    offset: Offset(1, 1),
                    blurRadius: 5,
                  ),
                ]),
          )
        ],
      ),
    );
  }

  Widget _renderSexAndAge(int? age, int? sex) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4, top: 1.5),
      child: UserSexAndAgeWidget(
        age: age,
        sex: sex,
      ),
    );
  }
}
