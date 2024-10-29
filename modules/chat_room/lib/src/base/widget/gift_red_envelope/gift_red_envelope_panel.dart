import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../../assets.dart';
import '../../../../chat_room.dart';
import 'package:chat_room/k.dart';
import '../../../protobuf/generated/gift_red_packet.pb.dart';
import 'gift_red_envelope_pay_dialog.dart';
import 'gift_red_envelope_repo.dart';

/// 礼物红包
class GiftRedEnvelopePanel extends StatefulWidget {
  final ChatRoomData room;
  const GiftRedEnvelopePanel({Key? key, required this.room}) : super(key: key);

  @override
  State<GiftRedEnvelopePanel> createState() => _GiftRedEnvelopePanelState();

  static Future show(
    BuildContext context,
    ChatRoomData room,
  ) async {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 0.8,
      builder: (BuildContext context) {
        return GiftRedEnvelopePanel(
          room: room,
        );
      },
    );
  }
}

class _GiftRedEnvelopePanelState extends State<GiftRedEnvelopePanel>
    with TickerProviderStateMixin<GiftRedEnvelopePanel> {
  TabController? _tabController;

  int _currentIndex = 0;

  List<RedPacket> _redPacketList = [];

  int durationSelectedIndex = 0; // 礼物时长下标

  int startTimeSelectedIndex = 0; // 开启时间下标

  RedPacketDurationCfg? durationConfig;

  RedPacketBeginTimeCfg? beginTimeConfig;

  int _selectedDurationId = 1; // 选中红包时长ID

  int _selectedBeginTimeId = 1; // 选中开启时间ID

  String? totalPriceStr;

  int price = 0;

  int redId = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    RedPacketHomeData data =
        await GiftRedEnvelopeRepo.getGiftRedEnvelopePanel();
    _redPacketList = data.redItems;
    durationConfig = data.durationConfig;
    beginTimeConfig = data.beginTimeConfig;
    _initTab();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (_redPacketList.isEmpty == true) return const SizedBox.shrink();
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.dp),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.dp, sigmaY: 16.dp),
        child: Container(
            height: Util.iphoneXBottom + 450.dp,
            padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
            decoration: BoxDecoration(
              color: const Color(0xFF171621).withOpacity(0.7),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16.dp),
                topEnd: Radius.circular(16.dp),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                PositionedDirectional(
                  top: 0,
                  child: R.img(
                      RoomAssets
                          .chat_room$gift_red_envelope_top_atmosphere_bg_webp,
                      width: Util.width,
                      height: 24.dp),
                ),
                PositionedDirectional(
                  top: 0,
                  end: -16.dp,
                  child: R.img(
                      RoomAssets
                          .chat_room$gift_red_envelope_red_envelope_bg_webp,
                      width: 105.dp,
                      height: 125.dp,
                      fit: BoxFit.fill),
                ),
                PositionedDirectional(
                  bottom: -Util.iphoneXBottom,
                  child: R.img(
                      RoomAssets
                          .chat_room$gift_red_envelope_gift_red_bottom_pg_webp,
                      width: Util.width,
                      height: 100.dp,
                      fit: BoxFit.fill),
                ),
                Column(
                  children: [
                    _buildTitle(),
                    Container(
                      margin:
                          EdgeInsetsDirectional.only(start: 16.dp, top: 12.dp),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(K.choose_red_envelope,
                          style: TextStyle(
                              fontSize: 16.dp,
                              color: const Color(0xE6FFFFFF),
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 10.dp),
                    _buildRedAmountArea(),
                    SizedBox(height: 20.dp),
                    SizedBox(
                      height: 84.dp,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildDurationTabRow(), // 第一行选项
                          SizedBox(height: 20.dp), // 行间距
                          buildStartTimeTabRow(), // 第二行选项
                        ],
                      ),
                    ),
                    SizedBox(height: 20.dp),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        GiftRedEnvelopePayDialog.show(
                            context,
                            widget.room,
                            price,
                            _selectedDurationId,
                            _selectedBeginTimeId,
                            redId);
                      },
                      child: Container(
                        width: 250.dp,
                        height: 44.dp,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: AlignmentDirectional.centerStart,
                            end: AlignmentDirectional.centerEnd,
                            colors: [
                              Color(0xFFFF35AE),
                              Color(0xFFFF356E),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(22.dp),
                        ),
                        child: Text(
                          totalPriceStr ?? '',
                          style: TextStyle(
                              fontSize: 16.dp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      height: 44.dp,
      child: Container(
        height: 44.dp,
        alignment: Alignment.center,
        child: Text(K.give_red_envelope,
            style: TextStyle(
                fontSize: 16.dp,
                color: const Color(0xE6FFFFFF),
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  //红包额度区域
  Widget _buildRedAmountArea() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16.dp),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.dp, sigmaY: 16.dp),
            child: Container(
              height: 188.dp,
              width: Util.width - 32.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.dp),
                color: const Color(0x0FFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTabWidget(),
                  SizedBox(height: 14.dp),
                  Expanded(
                    child: ExtendedTabBarView(
                      controller: _tabController,
                      children: _redPacketList
                          .map((e) => _buildRedAccountContent(e))
                          .toList(),
                    ),
                  ),
                ],
              ),
            )));
  }

  // 礼物tab
  Widget buildTabWidget() {
    List<Widget> tabs = [];
    for (int i = 0; i < _redPacketList.length; i++) {
      bool selected = _currentIndex == i;
      Tab tab = Tab(
        icon: null,
        child: GradientBorderV2(
            borderGradient: selected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFF356E), Color(0x00FF356E)],
                  )
                : null,
            borderRadius: BorderRadiusDirectional.only(
              topStart: i == 0 ? Radius.circular(16.dp) : Radius.circular(0.dp),
              topEnd: i == (_redPacketList.length - 1)
                  ? Radius.circular(16.dp)
                  : Radius.circular(0.dp),
            ),
            borderWidth: selected ? 1.dp : 0,
            child: Container(
                decoration: BoxDecoration(
                  color: selected
                      ? null
                      : const Color(0xFFFFFFFF).withOpacity(0.02),
                  gradient: selected
                      ? const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x29FF356E),
                            Color(0x00FF356E),
                          ],
                        )
                      : null,
                ),
                height: 44.dp,
                width: (Util.width - 32.dp) / 4,
                alignment: AlignmentDirectional.center,
                child: Text(
                  _redPacketList[i].name,
                  style: TextStyle(
                      color: selected ? Colors.white : const Color(0x80FFFFFF),
                      fontSize: selected ? 14.dp : 12.dp,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400),
                ))),
      );
      tabs.add(tab);
    }

    return CommonTabBar(
      showSplash: false,
      controller: _tabController,
      isScrollable: true,
      tabs: tabs,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.5),
      labelPadding: EdgeInsetsDirectional.only(end: 0.dp),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 1.0, color: Colors.transparent),
      ),
    );
  }

  // 礼物列表
  Widget _buildRedAccountContent(RedPacket redPacket) {
    List<Widget> giftsWidget = [];
    giftsWidget.add(SizedBox(
      width: 13.dp,
    ));
    for (int i = 0; i < redPacket.members.length; i++) {
      giftsWidget.add(_buildGiftItem(redPacket.members[i]));
    }
    return Column(
      children: [
        Row(
          children: giftsWidget,
        ),
        SizedBox(height: 10.dp),
        Text(redPacket.fmtDescText,
            style: TextStyle(
                fontSize: 10.dp,
                color: const Color(0xFFFF356E),
                fontWeight: FontWeight.w400)),
        SizedBox(height: 12.dp),
      ],
    );
  }

  Widget _buildGiftItem(RedPacketMembers giftInfo) {
    double width = (Util.width - 58.dp - 21.dp) / 4;
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 7.dp),
          width: width,
          height: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              R.img(RoomAssets.chat_room$gift_red_envelope_gift_border_bg_webp,
                  fit: BoxFit.fill),
              R.img('${System.imageDomain}${giftInfo.icon}',
                  fit: BoxFit.fill, width: 36.dp, height: 36.dp),
              PositionedDirectional(
                bottom: 13.dp,
                end: 13.dp,
                child: NumText(
                  '${giftInfo.num}',
                  style: TextStyle(
                    fontSize: 12.dp,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        // SizedBox(height: 7.dp),
        Text(giftInfo.name,
            style: TextStyle(
                fontSize: 12.dp,
                color: Colors.white,
                fontWeight: FontWeight.w400)),
      ],
    );
  }

  double getBtnWidth(String content) {
    TextStyle style = TextStyle(
        fontSize: 16.dp,
        color: const Color(0xE6FFFFFF),
        fontWeight: FontWeight.w600);
    double textWidth =
        TextUtils.getTextSize(System.context, content, style, 100.dp, 1).width;
    double btnWidth = (Util.width - 32.dp - textWidth - 24.dp) / 3;
    return btnWidth;
  }

  Widget buildDurationTabRow() {
    if (durationConfig == null) return const SizedBox.shrink();
    return Container(
      height: 32.dp,
      margin: EdgeInsetsDirectional.only(start: 16.dp),
      child: Row(
        children: [
          Text(durationConfig!.name,
              style: TextStyle(
                  fontSize: 16.dp,
                  color: const Color(0xE6FFFFFF),
                  fontWeight: FontWeight.w600)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(durationConfig!.redPacketDuration.length,
                (index) {
              bool isSelected = durationSelectedIndex == index;
              RedPacketDuration durationItem =
                  durationConfig!.redPacketDuration[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    durationSelectedIndex = index;
                    _selectedDurationId = durationItem.id;
                  });
                },
                child: Container(
                    height: 32.dp,
                    width: getBtnWidth(durationConfig!.name),
                    alignment: Alignment.center,
                    margin: EdgeInsetsDirectional.only(start: 8.dp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.dp),
                      border: isSelected
                          ? Border.all(
                              color: const Color(0xFFFF356E), width: 1.dp)
                          : null,
                      color: isSelected
                          ? const Color(0x14FF356E)
                          : const Color(0x0FFFFFFF),
                    ),
                    child: NumText(
                      durationItem.name,
                      style: TextStyle(
                        fontSize: 12.dp,
                        color: isSelected
                            ? const Color(0xFFFFFFFF)
                            : const Color(0x80FFFFFF),
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    )),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget buildStartTimeTabRow() {
    if (beginTimeConfig == null) return const SizedBox.shrink();
    return Container(
      height: 32.dp,
      margin: EdgeInsetsDirectional.only(start: 16.dp),
      child: Row(
        children: [
          Text(beginTimeConfig!.name,
              style: TextStyle(
                  fontSize: 16.dp,
                  color: const Color(0xE6FFFFFF),
                  fontWeight: FontWeight.w600)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                beginTimeConfig!.redPacketBeginDuration.length, (index) {
              bool isSelected = startTimeSelectedIndex == index;
              RedPacketBeginTime beginTimeItem =
                  beginTimeConfig!.redPacketBeginDuration[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    startTimeSelectedIndex = index;
                    _selectedBeginTimeId = beginTimeItem.id;
                  });
                },
                child: Container(
                    height: 32.dp,
                    width: getBtnWidth(beginTimeConfig!.name),
                    alignment: Alignment.center,
                    margin: EdgeInsetsDirectional.only(start: 8.dp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.dp),
                      border: isSelected
                          ? Border.all(
                              color: const Color(0xFFFF356E), width: 1.dp)
                          : null,
                      color: isSelected
                          ? const Color(0x14FF356E)
                          : const Color(0x0FFFFFFF),
                    ),
                    child: NumText(
                      beginTimeItem.name,
                      style: TextStyle(
                        fontSize: 12.dp,
                        color: isSelected
                            ? const Color(0xFFFFFFFF)
                            : const Color(0x80FFFFFF),
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    )),
              );
            }),
          )
        ],
      ),
    );
  }

  _initTab() async {
    _disposeTabController();
    _currentIndex = 0;
    if (_redPacketList.isNotEmpty) {
      totalPriceStr = _redPacketList[_currentIndex].fmtPriceText;
      price = _redPacketList[_currentIndex].price;
      redId = _redPacketList[_currentIndex].redId;
      safeRun(() {
        _tabController = TabController(
            initialIndex: 0, length: _redPacketList.length, vsync: this);
        _tabController!.addListener(_onTabChanged);
      });
    }
  }

  void _onTabChanged() {
    if (_tabController?.indexIsChanging == true) return;
    int index = _tabController?.index ?? 0;
    if (_currentIndex != index) {
      _currentIndex = index;
      totalPriceStr = _redPacketList[_currentIndex].fmtPriceText;
      price = _redPacketList[_currentIndex].price;
      redId = _redPacketList[_currentIndex].redId;
      refresh();
    }
  }

  @override
  void dispose() {
    _disposeTabController();
    super.dispose();
  }

  void _disposeTabController() {
    if (_tabController != null) {
      _tabController!.removeListener(_onTabChanged);
      _tabController!.dispose();
      _tabController = null;
    }
  }
}
