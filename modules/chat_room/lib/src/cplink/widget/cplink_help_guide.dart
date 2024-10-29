import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';

/// 玩法说明
class CpLinkHelpGuideWidget extends StatefulWidget {
  final int rid;

  const CpLinkHelpGuideWidget({
    Key? key,
    required this.rid,
  }) : super(key: key);

  @override
  _CpLinkHelpGuideWidgetState createState() => _CpLinkHelpGuideWidgetState();
}

class _CpLinkHelpGuideWidgetState extends State<CpLinkHelpGuideWidget>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin {
  String? _content;

  @override
  void initState() {
    super.initState();
    _load();
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
    var resp = await CpLinkRepo.noticeInfo(widget.rid, 1);
    if (resp.success == true) {
      _content = resp.data?.content;
      setScreenReady();
    } else if (resp.msg?.isNotEmpty == true) {
      setScreenError(errorMsg: resp.msg);
    } else {
      setScreenError();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
