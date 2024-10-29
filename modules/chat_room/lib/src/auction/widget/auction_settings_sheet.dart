import 'dart:math';

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/auction/widget/auction_settings_sub_sheet.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/auction/model/auction_repo.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

class AuctionSettingsSheet extends StatefulWidget {
  final int rid; // 房间ID
  final int vvc; // 给后台透传参数

  const AuctionSettingsSheet({super.key, required this.rid, required this.vvc});

  @override
  AuctionSettingsSheetState createState() {
    return AuctionSettingsSheetState();
  }

  static void show({
    required BuildContext context,
    required int rid,
    required int vvc,
  }) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: R.color.mainBgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
        ),
        builder: (BuildContext context) {
          return AuctionSettingsSheet(
            rid: rid,
            vvc: vvc,
          );
        });
  }
}

class AuctionSettingsSheetState extends State<AuctionSettingsSheet> {
  bool isLoading = true;

  final List<String> _tabs = [
    K.room_auction_setting_tab_1,
    K.room_auction_setting_tab_2
  ];
  List<Widget> _pagesWidget = [];
  int _curIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    RespAuctionSetting rsp = await AuctionRepo.getSettings(widget.rid);
    if (!mounted) return;
    isLoading = false;
    if (rsp.success) {
      _pageController = PageController(initialPage: _curIndex, keepPage: true);
      _pagesWidget = _tabs
          .mapIndexed((i, e) => AuctionSettingsSubSheet(
              type: i, rid: widget.rid, vvc: widget.vvc, data: rsp.data))
          .toList();
    } else {
      Toast.show(context, rsp.message);
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: Util.width,
        height: min(Util.height * 0.75, 560),
        child: isLoading
            ? const Loading()
            : Column(
                children: [
                  Container(
                    height: 50,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.room_auction_settings_title,
                      style: TextStyle(
                        fontSize: 18,
                        color: R.color.mainTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  _buildTabBar(),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: _pagesWidget,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      width: Util.width,
      height: 38,
      margin: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 5, bottom: 5),
      padding: const EdgeInsets.all(2),
      decoration: const ShapeDecoration(
        color: Color(0xFFF6F7F9),
        shape: StadiumBorder(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _tabs.mapIndexed((i, e) => _buildTabItem(i, e)).toList(),
      ),
    );
  }

  Widget _buildTabItem(
    int index,
    String tabLabel,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabSelected(index),
        child: Container(
          width: double.infinity,
          height: 34,
          decoration: ShapeDecoration(
            color: _curIndex == index ? Colors.white : Colors.transparent,
            shape: const StadiumBorder(),
          ),
          alignment: Alignment.center,
          child: Text(
            tabLabel,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _curIndex == index
                  ? const Color(0xFF202020)
                  : const Color(0xFF202020).withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int index) async {
    _curIndex = index;
    _pageController?.jumpToPage(index);
    refresh();
  }
}
