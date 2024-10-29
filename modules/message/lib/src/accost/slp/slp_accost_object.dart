import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../../api/message_repo.dart';
import '../../model/pb/generated/slp_gs.pb.dart';

class BbAccostObjectWidget extends StatefulWidget {
  const BbAccostObjectWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BbAccostObjectState();
}

class _BbAccostObjectState extends State<BbAccostObjectWidget>
    with BaseScreenStateMixin {
  List<AccostPermissionHelpItem> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    ResAccostGsPermissions res = await MessageRepo.getBbAccostObjectList();
    if (res.success) {
      if (res.data.isNotEmpty) {
        _data = res.data;
        setScreenReady();
      } else {
        setScreenEmpty();
      }
    } else {
      setScreenError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.msg_accost_object,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
      ),
      body: buildStatusContent(),
    );
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget buildContent() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildItem(_data[index]);
      },
      itemCount: _data.length,
      physics: const ClampingScrollPhysics(),
    );
  }

  Widget _buildItem(AccostPermissionHelpItem item) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 30, end: 30, top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              color: Color(0xFF202020),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            item.annotation,
            style: TextStyle(
              color: R.color.secondTextColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
