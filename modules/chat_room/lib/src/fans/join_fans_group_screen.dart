import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/fans/model/fans_group_beans.dart';
import 'package:chat_room/src/fans/repo/fans_group_repository.dart';

import '../../assets.dart';
import '../../k.dart';

/// 送礼物加入粉丝团弹窗
class JoinFansGroupScreen extends StatefulWidget {
  final int uid;

  final int rid;

  final String? icon;

  const JoinFansGroupScreen(
      {Key? key, required this.uid, required this.rid, this.icon})
      : super(key: key);

  @override
  _JoinFansGroupScreenState createState() => _JoinFansGroupScreenState();

  static Future<bool?> show(BuildContext context,
      {int uid = 0, required int rid, String? icon}) {
    return displayModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isBarrierDismissible: true,
        builder: (BuildContext context) {
          return JoinFansGroupScreen(
            uid: uid,
            rid: rid,
            icon: icon,
          );
        });
  }
}

class _JoinFansGroupScreenState extends BaseScreenState<JoinFansGroupScreen> {
  JoinFansGroup? _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    JoinFansGroupResp resp = await FansGroupRepo.getJoinFansGroup(widget.rid);
    if (resp.success == true) {
      _data = resp.data;
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        R.img(RoomAssets.chat_room$join_fans_top_bg_png,
            package: RoomAssets.package,
            width: Util.width,
            height: Util.width * 100 / 375,
            fit: BoxFit.fitWidth),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    if (_data != null) _buildAvatar(),
                    if (_data != null) _buildRank()
                  ],
                ).paddingOnly(left: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_data?.name}的粉丝团',
                      style: TextStyle(
                          fontSize: 16,
                          color: R.color.mainTextColor,
                          fontWeight: FontWeight.w500),
                    ).paddingOnly(left: 12),
                    Text(
                      '团成员：${_data?.fansNum}人',
                      style: TextStyle(
                          fontSize: 12,
                          color: R.color.mainTextColor,
                          fontWeight: FontWeight.w500),
                    ).paddingOnly(left: 12),
                  ],
                ).paddingOnly(top: 32),

                //
              ],
            ),
            _buildInfoContent()
          ],
        )
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: CommonAvatar(
        path: _data?.icon,
        size: 55,
        shape: BoxShape.circle,
        loadingWidget: const CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildRank() {
    return Positioned(
      top: 60,
      left: 0,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFFF48C1), Color(0xFFFF4EA3)]),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Center(
          child: Text(
            K.room_fans_group_rank_week(['${_data!.rank}']),
            style: const TextStyle(color: Colors.white, fontSize: 8),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContent() {
    return Container(
        // constraints:
        //     isScreenReady() ? null : const BoxConstraints(minHeight: 260),
        padding:
            EdgeInsetsDirectional.only(top: 25, bottom: Util.iphoneXBottom + 4),
        child: buildStatusContent());
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          '粉丝团权益',
          style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.4)),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _data!.rights.map((e) => _buildWelfare(e)).toList(),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: _pay,
          child: Container(
            height: 58,
            width: 293,
            margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: (R.img(RoomAssets.chat_room$fans_add_zuan_shi_png,
                          width: 293,
                          height: 58,
                          package: RoomAssets.package) as Image)
                      .image,
                  fit: BoxFit.fill),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    K.room_join_send_gift(['${_data!.gift?.name}']),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '(${_getGiftPrice()}${MoneyConfig.moneyName})',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildWelfare(FansRight fansRight) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonAvatar(
          path: fansRight.icon,
          size: 48,
          shape: BoxShape.circle,
        ),
        const SizedBox(height: 2),
        Text(
          fansRight.name ?? '',
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        const SizedBox(height: 2),
        Text(
          fansRight.desc ?? '',
          style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 12),
        ),
      ],
    );
  }

  int _getGiftPrice() {
    return (_data!.gift!.price * 100).round();
  }

  void _pay() async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? callback =
        await payManager.showRechargeSheet(context, _getGiftPrice());

    if (callback == null || callback.reason == SheetCloseReason.Active) {
      return;
    }

    if (callback.value?.key == IPayManager.pTRecharge) {
      return;
    }

    payManager.pay(context,
        key: 'gift',
        type: callback.value?.key ?? '',
        refer: 'gift',
        args: {
          'money': _getGiftPrice(),
          'type': 'package',
          'params': {
            'rid': widget.rid,
            'uids': _data!.uid,
            'live_uid': _data!.uid,
//              'positions': _getSelectPosition().join(','),
//              'position': _getMyPosition(),
            'giftId': _data!.gift!.id,
            'giftNum': 1,
            'price': _getGiftPrice(),
            'cid': _data!.gift!.cid,
            'ctype': 'gift',
            'duction_money': 0,
            'version': 2,
            'num': 1,
            'gift_type': _data!.gift!.giftType,
            'star': 0,
            'refer': 'fans.group:room',
          }
        },
        onPayed: _onPayed,
        onError: (isErrorCatch) => _onPayError(isErrorCatch));
  }

  void _onPayed() {
    Log.d('JoinFansGroupScreen_onPayEd');
    //Tracker.instance.track(TrackEvent.join_fans_group, properties: {'anchor_uid': _data.uid});
    Fluttertoast.showToast(msg: K.room_join_fans_group_success_msg);
    if (ModalRoute.of(context)?.isCurrent == true) {
      Navigator.of(context).pop(true);
    }
  }

  _onPayError(bool e) {
    Log.d('JoinFansGroupScreen_onPayError');
    //eventCenter.emit(RoomConstant.EVENT_JOIN_FANS_GROUP_SUCCESS, '');
  }
}
