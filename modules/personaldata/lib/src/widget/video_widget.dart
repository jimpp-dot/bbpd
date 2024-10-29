import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personaldata/src/model/profile_model.dart';

import '../images.dart';

class VideoWidget extends StatefulWidget {
  final ProfileBean? data;
  final int uid;
  final VoidCallback? onVideoRemoved;

  const VideoWidget({Key? key, this.data, this.uid = 0, this.onVideoRemoved})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  bool _lock = false;

  @override
  Widget build(BuildContext context) {
    return _buildVideos(context);
  }

  Widget _buildVideos(BuildContext context) {
    List? videos = widget.data?.videos ?? [];
    bool me = widget.uid == Session.uid;
    if (me == false && (videos.isEmpty)) return Container();

    List<Widget> widgets = [
      Container(
        margin: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        color: R.color.dividerColor,
        height: 0.5,
      ),
      Container(
        height: 24.0,
      ),
      Container(
        margin: const EdgeInsets.only(left: 18.0, bottom: 8.0),
        child: Text(
          R.string('video_feed'),
          style: R.textStyle.title.copyWith(fontSize: 15),
        ),
      )
    ];

    if (me) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: InkWell(
          onTap: _switchVideo,
          child: Container(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
            decoration: BoxDecoration(
                border: Border.all(
              color: R.color.secondBgColor,
              width: 0.0,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.camera_alt,
                  color: R.color.mainTextColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      R.string('upload_video'),
                      style: TextStyle(color: R.color.mainTextColor),
                    ),
                  ),
                ),
                Icon(Icons.add_circle_outline, color: R.color.mainTextColor)
              ],
            ),
          ),
        ),
      ));
    }

    List<VideoInfo> videoList = [];
    for (var value in videos) {
      value['icon'] = widget.data?.icon ?? '';
      value['name'] = widget.data?.displayName ?? '';
      videoList.add(VideoInfo.fromJson(value));
    }

    for (int i = 0; i < videos.length; i++) {
      Map video = videos.elementAt(i);
      widgets.add(GestureDetector(
        onLongPress: widget.uid == Session.uid
            ? () {
                _onRemoveAction(context, Util.parseInt(video['vid']));
              }
            : null,
        onTap: () {
          IVideoManager videoManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_VIDEO);
          videoManager.playVideo(context, videoList: videoList, index: i);
        },
        child: Stack(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width - 36.0,
                height: MediaQuery.of(context).size.width - 36.0,
                margin: const EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 10.0, bottom: 10.0),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                          color: const Color(0x99000000),
                          foregroundDecoration:
                              const BoxDecoration(color: Color(0x99000000)),
                          child: Hero(
                              tag:
                                  "${System.imageDomain}${video['cover']}!cover750",
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${System.imageDomain}${video['cover']}!cover750",
                                fit: BoxFit.cover,
                                fadeInDuration: const Duration(microseconds: 0),
                                fadeOutDuration:
                                    const Duration(microseconds: 0),
                              )),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                        start: 10,
                        bottom: 15,
                        child: Row(
                          children: <Widget>[
                            Images.img(
                              "video_playnum.png",
                              width: 10,
                              height: 10,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                video['view_num'],
                                textScaleFactor: 1.0,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white, //统一白,不随主题
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                )),
            PositionedDirectional(
              start: 0.0,
              top: 0.0,
              bottom: 0.0,
              end: 0.0,
              child: Center(
                child: Images.img(
                  "btn_play.png",
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ),
          ],
        ),
      ));
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }

  _switchVideo() async {
    if (_lock) return;
    try {
      _lock = true;
      File? video = await ImagePicker.pickVideo(
        source: ImageSource.gallery,
      );
      _lock = false;
      if (video != null) {
        VideoUpload.instance().add(video);
      }
    } catch (e) {
      _lock = false;
      Log.d(e);
    }
  }

  _onRemoveAction(BuildContext context, int vid) async {
    List<SheetItem> res = [];
    res.add(SheetItem(R.string('delete_video'), "remove"));
    SheetCallback result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result.reason == SheetCloseReason.Active) {
      return;
    }
    try {
      await Xhr.postJson(
          "${System.domain}video/delete", {'vid': vid.toString()},
          throwOnError: true);
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
    if (widget.onVideoRemoved != null) {
      widget.onVideoRemoved!();
    }
//    setState(() {});
  }
}
