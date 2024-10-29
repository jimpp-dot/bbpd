import 'package:chat_room/k.dart';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/room_vip.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

import '../../../chat_room.dart';

class VisitantRankListWidget extends StatefulWidget {
  final ChatRoomData room;

  final PageRefer refer = const PageRefer('VisitantRank');

  const VisitantRankListWidget({super.key, required this.room});

  static Future openRoomBottomMenu(BuildContext context, ChatRoomData room,
      {Key? key}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.8,
      defineBarrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return VisitantRankListWidget(key: key, room: room);
      },
    );
  }

  @override
  _VisitantRankListState createState() => _VisitantRankListState();
}

class _VisitantRankListState extends State<VisitantRankListWidget> {
  late _VisitantRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _VisitantRankLoadingSource(widget.room.rid, this);
    _source.refresh();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double expandedHeight = 302;

    return GestureDetector(
      onTap: () {}, // 消费点击事件
      child: Container(
        width: Util.width,
        height: 650,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Container(
              width: Util.width,
              height: 370,
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(16), topEnd: Radius.circular(16)),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    Color(0xFF802BD9),
                    Color(0xFF493ADC),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: Util.width,
                  height: 44.0,
                  margin: const EdgeInsetsDirectional.only(
                      top: 12, bottom: 12, end: 20, start: 20),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.center,
                        child: Text(
                          K.room_visitant_rank,
                          style: const TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            BaseWebviewScreen.show(context,
                                url: Util.getHelpUrlWithQStr('k83'));
                          },
                          child: R.img(
                            'room_visitant_rank_help.webp',
                            width: 24,
                            height: 24,
                            package: ComponentManager.MANAGER_BASE_ROOM,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          pinned: false,
                          snap: false,
                          elevation: 0.0,
                          automaticallyImplyLeading: false,
                          primary: false,
                          floating: true,
                          expandedHeight: expandedHeight,
                          backgroundColor: Colors.transparent,
                          flexibleSpace: FlexibleSpaceBar(
                            background: SizedBox(
                              width: Util.width,
                              height: 302,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    child: R.img(
                                      'room_visitant_rank_header_light_bg.webp',
                                      width: Util.width,
                                      height: 287,
                                      package:
                                          ComponentManager.MANAGER_BASE_ROOM,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 16, end: 16),
                                      child: R.img(
                                        'room_visitant_rank_header_taizi_bg.webp',
                                        width: Util.width,
                                        height: 123,
                                        package:
                                            ComponentManager.MANAGER_BASE_ROOM,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildTop(),
                                      _buildTopThree(_source.sublist(
                                          0, min(3, _source.length))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    body: Container(
                        color: Colors.white,
                        child: showRankListByKey(roomVipKey)
                            ? _buildList()
                            : ErrorData(error: R.string("no_data"))),
                  ),
                ),
                if (Util.validStr(_source.achieveTips))
                  _buildAchievementGuideWidget(),
                if (_source.my != null) _buildMyRank(_source.my!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 解锁新成就引导条幅
  Widget _buildAchievementGuideWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          color: const Color(0xFFFFF2E7),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                R.img(
                  'ic_achievement_guide.webp',
                  width: 40,
                  height: 40,
                  package: ComponentManager.MANAGER_GIFT,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    _source.achieveTips ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(fontSize: 11, color: Color(0xFFFDA252)),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_source.my == null)
          Container(
            height: MediaQuery.of(context).padding.bottom,
            color: const Color(0xFFFFF2E7),
          )
      ],
    );
  }

  /// 贵宾专属内容
  Widget _buildTop() {
    return Container(
      height: 72,
      margin: const EdgeInsetsDirectional.only(
          start: 22, end: 22, top: 3, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color(0xFF9C7EF9), width: 0.5),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            Color(0xFF976BFF),
            Color(0xFF5A58FB),
          ],
        ),
      ),
      child: GradientBorder(
        borderGradient: const LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            Color(0x00FFFFFF),
            Color(0xFFFFFFFF),
            Color(0x00FFFFFF),
          ],
        ),
        borderWidth: 0.5,
        borderRadius: 7,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 12.0, end: 6, top: 5, bottom: 5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: const Color(0xFFFED300),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    K.room_visitant_private_fun_text,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Offstage(
                    // 房主或接待； true -> 隐藏，false -> 显示
                    offstage:
                        !(widget.room.isCreator || widget.room.isReception),
                    child: GestureDetector(
                      onTap: () {
                        _onEditDesc();
                      },
                      child: Container(
                        width: 51,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0x33D8D8D8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            R.img(
                              'room_visitant_rank_edit.webp',
                              width: 16,
                              height: 16,
                              package: ComponentManager.MANAGER_BASE_ROOM,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              R.string('base_edit'),
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 1.0),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SingleChildScrollView(
                    child: Text(
                      Util.isStringEmpty(_source.desc)
                          ? R.string("rank_no_data")
                          : _source.desc!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 前三名
  Widget _buildTopThree(List<RoomVipRankItem> items) {
    int length = items.length;

    return Container(
      height: 214,
      alignment: AlignmentDirectional.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PositionedDirectional(
              start: 0,
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: length >= 2
                    ? _buildTopThreeItem(items[1], 2)
                    : _buildTopEmptyItem(2),
              )),
          PositionedDirectional(
            end: 0,
            child: Container(
              alignment: AlignmentDirectional.bottomEnd,
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: length >= 3
                  ? _buildTopThreeItem(items[2], 3)
                  : _buildTopEmptyItem(3),
            ),
          ),
          PositionedDirectional(
            child: Container(
              alignment: AlignmentDirectional.bottomCenter,
              child: length >= 1
                  ? _buildTopThreeItem(items[0], 1)
                  : _buildTopEmptyItem(1),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> topThreeBorderColor(int rank) {
    List<Color> rank1Colors = [
      const Color(0xFFFAD961),
      const Color(0xFFF7B01C)
    ];
    List<Color> rank2Colors = [
      const Color(0xFFE6E6E6),
      const Color(0xFFCDD5E8),
      const Color(0xFFD8D8D8)
    ];
    List<Color> rank3Colors = [
      const Color(0xFFFFE9D6),
      const Color(0xFFFFAB81)
    ];
    if (rank == 1) {
      return rank1Colors;
    } else if (rank == 2) {
      return rank2Colors;
    } else if (rank == 3) {
      return rank3Colors;
    }
    return [Colors.white];
  }

  Widget _buildTopEmptyItem(int rank) {
    double nameWidth = rank == 1 ? 124 : 110;
    double top = rank == 1 ? 16 : 26;
    return SizedBox(
      width: nameWidth,
      height: 106,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PositionedDirectional(
              top: top,
              child: Text(
                K.room_visitant_rank_empty_text,
                style: const TextStyle(fontSize: 14, color: Colors.white30),
              ))
        ],
      ),
    );
  }

  Column _buildTopThreeItem(RoomVipRankItem data, int rank) {
    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 72 : 64;

    double avatarBottom = rank == 1 ? 14 : 0;
    double crownBottom = rank == 1 ? 67 : 46;
    double crownStart = rank == 1 ? 12 : 8;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: rank == 1 ? 124 : 110,
          height: 108,
          child: GestureDetector(
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, data.user.uid,
                  refer: widget.refer);
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PositionedDirectional(
                  bottom: avatarBottom,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: GradientBorder(
                        borderGradient: LinearGradient(colors: borderColor),
                        borderWidth: 2,
                        borderRadius: (avatarSize + 4) / 2,
                        child: CommonAvatarWithFrame(
                          childWidget: Container(
                            padding: const EdgeInsets.all(2),
                            child: CommonAvatar(
                              path: data.user.icon,
                              size: avatarSize,
                              shape: BoxShape.circle,
                              onTap: () {
                                IPersonalDataManager personalDataManager =
                                    ComponentManager.instance.getManager(
                                        ComponentManager.MANAGER_PERSONALDATA);
                                personalDataManager.openImageScreen(
                                    context, data.user.uid,
                                    refer: widget.refer);
                              },
                            ),
                          ),
                          uid: 0,
                        )),
                  ),
                ),
                PositionedDirectional(
                  bottom: crownBottom,
                  start: crownStart,
                  child: R.img(
                    "room_visitant_rank_crown_$rank.webp",
                    width: 52,
                    height: 49,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ),
        _buildOverLordCard(rank, data),
      ],
    );
  }

  Widget _buildOverLordCard(int rank, RoomVipRankItem data) {
    double nameTop = rank == 1
        ? 0
        : rank == 2
            ? 13
            : 15;
    double nameWidth = rank == 1 ? 124 : 110;

    return SizedBox(
      width: nameWidth,
      height: 106,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PositionedDirectional(
            top: 10 + nameTop,
            child: Container(
              constraints: BoxConstraints(maxWidth: nameWidth - 20),
              child: Text(data.user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          PositionedDirectional(
            top: 36 + nameTop,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!NobilityUtil.titleIsInvalid(data.user.titleNew))
                  UserNobilityWidget(
                    titleNew: data.user.titleNew,
                    height: 22,
                  ),
                UserVipWidget(
                  vip: data.user.vipLevel,
                  height: 22,
                ),
                UserPopularity(
                  popularityLevel: data.user.popularityLevel,
                  height: 22,
                ),
                RoomVisitantWidget(
                  visitant: data.level,
                  height: 22,
                ),
              ],
            ),
          ),
          if (rank > 1 && showRankScoreByKey(roomVipKey))
            PositionedDirectional(
              top: 62 + nameTop,
              child: _buildScoreText(data,
                  fontSize: 11, textColor: Colors.white.withOpacity(0.8)),
            ),
        ],
      ),
    );
  }

  Widget _buildList() {
    LoadingMoreList child =
        LoadingMoreList<RoomVipRankItem>(ListConfig<RoomVipRankItem>(
      itemBuilder: _itemBuilder,
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
    ));

    return RefreshIndicatorFactory.of(
      child: child,
      onRefresh: () => _source.refresh(),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        hasMore: false,
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _source.errorMsg,
        onTap: () {
          _source.refresh();
        },
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: R.string("no_data"),
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg, loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  Widget _itemBuilder(BuildContext context, RoomVipRankItem item, int index) {
    if (index < 3) return Container();

    return VisitantRankItemWidget(index, item, widget.refer);
  }

  Widget _buildMyRank(RoomVipRankItem myItem) {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(12.0),
          topEnd: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(0.0, -4.0),
              color: R.color.thirdBgColor),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 16.0, end: 12.0, bottom: Util.iphoneXBottom),
        child: Row(
          children: <Widget>[
            if (showRankByKey(roomVipKey))
              Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                child: Text(
                  myItem.rank,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 4.0, end: 12.0, top: 12.0, bottom: 12.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(26)),
                child: CachedNetworkImage(
                  imageUrl: System.imageDomain + myItem.user.icon,
                  width: 52.0,
                  height: 52.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 250),
                    child: Text(
                      myItem.user.name,
                      style: TextStyle(
                          fontSize: 16,
                          color: R.color.mainTextColor,
                          fontFamily: 'PingFang SC'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(children: [
                    if (!NobilityUtil.titleIsInvalid(myItem.user.titleNew))
                      NobilityCornerMarker(
                        titleNew: myItem.user.titleNew,
                        height: 22,
                      ),
                    UserVipWidget(
                      vip: myItem.user.vipLevel,
                      height: 22,
                    ),
                    UserPopularity(
                      popularityLevel: myItem.user.popularityLevel,
                      height: 22,
                    ),
                    if (myItem.level > 0)
                      RoomVisitantWidget(
                        visitant: myItem.level,
                        height: 22,
                      ),
                  ]),
                ],
              ),
            ),
            showRankScoreByKey(roomVipKey)
                ? ((myItem.level > 0)
                    ? _buildScoreText(myItem,
                        fontSize: 13,
                        textColor: const Color(0x80222222),
                        my: true)
                    : _buildOpen(myItem))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildOpen(RoomVipRankItem data) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();

        /// 打开礼物面板并指定开卡礼物
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showRoomGiftPanel(context,
            room: widget.room, defaultId: _source.openGiftId ?? -1);
      },
      child: Container(
        width: 76,
        height: 28,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: R.color.mainBrandGradientColors,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Center(
          child: Text(
            K.room_open_now,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }

  void _onEditDesc() async {
    int index = FormScreen.config(
        type: FormTypes.textArea,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        title: K.room_visitant_desc_input,
        value: _source.desc,
        maxLength: 200);
    String? value = await FormScreen.openFormScreen(context, index);
    if (Util.validStr(value) && value != _source.desc) {
      String rid = "${widget.room.rid}";
      String url = '${System.domain}go/yy/room/vipDescSet';
      XhrResponse response =
          await Xhr.postPb(url, {"rid": rid, "desc": "$value"});
      try {
        RoomVipRankDescSetResp resp =
            RoomVipRankDescSetResp.fromBuffer(response.bodyBytes);
        Log.d("gavin _onEditDesc resp:$resp");
        if (resp.success) {
          // desc = resp.data;
          _source.desc = value;
          refresh();
        }
      } catch (e) {}
    }
  }
}

Widget _buildScoreText(RoomVipRankItem data,
    {required double fontSize, Color? textColor, bool my = false}) {
  if (my) {
    ///是否上榜
    int? rank = int.tryParse(data.rank);
    bool onList = rank == null ? false : true;
    Log.d("gavin rank:$rank,data.rank:${data.rank},onList:$onList");
    String gapStr =
        onList ? K.room_visitant_rank_gap : K.room_visitant_rank_list_gap;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(R.string('rank_config_score') + Util.numberToWString(data.points),
            style: TextStyle(
                color: const Color(0xCC222222),
                fontSize: fontSize,
                fontWeight: FontWeight.w500)),
        if (rank != 1)
          Text(gapStr + Util.numberToWString(data.gap),
              style: TextStyle(
                  color: textColor ?? R.color.thirdBrightColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500)),
      ],
    );
  }
  return Text(K.room_visitant_rank_gap + Util.numberToWString(data.gap),
      style: TextStyle(
          color: textColor ?? R.color.thirdBrightColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w500));
}

class VisitantRankItemWidget extends StatelessWidget {
  final int index;
  final RoomVipRankItem rankItem;
  final PageRefer refer;

  const VisitantRankItemWidget(this.index, this.rankItem, this.refer,
      {super.key});

  Widget _buildIndex() {
    return Container(
      height: 20,
      width: 20,
      alignment: Alignment.center,
      child: Text(
        '${index + 1}',
        maxLines: 1,
        style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.color.mainBgColor,
      padding: const EdgeInsetsDirectional.only(
          top: 5, bottom: 5, start: 16, end: 12),
      child: InkWell(
        onTap: () {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, rankItem.user.uid,
              refer: refer);
        },
        child: Row(
          children: <Widget>[
            if (showRankByKey(roomVipKey)) _buildIndex(),
            VisitantRankItemIconWidget(rankItem, 62.0, false, refer),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 250),
                    child: Text(
                      rankItem.user.name,
                      style: TextStyle(
                          fontSize: 16,
                          color: R.color.mainTextColor,
                          fontFamily: 'PingFang SC'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(children: [
                    if (!NobilityUtil.titleIsInvalid(rankItem.user.titleNew))
                      NobilityCornerMarker(
                        titleNew: rankItem.user.titleNew,
                        height: 22,
                      ),
                    UserVipWidget(
                      vip: rankItem.user.vipLevel,
                      height: 22,
                    ),
                    UserPopularity(
                      popularityLevel: rankItem.user.popularityLevel,
                      height: 22,
                    ),
                    RoomVisitantWidget(
                      visitant: rankItem.level,
                      height: 22,
                    ),
                  ]),
                ],
              ),
            ),
            if (showRankScoreByKey(roomVipKey))
              _buildScoreText(rankItem,
                  fontSize: 13, textColor: const Color(0xCC222222)),
          ],
        ),
      ),
    );
  }
}

class VisitantRankItemIconWidget extends StatelessWidget {
  final double size;
  final RoomVipRankItem rankItem;
  final bool isTopIcon;
  final PageRefer refer;

  const VisitantRankItemIconWidget(
      this.rankItem, this.size, this.isTopIcon, this.refer,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, rankItem.user.uid,
            refer: refer);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            if (isTopIcon)
              R.img('rank/charm_fame_head_border.webp',
                  width: size,
                  height: size,
                  package: ComponentManager.MANAGER_RANK),
            CommonAvatarWithFrame(
              childWidget: CommonAvatar(
                path: rankItem.user.icon,
                shape: BoxShape.circle,
                size: 52,
              ),
              uid: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class _VisitantRankLoadingSource extends LoadingMoreBase<RoomVipRankItem> {
  static const int _firstPageIndex = 1;

  final int rid;
  final _VisitantRankListState state;

  _VisitantRankLoadingSource(this.rid, this.state);

  int _pageIndex = _firstPageIndex;
  bool _hasMore = true;
  String errorMsg = '';

  RoomVipRankItem? my;
  int? openGiftId;
  String? achieveTips;
  String? desc;

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool loadSuccess = false;

    if (!isloadMoreAction) {
      _pageIndex = _firstPageIndex;
      _hasMore = true;
    }

    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;

    /// 请求 房间贵宾说明
    if (!isloadMoreAction) {
      String rid = "${this.rid}";
      String url = '${System.domain}go/yy/room/vipDesc';
      XhrResponse response = await Xhr.postPb(url, {"rid": rid});
      try {
        RoomVipRankDescResp resp =
            RoomVipRankDescResp.fromBuffer(response.bodyBytes);
        Log.d("gavin desc-resp:$resp");
        desc = resp.data;
        state.refresh();
      } catch (e) {}
    }

    /// 请求 贵宾榜单
    String rid = "${this.rid}";
    String url = '${System.domain}go/yy/room/vipRank';

    XhrResponse response = await Xhr.postPb(url, {"rid": rid, "page": "$page"});
    try {
      GetRoomVipRankResp resp =
          GetRoomVipRankResp.fromBuffer(response.bodyBytes);
      if (resp.success) {
        my = resp.data.myCard;
        openGiftId = resp.data.openCardGiftId;
        achieveTips = resp.data.achieveTips;

        if (page == _firstPageIndex) {
          clear();
          state.refresh();
        }

        if (resp.data.rankList.isNotEmpty) {
          addAll(resp.data.rankList);
          _pageIndex = page;

          _hasMore = true;
        } else {
          _hasMore = false;
        }
        loadSuccess = true;
      } else {
        errorMsg = resp.msg;
        loadSuccess = false;
      }
    } catch (e) {
      errorMsg = e.toString();
      loadSuccess = false;
    }
    return loadSuccess;
  }
}
