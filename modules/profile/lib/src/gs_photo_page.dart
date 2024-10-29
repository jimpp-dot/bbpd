import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/k.dart';

/// 搭讪照片（针对GS专门入口，该部分的照片用于不同亲密度触发的效果机制）
class GsPhotoPage extends StatefulWidget {
  const GsPhotoPage({super.key});

  static Future openGsPhotoPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const GsPhotoPage(),
      settings: const RouteSettings(name: '/GsPhotoPage'),
    ));
  }

  @override
  _GsPhotoPageState createState() => _GsPhotoPageState();
}

class _GsPhotoPageState extends State<GsPhotoPage> {
  final List<ModifyPhoto> _photos = [];
  late int _maxPhotoNum;
  bool _loading = true;
  String? _errMsg;

  @override
  void initState() {
    super.initState();
    _load();
  }

  static Future<DataRsp<PhotosData>> photosData() async {
    String url = '${System.domain}go/mate/gs/photos';
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: false, formatJson: true);
      return DataRsp<PhotosData>.fromXhrResponse(
          response, (object) => PhotosData.fromJson(object as Map));
    } catch (e) {
      return DataRsp<PhotosData>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  void _load() async {
    DataRsp<PhotosData> rsp = await photosData();
    if (rsp.success == true && rsp.data != null) {
      _maxPhotoNum = rsp.data!.maxNum;
      if (_maxPhotoNum <= 0) {
        _maxPhotoNum = 8;
      }
      _photos.clear();
      if (rsp.data!.photos.isNotEmpty) {
        _photos.addAll(rsp.data!.photos);
      }
      if (_photos.length < _maxPhotoNum) {
        _photos.add(ModifyPhoto.empty());
      }
    } else {
      _errMsg = rsp.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  _reload() {
    setState(() {
      _errMsg = null;
      _loading = true;
    });
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.profile_gs_pic),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errMsg != null) {
      return ErrorData(
        error: _errMsg,
        onTap: () {
          _reload();
        },
      );
    }

    return ListView(
      addAutomaticKeepAlives: true,
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      children: <Widget>[
        Photos(
          width: _getPhotoWidth(),
          height: _getPhotoHeight(),
          spacing: 12,
          runSpacing: 12,
          radius: 12,
          photos: _photos,
          onComplete: _load,
          progressWidth: _getPhotoWidth(),
          progressHeight: _getPhotoHeight(),
          crop: false,
          maxNum: _maxPhotoNum,
        ),
      ],
    );
  }

  double _getPhotoWidth() {
    return (MediaQuery.of(context).size.width - 40 - 36) / 4;
  }

  double _getPhotoHeight() {
    return (MediaQuery.of(context).size.width - 40 - 36) / 4;
  }
}

class PhotosData {
  final int maxNum;
  final List<ModifyPhoto> photos;

  PhotosData(this.maxNum, this.photos);

  PhotosData.fromJson(Map map)
      : maxNum = Util.parseInt(map['max_num']),
        photos = Util.parseList(map['photo'], (e) => ModifyPhoto.fromJson(e));
}

class ModifyPhoto {
  int id;
  String? path;
  int state; //0审核中，1通过，2失败

  ModifyPhoto(this.id, this.path, this.state);

  ModifyPhoto.fromJson(Map map)
      : id = Util.parseInt(map['id']),
        path = map['path'],
        state = Util.parseInt(map['state']);

  ModifyPhoto.empty()
      : id = 0,
        path = null,
        state = 1;
}

class Photos extends StatefulWidget {
  final List<ModifyPhoto> photos;
  final VoidCallback onComplete;
  final double width;
  final double height;
  final double spacing;
  final double runSpacing;
  final double radius;
  final double progressWidth;
  final double progressHeight;
  final bool crop;
  final int maxNum;

  const Photos({
    super.key,
    required this.photos,
    required this.onComplete,
    this.width = 48,
    this.height = 48,
    this.spacing = 10,
    this.runSpacing = 10,
    this.radius = 5.0,
    this.progressWidth = 100,
    this.progressHeight = 100,
    this.crop = false,
    required this.maxNum,
  });

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  Widget _renderUpload(int index) {
    ModifyPhoto photo = widget.photos[index];
    Text? text;
    if (photo.state == 0) {
      text = Text(
        K.profile_welcome_state_check,
        style: const TextStyle(fontSize: 13, color: Colors.white),
      );
    } else if (photo.state == 2) {
      text = Text(
        K.profile_audit_rejected,
        style: const TextStyle(
            fontSize: 13,
            color: Color(0xFFFF4F7A),
            fontWeight: FontWeight.w500),
      );
    }
    return ImageUpload(
      source: ImageSource.gallery,
      uploadUrl: '${System.domain}upload/image/',
      onComplete: (String path, int width, int height, Map origin) {
        uploadOrEdit(photo, path, index);
        return true;
      },
      minSize: Util.getUserUploadImageMinSize(),
      crop: widget.crop,
      cropAspectRatio: 3.0 / 4.0,
      progressWidth: widget.progressWidth,
      progressHeight: widget.progressHeight,
      onTapFilter: (state) {
        if (photo.id > 0) {
          state.showDefaultActionSheet();
        } else {
          state.switchImage();
        }
      },
      onDelete: (state) async {
        await state.deletePhoto(photo.id.toString());
        uploadOrEdit(photo, '', index, delete: true);
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.radius),
          ),
          color: R.color.secondBgColor,
        ),
        child: photo.id > 0
            ? ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "${System.imageDomain}${photo.path}",
                      suffix: '!head150',
                      fit: BoxFit.cover,
                      fadeOutDuration: const Duration(microseconds: 0),
                      fadeInDuration: const Duration(microseconds: 0),
                      width: widget.width,
                      height: widget.height,
                    ),
                    if (text != null)
                      Container(
                        alignment: AlignmentDirectional.center,
                        width: widget.width,
                        height: widget.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          ),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: text,
                      ),
                  ],
                ),
              )
            : R.img(
                'icon_add.svg',
                width: 28,
                height: 28,
                fit: BoxFit.cover,
                color: R.color.mainTextColor,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
      ),
    );
  }

  Future<void> uploadOrEdit(ModifyPhoto photo, String path, int index,
      {bool delete = false}) async {
    DataRsp<ModifyPhoto> rsp = await uploadImage(photo.id, path);
    if (rsp.success == true && rsp.data != null) {
      setState(() {
        if (delete) {
          widget.photos.removeAt(index);
        } else {
          if (photo.id > 0) {
            photo.id = rsp.data!.id;
            photo.state = rsp.data!.state;
            photo.path = path;
          } else {
            rsp.data!.path = path;
            widget.photos.insert(index, rsp.data!);
          }
        }
      });
    } else {
      Fluttertoast.showToast(msg: rsp.msg ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (widget.photos.length > widget.maxNum) {
      widget.photos.removeLast();
    } else if (widget.photos.length < widget.maxNum &&
        widget.photos.last.id > 0) {
      widget.photos.add(ModifyPhoto.empty());
    }

    for (int i = 0; i < widget.photos.length; i++) {
      children.add(SizedBox(
        width: widget.width,
        height: widget.height,
        child: _renderUpload(i),
      ));
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
      child: Wrap(
        runSpacing: widget.runSpacing,
        spacing: widget.spacing,
        alignment: WrapAlignment.start,
        children: children,
      ),
    );
  }

  static Future<DataRsp<ModifyPhoto>> uploadImage(int id, String path) async {
    String url = '${System.domain}go/mate/gs/updatePhoto';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'id': '$id',
            'url': path,
          },
          formatJson: true);
      return DataRsp<ModifyPhoto>.fromXhrResponse(
          response, (object) => ModifyPhoto.fromJson(object as Map));
    } catch (e) {
      return DataRsp<ModifyPhoto>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
