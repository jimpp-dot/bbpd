import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../../assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/k.dart' as BaseK;
import '../../../protobuf/generated/gift_red_packet.pb.dart';
import 'gift_red_envelope_repo.dart';
import 'package:provider/provider.dart' hide Selector;

/// 礼物红包抢结果弹窗
class GiftRedEnvelopeResultDialog extends StatefulWidget {
  final int redId;
  const GiftRedEnvelopeResultDialog({Key? key, required this.redId})
      : super(key: key);

  @override
  State<GiftRedEnvelopeResultDialog> createState() =>
      _GiftRedEnvelopeResultDialogState();

  static Future show(BuildContext context, int redId) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color(0xB3000000),
      builder: (context) => GiftRedEnvelopeResultDialog(redId: redId),
    );
  }
}

class _GiftRedEnvelopeResultDialogState
    extends State<GiftRedEnvelopeResultDialog> {
  bool isGaped = true; // 是否抢到了
  String givenContent = '';
  String giftName = '';
  String giftIcon = '';
  int totalNum = 0;
  int receivedNum = 0;
  RedEnvelopeUserModel redEnvelopeUserModel = RedEnvelopeUserModel();
  int _pageIndex = 0;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _loadMessage();
  }

  _loadMessage({bool isPullToFefresh = false}) async {
    if (loading) {
      return;
    }
    loading = true;
    try {
      ResRedPacketDetail response = await GiftRedEnvelopeRepo.redPacketDetail(
          isPullToFefresh ? 0 : _pageIndex, widget.redId);
      if (response.success) {
        givenContent = response.data.redAuthorText;
        giftName = response.data.goodsText;
        totalNum = response.data.redSum;
        giftIcon = response.data.goodsIcon;
        receivedNum = response.data.robNum;
        isGaped = response.data.isAlreadyRob;
        if (isPullToFefresh) {
          _pageIndex = 0;
          redEnvelopeUserModel.redPacketUserList.clear();
        }
        _pageIndex++;
        redEnvelopeUserModel.redPacketUserList.addAll(response.data.user);
      }
    } finally {
      loading = false;
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 360.dp,
            width: 280.dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.dp),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFC2D4),
                  Color(0xFFFFE6E0),
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
            child: Column(
              children: [
                isGaped ? gotTopWidget() : failedGapTopWidget(),
                Container(
                  height: 22.5.dp,
                  alignment: AlignmentDirectional.centerStart,
                  margin: EdgeInsetsDirectional.only(start: 16.5.dp),
                  child: Text(
                    K.has_received_number(['$receivedNum', '$totalNum']),
                    style: TextStyle(
                        fontSize: 10.dp,
                        color: const Color(0x80000000),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                _buildGapListWidget(),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: -78.dp,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: R.img(
                  RoomAssets.chat_room$gift_red_envelope_close_result_webp,
                  width: 48.dp,
                  height: 48.dp,
                  fit: BoxFit.contain),
            ),
          ),
          // Your other children go here
        ],
      ),
    );
  }

  Widget gotTopWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        R.img(RoomAssets.chat_room$gift_red_envelope_got_head_bg_webp,
            width: 280.dp, height: 121.dp, fit: BoxFit.contain),
        PositionedDirectional(
            top: 51.dp,
            child: Column(
              children: [
                Text(
                  givenContent,
                  style: TextStyle(
                      fontSize: 12.dp,
                      color: const Color(0xE6FFFFFF),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 4.dp),
                Row(
                  children: [
                    R.img(Util.getRemoteImgUrl(giftIcon),
                        fit: BoxFit.fill, width: 20.dp, height: 20.dp),
                    SizedBox(width: 3.dp),
                    Text(
                      giftName,
                      style: TextStyle(
                          fontSize: 20.dp,
                          color: const Color(0xE6FFFFFF),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                // SizedBox(height: 6.dp),
                Text(
                  K.put_on_package,
                  style: TextStyle(
                      fontSize: 10.dp,
                      color: const Color(0x80FFFFFF),
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
      ],
    );
  }

  Widget failedGapTopWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        R.img(RoomAssets.chat_room$gift_red_envelope_gap_finished_head_bg_webp,
            width: 280.dp, height: 91.dp, fit: BoxFit.contain),
        PositionedDirectional(
          top: 51.dp,
          child: Text(
            givenContent,
            style: TextStyle(
                fontSize: 12.dp,
                color: const Color(0xE6FFFFFF),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Widget _buildGapListWidget() {
    return RefreshIndicatorFactory.of(
      backgroundColor: R.color.mainBgColor,
      child: ChangeNotifierProvider<RedEnvelopeUserModel>.value(
        value: redEnvelopeUserModel,
        child: Consumer<RedEnvelopeUserModel>(
          builder: (context, model, child) {
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  // 上拉翻页
                  _loadMessage();
                }
                return false;
              },
              child: redEnvelopeUserModel.redPacketUserList.isNotEmpty
                  ? SizedBox(
                      height: isGaped ? 200.dp : 220.dp,
                      child: ListView.builder(
                        padding: EdgeInsetsDirectional.zero,
                        itemBuilder: (BuildContext context, int index) {
                          return _redEnvelopeUserItem(
                              redEnvelopeUserModel.redPacketUserList[index]);
                        },
                        itemCount:
                            redEnvelopeUserModel.redPacketUserList.length,
                      ),
                    )
                  : hasNoDataWidget(),
            );
          },
        ),
      ),
      onRefresh: () async {
        // 下拉刷新
        _loadMessage(isPullToFefresh: true);
      },
    );
  }

  Widget _redEnvelopeUserItem(RedPacketUser user) {
    return Container(
      height: 43.dp,
      width: 280.dp,
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      decoration: user.uid == Session.uid
          ? const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x29FF356E), Color(0x00FF356E)],
              ),
            )
          : null,
      child: Row(
        children: [
          CommonAvatar(
            shape: BoxShape.circle,
            path: user.icon,
            size: 26.dp,
          ),
          SizedBox(
            width: 6.dp,
          ),
          Text(user.name,
              style: TextStyle(
                  color: user.uid == Session.uid
                      ? const Color(0xFFFF356E)
                      : const Color(0xE6000000),
                  fontWeight: FontWeight.w400,
                  fontSize: 11.dp)),
          const Spacer(),
          R.img(Util.getRemoteImgUrl(user.giftIcon),
              fit: BoxFit.fill, width: 20.dp, height: 20.dp),
        ],
      ),
    );
  }

  Widget hasNoDataWidget() {
    return SingleChildScrollView(
      child: Center(
        child: GestureDetector(
          onTap: () {
            _loadMessage();
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 50.0, bottom: 120, start: 16, end: 16),
            child: Text(
              BaseK.K.no_data,
              textAlign: TextAlign.center,
              style:
                  R.textStyle.caption.copyWith(color: const Color(0x66313131)),
            ),
          ),
        ),
      ),
    );
  }
}

class RedEnvelopeUserModel with ChangeNotifier {
  final List<RedPacketUser> _redPacketUserList = [];

  List<RedPacketUser> get redPacketUserList => _redPacketUserList;
}
