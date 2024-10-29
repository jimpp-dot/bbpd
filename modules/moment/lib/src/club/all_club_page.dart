import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import '../../k.dart';
import 'club_detail_screen.dart';
import 'model/club_bean.dart';
import 'model/club_repo.dart';

/// 所有俱乐部
///
class AllClubPage extends StatefulWidget {
  const AllClubPage({super.key});

  @override
  _AllClubPageState createState() => _AllClubPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const AllClubPage();
        },
        settings: const RouteSettings(name: '/AllClubPage'),
      ),
    );
  }
}

class _AllClubPageState extends State<AllClubPage> {
  late ClubListRepo _repository;

  late double _ratio;

  @override
  void initState() {
    super.initState();
    _ratio = (Util.width - 40 - 12 * 2) / (104 * 3);
    _repository = ClubListRepo();
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.moment_all_club,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _repository.refresh();
      },
      child: LoadingMoreList(
        ListConfig<ClubBean>(
          itemBuilder: (context, item, index) {
            return ClubWidget(bean: item, ratio: _ratio);
          },
          sourceList: _repository,
          shrinkWrap: false,
          physics: const BouncingScrollPhysics(),
          indicatorBuilder: _indicatorBuilder,
          padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 12, 20),
          extendedListDelegate:
              const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
          ),
          lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        ),
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
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.base_net_error,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.base_net_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class ClubWidget extends StatefulWidget {
  final double ratio;
  final ClubBean? bean;

  const ClubWidget({Key? key, this.ratio = 1, this.bean}) : super(key: key);

  @override
  _ClubWidgetState createState() => _ClubWidgetState();
}

class _ClubWidgetState extends State<ClubWidget> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventJoinClub, _onJoinClub);
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventJoinClub, _onJoinClub);
    super.dispose();
  }

  _onJoinClub(type, data) {
    if (!mounted) return;
    int clubId = data as int;
    if (clubId > 0 && widget.bean!.clubId == clubId) {
      widget.bean?.joined = true;
      setState(() {});
    }
  }

  void _onTapClub(BuildContext context, ClubBean? item) {
    ClubDetailScreen.show(context, item!.clubId);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bean == null) return const SizedBox.shrink();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onTapClub(context, widget.bean),
      child: Stack(
        children: [
          Container(
            width: 104 * widget.ratio,
            height: 138 * widget.ratio,
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 0,
                  color: R.color.mainTextColor.withOpacity(0.08),
                )
              ],
            ),
            child: Column(
              children: [
                CommonAvatar(
                  path: widget.bean!.icon,
                  size: 104 * widget.ratio,
                  suffix: null,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                Container(
                  width: 104 * widget.ratio,
                  height: 34 * widget.ratio,
                  padding: const EdgeInsetsDirectional.only(
                    start: 10,
                    end: 10,
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    '${widget.bean?.name}',
                    style:
                        TextStyle(color: R.color.mainTextColor, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          if (widget.bean!.joined)
            PositionedDirectional(
              top: 6,
              end: 6,
              child: Container(
                height: 16,
                padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: R.color.mainBrandColor,
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.moment_joined,
                  style: const TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
