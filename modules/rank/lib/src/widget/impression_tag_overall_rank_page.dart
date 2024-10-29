import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/model/pb/generated/impression_tag_rank.pb.dart';
import 'package:rank/src/api/api.dart';
import 'package:rank/src/widget/impression_tag_rank_page.dart';

class ImpressionTagOverallRankPage extends StatefulWidget {
  //是否是上周榜单
  final bool isLastWeek;
  const ImpressionTagOverallRankPage({Key? key, this.isLastWeek = false})
      : super(key: key);

  @override
  State<ImpressionTagOverallRankPage> createState() =>
      _ImpressionTagOverallRankPageState();
}

class _ImpressionTagOverallRankPageState
    extends State<ImpressionTagOverallRankPage> with TickerProviderStateMixin {
  bool _isLoading = false;
  List<ImpressionRank> _rankList = [];
  List<ImpressionRank> _topThreeList = [];
  List<ImpressionTag> _tags = [];
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Loading();
    } else {
      if (_errorMsg != null) {
        return _errorWidget();
      }
    }

    if (_topThreeList.isEmpty && _rankList.isEmpty) {
      return const EmptyWidget();
    }

    return Container(
      color: const Color(0xffD670FF),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              snap: false,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              primary: false,
              floating: true,
              expandedHeight: 245,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: _topThreeWidget(),
              ),
            ),
          ];
        },
        body: _listViewWidget(),
      ),
    );
  }

  Future<void> _requestData() async {
    _isLoading = true;
    ImpressionTagsRankRsp res =
        await Api.getImpressionTagOverallRank(lastWeek: widget.isLastWeek);
    if (res.success) {
      if (res.data.list.length <= 3) {
        _topThreeList = res.data.list;
        _rankList = [];
      } else {
        _topThreeList = res.data.list.sublist(0, 3);
        _rankList = res.data.list.sublist(3);
      }
      _tags = res.data.tags;
      _errorMsg = null;
    } else {
      _errorMsg = res.msg;
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _errorWidget() {
    return ErrorData(
      error: _errorMsg,
      onTap: () {
        _requestData();
      },
    );
  }

  Widget _topThreeWidget() {
    return Stack(alignment: Alignment.bottomCenter, children: [
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
      if (_topThreeList.isNotEmpty)
        PositionedDirectional(top: 0, child: _topItemWidget(_topThreeList[0])),
      if (_topThreeList.length > 1)
        PositionedDirectional(
            top: 20, start: 8, child: _topItemWidget(_topThreeList[1])),
      if (_topThreeList.length > 2)
        PositionedDirectional(
            top: 20, end: 8, child: _topItemWidget(_topThreeList[2])),
    ]);
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
                        onTap: () {
                          IPersonalDataManager personalDataManager =
                              ComponentManager.instance.getManager(
                                  ComponentManager.MANAGER_PERSONALDATA);
                          personalDataManager.openImageScreen(
                              context, item.uid);
                        },
                      ),
                    ),
                    uid: 0,
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
          GestureDetector(
            onTap: () {
              ImpressionTag? tag = _selectTag(item.tagId);
              if (tag != null) {
                ImpressionTagRankPage.show(context, tag.tagId, tag.tagName,
                    isLastWeek: widget.isLastWeek);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: Util.resizeUrl(item.badgeIcon, rh: 100),
                  height: 28,
                  fit: BoxFit.fitHeight,
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
          ),
        ],
      ),
    );
  }

  Widget _listViewWidget() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      child: _rankList.isEmpty
          ? const EmptyWidget()
          : RefreshIndicatorFactory.of(
              child: ListView.builder(
                  itemCount: _rankList.length,
                  itemExtent: 66,
                  itemBuilder: (context, index) {
                    ImpressionRank item = _rankList[index];
                    return _itemBuilder(context, item, index);
                  }),
              onRefresh: () async {
                _requestData();
              },
            ),
    );
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
          GestureDetector(
            onTap: () {
              ImpressionTag? tag = _selectTag(item.tagId);
              if (tag != null) {
                ImpressionTagRankPage.show(context, tag.tagId, tag.tagName,
                    isLastWeek: widget.isLastWeek);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: Util.resizeUrl(item.badgeIcon, rh: 100),
                  height: 28,
                  fit: BoxFit.fitHeight,
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

  ImpressionTag? _selectTag(int tagId) {
    for (ImpressionTag tag in _tags) {
      if (tagId == tag.tagId) {
        return tag;
      }
    }
    return null;
  }
}
