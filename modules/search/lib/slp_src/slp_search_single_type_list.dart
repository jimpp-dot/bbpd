import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:search/assets.dart';
import 'package:search/src/model/pb/generated/pretty_user.pb.dart';
import 'slp_search_result_item.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../k.dart';

class SlpSearchSingleTypeList extends StatefulWidget {
  final int startIndex;
  final String typeName;
  final List<JointSearchItem> datas;
  final OnGoRoom? onGoRoom;
  final OnFollow? onFollow;
  final OnTapItem onTapItem;
  final OnTypeMore? onTypeMore;
  final ReportItemExpose reportItemExpose;
  final GetRidByUid getRidByUid;
  final Map<String, dynamic>? boxStatus;
  final List<PrettyInfo>? prettyUsers; // 带扩展信息的靓号用户
  final Function(JointSearchItem, int)? onJoinSingerClub;

  const SlpSearchSingleTypeList({
    super.key,
    required this.startIndex,
    required this.typeName,
    required this.datas,
    required this.onTapItem,
    required this.reportItemExpose,
    required this.getRidByUid,
    this.boxStatus,
    this.onTypeMore,
    this.onGoRoom,
    this.onFollow,
    this.prettyUsers,
    this.onJoinSingerClub,
  });

  @override
  BbSearchSingleTypeState createState() {
    return BbSearchSingleTypeState();
  }
}

class BbSearchSingleTypeState extends State<SlpSearchSingleTypeList> {
  bool expanded = false;
  int length = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    length = widget.datas.length;
    expanded = length <= 3;
  }

  Widget _buildSectionHeader() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16, start: 20, bottom: 6),
      child: Row(
        children: [
          Text(
            widget.typeName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: R.colors.mainTextColor,
            ),
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => widget.onTypeMore?.call(widget.typeName),
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              alignment: AlignmentDirectional.center,
              child: R.img(Assets.search$search_type_more_webp,
                  width: 12, height: 12),
            ),
          ),
        ],
      ),
    );
  }

  /// 作品列表
  Widget _buildWorkWidget() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSectionHeader(),
          SizedBox(
            height: 215,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.datas.length,
              itemBuilder: (BuildContext context, int index) {
                JointSearchItem item = widget.datas[index];
                return SlpSearchResultItem(
                  item,
                  (item) => widget.onTapItem(index, item),
                  null,
                  null,
                  0,
                  boxStatus: widget.boxStatus,
                );
              },
            ),
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.typeName == K.search_isong_work
        ? _buildWorkWidget()
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 16, start: 16, end: 16, bottom: 6),
                    child: Text(
                      widget.typeName,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: R.colors.secondTextColor,
                      ),
                    ),
                  );
                } else if (!expanded && index == 4) {
                  return GestureDetector(
                    onTap: () {
                      expanded = true;
                      refresh();
                    },
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(
                          top: 8, start: 20, end: 20),
                      width: Util.width - 40,
                      height: 44,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: R.colors.dividerColor, width: 0.5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            K.search_for_more,
                            style: TextStyle(
                              fontSize: 13,
                              color: R.colors.thirdTextColor,
                            ),
                          ),
                          const SizedBox(width: 2),
                          R.img(
                            Assets.search$ic_expand_svg,
                            width: 16,
                            height: 16,
                            color: R.colors.mainTextColor.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  JointSearchItem item = widget.datas.elementAt(index - 1);

                  String? prettyId = item.user.prettyId;
                  int uid = Util.parseInt(item.id);
                  int rid = widget.getRidByUid(uid);

                  PrettyInfo? prettyInfo =
                      widget.prettyUsers?.firstWhereOrNull((e) => e.uid == uid);

                  return VisibilityDetector(
                    key: ValueKey('SearchItem-${index + widget.startIndex}'),
                    onVisibilityChanged: (visibilityInfo) {
                      if (visibilityInfo.visibleFraction > 0 &&
                          (index != 0 || (!expanded && index == 4))) {
                        // 标题和查看更多不做曝光上报
                        widget.reportItemExpose(
                            index: index - 1 + widget.startIndex,
                            rid: rid,
                            uid: uid);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          bottom: (expanded && index == widget.datas.length)
                              ? 8
                              : 0),
                      child: SlpSearchResultItem(
                        item,
                        (item) => widget.onTapItem(index, item),
                        widget.onFollow,
                        (rid) => widget.onGoRoom?.call(
                            position: index,
                            rid: rid,
                            uid: uid,
                            refer: !Util.isNullOrEmpty(prettyId)
                                ? 'pretty_uid'
                                : null),
                        rid,
                        boxStatus: widget.boxStatus,
                        prettyInfo: prettyInfo,
                        onJoinSingerClub: widget.onJoinSingerClub,
                      ),
                    ),
                  );
                }
              },
              childCount: expanded ? widget.datas.length + 1 : 5,
            ),
          );
  }

  @override
  void didUpdateWidget(covariant SlpSearchSingleTypeList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (length != widget.datas.length && mounted) {
      setState(() {
        init();
      });
    }
  }
}

typedef OnGoRoom = void Function(
    {required int position, required int rid, required int uid, String? refer});
typedef OnFollow = void Function(JointSearchItem item);
typedef OnTapItem = void Function(int position, JointSearchItem item);
typedef OnTypeMore = void Function(String typeName);
typedef ReportItemExpose = void Function(
    {required int index, int uid, int rid});
typedef GetRidByUid = int Function(int uid);
