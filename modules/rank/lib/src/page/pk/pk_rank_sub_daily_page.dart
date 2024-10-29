import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';

import 'package:rank/src/model/entity/pk_rank_beans.dart';
import 'package:rank/src/widget/pk/pk_daily_item.dart';
import 'package:rank/src/widget/pk/pk_bottom_anchor_info.dart';
import 'package:rank/k.dart';

import 'pk_daily_star_page.dart';

class PkSubDailyPage extends StatefulWidget {
  final PkDailyRankType rankType;
  final PageRefer? refer;
  final Color? backgroundColor;

  const PkSubDailyPage(
      {super.key, required this.rankType, this.refer, this.backgroundColor});

  @override
  _PkSubDailyPageState createState() => _PkSubDailyPageState();
}

class _PkSubDailyPageState extends State<PkSubDailyPage>
    with AutomaticKeepAliveClientMixin<PkSubDailyPage>, ReloadStateMixin {
  @override
  bool get wantKeepAlive => true;

  PkDailyRankResponse? _rsp;
  PkDailyRankTopItem? _rankTopItem;
  PkAnchorInfoItem? _anchorInfoItem;
  final int _firstPage = 1;

  final GlobalKey<LoadMoreBaseListWidgetState> _key =
      GlobalKey<LoadMoreBaseListWidgetState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return showRankListByKey(matchPkKey)
        ? ColoredBox(
            color: widget.backgroundColor ?? Colors.transparent,
            child: Column(
              children: [
                if (widget.rankType == PkDailyRankType.daily) _buildTop(),
                Expanded(
                  child: LoadMoreBaseListWidget(
                    key: _key,
                    loadData: loadData,
                    itemHeight: PkDailyRankItemWidget.widgetHeight,
                    itemBuilder: (index, item) => PkDailyRankItemWidget(
                      index: index,
                      item: item,
                      headerFrame: _rsp?.headerFrame,
                      refer: widget.refer,
                    ),
                    showSafeBottomArea: false,
                    showMoreWidget: false,
                  ),
                ),
                BottomAnchorPkInfo(
                  item: _anchorInfoItem,
                  maxRank: _rsp?.total,
                  refer: widget.refer,
                ),
              ],
            ),
          )
        : Container(
            color: Colors.white,
            child: Center(
              child: Text(
                K.rank_no_more_data,
                style: TextStyle(fontSize: 13, color: Colors.grey[400]),
              ),
            ),
          );
  }

  @override
  void reload({bool force = true, animated = true}) {
    scrollToTop(animated: animated);
    loadData(1);
  }

  Future<ResponseData> loadData(int page) async {
    _rsp = await PkRankRepository.getRankItems(widget.rankType, page);
    if (_rsp != null && _rsp!.success == true) {
      if (page == _firstPage) {
        _rankTopItem = _rsp?.topItem;
        _anchorInfoItem = _rsp?.anchorInfoItem;
        if (mounted) {
          setState(() {});
        }
      }
      return ResponseData(
          listData: _rsp?.items, hasMore: false, success: _rsp!.success);
    } else {
      Fluttertoast.showToast(msg: _rsp?.msg);
      return ResponseData(listData: null, hasMore: false, success: false);
    }
  }

  Widget _buildLabel(String text, List<Color> bgColor) {
    return Container(
      alignment: Alignment.center,
      width: 44,
      height: 16,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(
            side: BorderSide(color: Color(0xFFFFF1AB), width: 1)),
        gradient: LinearGradient(colors: bgColor),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 9, color: Colors.white),
      ),
    );
  }

  Widget _buildTop() {
    if (_rankTopItem == null) return Container();
    return Container(
      margin: const EdgeInsetsDirectional.only(
          top: 16, bottom: 8, start: 18, end: 18),
      padding: const EdgeInsetsDirectional.only(start: 6, end: 8),
      height: 72,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(R.imagePath(Assets.rank_bg_rank_daily_top_webp,
                package: ComponentManager.MANAGER_RANK))),
      ),
      child: InkWell(
        onTap: () => PkDailyStarScreen.show(context),
        child: Row(
          children: <Widget>[
            PkDailyRankItemIconWidget(_rankTopItem!, 72.0,
                _rsp!.headerFrame?.famousFrame, widget.refer),
            const SizedBox(
              width: 2,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LimitedBox(
                    child: Text(
                      _rankTopItem!.name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF313131),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      _buildLabel(K.rank_daily_last_top,
                          [const Color(0xFFFFCF8A), const Color(0xFFFDA252)]),
                      const SizedBox(
                        width: 4,
                      ),
                      if (_rankTopItem?.topDays != null &&
                          _rankTopItem!.topDays > 0)
                        _buildLabel(
                            '${K.rank_daily_last_top_times} x${_rankTopItem!.topDays}',
                            [const Color(0xFFFF99B4), const Color(0xFFFF5F7D)]),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              K.rank_daily_star_title,
              style: const TextStyle(color: Color(0xFF313131), fontSize: 13),
            ),
            R.img(BaseAssets.icon_next_svg,
                color: const Color(0xFF313131),
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_BASE_CORE),
          ],
        ),
      ),
    );
  }

  @override
  void scrollToTop({bool animated = true}) {
    _key.currentState?.scrollToTop();
  }
}
