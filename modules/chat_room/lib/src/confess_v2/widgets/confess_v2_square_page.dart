import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_record_history.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_square_view_model.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_view_model.dart';
import 'package:chat_room/src/confess_v2/pb/generated/confess_v2.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:provider/provider.dart' hide Selector;

/// 恋爱头条--广场或我的tab页面
class ConfessV2SquarePage extends StatefulWidget {
  final bool me;

  const ConfessV2SquarePage({super.key, this.me = false});

  @override
  State<ConfessV2SquarePage> createState() => _ConfessV2SquarePageState();
}

class _ConfessV2SquarePageState extends State<ConfessV2SquarePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(child: _buildBody(context)),
        SizedBox(height: 12 + Util.iphoneXBottom),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final history = context
        .select<ConfessV2SquareViewModel, ConfessV2RecordHistory>((model) =>
            widget.me ? model.mineOnlyRecordHistory : model.allRecordHistory);

    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        history.refresh();
      },
      child: LoadingMoreList(
        ListConfig<ConfessHistoryItem>(
            shrinkWrap: true,
            sourceList: history,
            indicatorBuilder: _indicatorBuilder,
            itemBuilder: (context, item, index) {
              return _ConfessionRecordListViewItem(recordData: item);
            }),
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
      return const SizedBox();
    } else if (status == IndicatorStatus.error) {
      return const SizedBox();
    } else if (status == IndicatorStatus.empty) {
      return const EmptyWidget();
    } else if (status == IndicatorStatus.none) {
      return const SizedBox();
    }
    return const LoadingFooter(hasMore: true);
  }
}

/// 表白记录列表item
class _ConfessionRecordListViewItem extends StatelessWidget {
  final ConfessHistoryItem recordData;

  const _ConfessionRecordListViewItem({Key? key, required this.recordData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = Util.width - 32;
    double height = width * 100 / 343;
    double ratio = width / 343;
    double iconSize = 48 * ratio;
    double overlapSize = 8 * ratio;
    double iconsWidth = iconSize * 2 - overlapSize;
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              R.img(
                RoomAssets.chat_room$confess_v2_bg_headline_item_webp,
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
              Row(
                children: [
                  SizedBox(width: 12 * ratio),
                  SizedBox(
                    width: iconsWidth,
                    height: iconSize,
                    child: Stack(
                      children: [
                        _userAvatar(context, iconSize, recordData.fromIcon,
                            const Color(0xFF8F55E0),
                            uid: recordData.fromUid),
                        PositionedDirectional(
                          start: iconSize - overlapSize,
                          child: _userAvatar(context, iconSize,
                              recordData.toIcon, const Color(0xFFF0569C),
                              uid: recordData.toUid),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      recordData.text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF461443),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 用户头像和名称
  Widget _userAvatar(
      BuildContext context, double iconSize, String url, Color borderColor,
      {int? uid}) {
    double borderW = 1.25;
    return Container(
      width: iconSize,
      height: iconSize,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(31)),
        border: Border.all(width: borderW, color: borderColor),
      ),
      child: CommonAvatar(
        path: Util.parseIcon(url),
        size: iconSize - borderW * 2,
        shape: BoxShape.circle,
        onTap: () {
          /// 打开用户资料面板
          if (uid != null && uid > 0) {
            context
                .read<ConfessV2ViewModel>()
                .actionForShowPersonalProfileBottomSheetDialog(uid);
          }
        },
      ),
    );
  }
}
