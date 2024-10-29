import 'package:chat_room/k.dart';
import 'package:chat_room/src/live/knight/knight_rank_widget.dart';
import 'package:chat_room/src/live/model/live_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class KnightInfoWidget extends StatefulWidget {
  final int rid;
  final int uid;
  final bool isLive;

  const KnightInfoWidget(this.rid, this.uid, this.isLive, {super.key});

  @override
  _KnightInfoWidgetState createState() => _KnightInfoWidgetState();

  static Future show(BuildContext context, int rid, int uid, bool isLive) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return KnightInfoWidget(rid, uid, isLive);
      },
    );
  }
}

class _KnightInfoWidgetState extends State<KnightInfoWidget> {
  ResKnightMine? _resKnightMine;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    _resKnightMine = await LiveRepository.getKnightMineData(widget.rid, widget.uid);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 44,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    KnightRankWidget.show(context, widget.rid, widget.uid, widget.isLive);
                  },
                  child: R.img('ic_black_back.webp', width: 24, height: 24, package: ComponentManager.MANAGER_BASE_ROOM),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(K.room_knight_detail, style: R.textStyle.medium14.copyWith(color: const Color(0xFF313131), fontSize: 15)),
                  ),
                ),
                const SizedBox(width: 24)
              ],
            ),
          ),
          _buildContent(),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_resKnightMine == null) {
      return Container(
        height: 100,
        alignment: AlignmentDirectional.center,
        child: const CupertinoActivityIndicator(),
      );
    }
    if (!_resKnightMine!.success) {
      return ErrorData(
        error: _resKnightMine!.msg,
        onTap: _loadData,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(colors: [Color(0xFF745EFB), Color(0xFFCB72FF)]),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: const Color(0x33FFFFFF), width: 2),
                ),
                alignment: AlignmentDirectional.center,
                child: CommonAvatar(
                  path: _resKnightMine!.icon,
                  size: 60,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            _resKnightMine!.name,
                            maxLines: 1,
                            style: R.textStyle.medium16.copyWith(color: Colors.white),
                          ),
                        ),
                        UserKnightWidget(knightLevel: _resKnightMine!.knightLevel),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            K.room_knight_week_score,
                            maxLines: 1,
                            style: R.textStyle.medium14.copyWith(color: Colors.white),
                          ),
                        ),
                        Text(
                          '${_resKnightMine!.knightScore}',
                          style: R.textStyle.medium14.copyWith(color: const Color(0xFFFFD04B), fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              if (_resKnightMine!.knightLevel > 0)
                Opacity(
                  opacity: 0.4,
                  child: R.img(
                    'ic_knight_big_${_resKnightMine!.knightLevel}.png',
                    width: 90,
                    height: 90,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          K.room_my_knight,
          style: R.textStyle.medium16.copyWith(color: const Color(0xFF313131)),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 4),
        ..._resKnightMine!.knightList.map((e) {
          return _buildItem(e);
        }).toList()
      ],
    );
  }

  Widget _buildItem(MeKnightItem item) {
    String iconPath = '';
    String contentStr = '';
    String btnStr = '';
    if (item.hasBuy) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(item.expireTime * 1000);
      DateTime dateNow = DateTime.now();
      int diff = dateTime.difference(dateNow).inDays + 1;
      iconPath = 'ic_knight_mid_${item.knightLevel}.png';
      contentStr = K.room_vaild_remain_day(['$diff']);
      btnStr = K.room_renew;
    } else {
      iconPath = 'ic_knight_mid_gray_${item.knightLevel}.png';
      contentStr = K.room_not_buy;
      btnStr = K.room_open_buy;
    }
    return Container(
      height: 72,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          R.img(iconPath, width: 48, height: 48, package: ComponentManager.MANAGER_BASE_ROOM),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.knightName,
                  style: R.textStyle.medium16.copyWith(color: const Color(0xFF313131)),
                ),
                const SizedBox(height: 2),
                Text(contentStr, style: R.textStyle.medium14.copyWith(color: const Color(0xFF313131).withOpacity(0.6))),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openBuyKnightScreen(context, level: item.knightLevel);
            },
            child: Container(
              width: 64,
              height: 32,
              alignment: AlignmentDirectional.center,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(colors: [Color(0xFFFF4C5C), Color(0xFFFF72D2)]),
              ),
              child: Text(btnStr, style: R.textStyle.regular14.copyWith(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
