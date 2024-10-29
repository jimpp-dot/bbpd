import 'dart:ffi';
import 'dart:math';
import 'package:fixnum/fixnum.dart';
import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:chat_room/src/live/knight/knight_rank_respository.dart';
import 'package:chat_room/src/live/knight/knigjt_info_widget.dart';

import '../../../assets.dart';

/// 从个人资料卡点进来的排行榜
const personalDataCard = 'personal_data_card';

class KnightRankWidget extends StatefulWidget {
  final int uid;
  final int rid;
  final bool isLive;
  final String entryType;
  final bool showBuyEntry;

  const KnightRankWidget(this.rid, this.uid, this.isLive,
      {super.key, this.entryType = '', this.showBuyEntry = false});

  @override
  State<KnightRankWidget> createState() => _KnightRankWidgetState();

  static Future show(BuildContext context, int rid, int uid, bool isLive,
      {String entryType = '', bool showBuyEntry = false}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.75,
      backgroundColor: Colors.transparent,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return KnightRankWidget(rid, uid, isLive,
            entryType: entryType, showBuyEntry: showBuyEntry);
      },
    );
  }
}

class _KnightRankWidgetState extends State<KnightRankWidget>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late KnightRankRepository _repository;
  final ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _repository = KnightRankRepository(widget.rid);
    _loadData();
  }

  Future _loadData() async {
    await _repository.refresh();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        R.img(RoomAssets.chat_room$knight_rank_bg_png,
            width: Util.width, height: 1148, package: RoomAssets.package),
        PositionedDirectional(
          start: 0,
          top: 20,
          end: 0,
          bottom: 0,
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: RefreshIndicatorFactory.of(
                  onRefresh: _loadData,
                  child: CustomScrollView(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: <Widget>[
                      const SliverToBoxAdapter(),
                      LoadingMoreSliverList(
                        SliverListConfig<KnightRankItem>(
                          itemBuilder: _itemBuilder,
                          sourceList: _repository,
                          indicatorBuilder: _indicatorBuilder,
                          autoRefresh: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildTrueLoveKnightExperienceCard(),
              _buildBottomWidget()
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    if (_repository.hasError || _repository.groupInfo == null)
      return const SizedBox.shrink();
    var containerHeight = (Util.width - 32) * 90 / 343;

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${K.room_knight_rank}(${_repository.total})',
                style: R.textStyle.medium16
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  BaseWebviewScreen.show(context,
                      url: Util.getHelpUrlWithQStr(
                          widget.isLive ? 'k59' : 'k64'));
                },
                child: R.img('ic_help.webp',
                    color: Colors.white,
                    width: 20,
                    height: 20,
                    package: ComponentManager.MANAGER_BASE_ROOM),
              )
            ],
          ),
          // Container(
          //   height: 1,
          //   color: const Color(0x99313131).withOpacity(0.1),
          //   margin: const EdgeInsetsDirectional.fromSTEB(0, 11, 0, 6),
          // ),

          const SizedBox(
            height: 10,
          ),

          Container(
            height: containerHeight,
            width: Util.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: (R.img(
                RoomAssets.chat_room$fans_open_shouhu_middle_bg_png,
                package: RoomAssets.package,
                height: containerHeight,
                width: containerHeight * 168 / 702,
              ) as Image)
                      .image),
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                R.img(
                  'rank/knight_rank_header_bg.webp',
                  width: Util.width - 32,
                  height: (Util.width - 32) * 90 / 343,
                  package: ComponentManager.MANAGER_RANK,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 12),
                    CommonAvatar(
                      path: _repository.groupInfo!.icon,
                      size: 60,
                      shape: BoxShape.circle,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              LimitedBox(
                                maxWidth: 90,
                                child: Text(
                                  _repository.groupInfo!.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFD800D8)),
                                ),
                              ),
                              Text(
                                K.knight_group_of,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              if (showRankScoreByKey(roomSweetKey)) ...[
                                Text(
                                  K.knight_value,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Text(
                                  _valueString(
                                      value: _repository.groupInfo!.groupScore),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ],
                              Text(
                                K.knight_person_num,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              Text(
                                _valueString(
                                    value: _repository.groupInfo!.memberNum),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (showRankByKey(roomSweetKey))
                      SizedBox(
                        width: 0.5,
                        height: 40,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1)),
                        ),
                      ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        IRankManager rankManager = ComponentManager.instance
                            .getManager(ComponentManager.MANAGER_RANK);
                        rankManager.showRoomRankMainTabScreen(context,
                            rid: widget.rid,
                            charmType: 'activity',
                            tabType: 'knight');
                      },
                      child: Row(
                        children: [
                          if (showRankByKey(roomSweetKey))
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  width: 50,
                                  child: Text(
                                    _repository.groupInfo!.groupRank > 999
                                        ? '999+'
                                        : _repository.groupInfo!.groupRank
                                            .toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFD800D8)),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  K.knight_liver_rank,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          Container(
                            width: 16,
                            height: 16,
                            alignment: AlignmentDirectional.centerEnd,
                            child: R.img(
                              'icon_next.svg',
                              color: Colors.white.withOpacity(0.7),
                              width: 16,
                              height: 16,
                              package: ComponentManager.MANAGER_BASE_CORE,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 78,
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white.withOpacity(0), Colors.white38],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              R.img('ic_knight_cup.png',
                  width: 14,
                  height: 14,
                  package: ComponentManager.MANAGER_BASE_ROOM),
              const SizedBox(width: 2),
              Text(
                K.room_this_week_rank,
                style: R.textStyle.regular16
                    .copyWith(color: Colors.white.withOpacity(0.4)),
              ),
              const SizedBox(width: 8),
              Container(
                width: 78,
                height: 1,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white38, Colors.white.withOpacity(0)])),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, KnightRankItem item, int index) {
    return _buildItemWidget(item, false, Colors.white);
  }

  Widget _buildItemWidget(KnightRankItem item, bool special, Color textColor) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showRankByKey(roomSweetKey)) ...[
            (item.sortIndex < 4 && item.sortIndex > 0)
                ? R.img('ic_knight_cup${item.sortIndex}.webp',
                    width: 30,
                    height: 27,
                    package: ComponentManager.MANAGER_BASE_ROOM)
                : Padding(
                    padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
                    child: Text(
                      (Util.parseInt(item.sortIndex) < 10)
                          ? ('0${item.sortIndex}')
                          : item.sortIndex.toString(),
                      style: R.textStyle.medium16.copyWith(
                          color: const Color(0xFFFFD04B),
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
            const SizedBox(width: 10),
          ],
          CommonAvatar(
            path: item.icon,
            size: 48,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: R.textStyle.medium16
                      .copyWith(fontSize: 15, color: textColor),
                  maxLines: 1,
                ),
                UserKnightWidget(
                  knightLevel: Util.parseInt(item.knightLevel),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (showRankScoreByKey(roomSweetKey))
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${item.sortScore} ',
                      style: R.textStyle.medium16.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      K.knight_value,
                      style: R.textStyle.medium16
                          .copyWith(fontSize: 15, color: textColor),
                    ),
                  ],
                ),
              if (special || item.expireDesc.isNotEmpty)
                const SizedBox(height: 4),
              (special)
                  ? (item.expireAlert)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildKnightExpireDesc(
                                item.expireDesc, item.expireAlert),
                            const SizedBox(width: 6),
                            _buildKnightRenew(item.knightLevel),
                          ],
                        )
                      : _buildKnightDetail()
                  : _buildKnightExpireDesc(item.expireDesc, item.expireAlert),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKnightExpireDesc(String expireDesc, bool expireAlert) {
    if (expireDesc.isNotEmpty == true) {
      return Text(
        expireDesc,
        style: TextStyle(
          fontSize: 13,
          color: expireAlert
              ? const Color(0xFFFF5F7D)
              : Colors.white.withOpacity(0.5),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildKnightRenew(int knightLevel) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openBuyKnightScreen(context, level: knightLevel);
      },
      child: Container(
        height: 24,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        child: Text(
          K.knight_to_renew,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }

  Widget _buildKnightDetail() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        KnightInfoWidget.show(context, widget.rid, widget.uid, widget.isLive);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 4),
        child: Text(
          '${K.room_knight_detail}>>',
          style: R.textStyle.medium14
              .copyWith(color: const Color(0xFFFFD04B), fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildTrueLoveKnightExperienceCard() {
    if (widget.uid == Session.uid ||
        _repository.isLoading ||
        _repository.hasError) {
      return const SizedBox.shrink();
    }
    return _repository.knightCoupon != null &&
            _repository.knightCoupon?.couponTips.isNotEmpty == true
        ? Container(
            height: 46,
            margin: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              gradient: LinearGradient(colors: [
                const Color(0xFFB281F5).withOpacity(0.3),
                const Color(0xFF7863FF).withOpacity(0.3)
              ]),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _repository.knightCoupon?.couponTips ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    IPayManager payManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_PAY);
                    payManager.pay(
                      context,
                      key: PayManagerType.knightBuy,
                      type: 'available',
                      args: {
                        'money': Util.parseInt(
                            _repository.knightCoupon?.ductionMoney),
                        'type': 'package',
                        'params': {
                          'rid': widget.rid,
                          'uids': '${widget.uid}',
                          'cid': Util.parseInt(_repository.knightCoupon?.ucid),
                          'price': Util.parseInt(
                              _repository.knightCoupon?.ductionMoney),
                          'duction_money': Util.parseInt(
                              _repository.knightCoupon?.ductionMoney),
                          'knight_level': Util.parseInt(
                              _repository.knightCoupon?.knightLevel)
                        }
                      },
                      onPayed: _onPayed,
                      onError: _onPayError,
                    );
                  },
                  child: Container(
                    width: 68,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors)),
                    child: Text(
                      K.room_topic_to_use,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  void _onPayed() async {
    Fluttertoast.showCenter(msg: K.room_use_succ);
    Navigator.of(context).pop();
  }

  void _onPayError(bool isErrorCatch) {}

  Widget _buildBottomWidget() {
    if (_repository.isLoading || _repository.hasError) {
      return const SizedBox.shrink();
    }

    // 如果是从资料卡进入的，则若主播用户在自己的房间内，则该守护排行页显示【购买入口】；若主播用户不在自己房间内，则守护排行页不显示【购买】入口
    if (widget.entryType == personalDataCard) {
      if (widget.showBuyEntry && !_repository.roomer) {
        return Container(
          color: const Color(0xFF271245),
          padding:
              EdgeInsetsDirectional.only(bottom: max(Util.iphoneXBottom, 20)),
          child: _repository.myInfo != null
              ? _buildItemWidget(_repository.myInfo!, true, Colors.black)
              : _buildBuyEntryWidget(),
        );
      } else {
        return const SafeArea(
          top: false,
          child: SizedBox(height: 20),
        );
      }
    }

    // 从非资料卡进入的，则走之前的老逻辑
    if (_repository.roomer) {
      return const SafeArea(top: false, child: SizedBox(height: 2));
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Colors.white, Colors.white],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: EdgeInsetsDirectional.only(bottom: max(Util.iphoneXBottom, 20)),
      child: _repository.myInfo != null
          ? _buildItemWidget(_repository.myInfo!, true, Colors.black)
          : _buildBuyEntryWidget(),
    );
  }

  Widget _buildBuyEntryWidget() {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 16, bottom: 5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                K.room_total_knight_tips(['${_repository.total}']),
                style: R.textStyle.medium14
                    .copyWith(fontSize: 13, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                K.room_knight_buy_tips,
                style: R.textStyle.medium14.copyWith(
                    fontSize: 13, color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openBuyKnightScreen(context);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 23, end: 23, top: 13, bottom: 13),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFFF4CD4), Color(0xFFFF4CD4)]),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Text(
                K.room_buy_knight,
                style: R.textStyle.medium16.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: ErrorData(
            onTap: _loadData, fontColor: Colors.white.withOpacity(0.4)),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: R.string('data_error'),
        loadMore: _repository.loadMore,
        textColor: Colors.white.withOpacity(0.4),
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: EmptyWidget(
            onTap: _loadData, textColor: Colors.white.withOpacity(0.4)),
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  @override
  void reload({bool force = true, animated = true}) {
    _loadData();
  }

  @override
  void scrollToTop({bool animated = true}) {
    if (_scrollController.hasClients) {
      if (animated) {
        _scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      } else {
        _scrollController.jumpTo(0.0);
      }
    }
  }
}

String _valueString({required dynamic value, int fractionDigits = 1}) {
  if (value == null) return '0';

  if (value is int || value is Int32 || value is Uint32) {
    if (value < 1000) {
      return value.toString();
    } else if (value < 1000 * 1000) {
      return '${(value / 1000).toStringAsFixed(fractionDigits)}K';
    } else if (value < 1000 * 1000 * 1000) {
      return '${(value / 1000000).toStringAsFixed(fractionDigits)}M';
    } else {
      return '${(value / 1000000000).toStringAsFixed(fractionDigits)}B';
    }
  } else if (value is Int64 || value is Uint64) {
    int mod = 0;
    String modStr = '';

    if (value < 1000) {
      return value.toString();
    } else if (value < 1000 * 1000) {
      mod = (value % 1000).toInt();
      modStr =
          (mod / 1000).toStringAsFixed(fractionDigits).toString().substring(1);

      return '${value ~/ 1000}${modStr}K';
    } else if (value < 1000 * 1000 * 1000) {
      mod = (value % 1000000).toInt();
      modStr = (mod / 1000000)
          .toStringAsFixed(fractionDigits)
          .toString()
          .substring(1);

      return '${value ~/ 1000000}${modStr}M';
    } else {
      mod = (value % 1000000000).toInt();
      modStr = (mod / 1000000000)
          .toStringAsFixed(fractionDigits)
          .toString()
          .substring(1);

      return '${value ~/ 1000000000}B';
    }
  }

  return '0';
}
