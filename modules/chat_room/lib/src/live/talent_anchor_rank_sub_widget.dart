import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/src/live/model/live_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../k.dart';
import '../protobuf/generated/live.pb.dart';

class TalentAnchorRankSubWidget extends StatefulWidget {
  final int type;

  const TalentAnchorRankSubWidget(this.type, {super.key});

  @override
  State<StatefulWidget> createState() => _TalentAnchorRankSubState();
}

class _TalentAnchorRankSubState extends State<TalentAnchorRankSubWidget>
    with AutomaticKeepAliveClientMixin {
  late _TalentAnchorRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _TalentAnchorRankLoadingSource(widget.type, this);
    _source.refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget child = LoadingMoreList<TagRoomListItem>(ListConfig<TagRoomListItem>(
      itemBuilder: (context, item, index) {
        return _buildItem(item);
      },
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
      physics: const ClampingScrollPhysics(),
    ));

    return RefreshIndicatorFactory.of(
      child: child,
      onRefresh: () => _source.refresh(),
    );
  }

  Widget _buildItem(TagRoomListItem item) {
    return Container(
      width: double.infinity,
      height: 88,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: const Color(0xFF896EFB).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatar(item),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  item.desc,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                _buildTagWidget(item.tagText),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // 关注按钮
          _buildFollowBtn(item),
        ],
      ),
    );
  }

  Widget _buildAvatar(TagRoomListItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        if (item.rid > 0 && item.rid != roomManager.getRid()) {
          Tracker.instance
              .track(TrackEvent.live_content_pop_click, properties: {
            'uid': Session.uid,
            'rid': item.rid,
            'to_uid': item.uid,
          });
          roomManager.openChatRoomScreenShow(context, item.rid);
        } else if (item.uid > 0) {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, item.uid);
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          CommonAvatar(
            path: item.icon,
            size: 52,
            shape: BoxShape.circle,
          ),
          if (item.rid > 0) ...[
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: const Color(0xFFFF5F7D), width: 1),
              ),
              child: Container(
                width: 51,
                height: 51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.5),
                  border: Border.all(color: Colors.white, width: 1),
                ),
              ),
            ),
            PositionedDirectional(
              bottom: -2,
              child: Container(
                height: 16,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5F7D),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  K.room_pub_home_rank_living,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFollowBtn(TagRoomListItem item) {
    if (item.uid == Session.uid) {
      return const SizedBox.shrink();
    }
    if (item.isFollow) {
      return const SizedBox();
    }
    return InkWell(
      onTap: () async {
        NormalNull response = await BaseRequestManager.onFollow('${item.uid}');
        if (response.success) {
          item.isFollow = true;
          Fluttertoast.showToast(msg: K.followed, gravity: ToastGravity.CENTER);
          refresh();
        } else {
          if (response.msg.isNotEmpty) {
            Fluttertoast.showToast(
                msg: response.msg, gravity: ToastGravity.CENTER);
          }
        }
      },
      child: Container(
        height: 28,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          K.follow,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildTagWidget(String tagText) {
    List<String> tags = tagText.split(',');
    if (tags.isNotEmpty == true) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: tags.map((e) => _buildTagItem(e)).toList(),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildTagItem(String text) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      margin: const EdgeInsetsDirectional.only(end: 6),
      alignment: AlignmentDirectional.center,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: const StadiumBorder(),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true, textColor: Colors.white);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
          hasMore: false, loadMore: () => {}, textColor: Colors.white);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _source.errorMsg,
        onTap: () {
          _source.refresh();
        },
        fontColor: Colors.white,
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
        fontColor: Colors.white,
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg,
          loadMore: _source.loadMore,
          textColor: Colors.white);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore,
          loadMore: _source.loadMore,
          textColor: Colors.white);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _TalentAnchorRankLoadingSource extends LoadingMoreBase<TagRoomListItem> {
  final int type;
  int _nextId = 0;
  final _TalentAnchorRankSubState state;

  _TalentAnchorRankLoadingSource(this.type, this.state);

  bool _hasMore = true;
  String errorMsg = '';

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _nextId = 0;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _nextId = 0;
      _hasMore = true;
    }

    bool loadSuccess = false;
    ResLiveTagRoomList res = await LiveRepository.getTalentAnchorRankList(
        type: type, nextId: _nextId);
    if (res.success) {
      if (_nextId == 0) {
        clear();
        state.refresh();
      }

      addAll(res.data);

      _hasMore = res.hasMore;
      _nextId = res.nextId;
      loadSuccess = true;
    } else {
      errorMsg = res.msg;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}
