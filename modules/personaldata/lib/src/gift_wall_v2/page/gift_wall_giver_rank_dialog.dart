import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/api/gift_wall_api.dart';

class GiftWallGiverRankDialog extends StatefulWidget {
  /// 系列type
  final String typ;

  /// 送还是收
  final String seriesType;
  const GiftWallGiverRankDialog(
      {required this.typ, required this.seriesType, super.key});

  @override
  State<GiftWallGiverRankDialog> createState() =>
      _GiftWallGiverRankDialogState();

  static Future<void> show(
      BuildContext context, String typ, String seriesType) async {
    showDialog(
        barrierDismissible: true,
        barrierColor: Colors.black45,
        context: context,
        builder: (BuildContext context) {
          return GiftWallGiverRankDialog(typ: typ, seriesType: seriesType);
        });
  }
}

class _GiftWallGiverRankDialogState extends State<GiftWallGiverRankDialog> {
  bool _isLoading = false;
  WealthyCollectorRankRsp? _rankRsp;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              R.img(Assets.personaldata$gift_wall_giver_rank_bg_webp,
                  width: 299.dp, height: 345.dp),
              _isLoading
                  ? _loadingWidget()
                  : ((_rankRsp != null && !_rankRsp!.success)
                      ? _errorWidget()
                      : PositionedDirectional(
                          top: 30.dp,
                          bottom: 8.dp,
                          start: 0,
                          end: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                K.gift_wall_giver_name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.dp,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: _rankRsp?.data.length ?? 0,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      WealthyCollectorRankRsp_Data itemData =
                                          _rankRsp!.data[index];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 7.dp,
                                            end: 7.dp,
                                            top: 8.dp,
                                            bottom: 8.dp),
                                        child: Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: 38,
                                              child: NumText(
                                                itemData.rank.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.dp,
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 28.dp,
                                              height: 28.dp,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        14.dp),
                                                color: Colors.white,
                                              ),
                                              child: CommonAvatar(
                                                path: itemData.icon,
                                                suffix:
                                                    Util.squareResizeSuffix(50),
                                                size: 26.dp,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Expanded(
                                              child: Text(
                                                itemData.name,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.dp,
                                                  color: Colors.white
                                                      .withOpacity(0.9),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            NumText(
                                              itemData.time,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.dp,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ))),
            ],
          ),
          SizedBox(
            height: 30.dp,
          ),
          InkWell(
            child: R.img(Assets.personaldata$gift_wall_ic_close_svg,
                width: 32.dp, height: 32.dp, fit: BoxFit.contain),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Widget _loadingWidget() {
    return Container(
      width: 299.dp,
      height: 345.dp,
      alignment: Alignment.center,
      child: const Loading(),
    );
  }

  Widget _errorWidget() {
    return SizedBox(
      width: 299.dp,
      height: 345.dp,
      child: ErrorData(
        error: _rankRsp?.msg,
        fontColor: Colors.white,
        onTap: () {
          _requestData();
        },
      ),
    );
  }

  Future<void> _requestData() async {
    if (_isLoading) return;
    _isLoading = true;
    _rankRsp = await GiftWallApi.getGiverRank(widget.typ, widget.seriesType);
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}
