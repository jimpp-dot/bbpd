import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/model/pb/generated/impression_tag_rank.pb.dart';
import 'package:rank/k.dart';
import 'package:rank/src/api/api.dart';
import 'package:shared/k.dart' as BaseK;

class ImpressionTagRankPage extends StatefulWidget {
  final int tagId;
  final String tagName;
  //是否是上周榜单
  final bool isLastWeek;
  const ImpressionTagRankPage(
      {Key? key,
      required this.tagId,
      required this.tagName,
      this.isLastWeek = false})
      : super(key: key);

  static Future show(BuildContext context, int tagId, String tagName,
      {bool isLastWeek = false}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ImpressionTagRankPage(
        tagId: tagId,
        tagName: tagName,
        isLastWeek: isLastWeek,
      ),
      settings: const RouteSettings(name: '/ImpressionTagRankPage'),
    ));
  }

  @override
  State<ImpressionTagRankPage> createState() => _ImpressionTagRankPageState();
}

class _ImpressionTagRankPageState extends State<ImpressionTagRankPage> {
  String? _errorMsg;
  late _ImpressionTagRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source =
        _ImpressionTagRankLoadingSource(widget.tagId, this, widget.isLastWeek);
    _source.refresh();
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0XFFD670FF)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: BaseAppBar.custom(
          statusBrightness: Brightness.dark,
          title: Text(
            widget.tagName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.transparent,
          backColor: Colors.white,
        ),
        body: ScaffoldBody(
          child: Column(children: [
            Expanded(
                child: Container(
              color: const Color(0xffD670FF),
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
                      expandedHeight: 245,
                      flexibleSpace: FlexibleSpaceBar(
                        background: _topThreeWidget(),
                      ),
                    ),
                  ];
                },
                body: _listViewWidget(),
              ),
            )),
            _buildMyRank(_source.my),
          ]),
        ),
      ),
    );
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget _topThreeWidget() {
    return Container(
      color: const Color(0xffD670FF),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        PositionedDirectional(
          top: -10,
          child: R.img(
            Assets.rank$rank_impression_tag_rank_top_bg_png,
            width: 156,
            height: 156,
            fit: BoxFit.fitWidth,
          ),
        ),
        PositionedDirectional(
            bottom: -45,
            child: R.img(Assets.rank$rank_impression_tag_rank_bg_webp,
                width: 360.dp, fit: BoxFit.fitWidth)),
        if (_source.topThreeList.isNotEmpty)
          PositionedDirectional(
              top: 0, child: _topItemWidget(_source.topThreeList[0])),
        if (_source.topThreeList.length > 1)
          PositionedDirectional(
              top: 20,
              start: 8,
              child: _topItemWidget(_source.topThreeList[1])),
        if (_source.topThreeList.length > 2)
          PositionedDirectional(
              top: 20, end: 8, child: _topItemWidget(_source.topThreeList[2])),
      ]),
    );
  }

  Widget _topItemWidget(ImpressionRank item) {
    double avatarSize = item.rank == 1 ? 72 : 64;
    List<Color> borderColor = topThreeBorderColor(item.rank);

    double width = item.rank == 1 ? 140.dp : 110.dp;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            height: item.rank == 1 ? 117 : 104,
            child: GestureDetector(
              onTap: () {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, item.uid);
              },
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
                        path: item.userIcon,
                        size: avatarSize,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            item.userName,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!NobilityUtil.titleIsInvalid(item.titleNew))
                UserNobilityWidget(titleNew: item.titleNew, height: 22),
              const SizedBox(width: 2),
              if (item.popularityLevel > 0)
                UserPopularity(
                    popularityLevel: item.popularityLevel, height: 22),
              if (item.vipLevel > 0)
                UserVipWidget(vip: item.vipLevel, height: 22),
            ],
          ),
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(item.badgeIcon),
            height: 28,
            fit: BoxFit.fitHeight,
            suffix: '!cover375',
          ),
          NumText(
            'x${Util.numberToWString(item.score)}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listViewWidget() {
    LoadingMoreList child =
        LoadingMoreList<ImpressionRank>(ListConfig<ImpressionRank>(
      itemBuilder: _itemBuilder,
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
    ));

    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16)),
        ),
        child: RefreshIndicatorFactory.of(
          child: child,
          onRefresh: () => _source.refresh(),
        ));
  }

  Widget _itemBuilder(BuildContext context, ImpressionRank item, int index) {
    return SizedBox(
      width: Util.width,
      height: 66,
      child: Row(
        children: [
          SizedBox(
            width: 41,
            child: NumText(
              item.rank.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xff202020).withOpacity(0.2),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
              onTap: () {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, item.uid);
              },
              child: CommonAvatar(
                  path: Util.getRemoteImgUrl(item.userIcon),
                  size: 46,
                  shape: BoxShape.circle)),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    item.userName,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff202020),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                if (!NobilityUtil.titleIsInvalid(item.titleNew))
                  UserNobilityWidget(
                    titleNew: item.titleNew,
                  ),
                if (item.popularityLevel > 0)
                  UserPopularity(popularityLevel: item.popularityLevel),
                if (item.vipLevel > 0) UserVipWidget(vip: item.vipLevel),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(item.badgeIcon),
                height: 28,
                fit: BoxFit.fitHeight,
                suffix: '!cover375',
              ),
              Text(
                'x${Util.numberToWString(item.score)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFDA252),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  List<Color> topThreeBorderColor(int rank) {
    const List<Color> rank1Colors = [Color(0xFFFAD961), Color(0xFFF7B01C)];
    const List<Color> rank2Colors = [
      Color(0xFFE6E6E6),
      Color(0xFFCDD5E8),
      Color(0xFFD8D8D8)
    ];
    const List<Color> rank3Colors = [Color(0xFFFFE9D6), Color(0xFFFFAB81)];
    switch (rank) {
      case 1:
        return rank1Colors;
      case 2:
        return rank2Colors;
      case 3:
        return rank3Colors;
      default:
        return [Colors.white];
    }
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (status == IndicatorStatus.noMoreLoad) {
      return Container();
      // return LoadingFooter(
      //   hasMore: false,
      //   loadMore: () => {},
      // );
    } else if (status == IndicatorStatus.fullScreenError) {
      _errorMsg = _source.errorMsg;
      return ErrorData(
        error: _source.errorMsg,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.empty) {
      if (_source.topThreeList.isEmpty) {
        return ErrorData(
          error: BaseK.K.no_data,
          onTap: () {
            _source.refresh();
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg, loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  Widget _buildMyRank(ImpressionRank? myItem) {
    if (myItem == null) return const SizedBox.shrink();
    return Container(
      height: Util.iphoneXBottom + 66,
      width: Util.width,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(12.0),
          topEnd: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 8.0,
              spreadRadius: 0.0,
              offset: const Offset(0.0, -3.0),
              color: R.color.thirdBgColor),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 41,
              child: Text(
                myItem.rank == 0 ? "-" : "${myItem.rank}",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            CommonAvatar(
                path: Util.getRemoteImgUrl(myItem.userIcon),
                size: 46,
                shape: BoxShape.circle),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                myItem.userName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff202020),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              myItem.score <= 0
                  ? K.rank_no_impress_tag
                  : K.rank_impress_tag_num(
                      [(Util.numberToWString(myItem.score))]),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffFDA252),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _ImpressionTagRankLoadingSource extends LoadingMoreBase<ImpressionRank> {
  final int tagId;
  final bool isLastWeek;
  int _lastId = 0;
  final _ImpressionTagRankPageState state;

  _ImpressionTagRankLoadingSource(this.tagId, this.state, this.isLastWeek);

  bool _hasMore = true;
  String errorMsg = '';
  List<ImpressionTag> tags = [];
  List<ImpressionRank> topThreeList = [];
  ImpressionRank? my;

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    if (isLoading) return Future.value(false);
    _hasMore = true;
    _lastId = 0;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _hasMore = true;
      _lastId = 0;
    }
    ImpressionTagsRankRsp res =
        await Api.getImpressionTagRank(tagId, lastWeek: isLastWeek);
    if (res.success && res.data.list.isNotEmpty) {
      tags = res.data.tags;
      my = res.data.my;
      _hasMore = res.hasMore;
      if (_lastId == 0) {
        clear();
        state.refresh();
        if (res.data.list.length <= 3) {
          topThreeList = res.data.list;
        } else {
          topThreeList = res.data.list.sublist(0, 3);
          addAll(res.data.list.sublist(3));
        }
      } else {
        addAll(res.data.list);
      }
      _lastId = res.lastId;
    } else {
      _hasMore = res.hasMore;
    }
    return true;
  }
}
