import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_beans.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_repos.dart';

import 'juke_gift_list_mixin.dart';

/// 房间点歌礼金设置
class JukeRoomPriceSetting extends StatefulWidget {
  final int rid;

  const JukeRoomPriceSetting({super.key, required this.rid});

  static void open(BuildContext context, int rid) async {
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        disableTapDismissible: true,
        builder: (BuildContext context) {
          return JukeRoomPriceSetting(rid: rid);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
  }

  @override
  _JukeRoomPriceSettingState createState() => _JukeRoomPriceSettingState();
}

class _JukeRoomPriceSettingState extends State<JukeRoomPriceSetting>
    with JukeGiftListMixin {
  bool _loading = true;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    setState(() {
      _loading = true;
    });
    DataRsp dataRsp = await JukeMusicRepos.getSetting(widget.rid);
    _errorMsg = dataRsp.msg;
    List<JukeMusicGiftSetting> list = dataRsp.data;
    setGiftData(list);
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  /// 设置点唱礼物
  _submit() async {
    bool success = await JukeMusicRepos.setJukeGift(
        rid: widget.rid, giftId: selectItem!.giftId, giftCount: count);
    if (mounted && success) {
      Navigator.maybePop(context);
      Fluttertoast.showToast(msg: K.room_juke_price_set_success);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (_loading) {
      content = const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (giftList == null) {
      content = Center(
        child: Text(
          _errorMsg ?? K.network_lost_retry,
          style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
        ),
      );
    } else {
      content = _renderBody();
    }

    return Container(
      width: double.infinity,
      height: 268.dp + Util.iphoneXBottom,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.dp)),
        color: R.color.mainBgColor,
      ),
      child: content,
    );
  }

  Widget _renderBody() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 54.dp,
          alignment: AlignmentDirectional.center,
          child: Text(K.room_juke_music_price_setting,
              style: R.textStyle.title.copyWith(fontSize: 16)),
        ),
        Container(
          width: double.infinity,
          height: 0.5.dp,
          color: R.color.dividerColor,
        ),
        SizedBox(height: 10.dp),
        Container(
          width: double.infinity,
          height: 86.dp,
          alignment: AlignmentDirectional.centerStart,
          child: renderGiftList(),
        ),

        /// 礼物
        Container(
          width: double.infinity,
          height: 0.5.dp,
          margin: EdgeInsetsDirectional.only(start: 18.dp, end: 18.dp),
          color: R.color.dividerColor,
        ),
        SizedBox(height: 10.dp),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 18.dp),
            Text(K.room_juke_gift_cost,
                style: R.textStyle.body1.copyWith(fontSize: 16)),
            SizedBox(width: 8.dp),
            Text('${K.room_total}${selectItem!.giftPrice * count}',
                style: R.textStyle.body2.copyWith(fontSize: 13)),
            SizedBox(width: 2.dp),
            R.img(MoneyConfig.moneyIcon, width: 12.dp, height: 12.dp),
            const Spacer(),
            Container(
              width: 110.dp,
              height: 24.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.dp),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      reduceOne();
                    },
                    child: Container(
                      width: 32.dp,
                      height: 24.dp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.horizontal(
                            start: Radius.circular(8.dp)),
                        color: count <= selectItem!.min
                            ? R.color.mainBrandColor.withOpacity(0.2)
                            : R.color.mainBrandColor.withOpacity(0.5),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: R.img(
                          RoomAssets.chat_room$jukemusic_ic_minus_small_png,
                          width: 16.dp,
                          height: 16.dp),
                    ),
                  ),
                  Container(
                    width: 46.dp,
                    height: 24.dp,
                    color: R.color.mainBrandColor.withOpacity(0.5),
                    child: Container(
                      width: 42.dp,
                      height: 20.dp,
                      margin: EdgeInsets.all(2.dp),
                      alignment: AlignmentDirectional.center,
                      color: R.color.mainBgColor,
                      child: Text('$count',
                          style: R.textStyle.title.copyWith(fontSize: 13)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      addOne();
                    },
                    child: Container(
                      width: 32.dp,
                      height: 24.dp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.horizontal(
                            end: Radius.circular(8.dp)),
                        color: count >= selectItem!.max
                            ? R.color.mainBrandColor.withOpacity(0.2)
                            : R.color.mainBrandColor.withOpacity(0.5),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: R.img(
                          RoomAssets.chat_room$jukemusic_ic_add_small_png,
                          width: 16.dp,
                          height: 16.dp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 18.dp),
          ],
        ),
        SizedBox(height: 20.dp),
        GestureDetector(
          onTap: _submit,
          child: Container(
            width: 335.dp,
            height: 52.dp,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
              borderRadius: BorderRadius.circular(26.dp),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(K.room_confirm,
                style: R.textStyle.title
                    .copyWith(fontSize: 16, color: Colors.white)),
          ),
        ),
        SizedBox(height: 8.dp),
      ],
    );
  }
}
