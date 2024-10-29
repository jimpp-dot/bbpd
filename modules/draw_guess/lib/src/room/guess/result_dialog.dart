import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';

import 'data.dart';
import 'draw_something.dart';
import 'game_guess.dart';
import 'save_picture.dart';

/// 一轮游戏结束后弹出的结果对话框
class ResultDialog extends StatefulWidget {
  final ChatRoomData room;
  final String answer; // 答案
  final String author; // 作者
  final String avatar; // 作者头像
  final Trace trace; // 轨迹数据
  final bool canThumbsUp; // 是否可点赞
  final VoidCallback? onThumbsUp; // 点赞回调

  const ResultDialog({
    super.key,
    required this.room,
    required this.answer,
    required this.author,
    required this.avatar,
    required this.trace,
    this.canThumbsUp = false,
    this.onThumbsUp,
  });

  @override
  ResultDialogState createState() => ResultDialogState();
}

// 官网链接
String? _officialUrl;

class ResultDialogState extends State<ResultDialog> {
  static const Color _boardColor = Color(0xFFFFF4EB);

  final DialogLoadingController _loadingController = DialogLoadingController();

  bool _feedback = false; // 是否反馈过

  Timer? _timer; // 5秒后自动关闭弹窗

  int _likeNum = 0; // 点赞数量

  set likeNum(int likeNum) {
    if (likeNum > 0 && _likeNum != likeNum) {
      _likeNum = likeNum;
      refresh();
      _initTimer(); // 重置timer
    }
  }

  int get likeNum => _likeNum;

  @override
  void initState() {
    super.initState();
    widget.room.addListener(RoomConstant.Event_Message, _onRcvThumbsUp);
    _initTimer();
    _getOfficialUrl();
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Message, _onRcvThumbsUp);
    _cancelTimer();
    _loadingController.close();
    super.dispose();
  }

  /// 点赞消息监听
  _onRcvThumbsUp(String type, dynamic data) {
    if (data is MessageContent && data.extra != null) {
      MessageType type = data.type;
      String? subType = data.extra?['subType'];
      if (type == MessageType.Guess &&
          subType == GameGuess.MSG_TYPE_THUMBS_UP) {
        likeNum++;
        String content = data.message ?? '';
        String? name = data.extra?['name'];
        Fluttertoast.showToast(
            msg: '${name ?? ''} $content', gravity: ToastGravity.CENTER);
      }
    } else {
      Log.d('_onRcvThumbsUp: else');
    }
  }

  /// 5s后自动关闭弹窗
  void _initTimer() {
    _cancelTimer();
    _timer = Timer(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  /// 保存图片
  _saveImageToFile() async {
    if (Platform.isAndroid) {
      PermissionStatus locationPermission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.storage);
      if (locationPermission != PermissionStatus.granted) {
        return;
      }
    }
    GuessConfigData? guessConfigData =
        widget.room.config?.configExpendData as GuessConfigData;
    String? qrData = await _getOfficialUrl();
    if (qrData == null) return;
    ui.Image image = await canvasToImage(
      widget.trace,
      '提示：${guessConfigData.prompt}',
      widget.author,
      Util.getUserSmallIcon(widget.avatar),
      qrData,
    );
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    if (byteData == null) return;
    Directory dir = Directory(Constant.temporaryDirectory.path);
    File imageFile =
        File(p.join(dir.path, '${DateTime.now().millisecondsSinceEpoch}.png'));
    imageFile.writeAsBytesSync(byteData.buffer.asUint8List());
    String? result = await ImagePicker.saveByteDataImageToGallery(
        imageFile.readAsBytesSync());
    if (result != null) {
      Toast.show(context, K.room_save_success);
    } else {
      Toast.show(context, K.room_save_failed);
    }
  }

  /// 获取官网链接
  Future<String?> _getOfficialUrl() async {
    if (_officialUrl == null) {
      String url = '${System.domain}account/getMix';
      XhrResponse response = await Xhr.getJson(url);
      if (!mounted) return null;
      if (response.error != null) {
        Log.d('account/getMix api error');
        return null;
      }
      Map res = response.value();
      if (res['success'] == false ||
          res['config'] == null ||
          res['config'] is! Map) {
        Toast.show(context, K.room_save_failed);
        return null;
      }
      _officialUrl = res['config']['offical_url_redirect'] ??
          'https://www.happyxq.cc.cn/home';
    }
    return _officialUrl;
  }

  /// 题目反馈
  _onFeedback() async {
    if (_feedback == true) {
      return;
    }
    String url = '${System.domain}roomguess/feedback';
    XhrResponse response =
        await Xhr.postJson(url, {'word': widget.answer}, throwOnError: false);
    if (!mounted) return;
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        setState(() {
          _feedback = true;
        });
      } else {
        if (res['msg'] != null) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } else {
      Fluttertoast.showToast(
          msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 200,
            height: 56,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              '${R.string('room_answer')}：${widget.answer}',
              style: const TextStyle(
                color: Color(0xFF6D3824),
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: 296,
            height: 237,
            margin: const EdgeInsetsDirectional.only(
                start: 16, end: 16, bottom: 16),
            decoration: BoxDecoration(
              color: _boardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: AudienceBoard(
              widget.trace,
              eraseColor: _boardColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  widget.canThumbsUp
                      ? IconButton(
                          onPressed: widget.onThumbsUp,
                          icon: R.img(
                              RoomAssets.chat_room$guess_ic_like_round_png,
                              width: 56,
                              height: 56),
                          iconSize: 56,
                          padding: const EdgeInsets.all(0),
                        )
                      : Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFAB1D),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: NumText(
                            '+$_likeNum',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      K.room_like,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6D3824),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 56),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    iconSize: 56,
                    onPressed: _saveImageToFile,
                    padding: const EdgeInsets.all(0),
                    icon: Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF05BCFF),
                      ),
                      alignment: Alignment.center,
                      child: R.img(
                        RoomAssets.chat_room$guess_ic_save_picture_svg,
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      K.room_save_picture,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6D3824),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 50,
            margin: const EdgeInsetsDirectional.only(end: 16),
            alignment: AlignmentDirectional.centerEnd,
            child: _feedback == false
                ? GestureDetector(
                    onTap: _onFeedback,
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          Icons.sentiment_dissatisfied,
                          color: Color(0xFF979797),
                          size: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            K.room_answer_need_improve,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9B9B9B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(
                        Icons.sentiment_satisfied,
                        color: Color(0xFF979797),
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(
                          K.room_feedback_success,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
