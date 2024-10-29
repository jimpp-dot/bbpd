import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:moment/moment.dart';

import '../../k.dart';
import 'club_anchor_rank_page.dart';
import 'package:provider/provider.dart' hide Selector;

/// 游戏俱乐部详情
///
class ClubDetailScreen extends StatefulWidget {
  final int clubId; // 俱乐部id
  final String? clubName;

  static Future show(BuildContext context, int clubId,
      {Key? key, String? clubName}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ClubDetailScreen(key: key, clubId: clubId, clubName: clubName);
        },
        settings: const RouteSettings(name: '/ClubDetailScreen'),
      ),
    );
  }

  const ClubDetailScreen({Key? key, required this.clubId, this.clubName})
      : super(key: key);

  @override
  _ClubDetailScreenState createState() => _ClubDetailScreenState();
}

const double cornerHeight = 12;
const double photoHeaderHeight = 244; // 背景图片高度

class _ClubDetailScreenState extends State<ClubDetailScreen> {
  bool _loading = true;
  String? _errorMessage;
  bool _isExpanded = true;

  final ScrollController _scrollController = ScrollController();

  ClubDetailBean? _data;

  late CircleDetailRepo _source;

  late MomentModel _momentModel;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _momentModel = context.read<MomentModel>();
    _source = CircleDetailRepo(widget.clubId, PageType.GameClub, _momentModel);
    _source.refresh();

    _loadData();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _source.dispose();
    super.dispose();
  }

  _loadData() async {
    DataRsp<ClubDetailBean> rsp = await ClubRepo.getClubDetail(widget.clubId);
    if (rsp.success == true) {
      _data = rsp.data;
    } else {
      _errorMessage = rsp.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  _reload() {
    _errorMessage = null;
    _loading = true;

    _source.refresh();

    _loadData();
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;
    double max = photoHeaderHeight +
        cornerHeight -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    if (_isExpanded == true && _scrollController.offset >= max) {
      setState(() {
        _isExpanded = false;
      });
    } else if (_isExpanded == false && _scrollController.offset < max) {
      setState(() {
        _isExpanded = true;
      });
    }
  }

  /// 发布动态
  _onPublishTaped() async {
    // Tracker.instance.track(TrackEvent.topic_detail_page, properties: {'publish': '${_data.name ?? widget.clubName}'});
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentPublishScreen(context,
        from: 'ClubDetailScreen', tag: '${_data?.name ?? widget.clubName}');
  }

  _onJoinTaped() async {
    NormalNull rsp = await ClubRepo.joinClub(widget.clubId);
    if (rsp.success && _data != null) {
      _data?.joined = true;
      _data?.memberNum += 1;
      if (mounted) setState(() {});
    } else {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _data == null ? BaseAppBar(widget.clubName ?? '') : null,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null && _errorMessage!.isNotEmpty) {
      return ErrorData(
        error: _errorMessage,
        onTap: _reload,
      );
    }

    if (_data == null) return EmptyWidget(onTap: _reload);

    return Stack(
      children: <Widget>[
        CommonNestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              _ClubDetailAppBar(
                  data: _data,
                  isExpanded: _isExpanded,
                  onJoinTap: _onJoinTaped),
            ];
          },
          body: _buildList(),
        ),
        MomentPublishWidget(onTap: _onPublishTaped),
      ],
    );
  }

  Widget _buildList() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _reload();
      },
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ClubGameRoomWidget(rooms: _data!.relatedRooms),
                ClubGameAnchorWidget(users: _data!.relatedBroadcast),
                // PartyGodList(gods: _data?.gods, cid: _data?.pcid),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 20, end: 12, top: 12, bottom: 0),
                  child: Text(
                    K.moment_member_moment,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          LoadingMoreSliverList(
            SliverListConfig<Moment>(
              itemBuilder: (c, item, index) {
                Moment? cachedMoment =
                    _momentModel.getCachedMoment(item.topicId);
                if (cachedMoment != null) {
                  item = cachedMoment;
                }

                return MomentItem(
                  key: ValueKey(item.topicId),
                  moment: item,
                  canHeadTaped: true,
                  showFollow: true,
                  onMomentDelete: (int topicId) {
                    _source.removeWhere((item) => item.topicId == topicId);
                  },
                  page: MomentFlowPage.TopicDetail,
                );
              },
              sourceList: _source,
              indicatorBuilder: _indicatorBuilder,
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: PreLoading(child: MomentLoadingWidget()),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.only(top: 100),
          child: ErrorData(
            error: _errorMessage,
            onTap: () {
              _source.refresh();
            },
          ),
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMessage, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.only(top: 100),
          child: EmptyWidget(
            onTap: () {
              _source.refresh();
            },
          ),
        ),
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

///
class _ClubDetailAppBar extends StatelessWidget {
  final ClubDetailBean? data;
  final bool isExpanded;
  final VoidCallback? onJoinTap;

  const _ClubDetailAppBar(
      {Key? key, this.data, this.isExpanded = true, this.onJoinTap})
      : super(key: key);

  Widget _buildRank(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 12.0),
          child: IconButton(
            padding: const EdgeInsets.all(8.0),
            icon: R.img('club/ic_club_rank.webp',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_MOMENT),
            onPressed: () => ClubAnchorRankPage.show(context, data!.clubId),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: R.color.mainBgColor,
      pinned: true,
      systemOverlayStyle:
          isExpanded ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      floating: false,
      snap: false,
      elevation: 0,
      title: _buildTitle(isExpanded),
      leading: _buildBackBtn(context, isExpanded),
      actions: [
        if (isExpanded) _buildRank(context) else _buildFollowButton(context),
      ],
      expandedHeight: photoHeaderHeight - MediaQuery.of(context).padding.top,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            background: _buildBackground(context),
          );
        },
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: SizedBox(
          height: cornerHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              PositionedDirectional(
                start: 0,
                end: 0,
                bottom: -1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: cornerHeight,
                  decoration: BoxDecoration(
                    color: R.color.mainBgColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackBtn(BuildContext context, bool isExpanded) => IconButton(
        padding: const EdgeInsets.all(0.0),
        icon: Container(
          width: 36.0,
          height: 36.0,
          margin: const EdgeInsetsDirectional.only(start: 6.0),
          alignment: Alignment.center,
          child: R.img(
            "ic_titlebar_back.svg",
            width: 24,
            height: 24,
            color: (isExpanded && data != null)
                ? Colors.white
                : R.color.mainTextColor,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      );

  Widget _buildTitle(bool isExpanded) => GestureDetector(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isExpanded
                ? Text(
                    '',
                    style: TextStyle(color: R.color.mainTextColor),
                  )
                : LimitedBox(
                    maxWidth: 180,
                    child: Text(
                      data?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ],
        ),
      );

  Widget _buildFollowButton(BuildContext context) {
    if (data == null || data!.joined) return const SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onJoinTap,
          child: Container(
            width: 52,
            height: 32,
            margin: EdgeInsetsDirectional.only(end: isExpanded ? 0 : 20),
            alignment: AlignmentDirectional.center,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            ),
            child: Text(
              K.moment_club_join,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  /// 背景
  Widget _buildBackground(BuildContext context) {
    if (data == null) return const SizedBox.shrink();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          _buildImage(context),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Container(
              height: photoHeaderHeight / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.5)
                  ],
                ),
              ),
            ),
          ),
          PositionedDirectional(
            start: 20,
            top: 160,
            end: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CommonAvatar(
                  path: '${data?.icon}',
                  size: 64,
                  borderRadius: BorderRadius.circular(12),
                  suffix: null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data?.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 2),
                      _buildClubInfo(context),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                _buildFollowButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClubInfo(BuildContext context) {
    return Row(
      children: [
        Text(
          K.moment_club_gs,
          style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
        Text(
          '${data?.broadcastNum ?? 0}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 16),
        Text(
          K.moment_club_member,
          style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
        Text(
          '${data?.memberNum ?? 0}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    if (data?.bgImg != null) {
      return CachedNetworkImage(
        imageUrl: '${data?.bgImg}',
        height: photoHeaderHeight,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    } else {
      return R.img(
        'bg_topic_default.webp',
        height: photoHeaderHeight,
        width: MediaQuery.of(context).size.width,
        package: ComponentManager.MANAGER_MOMENT,
        fit: BoxFit.cover,
      );
    }
  }
}
