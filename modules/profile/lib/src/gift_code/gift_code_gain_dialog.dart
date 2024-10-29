import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';
import '../model/pb/generated/gift_bag.pb.dart';

class GiftCodeGainDialog extends StatefulWidget {
  final List<CommoditySimpleInfo>? rewardList;

  const GiftCodeGainDialog(this.rewardList, {super.key});

  @override
  _GiftCodeGainDialogState createState() => _GiftCodeGainDialogState();

  static void show(
      BuildContext context, List<CommoditySimpleInfo>? rewardList) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return GiftCodeGainDialog(rewardList);
      },
    );
  }
}

class _GiftCodeGainDialogState extends State<GiftCodeGainDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildContent());
  }

  Widget _buildContent() {
    return Container(
      width: Util.width - 60,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          Text(
            K.profile_congratulations_get_gift,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: R.color.unionRankText1,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30.0),
          _buildGiftReward(),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 200,
              height: 48,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: R.color.mainBrandColor,
              ),
              child: Text(
                K.profile_know,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildGiftReward() {
    int count = widget.rewardList?.length ?? 0;
    if (count == 0) return const SizedBox.shrink();
    if (count <= 2) {
      List<Widget> children = [];
      for (int i = 0; i < count; i++) {
        CommoditySimpleInfo item = widget.rewardList![i];
        children.add(_buildGridItem(item));
        if (i < count - 1) children.add(const SizedBox(width: 12));
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    } else {
      Widget child = Container(
        width: 264,
        alignment: AlignmentDirectional.topCenter,
        child: _buildGridView(),
      );
      return count > 12
          ? ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 336),
              child: child,
            )
          : child;
    }
  }

  Widget _buildGridView() {
    var children = widget.rewardList?.map((e) => _buildGridItem(e)).toList() ??
        const <Widget>[];

    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 80 / 104,
      // 宽高比例
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      children: children,
    );
  }

  Widget _buildGridItem(CommoditySimpleInfo rewardInfo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Util.validStr(rewardInfo.image)
              ? Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CommonAvatar(
                      path: rewardInfo.image,
                      size: 48,
                      fit: BoxFit.contain,
                      suffix: null,
                    ),
                    if (rewardInfo.period > 0)
                      PositionedDirectional(
                        top: 0,
                        end: 0,
                        child: Container(
                          height: 11,
                          padding: const EdgeInsetsDirectional.only(
                              start: 5, end: 5),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF9E00),
                            borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(8),
                                topEnd: Radius.circular(8)),
                          ),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            K.profile_gift_reward_period(
                                ['${rewardInfo.period}']),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 7,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                  ],
                )
              : const SizedBox(
                  width: 80,
                  height: 80,
                ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 80,
          height: 18,
          alignment: AlignmentDirectional.center,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: rewardInfo.name,
                  style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.4),
                    fontSize: 13,
                  ),
                ),
                TextSpan(
                  text: rewardInfo.num > 1 ? ' x${rewardInfo.num}' : '',
                  style: const TextStyle(
                    color: Color(0xFFFDA252),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                )
              ],
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
