import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as baseK;
import 'package:vip/assets.dart';
import 'package:vip/src/mount/model/mount_repos.dart';
import 'package:vip/src/mount/page/mount_piece_exchange_success_dialog.dart';
import 'package:vip/src/mount/pb/generated/mount.pb.dart';

const mountPieceCountChanged = 'mount.piece.count.changed';

/// 座驾碎片兑换
class MountPieceExchangeSheet extends StatefulWidget {
  final int serialId;
  final MountDebrisBagItem pieceItem;
  final List<MountDebrisBagItem> pieceList;

  const MountPieceExchangeSheet(
      {super.key,
      required this.serialId,
      required this.pieceItem,
      required this.pieceList});

  static Future launch(BuildContext context,
      {required int serialId,
      required MountDebrisBagItem pieceItem,
      required List<MountDebrisBagItem> pieceList}) async {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 1,
      builder: (context) {
        return MountPieceExchangeSheet(
            serialId: serialId, pieceItem: pieceItem, pieceList: pieceList);
      },
    );
  }

  @override
  State<MountPieceExchangeSheet> createState() =>
      _MountPieceExchangeSheetState();
}

class _MountPieceExchangeSheetState extends State<MountPieceExchangeSheet> {
  final List<MountDebrisBagItem> _pieceList = [];
  bool _exchangeMount = true; // true:兑换座驾 false:兑换碎片
  MountDebrisBagItem? _selectedItem;

  @override
  void initState() {
    super.initState();

    /// 过滤当前碎片
    for (MountDebrisBagItem item in widget.pieceList) {
      if (item.id != widget.pieceItem.id) {
        _pieceList.add(item);
      }
    }
    if (_pieceList.isNotEmpty) {
      _selectedItem = _pieceList[0];
    }
  }

  Future _exchange() async {
    ResMountExchange resMountExchange;
    if (_exchangeMount) {
      // 碎片兑换座驾
      resMountExchange = await MountRepos.exchange(
          serialId: widget.serialId,
          type: 'mount',
          pieceId: widget.pieceItem.id);
    } else {
      // 碎片兑换碎片
      resMountExchange = await MountRepos.exchange(
          serialId: widget.serialId,
          type: 'debris',
          pieceId: widget.pieceItem.id,
          toId: _selectedItem!.id);
    }
    if (resMountExchange.success) {
      Navigator.pop(context);
      String tip = _exchangeMount
          ? widget.pieceItem.mountName
          : '${_selectedItem!.name}X1';
      String icon =
          _exchangeMount ? widget.pieceItem.mountImg : _selectedItem!.img;
      if (_exchangeMount) {
        Tracker.instance.track(TrackEvent.exchange_mounts, properties: {
          'mount_name': widget.pieceItem.mountName,
        });
      } else {
        Tracker.instance.track(TrackEvent.exchange_mounts_piece, properties: {
          'piece_name': _selectedItem!.name,
        });
      }
      MountPieceExchangeSuccessDialog.show(context, icon, tip);
      eventCenter.emit(mountPieceCountChanged, widget.serialId);
    } else {
      Fluttertoast.showCenter(msg: resMountExchange.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 484.dp,
      width: Util.width,
      padding: EdgeInsetsDirectional.only(
          start: 12.dp,
          bottom: (Util.bottomMargin > 0 ? Util.bottomMargin : 10.dp),
          top: 16.dp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.dp)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80.dp,
                height: 80.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF0E00FF).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(6.dp),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.pieceItem.img,
                  width: 61.dp,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(width: 16.dp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pieceItem.name,
                    style: TextStyle(
                        color: const Color(0xFF202020),
                        fontSize: 16.dp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4.dp),
                  Row(
                    children: [
                      R.img(Assets.vip$mount_ic_mount_piece_png,
                          width: 28.dp, height: 28.dp),
                      SizedBox(width: 2.dp),
                      Text(
                        'X${widget.pieceItem.num}',
                        style: TextStyle(
                            color: const Color(0xFF6113CA),
                            fontSize: 14.dp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.dp),
          Text(
            '选中兑换类型',
            style: TextStyle(
                color: R.color.secondTextColor,
                fontSize: 13.dp,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 8.dp),
          Row(children: [
            _renderParentItem(widget.pieceItem.mountName, true),
            SizedBox(width: 12.dp),
            _renderParentItem('兑换其他碎片', false),
          ]),
          if (!_exchangeMount) ..._renderPieceList(),
          const Spacer(),
          _renderButton(),
        ],
      ),
    );
  }

  /// 碎片类型
  List<Widget> _renderPieceList() {
    return [
      SizedBox(height: 18.dp),
      Text(
        '兑换其他碎片类型',
        style: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 13.dp,
            fontWeight: FontWeight.normal),
      ),
      SizedBox(height: 8.dp),
      Wrap(
        spacing: 12.dp,
        runSpacing: 8.dp,
        children: _pieceList
            .mapIndexed(
              (index, e) => _renderPieceItem(e),
            )
            .toList(),
      ),
    ];
  }

  Widget _renderParentItem(String title, bool isMountSwitch) {
    double width = (Util.width - 12.dp * 4) / 3;
    bool selected = (isMountSwitch && _exchangeMount) ||
        (!isMountSwitch && !_exchangeMount);
    return GestureDetector(
      onTap: () {
        setState(() {
          _exchangeMount = isMountSwitch;
        });
      },
      child: Container(
        width: width,
        height: 46.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF6113CA).withOpacity(0.08)
              : const Color(0xFF202020).withOpacity(0.05),
          borderRadius: BorderRadius.circular(8.dp),
          border: selected
              ? Border.all(color: const Color(0xFF6113CA), width: 1.dp)
              : null,
        ),
        child: Text(
          '${title}X1',
          style: TextStyle(
              color:
                  selected ? const Color(0xFF6113CA) : R.color.secondTextColor,
              fontSize: 13.dp,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal),
        ),
      ),
    );
  }

  Widget _renderPieceItem(MountDebrisBagItem item) {
    double width = (Util.width - 12.dp * 4) / 3;
    bool selected = item.id == _selectedItem?.id;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = item;
        });
      },
      child: Container(
        width: width,
        height: 46.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF6113CA).withOpacity(0.08)
              : const Color(0xFF202020).withOpacity(0.05),
          borderRadius: BorderRadius.circular(8.dp),
          border: selected
              ? Border.all(color: const Color(0xFF6113CA), width: 1.dp)
              : null,
        ),
        child: Text(
          '${item.name}X1',
          style: TextStyle(
              color:
                  selected ? const Color(0xFF6113CA) : R.color.secondTextColor,
              fontSize: 13.dp,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal),
        ),
      ),
    );
  }

  /// 兑换按钮
  Widget _renderButton() {
    int needCount = 0;
    String name;
    if (_exchangeMount) {
      needCount = widget.pieceItem.exchangeMountNum;
      name = widget.pieceItem.mountName;
    } else {
      needCount = _selectedItem?.exchangeNum ?? 0;
      name = _selectedItem?.name ?? '';
    }

    return GestureDetector(
      onTap: () async {
        bool? result = await showDialog(
          context: context,
          builder: (context) {
            return ConfirmDialog(
              content: '确定要兑换$name？',
              positiveButton: PositiveButton(
                text: baseK.K.sure,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              negativeButton: NegativeButton(
                text: baseK.K.cancel,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            );
          },
        );
        if (result == true && mounted) {
          _exchange();
        }
      },
      child: Container(
        width: double.infinity,
        height: 52.dp,
        margin: EdgeInsetsDirectional.only(end: 12.dp),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFFB146D1),
            Color(0xFF7D2EE6),
            Color(0xFF5E10C7)
          ]),
          borderRadius: BorderRadius.circular(26.dp),
        ),
        child: Text(
          '消耗$needCount个${widget.pieceItem.name}',
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.dp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
