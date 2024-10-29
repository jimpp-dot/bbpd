import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/model/pb/generated/slp_report.pb.dart';
import 'package:personaldata/src/page/model/report_repo.dart';

/// 举报
class ReportScreen extends StatefulWidget {
  final int uid;
  final String? category; // 举报交友卡category为1，举报其他不用传
  final int reportId; // 举报对象id，动态id，房间id等
  final ReportType reportType; // 举报对象类型
  final List<MessageContent>? msgList; // 私聊消息列表

  const ReportScreen({
    Key? key,
    required this.uid,
    required this.reportId,
    required this.reportType,
    this.category,
    this.msgList,
  }) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();

  static Future show(BuildContext context,
      {required ReportType reportType, required int uid, String? category, int reportId = 0, List<MessageContent>? msgList}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ReportScreen(
        uid: uid,
        category: category,
        reportId: reportId,
        reportType: reportType,
        msgList: msgList,
      ),
      settings: const RouteSettings(name: '/report'),
    ));
  }
}

class _ScreenState extends State<ReportScreen> {
  final List<ImageVideoItem> _photos = [];

  int _type = 0; // 举报类型 - 索引
  late FocusNode _focusNode;
  late TextEditingController _textController;
  bool _uploadPic = true;

  final IChatManager _chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
  List<MessageContent> _chatEvidences = []; // 举报的聊天消息列表

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
    _focusNode = FocusNode();
    if (ReportType.Moment == widget.reportType || ReportType.FriendCard == widget.reportType) {
      _uploadPic = false;
    }
    _load();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future _load() async {
    ResReportList resp = await ReportRepo.getReportList();
    if (resp.success) {
      _reasonsNew.clear();
      _reasonsNew.addAll(resp.list);
      refresh();
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  // Map<int, String> get reasons => A.report_reason_new.asMap(); // 旧 举报类型 - 数据

  final List<ReportItem> _reasonsNew = []; // 新 举报类型 - 数据

  void _submit() async {
    if (_type < 0 || _type >= _reasonsNew.length) {
      Fluttertoast.showToast(msg: K.choose_report_type, gravity: ToastGravity.CENTER);
      return;
    }

//    if ((widget.tpid == null && widget.category == null) && (_photos == null || _photos.length <= 0)) {
//      Fluttertoast.showToast(msg: K.upload_proof_picture, gravity: ToastGravity.CENTER);
//      return;
//    }

    if (_uploadPic && (_photos.isEmpty)) {
      Fluttertoast.showToast(msg: K.upload_proof_picture, gravity: ToastGravity.CENTER);
      return;
    }

    String desc = _textController.value.text;
    if (desc.isEmpty) {
      Fluttertoast.showToast(msg: K.describe_the_report_content, gravity: ToastGravity.CENTER);
      return;
    }

    List<String> url = [];
    for (var photo in _photos) {
      url.add(photo.url);
    }

    Map<String, String> postData = {
      'to': widget.uid.toString(),
      'type': '${_reasonsNew[_type].type}',
      'desc': desc,
      'photo': json.encode(url),
    };

    if (ReportType.Moment == widget.reportType) {
      postData['tpid'] = '${widget.reportId}';
    } else if (ReportType.Room == widget.reportType) {
      postData['rid'] = '${widget.reportId}';
    } else if (ReportType.FriendCard == widget.reportType) {
      postData['category'] = '1';
    } else if (ReportType.PrivateChat == widget.reportType && Util.validList(widget.msgList) && Util.validList(_chatEvidences)) {
      List contexts = [];
      for (MessageContent item in _chatEvidences) {
        // Map params = {"sender_uid": Util.parseInt(item?.senderId), "send_ts": Util.parseInt(item?.sentTime), "msg_type": item?.type ?? ''};
        // if (item?.type == MessageType.Image) {
        //   params['msg'] = item?.imageUrl ?? '';
        // } else if (item?.type == MessageType.Voice) {
        //   params['msg'] = item?.audioData ?? '';
        // } else if (item?.type == MessageType.Location) {
        //   String extraJson = item?.extra;
        //   Map extra;
        //   try {
        //     if (extraJson != null && extraJson.isNotEmpty) {
        //       extra = json.decode(extraJson);
        //     }
        //   } catch (e) {}
        //   int size = 200;
        //   String markerURI = System.domain + 'public/static/icon/map_loc.png'; // markers=-1,${markerURI},0
        //   String uri = "http://restapi.amap.com/v3/staticmap?markers=-1,$markerURI,0:${extra['lng']},${extra['lat']}&size=$size*$size&key=${Constant.amapKEY}&zoom=14";
        //   params['msg'] = uri;
        // } else {
        //   params['msg'] = item?.content ?? '';
        // }
        contexts.add(item.toJson());
      }

      String? contextsStr;
      try {
        contextsStr = json.encode(contexts);
      } catch (e) {
        Log.d('json.encode(contexts) error:${e.toString()}');
      }
      if (Util.validStr(contextsStr)) {
        postData['chat_content'] = contextsStr!;
      }
    }

    await Xhr.postJson('${System.domain}cloud/report', postData, throwOnError: false);

    Tracker.instance.track(TrackEvent.report, properties: {
      'target_uid': widget.uid,
      if (ReportType.Room == widget.reportType) 'rid': widget.reportId,
      if (ReportType.Moment == widget.reportType) 'moment_id': widget.reportId,
      'report_type': _type,
    });

    Fluttertoast.showToast(msg: K.report_success_notice, gravity: ToastGravity.CENTER);
    Navigator.of(context).pop();
  }

  Widget _buildButtons() {
    List<Widget> buttons = [];
    _reasonsNew.forEachIndexed((i, e) {
      buttons.add(FilterRadioItemWidget(
        config: e.name,
        state: _type == i ? ButtonState.Enable : ButtonState.Disable,
        callback: () {
          refresh(() {
            _type = i;
          });
        },
      ));
    });

    List<Widget> widgets = [
      // 类型
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          K.type,
          style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
        ),
      ),
      SizedBox(
        width: Util.width - 32,
        child: Wrap(
          spacing: 15,
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: buttons,
        ),
      ),

      // 上传截图或视频
      Container(
        padding: const EdgeInsetsDirectional.only(top: 30, bottom: 16),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          K.upload_proof_picture,
          style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
        ),
      ),
      Photos(
        width: (Util.width - 80) / 3.0,
        photos: _photos,
        padding: EdgeInsets.zero,
      ),

      // 详细描述举报内容
      Container(
        padding: const EdgeInsetsDirectional.only(top: 30, bottom: 12),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          K.describe_the_report_content,
          style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
        ),
      ),
      Container(
        height: 100.0,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14.0,
            color: R.color.mainTextColor,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            isDense: true,
          ),
          focusNode: _focusNode,
          controller: _textController,
          autocorrect: true,
          autofocus: false,
          maxLines: 10,
        ),
      ),

      if (widget.reportType == ReportType.PrivateChat && Util.validList(widget.msgList))
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 15),
          child: GestureDetector(
            onTap: () async {
              List<MessageContent>? msgs = await _chatManager.openChatEvidenceScreen(context, msgList: widget.msgList);
              if (msgs != null) {
                refresh(() {
                  _chatEvidences = msgs;
                });
              }
            },
            child: Container(
              height: 48,
              child: Row(
                children: [
                  Text(
                    K.personaldata_chat_evidence,
                    style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    K.personaldata_how_many_chat_evidence(['${_chatEvidences.length}']),
                    style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor.withOpacity(0.4)),
                  ),
                  R.img(
                    'ic_next.svg',
                    color: R.color.secondTextColor,
                    width: 16,
                    package: ComponentManager.MANAGER_CHAT,
                  ),
                ],
              ),
            ),
          ),
        )
    ];

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0, bottom: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets),
    );
  }

  Widget _buildBody() {
    List<Widget> res = [
      _buildButtons(),
    ];

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(children: res),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.report),
      body: _buildBody(),
      bottomNavigationBar: BottomButton.of(
        title: K.submit,
        onTap: _submit,
      ),
    );
  }
}

enum ButtonState {
  Enable,
  Disable,
}

class FilterRadioItemWidget extends StatelessWidget {
  final String? config;
  final ButtonState? state;
  final VoidCallback? callback;

  const FilterRadioItemWidget({Key? key, this.config, this.state, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNormal = state == ButtonState.Enable;
    return GestureDetector(
      onTap: callback,
      child: IntrinsicWidth(
        child: Container(
          height: 30.0,
          decoration: BoxDecoration(
              color: isNormal ? Colors.transparent : R.color.secondBgColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: isNormal ? 1 : 0, color: isNormal ? const Color(0xFF9EFF4E) : Colors.white)),
          padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
          alignment: AlignmentDirectional.center,
          child: Text(
            config ?? '',
            style: TextStyle(color: isNormal ? Colors.white : R.color.thirdTextColor, fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class Photos extends StatefulWidget {
  final List<ImageVideoItem>? photos;

//  final VoidCallback onComplete;
  final double width;
  final bool enableVideo;
  final EdgeInsetsGeometry? padding;

  const Photos({Key? key, this.photos, this.width = 0, this.enableVideo = true, this.padding}) : super(key: key);

  @override
  PhotosState createState() => PhotosState();
}

class PhotosState extends State<Photos> {
  @override
  void didUpdateWidget(Photos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      setState(() {});
    }
  }

  Widget _renderUpload() {
    return ImageVideoUpload(
      source: ImageSource.gallery,
      enableVideo: widget.enableVideo ?? true,
      imageUplaodUrl: '${System.domain}upload/image/',
      child: R.img(
        "profile_add.png",
        width: widget.width,
        height: widget.width,
        color: const Color(0xFFE9EAE9).withOpacity(0.6),
        package: ComponentManager.MANAGER_BASE_CORE,
      ),
      onComplete: (String name, String type, String cover) {
        widget.photos?.add(ImageVideoItem(name, type, cover));
        setState(() {});
        return true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widget.photos?.forEach((ImageVideoItem item) {
      String imageUrl = 'image' == item.type ? item.url : item.cover;
      widgets.add(
        InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          onTap: () async {
            List<SheetItem> res = [];
            res.add(SheetItem(K.delete, "delete"));
            SheetCallback result = await displayModalBottomSheet(
                context: this.context,
                builder: (BuildContext context) {
                  return RadioBottomSheet(data: res);
                });
            if (result.value != null) {
              if (result.value?.key == 'delete') {
                widget.photos?.remove(item);
                setState(() {});
              }
            }
          },
          child: Stack(
            children: <Widget>[
              CommonAvatar(
                path: imageUrl,
                borderRadius: BorderRadius.circular(5),
                size: widget.width,
              ),
              if ('video' == item.type)
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    child: R.img(
                      'ic_video_play.svg',
                      width: 36,
                      height: 36,
                      package: ComponentManager.MANAGER_MOMENT,
                    ),
                  ),
                )
            ],
          ),
        ),
      );
    });
    if (widgets.length < 6) {
      widgets.add(SizedBox(
        width: widget.width,
        height: widget.width,
        child: _renderUpload(),
      ));
    }

    double space = 10.0;
    return Padding(
      padding: widget.padding ?? const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Wrap(
        runSpacing: space,
        spacing: space,
        alignment: WrapAlignment.start,
        children: widgets,
      ),
    );
  }
}
