import 'package:chat/k.dart';
import 'package:chat/src/model/intimate_msg_open.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'config.dart';
import 'intimate_intro_pop.dart';

/// 亲密度触发gs发照片
class DisplayIntimatePhoto extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;

  const DisplayIntimatePhoto({Key? key, required this.message, required this.extra, required this.direction}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DisplayIntimatePhotoState();
  }
}

class DisplayIntimatePhotoState extends State<DisplayIntimatePhoto> {
  final GlobalKey _btnKey = GlobalKey();
  String? _photo;
  late int _taskId;
  String? _senderContent;

  @override
  void initState() {
    super.initState();
    _photo = Util.parseStr(widget.extra['photo']);
    _taskId = Util.parseInt(widget.extra['task_id']);
    _senderContent = Util.parseStr(widget.extra['content_for_sender']);
  }

  @override
  Widget build(BuildContext context) {
    String content;
    double height;
    double textPad = 12;
    if (MessageDisplayDirection.Right == widget.direction) {
      content = _senderContent ?? '';
      height = 234;
      textPad = 24;
    } else {
      content = widget.message.content;
      height = 212;
    }
    return SizedBox(
      width: 236,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 236,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF5F7D),
                  Color(0xFFFF5FBE),
                ],
              ),
            ),
          ),
          Container(
            width: 236,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFFF9ABC),
              ),
            ),
          ),
          PositionedDirectional(
            top: -27,
            end: -30,
            child: R.img(
              'intimate_interact/msg_photo_top.png',
              width: 106,
              height: 86,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          PositionedDirectional(
            top: 37,
            end: 0,
            child: R.img(
              'intimate_interact/msg_photo_middle.png',
              width: 54,
              height: 86,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          PositionedDirectional(
            start: 0,
            bottom: 0,
            child: R.img(
              'intimate_interact/msg_photo_bottom.png',
              width: 112,
              height: 140,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CommonAvatar(
                path: _photo ?? '',
                size: 96,
                shape: BoxShape.circle,
                suffix: '?x-oss-process=image/blur,r_50,s_50',
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: textPad, end: textPad),
                child: Text(
                  content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _buildBtn(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBtn() {
    return GestureDetector(
      onTap: _tapView,
      child: Container(
        key: _btnKey,
        width: 212,
        height: 40,
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: Colors.white,
        ),
        child: Text(
          K.view_now,
          style: const TextStyle(fontSize: 13, color: Color(0xFFFF5F7D), fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Future<void> _tapView() async {
    String image = _photo ?? '';
    if (MessageDisplayDirection.Right == widget.direction) {
      _showImage(image);
    } else {
      DataRsp<IntimateMsgOpen> rsp = await _checkOpen(_taskId);
      if (rsp.success == true && rsp.data != null) {
        if (rsp.data!.canOpenPhoto) {
          Tracker.instance.track(TrackEvent.get_photo_success);
          _showImage(image);
        } else {
          _showTip(rsp.data!.prompt);
        }
      } else {
        Fluttertoast.showToast(msg: rsp.msg ?? '');
      }
    }
  }

  static Future<DataRsp<IntimateMsgOpen>> _checkOpen(int taskId) async {
    String url = '${System.domain}go/mate/gs/benefitReceived';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'task_id': '$taskId',
          },
          formatJson: true);
      return DataRsp<IntimateMsgOpen>.fromXhrResponse(response, (object) => IntimateMsgOpen.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<IntimateMsgOpen>(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  void _showImage(String image) {
    IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImagesViewScreen(
      context,
      index: 0,
      photos: [Photo.fromParams(image, 'image', '', 0)],
    );
  }

  void _showTip(List<IntimateColorText> tipList) {
    RenderBox renderBox = _btnKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    IntimateIntroPop.show(context, offset, renderBox.size.width, tipList);
  }
}
