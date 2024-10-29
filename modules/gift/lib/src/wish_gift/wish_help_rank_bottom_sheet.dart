import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:gift/k.dart';

import 'model/pb/generated/slp_roomgiftwish.pb.dart';
import 'repo/wish_gift_repo.dart';

/// 心愿助力榜单

class WishHelpRankBottomSheet extends StatefulWidget {
  final int rid;

  const WishHelpRankBottomSheet({Key? key, required this.rid})
      : super(key: key);

  @override
  State<WishHelpRankBottomSheet> createState() =>
      _WishHelpRankBottomSheetState();

  /// 打开心愿助力榜页面
  static Future<void> show(BuildContext context, {Key? key, required int rid}) {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.transparent,
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return WishHelpRankBottomSheet(key: key, rid: rid);
      },
    );
  }
}

class _WishHelpRankBottomSheetState extends State<WishHelpRankBottomSheet> {
  late RoomGiftWishRankDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = RoomGiftWishRankDataSource();
    _dataSource.rid = widget.rid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height * 0.6,
      decoration: const BoxDecoration(
        color: Color(0xFF171621),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16),
          topEnd: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: Util.width,
            height: 44,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Text(
                  K.gift_wish_assist_rank,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                PositionedDirectional(
                  start: 10,
                  child: BackButton(
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 1,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Expanded(
            child: Container(
              child: RefreshIndicatorFactory.of(
                onRefresh: () async {
                  _dataSource.refresh();
                },
                child: LoadingMoreList(
                  ListConfig(
                    itemBuilder: (BuildContext context,
                        RoomGiftWishRankItem item, int index) {
                      return _buildItem(item, index);
                    },
                    sourceList: _dataSource,
                    indicatorBuilder: _indicatorBuilder,
                    lastChildLayoutType:
                        LastChildLayoutType.fullCrossAxisExtent,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
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
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _dataSource.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _dataSource.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _dataSource.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(RoomGiftWishRankItem item, int index) {
    List<Widget> tags = [];

    Widget renderIndex() {
      if (index <= 2) {
        return R.img(
          'gift_week/rank${index + 1}.webp',
          width: 26,
          height: 24,
          package: ComponentManager.MANAGER_RANK,
        );
      } else {
        return NumText(
          "${index + 1}",
          textScaleFactor: 1.0,
          style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        );
      }
    }

    // 性别年龄标签
    tags.add(UserSexAndAgeWidget(
        sex: item.sex, age: item.age, width: 31, height: 14));

    // 人气等级标签
    if (item.popularityLevel > 0)
      tags.add(UserPopularity(popularityLevel: item.popularityLevel));

    // VIP等级标签
    if (item.vipLevel > 0) tags.add(UserVipWidget(vip: item.vipLevel));

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10, start: 16, end: 16),
      child: Container(
        height: 84,
        decoration: BoxDecoration(
            color: const Color(0xFF6F5EFF).withOpacity(0.08),
            borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              alignment: AlignmentDirectional.center,
              child: renderIndex(),
            ),
            CommonAvatar(
              path: item.icon,
              size: 52,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: Util.width - 250),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                if (Util.validList(tags))
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 4.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: tags,
                  )
              ],
            ),
            const Spacer(),
            const SizedBox(width: 8),
            Text(
              '${item.score}',
              style: const TextStyle(
                  color: Color(0xFF8462FF),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class RoomGiftWishRankDataSource extends LoadingMoreBase<RoomGiftWishRankItem> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  int rid = 0;

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      ResRoomGiftWishRank result =
          await WishGiftRepo.assistRank(rid: rid, page: page);

      if (page == 1) {
        clear();
      }

      for (var element in result.data.list) {
        add(element);
      }

      _hasMore = result.hasData() && Util.validList(result.data.list);
      page++;
      isSuccess = true;
    } catch (exception, _) {
      isSuccess = false;
    }

    return isSuccess;
  }
}
