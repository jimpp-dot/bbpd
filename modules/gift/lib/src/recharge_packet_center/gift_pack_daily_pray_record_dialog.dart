/// 往期祈福
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/repo/gift_activity_repo.dart';
import 'package:gift/src/model/generated/slp_gift_pack.pb.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

class GiftPackPrayRecordDialog extends StatefulWidget {
  const GiftPackPrayRecordDialog({Key? key}) : super(key: key);

  @override
  State<GiftPackPrayRecordDialog> createState() =>
      _GiftPackPrayRecordDialogState();

  static Future<void> show(BuildContext context) async {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: const GiftPackPrayRecordDialog(),
        );
      },
    );
  }
}

class _GiftPackPrayRecordDialogState extends State<GiftPackPrayRecordDialog>
    with TickerProviderStateMixin {
  List<GiftPackPrayHistoryItem> _historyList = [];
  final List<String> _values = [K.gift_pack_recent_pray, K.gift_pack_my_pray];

  ExtendedTabController? _tabController;
  final List<Widget> _tabWidgets = [];
  void _closeDialog() {
    Navigator.of(context, rootNavigator: true).pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var content in _values) {
      _tabWidgets.add(Text(content));
    }
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: 0, length: _tabWidgets.length, vsync: this),
    );
    _loadPrayRecord(0);
  }

  void _loadPrayRecord(int type) async {
    //type == 0 往期祈福 1：我的祈福
    //ResGiftPackPrayHistory resp1 = await GiftPackCenterRepo.getPrayHistory();

    ResGiftPackPrayHistory resp;

    if (type == 1) {
      resp = await GiftPackCenterRepo.getMyPrayHistory();
    } else {
      resp = await GiftPackCenterRepo.getPrayHistory();
    }

    if (resp.success) {
      if (mounted) {
        setState(() {
          _historyList = resp.historyList;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var element in _historyList) {
      String createTime = Utility.formatDateToDay(element.createTime);
      widgets.add(Container(
        margin: const EdgeInsetsDirectional.only(top: 12, bottom: 6),
        child: Text(
          createTime,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: R.color.secondTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w400),
        ),
      ));
      element.prayList.forEachIndexed((i, pray) {
        widgets.add(_buildPrayRecordItem(pray.icon, pray.name,
            pray.commodityName, i == element.prayList.length - 1));
      });
    }

    // _historyList.forEach((element) {
    //   element.prayList.forEach((pray) {
    //     widgets.add(_buildPrayRecordItem(
    //         pray.icon,pray.name, pray.commodityName,));
    //   })
    // )};

    return SizedBox(
      width: Util.width - 32 * 2,
      height: 341,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsetsDirectional.only(top: 20),
                child: _buildTabBar(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 12),
                  child: widgets.isNotEmpty
                      ? ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsetsDirectional.only(
                              start: 20, end: 20),
                          children: widgets,
                        )
                      : Center(
                          child: ErrorData(
                            error: K.gift_no_data,
                            bottom: 0,
                          ),
                        ),
                ),
              ),

              //_buildSureButton(context),
            ],
          ),
          PositionedDirectional(
            end: 4,
            child: IconButton(
              onPressed: _closeDialog,
              icon: R.img(
                Assets.gift_pack_gift_pack_daily_coupon_close_webp,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_GIFT,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleTabClickReport(int index) {
    if ((_tabController?.length ?? 0) > index) {
      _loadPrayRecord(index);
    }
    //   Tracker.instance.track(TrackEvent.party_page,
    //       properties: {'click_tab': _tabList[index].name});
    // }
  }

  Widget _buildTabBar() {
    return CommonTabBar(
      //key: _tabBarGlobalKey,
      showSplash: false,
      labelPadding: const EdgeInsetsDirectional.only(end: 12),
      controller: _tabController,
      isScrollable: true,
      tabs: _tabWidgets,
      onTap: handleTabClickReport,
      labelColor: R.color.unionRankText1,
      unselectedLabelColor: R.color.unionRankText1.withOpacity(0.3),
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

      indicator: CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: R.color.unionRankText1),
          insets: const EdgeInsetsDirectional.only(bottom: 0),
          wantWidth: 16,
          draggingWidth: 12.0),
    );
  }

  Widget _buildPrayRecordItem(
      String icon, String content, String name, bool isLast) {
    return Container(
      height: isLast ? 57 : 48,
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              CommonAvatar(
                size: 48,
                shape: BoxShape.circle,
                path: System.imageDomain + icon,
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xFF313131),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: K.git_pack_get_pray,
                  style: TextStyle(
                      color: R.color.secondTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: name,
                      style: const TextStyle(
                          color: Color(0xFF885AFF),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isLast)
            Container(
              margin: const EdgeInsetsDirectional.only(top: 8),
              height: 1,
              //margin: EdgeInsetsDirectional.only(start: 20,end: 20),
              color: const Color(0x1A313131),
            ),
        ],
      ),
    );
  }
}
