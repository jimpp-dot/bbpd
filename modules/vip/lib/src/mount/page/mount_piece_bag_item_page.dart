import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/assets.dart';
import 'package:vip/src/mount/model/mount_repos.dart';
import 'package:vip/src/mount/page/mount_piece_exchange_sheet.dart';
import 'package:vip/src/mount/pb/generated/mount.pb.dart';

/// 单个座驾碎片页面
class MountPieceBagItemPage extends StatefulWidget {
  final List<MountDebrisBagItem>? pieceList;
  final MountDebrisBagTab mount;
  final ValueChanged<bool> onRefreshCallback;

  const MountPieceBagItemPage(
      {super.key,
      this.pieceList,
      required this.mount,
      required this.onRefreshCallback});

  @override
  State<MountPieceBagItemPage> createState() => _MountPieceBagItemPageState();
}

class _MountPieceBagItemPageState extends State<MountPieceBagItemPage>
    with BaseScreenStateMixin {
  final List<MountDebrisBagItem> _list = [];

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(mountPieceCountChanged, _onPieceExchange);
    if (widget.pieceList != null && widget.pieceList!.isNotEmpty) {
      _list.addAll(widget.pieceList!);
      screenStatus = ScreenStatus.Ready;
    } else {
      _loadData();
    }
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(mountPieceCountChanged, _onPieceExchange);
  }

  /// 碎片变化
  void _onPieceExchange(String type, dynamic data) {
    widget.onRefreshCallback(true);
    _loadData();
  }

  Future _loadData() async {
    ResMountDebrisBag resData =
        await MountRepos.getMountPiece(widget.mount.serialId);
    if (!mounted) return;
    _list.clear();
    if (resData.success) {
      if (resData.data.tabList.isNotEmpty) {
        for (MountDebrisBagItem piece in resData.data.debrisList) {
          _list.add(piece);
        }
      }
      setScreenReady();
    } else {
      setScreenError(errorMsg: resData.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildStatusContent();
  }

  @override
  Widget buildContent() {
    return GridView.builder(
        itemCount: _list.length,
        padding:
            EdgeInsetsDirectional.only(start: 12.dp, end: 12.dp, top: 12.dp),
        physics: const ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.dp,
          childAspectRatio: 109 / 153,
        ),
        itemBuilder: (context, index) {
          return _itemBuilder(context, _list[index], index);
        });
  }

  Widget _itemBuilder(
      BuildContext context, MountDebrisBagItem item, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        MountPieceExchangeSheet.launch(context,
            serialId: widget.mount.serialId, pieceItem: item, pieceList: _list);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 109.dp,
                height: 109.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8.dp),
                ),
                child: CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(item.img),
                    width: 72.dp,
                    fit: BoxFit.fitWidth),
              ),
              PositionedDirectional(
                top: 4.dp,
                start: 4.dp,
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                      start: 6.dp, end: 6.dp, top: 2.dp, bottom: 2.dp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.dp),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Row(
                    children: [
                      R.img(Assets.vip$mount_ic_mount_piece_png,
                          width: 20.dp, height: 20.dp),
                      Text(
                        'X${item.num}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.dp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 44.dp,
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(top: 8.dp),
            alignment: AlignmentDirectional.topCenter,
            child: Text(
              item.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.dp),
            ),
          ),
        ],
      ),
    );
  }
}
