import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat_rank.pb.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_request.dart';
import 'package:flutter/material.dart';

class HatRankListWidget extends StatefulWidget {
  final int token;
  final Function(HatActivityRankItem item, int token)? getMyRankData;
  const HatRankListWidget({
    Key? key,
    required this.token,
    this.getMyRankData,
  }) : super(key: key);

  @override
  State<HatRankListWidget> createState() => _HatRankListWidgetState();
}

class _HatRankListWidgetState extends State<HatRankListWidget> {
  final GlobalKey<PageLoadingListState> rankState =
      GlobalKey<PageLoadingListState>();
  final List<HatActivityRankItem> rankItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestCommentData(0);
  }

  @override
  void didUpdateWidget(covariant HatRankListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.token != widget.token) {
      _requestCommentData(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _renderContentWidget();
  }

  Widget _renderContentWidget() {
    List<Widget> items = List.generate(rankItems.length, (index) {
      return listItem(rankItems[index]);
    });
    return Column(
      children: items,
    );
  }

  // Widget _renderContentWidget() {
  //   return PageLoadingList(
  //     key: rankState,
  //     loadData: _requestCommentData,
  //     itemBuilder: (context, item, index) => listItem(item, index),
  //     errorWidget: Center(
  //       child: GestureDetector(
  //         behavior: HitTestBehavior.translucent,
  //         onTap: () {
  //           rankState.currentState?.refresh();
  //         },
  //         child: Container(
  //           padding: const EdgeInsetsDirectional.only(start: 30, end: 30, top: 20, bottom: 30),
  //           child: Text(rankState.currentState?.errorMsg() ?? "请求出错，请重试", style: R.textStyle.caption.copyWith(color: Colors.white)),
  //         ),
  //       ),
  //     ),
  //     noDataWidget: Center(
  //       child: GestureDetector(
  //         behavior: HitTestBehavior.translucent,
  //         onTap: () {
  //           rankState.currentState?.refresh();
  //         },
  //         child: Container(
  //           padding: const EdgeInsetsDirectional.only(start: 30, end: 30, top: 20, bottom: 30),
  //           child: Text('暂无数据', style: R.textStyle.caption.copyWith(color: Colors.white)),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Future<HatRankListResponse?> _requestCommentData(int page) async {
  //   ApiHatActivityRankResponse rankResponse = await HatRequest.getRankData(widget.token, page);
  //   if (!rankResponse.success) {
  //     return HatRankListResponse(msg: rankResponse.message, success: rankResponse.success);
  //   } else {
  //     return HatRankListResponse(success: rankResponse.success, hasMore: rankResponse.data.more == 1, items: rankResponse.data.list);
  //   }
  // }

  Future<void> _requestCommentData(int page) async {
    ApiHatActivityRankResponse rankResponse =
        await HatRequest.getRankData(widget.token, page);
    if (rankResponse.success) {
      if (page == 0) {
        if (rankItems.isNotEmpty) {
          rankItems.removeRange(0, rankItems.length);
        }
        if (widget.getMyRankData != null) {
          widget.getMyRankData!(rankResponse.data.me, widget.token);
        }
      }
      rankItems.addAll(rankResponse.data.list);
    } else {
      if (page == 0) {
        if (widget.getMyRankData != null) {
          widget.getMyRankData!(HatActivityRankItem(), widget.token);
        }
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget listItem<T>(HatActivityRankItem data) {
    List<Color> colorList = [const Color(0xffFFF29F), const Color(0xffFF9A2B)];
    String imagePath = RoomAssets.chat_room$grab_hat_ic_hat_top1_webp;
    if (data.rank == 2) {
      colorList = [const Color(0xffD8EAFF), const Color(0xff8CAAFF)];
      imagePath = RoomAssets.chat_room$grab_hat_ic_hat_top2_webp;
    } else if (data.rank == 3) {
      colorList = [const Color(0xffFFDBBE), const Color(0xffFF8657)];
      imagePath = RoomAssets.chat_room$grab_hat_ic_hat_top3_webp;
    }
    return Container(
      height: 60.dp,
      margin: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(
              minWidth: 36,
            ),
            alignment: Alignment.center,
            child: Text(data.rank.toString(),
                maxLines: 1,
                style: TextStyle(
                  color: const Color(0xffFCD2AE),
                  fontSize: 16,
                  fontFamily: Util.numFontFamily,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsetsDirectional.only(start: 5, end: 5),
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: data.rank > 3
                        ? null
                        : LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: colorList,
                          ),
                    borderRadius: BorderRadius.circular(23),
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: CachedNetworkImage(
                      imageUrl: Util.getRemoteImgUrl(data.icon),
                      width: 42,
                      height: 42,
                    ),
                  )),
              if (data.rank <= 3)
                PositionedDirectional(
                    start: 3,
                    top: -10,
                    child: R.img(imagePath, width: 21, height: 21)),
            ],
          ),
          Expanded(
            child: Text(data.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('点亮分数',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  )),
              Text(data.score.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: Util.numFontFamily,
                    package: ComponentManager.MANAGER_BASE_CORE,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          const SizedBox(
            width: 9,
          ),
        ],
      ),
    );
  }
}

class HatRankListResponse extends BaseResponse
    with PageListResponse<HatActivityRankItem> {
  @override
  List<HatActivityRankItem>? items;

  @override
  bool hasMore;

  HatRankListResponse(
      {bool success = false, String msg = "", this.items, this.hasMore = false})
      : super(msg: msg, success: success);
}
