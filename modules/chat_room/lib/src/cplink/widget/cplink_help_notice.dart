import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

/// 房间公告
class CpLinkHelpNoticeWidget extends StatefulWidget {
  final ChatRoomData room;

  const CpLinkHelpNoticeWidget({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  _CpLinkHelpNoticeWidgetState createState() => _CpLinkHelpNoticeWidgetState();
}

class _CpLinkHelpNoticeWidgetState extends State<CpLinkHelpNoticeWidget>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin {
  String? _content;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildStatusContent();
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  @protected
  void onTapErrorWidget() {
    _load();
    setScreenLoading();
  }

  @override
  Widget buildContent() {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: EdgeInsets.all(15.dp),
      child: SingleChildScrollView(
        child: Text(
          _content ?? '',
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _load() async {
    ResRoomDataDesc resp = await RoomApi.roomDescription(widget.room.rid);
    if (resp.success && resp.hasData()) {
      _content = resp.data;
      setScreenReady();
    } else if (resp.hasMsg()) {
      setScreenError(errorMsg: resp.msg);
    } else {
      setScreenError();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
