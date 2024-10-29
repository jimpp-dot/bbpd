import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 私聊 顶部返回+未读
///
class ChatUnReadWidget extends StatefulWidget {
  const ChatUnReadWidget({super.key});

  @override
  State<ChatUnReadWidget> createState() => _ChatUnReadWidgetState();
}

class _ChatUnReadWidgetState extends State<ChatUnReadWidget> {
  int _unread = 0;

  @override
  void initState() {
    super.initState();
    eventCenter.addListeners([Im.EventUnreadChanged], _onUnreadChanged);
    _initUnread();
  }

  @override
  void dispose() {
    eventCenter.removeListeners([Im.EventUnreadChanged], _onUnreadChanged);
    super.dispose();
  }

  _initUnread() async {
    int? count = await Im.getTotalUnreadCount();
    if (mounted) {
      setState(() {
        _unread = count;
      });
    }
  }

  _onUnreadChanged(String type, dynamic value) {
    if (type == Im.EventUnreadChanged) {
      Map res = value;
      int left = Util.parseInt(res['left']);
      if (left == 0) _initUnread();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Center(
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: kToolbarHeight,
              height: kToolbarHeight,
              alignment: AlignmentDirectional.center,
              child: R.img(
                BaseAssets.shared$ic_titlebar_back_svg,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_BASE_CORE,
                color: R.colors.mainTextColor,
              ),
            ),
          ),
        ),
        if (_unread > 0)
          PositionedDirectional(
            start: 36.0,
            top: 0.0,
            bottom: 0.0,
            child: Center(
              child: Container(
                  alignment: Alignment.center,
                  padding: _unread > 9
                      ? const EdgeInsetsDirectional.only(
                          start: 6, end: 6, bottom: 1)
                      : const EdgeInsetsDirectional.only(bottom: 1),
                  width: _unread > 9 ? null : 24,
                  height: 16,
                  decoration: BoxDecoration(
                      color: R.colors.thirdBrightColor,
                      borderRadius: BorderRadius.circular(9)),
                  child: Text(
                    _unread <= 99 ? _unread.toString() : '99',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
            ),
          )
      ],
    );
  }
}
