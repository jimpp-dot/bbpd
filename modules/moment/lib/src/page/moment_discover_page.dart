import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:provider/provider.dart';

import '../../k.dart';

// 朋友圈发现页/标签页
class MomentDiscoverPage extends StatefulWidget {
  final PageType type;
  final int id;
  final String title;
  final String icon;

  const MomentDiscoverPage(
      {super.key,
      this.type = PageType.Discovery,
      required this.id,
      required this.title,
      required this.icon});

  @override
  MomentDiscoverPageState createState() => MomentDiscoverPageState();
}

class MomentDiscoverPageState extends State<MomentDiscoverPage>
    with AutomaticKeepAliveClientMixin<MomentDiscoverPage> {
  @override
  bool get wantKeepAlive => true;

  bool _loading = true;
  bool _loadingMore = false;
  bool _loadingMoreLock = false;

  String? _errorMessage;
  bool _hasMoreMoment = false;
  int _page = 1;

  List<Moment> _moments = [];

  final ScrollController _controller = ScrollController();

  void scrollToTop() {
    if (!_controller.hasClients) return;
    _controller.animateTo(0.0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    _loadMoments(_page, first: true);
  }

  @override
  dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  _onScroll() {
    if (!_controller.hasClients) return;
    if (_controller.offset > 0 &&
        _controller.offset >= _controller.position.maxScrollExtent + 40.0 &&
        _loadingMore == false &&
        _hasMoreMoment &&
        _loadingMoreLock == false) {
      _loadMoreMoment();
    }
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _errorMessage = null;
    _loadMoments(_page, first: true);
  }

  _loadMoments(int page, {bool first = false}) async {
    DataRsp<RushMomentPage> response;
    if (widget.type == PageType.Discovery) {
      response = await Api.getDiscoverList(page);
    } else {
      response = await Api.getPlayList(page, type: widget.type, id: widget.id);
    }

    if (response.success == true && response.data != null) {
      RushMomentPage momentPage = response.data!;

      List<Moment>? moments = momentPage.topics;
      if (moments != null) {
        if (first) {
          _moments = moments;
        } else {
          _moments.addAll(moments);
        }
      }
      _page = momentPage.page;
      if (momentPage.more == 0) {
        _hasMoreMoment = false;
      } else {
        _hasMoreMoment = true;
      }
    } else {
      _errorMessage = response.msg;
    }
    _loadingMore = false;
    _loading = false;
    if (mounted) {
      setState(() {});
    }
  }

  _loadMoreMoment() async {
    if (!mounted) return;
    _loadingMore = true;
    _loadingMoreLock = true;
    _errorMessage = null;
    setState(() {});

    _loadMoments(_page + 1, first: false);

    Future.delayed(const Duration(milliseconds: 500), () {
      _loadingMoreLock = false;
    });
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    if (widget.type != PageType.Discovery) {
      return;
    }
    if (_loading && _moments.isEmpty) return;

    List<String> exposureIds = [];

    int maxNum = _moments.length;

    for (int i = firstIndex; i < lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      Moment item = _moments.elementAt(i);
      if (item.isExposure) {
        continue;
      }
      exposureIds.add('circle_${item.topicId}');

      item.isExposure = true;
    }

    if (exposureIds.isNotEmpty) {
      Api.reportStreamExposure(exposureIds);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null && _moments.isEmpty) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          setState(() {
            _loading = true;
          });
          _onRefresh();
        },
      );
    }

    if (_moments.isEmpty) {
      return EmptyWidget(
        desc: K.no_more_moment,
        textColor: R.colors.secondTextColor,
        onTap: () {
          setState(() {
            _loading = true;
          });
          _onRefresh();
        },
      );
    }
    return RefreshIndicatorFactory.of(
      onRefresh: _onRefresh,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: CustomScrollView(
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: FixedExtentSliverChildBuilderDelegate(
                  (context, index) {
                    Moment moment = _moments[index];
                    Moment cachedMoment = context
                        .read<MomentModel>()
                        .getCachedMoment(moment.topicId)!;

                    moment = cachedMoment;
                    return MomentItem(
                      key: ValueKey(moment.topicId),
                      moment: moment,
                      parentTagId: widget.id,
                      showLikeList: false,
                      showFollow: true,
                      showCaseContent: index == 0,
                      page: MomentFlowPage.TopicDetail,
                      topicName: widget.title,
                    );
                  },
                  childCount: _moments.length,
                  onPositionChanged: _handleExposureReport,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildLoadMore(),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.type == PageType.Case)
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: 12.0,
              bottom: Util.iphoneXBottom + 12,
            ),
            child: InkWell(
              onTap: () async {
                IMomentManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_MOMENT);
                await manager.openMomentPublishScreen(
                  context,
                  from: 'discover',
                  caseTag: CaseTag(
                    widget.id,
                    widget.title,
                    widget.icon,
                  ),
                );
                if (mounted) {
                  Fluttertoast.showToast(
                      msg: K.moment_case_push_commit_success);
                  MomentModel momentModel = context.read<MomentModel>();
                  momentModel.notify();
                  scrollToTop();

                  eventCenter.emit(EventConstant.EventCaseMomentSubmitPass);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 32.0,
                height: 44.0,
                padding: const EdgeInsets.only(left: 16.0),
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  K.moment_case_push_to_commit,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    color: R.color.thirdTextColor,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// 加载更多
  Widget _buildLoadMore() {
    Widget more;
    if (_errorMessage != null) {
      more = InkWell(
        onTap: () => _loadMoreMoment(),
        child: Center(
          child: Text(
            "${_errorMessage!}, ${R.string('click_to_retry')}",
            style: TextStyle(color: R.color.secondTextColor),
          ),
        ),
      );
    } else if (_loadingMore) {
      more = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CupertinoActivityIndicator(animating: _loadingMore),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 6.0),
            child: Text(
              R.string('waitting_load'),
              style: TextStyle(color: R.color.secondTextColor),
            ),
          )
        ],
      );
    } else if (!_hasMoreMoment && !_loadingMore) {
      more = Text(
        R.string('not_any_more'),
        style: TextStyle(color: R.color.secondTextColor),
      );
    } else {
      more = Container();
    }

    return Container(
      height: 50.0,
      width: Util.width,
      alignment: Alignment.center,
      child: more,
    );
  }
}
