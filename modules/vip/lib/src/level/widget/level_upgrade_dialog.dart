import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/level/model/card_bean.dart';

import '../../../k.dart';

/// vip或者人气等级升级后获取宝箱弹出dialog
class LevelUpgradeDialog extends StatefulWidget {
  final UpgradeCard upgradeCard;
  final bool isVip;
  final int level;

  const LevelUpgradeDialog(
      {super.key,
      required this.upgradeCard,
      required this.isVip,
      required this.level});

  @override
  _LevelUpgradeDialogState createState() => _LevelUpgradeDialogState();

  static showLevelUpgradeDialog(BuildContext context,
      {required UpgradeCard upgradeCard,
      required bool isVip,
      required int level}) {
    showDialog(
      context: System.context,
      barrierDismissible: true,
      builder: (context) => Center(
        child: LevelUpgradeDialog(
          upgradeCard: upgradeCard,
          isVip: isVip,
          level: level,
        ),
      ),
    );
  }
}

class _LevelUpgradeDialogState extends State<LevelUpgradeDialog> {
  double _maxHeight = 478;

  @override
  void initState() {
    super.initState();
    if (_isReceiveEmpty || _isUnOpenEmpty) {
      int size = _isReceiveEmpty
          ? widget.upgradeCard.unOpen.length
          : widget.upgradeCard.receive.length;
      if (size <= _LIMIT) {
        _maxHeight = 348;
        setState(() {});
      }
    }
  }

  bool get _isReceiveEmpty =>
      Util.isCollectionEmpty(widget.upgradeCard.receive);

  bool get _isUnOpenEmpty => Util.isCollectionEmpty(widget.upgradeCard.unOpen);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(maxHeight: _maxHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            K.vip_congratulations_you,
            style: const TextStyle(
                color: Color(0xFFFDA252),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.isVip
                ? K.vip_vip_level_reach([widget.level.toString()])
                : K.vip_popularity_level_reach([widget.level.toString()]),
            style: const TextStyle(
                color: Color(0xFFFDA252),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          // Expanded(
          //   child: CustomScrollView(
          //     slivers: [
          //       if (!_isReceiveEmpty) ...[
          //         SliverToBoxAdapter(
          //           child: _buildTitleTips(K.vip_receive_box),
          //         ),
          //         SliverToBoxAdapter(
          //           child: _buildBoxListRows(widget.upgradeCard.receive),
          //         )
          //       ],
          //       if (!_isUnOpenEmpty) ...[
          //         SliverPadding(
          //           padding: EdgeInsetsDirectional.only(top: !_isReceiveEmpty ? 16 : 0),
          //           sliver: SliverToBoxAdapter(
          //             child: _buildTitleTips(K.vip_unlock_box),
          //           ),
          //         ),
          //         SliverToBoxAdapter(
          //           child: _buildBoxListRows(widget.upgradeCard.unOpen),
          //         ),
          //       ]
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
              width: 232,
              decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFDE77), Color(0xFFFF973A)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Center(
                child: Text(
                  K.vip_confirm_know,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleTips(String text) {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color(0xFFFDA252).withOpacity(0),
            const Color(0xFFFFCF8A),
          ])),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Color(0xFF313131),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color(0xFFFFCF8A),
            const Color(0xFFFDA252).withOpacity(0),
          ])),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildBoxListRows(List<UpgradeCardItem> list) {
    List<List<UpgradeCardItem>> rowsDataList = groupItems(list);

    List<Widget> rows = [];
    for (var element in rowsDataList) {
      rows.add(Row(
        mainAxisSize: MainAxisSize.min,
        children: _buildBoxList(element),
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: rows,
    );
  }

  List<Widget> _buildBoxList(List<UpgradeCardItem> list) {
    List<Widget> children = [];

    for (var item in list) {
      children.add(Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CachedNetworkImage(
          //   imageUrl: Util.cover375(item.cardImg),
          //   width: 96,
          //   height: 96,
          // ),

          SizedBox(
            height: 96,
            child: Center(child: Text('恭喜你升级到${item.cardNum}')),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.cardName,
                style: TextStyle(
                    color: const Color(0xFF313131).withOpacity(0.6),
                    fontSize: 11),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'x${item.cardNum}',
                style: const TextStyle(color: Color(0xFFFDA252), fontSize: 13),
              )
            ],
          ),
        ],
      ));
    }

    return children;
  }

  static const int _LIMIT = 3;

  List<List<UpgradeCardItem>> groupItems(List<UpgradeCardItem> data) {
    List<List<UpgradeCardItem>> groupItems = [];
    while (data.length > _LIMIT) {
      groupItems.add(data.sublist(0, _LIMIT));
      data = data.sublist(_LIMIT);
    }

    if (data.isNotEmpty) {
      groupItems.add(data);
    }
    return groupItems;
  }
}
