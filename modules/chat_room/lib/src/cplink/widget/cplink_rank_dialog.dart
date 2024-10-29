import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';
import 'package:chat_room/src/protobuf/generated/cplink.pb.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:chat_room/assets.dart';

class CpLinkRankDialog extends StatefulWidget {
  const CpLinkRankDialog({Key? key}) : super(key: key);

  @override
  State<CpLinkRankDialog> createState() => _CpLinkRankDialogState();

  static Future show(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.7),
      maxHeightRatio: 1.0,
      builder: (context) => const CpLinkRankDialog(),
    );
  }
}

class _CpLinkRankDialogState extends State<CpLinkRankDialog>
    with SingleTickerProviderStateMixin {
  late ExtendedTabController _tabController;
  final List<String> _tabs = [K.room_rank_week, K.room_pub_home_rank_total];

  @override
  void initState() {
    super.initState();
    _tabController = ExtendedTabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        R.img(
          RoomAssets.chat_room$cplink_cplink_rank_bg_webp,
          width: Util.width,
          fit: BoxFit.fitWidth,
        ),
        PositionedDirectional(
          top: 43,
          start: 0,
          end: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).maybePop();
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start: 6, top: 2),
                  width: 44,
                  height: 44,
                  alignment: AlignmentDirectional.topCenter,
                  child: R.img(RoomAssets.chat_room$back_svg,
                      width: 24.0, height: 24.0),
                ),
              ),
              R.img(
                RoomAssets.chat_room$cplink_cplink_rank_title_webp,
                width: 186,
                fit: BoxFit.fitWidth,
              ),
              GestureDetector(
                onTap: () {
                  BaseWebviewScreen.show(context,
                      url: Util.getProductHelpUrl('k222'), title: '拍拍关系榜单说明');
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.only(end: 6),
                  width: 44,
                  height: 44,
                  alignment: AlignmentDirectional.topCenter,
                  child: R.img(
                      RoomAssets.chat_room$cplink_cplink_rank_question_webp,
                      width: 24.0,
                      height: 24.0),
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 88,
          start: 0,
          end: 0,
          bottom: 0,
          child: Column(
            children: [
              Container(
                height: 44,
                margin: const EdgeInsets.only(bottom: 4),
                child: CommonTabBar(
                  tabs: _tabs.map((e) => Tab(child: Text(e))).toList(),
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const BoxDecoration(),
                  labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                  unselectedLabelStyle:
                      const TextStyle(color: Colors.white70, fontSize: 17),
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: R.colors.thirdTextColor,
                  labelPadding:
                      const EdgeInsetsDirectional.only(start: 10, end: 10),
                  isScrollable: true,
                ),
              ),
              Expanded(
                child: ExtendedTabBarView(
                  controller: _tabController,
                  children: _tabs.mapIndexed((i, e) => _TabPage(i)).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabPage extends StatefulWidget {
  final int index;

  const _TabPage(this.index);

  @override
  State<_TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<_TabPage> with AutomaticKeepAliveClientMixin {
  bool _isLoading = false;
  ResDefendPatRankList? _rankData;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_isLoading) {
      return const Center(child: Loading());
    } else {
      if (!(_rankData?.success ?? false)) {
        return _errorWidget();
      }
    }
    return _buildBody();
  }

  void _requestData() async {
    _isLoading = true;
    _rankData =
        await CpLinkRepo.getCpLinkRankData(widget.index == 0 ? 'week' : 'all');
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: _rankData?.msg,
        onTap: () {
          _requestData();
          if (mounted) {
            setState(() {});
          }
        },
      ),
    );
  }

  Widget _emptyWidget() {
    return const EmptyWidget();
  }

  Widget _buildBody() {
    if (_rankData != null && _rankData!.list.isEmpty) {
      return _emptyWidget();
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          bottom: 0,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _buildFirstWidget(_rankData!.list.first),
              ),
              if (_rankData!.list.length == 2)
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsetsDirectional.only(top: 8),
                      child: _buildOtherWidget(_rankData!.list[1])),
                ),
              if (_rankData!.list.length >= 3)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16, end: 16, top: 10),
                    child: Row(
                      children: [
                        _buildSecondAndThirdWidget(_rankData!.list[1]),
                        const SizedBox(
                          width: 8,
                        ),
                        _buildSecondAndThirdWidget(_rankData!.list[2]),
                      ],
                    ),
                  ),
                ),
              if (_rankData!.list.length >= 3)
                SliverFixedExtentList(
                  delegate: FixedExtentSliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      DefendPatRankData itemData = _rankData!.list[index + 3];
                      return _buildOtherWidget(itemData);
                    },
                    childCount: _rankData!.list.length - 3,
                  ),
                  itemExtent: 90,
                ),
              //有我的排行时显示
              if (_rankData!.list.length >= 3)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: Util.bottomMargin + 80,
                  ),
                ),
            ],
          ),
        ),
        PositionedDirectional(
            bottom: 0, child: _myRankWidget(_rankData!.myself)),
      ],
    );
  }

  Widget _buildFirstWidget(DefendPatRankData itemData) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          R.img(
            RoomAssets.chat_room$cplink_cplink_rank_first_bg_webp,
            width: Util.width - 32,
            fit: BoxFit.fitWidth,
          ),
          PositionedDirectional(
            start: 8,
            end: 8,
            top: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    R.img(
                      RoomAssets.chat_room$cplink_cplink_rank_number_bg_webp,
                      width: 26,
                      height: 26,
                    ),
                    PositionedDirectional(
                      start: 10,
                      top: 9,
                      child: GradientText(itemData.rank.toString(),
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: Util.numFontFamily,
                              package: ComponentManager.MANAGER_BASE_CORE),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffD724CD),
                                Color(0xff461443),
                              ])),
                    ),
                  ],
                ),
                Text(
                  itemData.relationName,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff461443)),
                ),
                const SizedBox(
                  width: 26,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _userAvatarAndName(
                    itemData.leftUser,
                    const [Color(0xFFBF8BFF), Color(0xffC425E2)],
                    const Color(0xff8F55E0),
                    size: 58,
                    fontSize: 12),
                const SizedBox(
                  width: 88,
                ),
                _userAvatarAndName(
                    itemData.rightUser,
                    const [Color(0xFFFF9F9F), Color(0xffFF4599)],
                    const Color(0xffF0569C),
                    size: 58,
                    fontSize: 12),
              ],
            ),
          ),
          PositionedDirectional(
            top: 22,
            child: R.img(
              RoomAssets.chat_room$cplink_cplink_rank_first_icon_webp,
              width: 110,
              height: 110,
            ),
          ),
          PositionedDirectional(
              bottom: 15,
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                    start: 8, end: 8, top: 4.5, bottom: 4.5),
                decoration: BoxDecoration(
                  color: const Color(0xffFF49A1).withOpacity(0.2),
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                child: NumText(
                  '守护值：${Util.numberToSizeString(itemData.score)}    ${DateUtils.format(itemData.relationStartTime * 1000, 'yyyy.MM.dd')}至今：${itemData.hasRelationDay}天',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff461443)),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSecondAndThirdWidget(DefendPatRankData itemData) {
    return Stack(
      alignment: Alignment.center,
      children: [
        R.img(
          RoomAssets.chat_room$cplink_cplink_rank_second_bg_webp,
          width: (Util.width - 40) / 2,
          fit: BoxFit.fitWidth,
        ),
        PositionedDirectional(
          start: 8,
          end: 8,
          top: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  R.img(
                    RoomAssets.chat_room$cplink_cplink_rank_number_bg_webp,
                    width: 26,
                    height: 26,
                  ),
                  PositionedDirectional(
                    start: 9,
                    top: 8.5,
                    child: GradientText(itemData.rank.toString(),
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontFamily: Util.numFontFamily,
                            package: ComponentManager.MANAGER_BASE_CORE),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffD724CD),
                              Color(0xff461443),
                            ])),
                  ),
                ],
              ),
              Text(
                itemData.relationName,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff461443)),
              ),
              const SizedBox(
                width: 26,
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 43,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userAvatarAndName(
                  itemData.leftUser,
                  const [Color(0xFFBF8BFF), Color(0xffC425E2)],
                  const Color(0xff8F55E0)),
              const SizedBox(
                width: 30,
              ),
              _userAvatarAndName(
                  itemData.rightUser,
                  const [Color(0xFFFF9F9F), Color(0xffFF4599)],
                  const Color(0xffF0569C)),
            ],
          ),
        ),
        PositionedDirectional(
            start: 10,
            end: 10,
            bottom: 10,
            child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFF49A1).withOpacity(0.2),
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    NumText(
                      '守护值：${Util.numberToSizeString(itemData.score)}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff461443).withOpacity(0.7)),
                    ),
                    NumText(
                      '${DateUtils.format(itemData.relationStartTime * 1000, 'yyyy.MM.dd')}至今：${itemData.hasRelationDay}天',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff461443).withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ))),
        PositionedDirectional(
          top: 32,
          child: R.img(
            RoomAssets.chat_room$cplink_cplink_rank_second_icon_webp,
            width: 60,
            height: 60,
          ),
        ),
      ],
    );
  }

  Widget _buildOtherWidget(DefendPatRankData itemData) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          R.img(
            RoomAssets.chat_room$cplink_cplink_rank_other_bg_webp,
            width: Util.width - 32,
            height: 80,
            fit: BoxFit.fill,
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            bottom: 0,
            child: Row(
              children: [
                Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: NumText(
                    itemData.rank.toString(),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff461443)),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                _userAvatarAndName(
                    itemData.leftUser,
                    const [Color(0xFFBF8BFF), Color(0xffC425E2)],
                    const Color(0xff8F55E0)),
                _userAvatarAndName(
                    itemData.rightUser,
                    const [Color(0xFFFF9F9F), Color(0xffFF4599)],
                    const Color(0xffF0569C)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        itemData.relationName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff461443)),
                      ),
                      const Spacer(),
                      NumText(
                        '守护值：${Util.numberToSizeString(itemData.score)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff461443).withOpacity(0.7)),
                      ),
                      NumText(
                        '${DateUtils.format(itemData.relationStartTime * 1000, 'yyyy.MM.dd')}至今：${itemData.hasRelationDay}天',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff461443).withOpacity(0.7)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 2,
            start: 79,
            child: R.img(
              RoomAssets.chat_room$cplink_cplink_rank_other_icon_webp,
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }

  Widget _myRankWidget(DefendPatRankData itemData) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          bottom: Util.bottomMargin, start: 16, end: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(11), topEnd: Radius.circular(11)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffFFE7F8), Colors.white],
        ),
      ),
      alignment: Alignment.center,
      height: Util.bottomMargin + 80,
      width: Util.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            start: 0,
            end: 0,
            child: Row(
              children: [
                Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: NumText(
                    itemData.rank <= 0 ? '-' : itemData.rank.toString(),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff461443)),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                if (itemData.leftUser.name.isNotEmpty)
                  _userAvatarAndName(
                      itemData.leftUser,
                      const [Color(0xFFBF8BFF), Color(0xffC425E2)],
                      const Color(0xff8F55E0),
                      showName: (itemData.rank > 0 ||
                          (itemData.leftUser.name.isNotEmpty &&
                              itemData.rightUser.name.isNotEmpty))),
                if (itemData.rightUser.name.isNotEmpty)
                  _userAvatarAndName(
                      itemData.rightUser,
                      const [Color(0xFFFF9F9F), Color(0xffFF4599)],
                      const Color(0xffF0569C),
                      showName: (itemData.rank > 0 ||
                          (itemData.leftUser.name.isNotEmpty &&
                              itemData.rightUser.name.isNotEmpty))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: (itemData.leftUser.name.isNotEmpty &&
                            itemData.rightUser.name.isNotEmpty)
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        (itemData.leftUser.name.isEmpty ||
                                itemData.rightUser.name.isEmpty)
                            ? (itemData.leftUser.name.isNotEmpty
                                ? itemData.leftUser.name
                                : itemData.rightUser.name)
                            : itemData.relationName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff461443)),
                      ),
                      SizedBox(
                        height: (itemData.leftUser.name.isEmpty ||
                                itemData.rightUser.name.isEmpty)
                            ? 6
                            : 12,
                      ),
                      if (itemData.leftUser.name.isEmpty ||
                          itemData.rightUser.name.isEmpty)
                        Text(
                          K.room_no_relationship,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff461443).withOpacity(0.7)),
                        ),
                      if (itemData.leftUser.name.isNotEmpty &&
                          itemData.rightUser.name.isNotEmpty)
                        NumText(
                          '守护值：${Util.numberToSizeString(itemData.score)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff461443).withOpacity(0.7)),
                        ),
                      if (itemData.leftUser.name.isNotEmpty &&
                          itemData.rightUser.name.isNotEmpty)
                        NumText(
                          '${DateUtils.format(itemData.relationStartTime * 1000, 'yyyy.MM.dd')}至今：${itemData.hasRelationDay}天',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff461443).withOpacity(0.7)),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          if (itemData.leftUser.name.isNotEmpty &&
              itemData.rightUser.name.isNotEmpty)
            PositionedDirectional(
              top: 5,
              start: 79,
              child: R.img(
                RoomAssets.chat_room$cplink_cplink_rank_other_icon_webp,
                width: 60,
                height: 60,
              ),
            ),
        ],
      ),
    );
  }

  Widget _userAvatarAndName(
      PatRankUserData userData, List<Color> colors, Color nameColor,
      {double size = 44, double fontSize = 12, bool showName = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            RoomUserProfile.openImageFloatScreenDisplayModalBottomSheet(
                context, userData.uid, ChatRoomData.getInstance(), 0);
          },
          child: Container(
              clipBehavior: Clip.hardEdge,
              width: size,
              height: size,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(size / 2),
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  width: 1.5,
                ),
              ),
              child: CommonAvatar(
                path: Util.getRemoteImgUrl(userData.icon),
                size: size - 2,
                borderRadius: BorderRadius.circular(size / 2 - 1),
                shape: BoxShape.circle,
              )),
        ),
        SizedBox(
          width: 5 * fontSize,
          child: showName
              ? Text(
                  userData.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: nameColor),
                )
              : null,
        ),
      ],
    );
  }
}
