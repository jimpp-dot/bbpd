import 'package:chat/k.dart';
import 'package:chat/src/repo/chat_service_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 对客服不满意留言反馈
class ChatFeedbackPage extends StatefulWidget {
  final String uuid;
  final String sid;

  const ChatFeedbackPage({super.key, required this.uuid, required this.sid});

  @override
  _ChatFeedbackPageState createState() => _ChatFeedbackPageState();

  static Future<bool?> show(BuildContext context,
      {required String uuid, required String sid}) async {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChatFeedbackPage(
        uuid: uuid,
        sid: sid,
      ),
      settings: const RouteSettings(name: '/ChatFeedbackPage'),
    ));
  }
}

class _ChatFeedbackPageState extends State<ChatFeedbackPage> {
  final List<ImageVideoItem> _photos = [];

  late FocusNode _focusNode;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.chat_feedback_title,
        suppDark: true,
      ),
      body: Container(
        padding: EdgeInsetsDirectional.only(
            start: 15, top: 10, end: 15, bottom: Util.iphoneXBottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
                end: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    K.chat_feedback_describe_problem,
                    style: TextStyle(
                        fontSize: 16.0, color: R.colors.secondTextColor),
                  ),
                  Container(
                    height: 100.0,
                    margin:
                        const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                    padding: const EdgeInsetsDirectional.all(5.0),
                    decoration: BoxDecoration(
                      color: R.colors.secondBgColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: R.colors.mainTextColor,
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
                  Text(
                    K.chat_feedback_upload_image,
                    style: TextStyle(
                        fontSize: 16.0, color: R.colors.secondTextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            manager.getPhotos(
              photos: _photos,
              width: (Util.width - 80) / 3.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton.of(
        title: K.chat_feedback_submit,
        onTap: _submit,
      ),
    );
  }

  void _submit() async {
    String desc = _textController.value.text;
    if ((desc.isEmpty) && _photos.isEmpty) {
      Fluttertoast.showToast(
          msg: K.chat_feedback_submit_error, gravity: ToastGravity.CENTER);
      return;
    }

    List<String> urls = [];
    for (var photo in _photos) {
      urls.add(photo.url);
    }

    BaseResponse resp = await ChatServiceRepo.submitServiceComment(
        widget.uuid, widget.sid, urls, desc);
    if (resp.success == true) {
      Fluttertoast.showToast(
          msg: K.chat_feedback_thanks, gravity: ToastGravity.CENTER);
      Navigator.of(context).pop(true);
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }
}
