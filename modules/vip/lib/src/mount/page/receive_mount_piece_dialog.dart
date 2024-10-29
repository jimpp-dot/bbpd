import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/mount/page/mount_piece_exchange_sheet.dart';

class ReceiveMountPieceDialog extends StatefulWidget {
  final List list;

  const ReceiveMountPieceDialog({super.key, required this.list});

  static Future show(BuildContext context, List list) {
    if (list.isNotEmpty) {
      eventCenter.emit(mountPieceCountChanged);
    }
    return showDialog(
      context: context,
      builder: (context) {
        return ReceiveMountPieceDialog(list: list);
      },
    );
  }

  @override
  State<ReceiveMountPieceDialog> createState() =>
      _ReceiveMountPieceDialogState();
}

class _ReceiveMountPieceDialogState extends State<ReceiveMountPieceDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 295,
        padding: const EdgeInsetsDirectional.only(bottom: 16, top: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(18),
          color: R.color.mainBgColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.list.isEmpty ? '大鱼在后面' : '恭喜获得以下座驾碎片',
                style: R.textStyle.medium16),
            SizedBox(height: widget.list.isEmpty ? 6 : 4),
            if (widget.list.isEmpty) _buildNone(),
            if (widget.list.isNotEmpty) _buildMounts(widget.list),
            const SizedBox(height: 24),
            const PositiveButton(width: 263, height: 48, useGradientBg: true)
          ],
        ),
      ),
    );
  }

  Widget _buildNone() {
    return Text('很遗憾，这次没有收获～', style: R.textStyle.regular14);
  }

  Widget _buildMounts(List list) {
    List<Widget> children = [];
    for (int i = 0; i < list.length; i++) {
      children.add(_buildMountItem(list.length > 2, list[i]));
      if (i != list.length - 1 && i % 3 != 2) {
        children.add(const SizedBox(width: 16));
      }
    }
    return Wrap(children: children);
  }

  Widget _buildMountItem(bool small, Map item) {
    String icon = item['icon'];
    String name = item['name'];
    int num = item['num'];
    double cardSize = small ? 77 : 109;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: cardSize,
          height: cardSize,
          alignment: AlignmentDirectional.center,
          margin: EdgeInsetsDirectional.only(top: 12, bottom: small ? 4 : 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(small ? 5.65 : 8),
            color: const Color(0x140027FF),
          ),
          child: CachedNetworkImage(
              imageUrl: icon, width: small ? 59 : 84, height: small ? 51 : 72),
        ),
        Text('${name}X$num',
            style: small ? R.textStyle.regular12 : R.textStyle.regular14),
      ],
    );
  }
}
