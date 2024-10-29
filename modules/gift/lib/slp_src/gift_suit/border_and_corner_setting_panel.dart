import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/gift_suit/gift_suit_util.dart';
import 'package:gift/slp_src/gift_suit/pb/generated/room_gift_suit.pb.dart';
import 'package:gift/slp_src/gift_suit/gift_suit_repo.dart';

///边框和角标设置面板（房间管理菜单的"房间设置"点击打开）
class BorderAndCornerSettingPanel extends StatefulWidget {
  final int rid;

  const BorderAndCornerSettingPanel(this.rid, {super.key});

  static Future show(BuildContext context, int rid) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 1.0,
      builder: (context) {
        return BorderAndCornerSettingPanel(rid);
      },
    );
  }

  @override
  State<BorderAndCornerSettingPanel> createState() =>
      _BorderAndCornerSettingPanelState();
}

class _BorderAndCornerSettingPanelState
    extends State<BorderAndCornerSettingPanel> with TickerProviderStateMixin {
  bool _loading = true;
  String _err = '';
  ExtendedTabController? _tabController;
  List<GetRoomFrameListResp_Tab> _tabList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _loadData() async {
    final res = await GiftSuitRepo.roomSettingPanel(widget.rid);
    _loading = false;
    if (res.success) {
      _err = '';
      _tabList =
          res.data.tabs.where((e) => GiftSuitUtil.supportTab(e.tabId)).toList();
      _tabController ??=
          ExtendedTabController(length: _tabList.length, vsync: this);
    } else {
      _err = res.msg;
    }
    refresh();
  }

  void _reload() {
    _loading = true;
    _err = '';
    refresh();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.horizontal(
            start: Radius.circular(16), end: Radius.circular(16)),
      ),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    } else if (_err.isNotEmpty) {
      return ErrorData(error: _err, onTap: _reload);
    } else if (_tabList.isEmpty) {
      return const EmptyWidget();
    } else {
      return Column(
        children: [
          Container(
            height: 44,
            alignment: AlignmentDirectional.centerStart,
            child: CommonTabBar(
              tabs: _tabList.map((e) => Tab(child: Text(e.name))).toList(),
              isScrollable: true,
              controller: _tabController!,
              labelColor: R.color.mainTextColor,
              unselectedLabelColor: R.color.secondTextColor,
              labelStyle: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  TextStyle(color: R.color.secondTextColor, fontSize: 14),
              indicator: const BoxDecoration(),
              indicatorWeight: 0,
              marginStart: 6,
              labelPadding:
                  const EdgeInsetsDirectional.only(start: 12, end: 12),
              tabItemAlign: const Alignment(0, 0),
            ),
          ),
          Expanded(
            child: ExtendedTabBarView(
              controller: _tabController,
              children: _tabList
                  .map((e) => _SubSettingTabPage(widget.rid, e))
                  .toList(),
            ),
          ),
        ],
      );
    }
  }
}

class _SubSettingTabPage extends StatefulWidget {
  final int rid;
  final GetRoomFrameListResp_Tab tab;

  const _SubSettingTabPage(this.rid, this.tab);

  @override
  State<_SubSettingTabPage> createState() => _SubSettingTabPageState();
}

class _SubSettingTabPageState extends State<_SubSettingTabPage>
    with AutomaticKeepAliveClientMixin {
  int _selectIndex = -1;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _selectIndex = widget.tab.items.indexWhere((e) => e.wearState == 1);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final list = widget.tab.items;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsetsDirectional.zero,
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(list[index], index);
            },
            itemCount: list.length,
          ),
        ),
        SizedBox(height: 14 + MediaQuery.of(context).padding.bottom),
      ],
    );
  }

  Widget _buildItem(GetRoomFrameListResp_Tab_TabItem item, int index) {
    return SizedBox(
      width: Util.width,
      height: 174.dp,
      child: Column(
        children: [
          SizedBox(height: 5.dp),
          Row(
            children: [
              SizedBox(width: 16.dp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: TextStyle(
                          fontSize: 14.dp,
                          color: R.color.mainTextColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 2.dp),
                  Text(
                    K.gift_get_time_x([
                      (DateTime.fromMillisecondsSinceEpoch(
                              item.getTime.toInt() * 1000)
                          .toyyyyMMddHHmm())
                    ]),
                    style: TextStyle(
                        fontSize: 10.dp, color: R.color.secondTextColor),
                  ),
                  SizedBox(height: 2.dp),
                  Text(
                    K.gift_valid_period_x([
                      DateTime.fromMillisecondsSinceEpoch(
                              item.endTime.toInt() * 1000)
                          .toyyyyMMddHHmm()
                    ]),
                    style: TextStyle(
                        fontSize: 10.dp, color: R.color.secondTextColor),
                  ),
                ],
              ),
              const Spacer(),
              _buildCheckBtn(index, item.showId),
              SizedBox(width: 10.dp),
            ],
          ),
          SizedBox(height: 4.dp),
          widget.tab.tabId == 1
              ? CachedNetworkImage(
                  imageUrl: item.img,
                  width: 353.dp,
                  height: 98.dp,
                  fit: BoxFit.contain,
                )
              : Container(
                  width: 343.dp,
                  height: 88.dp,
                  margin: EdgeInsetsDirectional.only(top: 5.dp),
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(16),
                      color: const Color(0xFFF7F8FA)),
                  child: CachedNetworkImage(
                    imageUrl: item.img,
                    width: 187.5.dp,
                    height: 31.dp,
                    fit: BoxFit.contain,
                  )),
        ],
      ),
    );
  }

  Widget _buildCheckBtn(int index, int showId) {
    bool checked = index == _selectIndex;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        CommonLoading.show();
        NormalNull rsp;
        if (checked) {
          rsp =
              await GiftSuitRepo.cancelRoomFrame(widget.rid, widget.tab.tabId);
        } else {
          rsp = await GiftSuitRepo.setRoomFrame(widget.rid, showId);
        }
        CommonLoading.dismiss();
        if (rsp.success) {
          if (checked) {
            _selectIndex = -1;
            Fluttertoast.showCenter(msg: K.gift_success_cancel);
          } else {
            _selectIndex = index;
            Fluttertoast.showCenter(msg: K.gift_wear_success);
          }
          refresh();
        } else {
          Fluttertoast.showCenter(msg: rsp.msg);
        }
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(6.dp),
        child: checked
            ? CheckBoxChecked(width: 21.dp, height: 21.dp)
            : CheckBoxUnchecked(width: 21.dp, height: 21.dp),
      ),
    );
  }
}
