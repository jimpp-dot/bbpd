import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_beans.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_repos.dart';

import 'juke_music_base_state.dart';
import 'juke_order_pay_mixin.dart';

/// 点歌确认
class JukeMusicOrderConfirmWidget extends StatefulWidget {
  final int rid;
  final int songId;

  const JukeMusicOrderConfirmWidget(
      {super.key, required this.rid, required this.songId});

  static void open(BuildContext context, int rid, int songId) async {
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        disableTapDismissible: true,
        maxHeightRatio: 1,
        builder: (BuildContext context) {
          return JukeMusicOrderConfirmWidget(rid: rid, songId: songId);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
  }

  @override
  _JukeMusicOrderConfirmWidgetState createState() =>
      _JukeMusicOrderConfirmWidgetState();
}

class _JukeMusicOrderConfirmWidgetState
    extends JukeMusicBaseState<JukeMusicOrderConfirmWidget>
    with JukeOrderPayMixin<JukeMusicOrderConfirmWidget> {
  JukeOrderInfo? _data;

  @override
  int get totalPrice => _data!.totalPrice;

  /// 加载数据
  @override
  Future<void> loadData() async {
    DataRsp dataRsp =
        await JukeMusicRepos.orderConfirmInfo(widget.rid, widget.songId);
    _data = dataRsp.data;
    if (_data == null) {
      setScreenError(
          errorMsg: dataRsp.msg, errorMsgColor: Colors.white.withOpacity(0.6));
    } else {
      setScreenReady();
    }
  }

  /// 支付
  void _pay() {
    pay('available');
  }

  @override
  Map getPayParam() {
    return {
      'money': totalPrice,
      'type': 'slp-consume',
      'params': {
        'consume_type': 'music_order',
        'rid': widget.rid,
        'order_songs': [
          {'song_id': widget.songId, 'singer_id': _data?.singer?.uid ?? 0}
        ],
      }
    };
    // List<JukePayTarget> targets = [];
    //
    // if (_data.roomCharge != null) {
    //   JukeCharge roomCharge = _data.roomCharge;
    //   targets.add(JukePayTarget(
    //       uid: roomCharge.uid,
    //       giftId: roomCharge.giftId,
    //       giftNum: roomCharge.giftCount,
    //       giftType: roomCharge.giftType,
    //       giftPrice: roomCharge.giftPrice,
    //       type: 'room'));
    // }
    // if (_data.userCharge != null) {
    //   JukeCharge userCharge = _data.userCharge;
    //   targets.add(JukePayTarget(
    //       uid: userCharge.uid,
    //       giftId: userCharge.giftId,
    //       giftNum: userCharge.giftCount,
    //       giftType: userCharge.giftType,
    //       giftPrice: userCharge.giftPrice,
    //       type: 'singer'));
    // }
    // return {
    //   'money': totalPrice,
    //   'type': 'room-music-order',
    //   'params': {
    //     'rid': widget.rid,
    //     'song_id': widget.songId,
    //     'targets': jsonEncode(targets),
    //   }
    // };
  }

  @override
  Widget buildTitle() {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          width: double.infinity,
          height: 56.dp,
          alignment: AlignmentDirectional.center,
          child: Text(
            K.room_juke_order_confirm,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        PositionedDirectional(
          child: GestureDetector(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
              child: R.img(RoomAssets.chat_room$jukemusic_ic_juke_back_png,
                  width: 24.dp, height: 24.dp),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 413.dp + Util.iphoneXBottom,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(RoomAssets.chat_room$jukemusic_juke_bg_webp),
            fit: BoxFit.fill),
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16.dp)),
      ),
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      child: buildBody(),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 276.dp,
          margin: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      RoomAssets.chat_room$jukemusic_bg_order_confirm_png))),
          child: Column(
            children: [
              _renderInfo(),
              _renderCost(),
              Container(
                width: double.infinity,
                height: 50.dp,
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsetsDirectional.only(start: 18.dp),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      K.room_juke_total_cost,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 9.dp),
                    Text(
                      '$totalPrice',
                      style: const TextStyle(
                          color: Color(0xff62CAFF),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 2.dp),
                    R.img(MoneyConfig.moneyIcon, width: 12.dp, height: 12.dp),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.dp),
        GestureDetector(
          onTap: _pay,
          child: Container(
            width: Util.width - 20.dp * 2,
            height: 52.dp,
            padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
              borderRadius: BorderRadius.circular(26.dp),
            ),
            child: Text(
              K.room_confirm_and_pay,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  /// 歌手信息、点唱歌曲信息
  Widget _renderInfo() {
    JukeMusicOrder? info = _data?.singer;
    return Container(
      width: double.infinity,
      height: 68.dp,
      margin: EdgeInsetsDirectional.only(top: 8.dp, bottom: 12.dp, start: 8.dp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 68.dp,
                height: 68.dp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(12.dp)),
                ),
                child: CommonAvatar(
                    path: info?.icon ?? '',
                    size: 68.dp,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.horizontal(
                        start: Radius.circular(12.dp)),
                    fit: BoxFit.cover),
              ),
              PositionedDirectional(
                start: -3.dp,
                bottom: -3.dp,
                child: R.img(RoomAssets.chat_room$jukemusic_ic_tag_png,
                    width: 29.dp, height: 29.dp),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsetsDirectional.only(start: 8.dp),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      info?.songName ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 28.dp,
                        alignment: AlignmentDirectional.centerStart,
                        padding:
                            EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color(0xff180021).withOpacity(0.63),
                            const Color(0xff280A32).withOpacity(0.35),
                            const Color(0xff32103E).withOpacity(0)
                          ]),
                        ),
                        child: Text(
                          '${K.room_juke_singer}: ${info?.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 房间礼金、点歌费用
  Widget _renderCost() {
    JukeCharge? roomCharge = _data?.roomCharge;
    JukeCharge? userCharge = _data?.userCharge;
    return Container(
      width: double.infinity,
      height: 136.dp,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (roomCharge != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.room_juke_room_price,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 12),
                ),
                SizedBox(height: 14.dp),
                SizedBox(
                  width: 58.dp,
                  height: 58.dp,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                          imageUrl: roomCharge.giftIcon,
                          width: 58.dp,
                          height: 58.dp),
                      PositionedDirectional(
                        end: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsetsDirectional.only(
                              top: 1.dp, bottom: 1.dp, start: 5.dp, end: 5.dp),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDA252),
                            borderRadius: BorderRadius.circular(8.dp),
                          ),
                          child: Text(
                            'x${roomCharge.giftCount}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.dp),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${roomCharge.totalPrice}',
                      style: const TextStyle(
                          color: Color(0xFF62CAFF),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 2.dp),
                    R.img(MoneyConfig.moneyIcon, width: 12.dp, height: 12.dp),
                  ],
                )
              ],
            ),
          if (userCharge != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.room_juke__music_order_price,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 12),
                ),
                SizedBox(height: 14.dp),
                SizedBox(
                  width: 58.dp,
                  height: 58.dp,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                          imageUrl: userCharge.giftIcon,
                          width: 58.dp,
                          height: 58.dp),
                      PositionedDirectional(
                        end: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsetsDirectional.only(
                              top: 1.dp, bottom: 1.dp, start: 5.dp, end: 5.dp),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDA252),
                            borderRadius: BorderRadius.circular(8.dp),
                          ),
                          child: Text(
                            'x${userCharge.giftCount}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.dp),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${userCharge.totalPrice}',
                      style: const TextStyle(
                          color: Color(0xFF62CAFF),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 2.dp),
                    R.img(MoneyConfig.moneyIcon, width: 12.dp, height: 12.dp),
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}
