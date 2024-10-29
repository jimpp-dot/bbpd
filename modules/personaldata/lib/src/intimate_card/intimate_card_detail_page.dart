import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/api/intimate_card_api.dart';

///亲密卡IM消息卡片详情页
class IntimateCardDetailPage extends StatefulWidget {
  final int id;
  final int addMoney;
  final ValueChanged<int> onStatus;

  const IntimateCardDetailPage(
      {super.key,
      required this.id,
      required this.addMoney,
      required this.onStatus});

  @override
  State<IntimateCardDetailPage> createState() => _IntimateCardDetailPageState();

  static Future show(BuildContext context, int id, ValueChanged<int> onStatus,
      {int addMoney = 0}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => IntimateCardDetailPage(
          id: id, addMoney: addMoney, onStatus: onStatus),
      settings: const RouteSettings(name: '/IntimateCardDetailPage'),
    ));
  }
}

class _IntimateCardDetailPageState
    extends BaseScreenState<IntimateCardDetailPage> {
  static const int _statusToGet = 1; //待领取
  static const int _statusGot = 2; //已领取
  static const int _statusInvalid = 3; //已失效
  static const int _statusUnbound = 4; //已解绑

  late ResIntimateCardDetailData _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    setScreenLoading();
    _loadData();
  }

  void _loadData() async {
    final res = await IntimateCardApi.intimateCardDetailPage(widget.id);
    if (res.success) {
      _data = res.data;
      widget.onStatus(_data.card.status);
      setScreenReady();
    } else {
      setScreenError(errorMsg: res.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = const Color(0xFFF5F5F5);
    return Scaffold(
      appBar: BaseAppBar(K.intimacy_card_text, backgroundColor: bgColor),
      backgroundColor: bgColor,
      body: buildStatusContent(),
    );
  }

  @override
  Widget buildContent() {
    String targetName = _data.card.name;
    bool me = _data.card.isSend;
    String icon = _data.card.icon;
    String text = me
        ? K.send_name_intimacy_card([targetName])
        : K.x_send_to_me_intimate_card([targetName]);
    int money = widget.addMoney > 0 ? widget.addMoney : _data.card.totalMoney;
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            CommonAvatar(
              path: icon,
              size: 44,
              shape: BoxShape.circle,
              onTap: () {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, _data.card.uid);
              },
            ),
            const SizedBox(width: 9),
            Expanded(
                child: Text(text,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: R.color.mainTextColor))),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 18.5),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16),
              color: Colors.white),
          child: Stack(
            children: [
              PositionedDirectional(
                end: 0,
                child: R.img(
                    Assets
                        .personaldata$intimate_card_ic_intimate_card_detail_webp,
                    width: 100,
                    height: 100),
              ),
              Column(
                children: [
                  const SizedBox(height: 13),
                  Text(
                      _cycleDesc +
                          (widget.addMoney > 0 ? K.personal_new_add : '') +
                          K.intimacy_card_consume_limit,
                      style: R.textStyle.regular16),
                  const SizedBox(height: 11),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      R.img(MoneyConfig.moneyIcon,
                          width: 24, height: 24, wholePath: true),
                      const SizedBox(width: 10),
                      NumText(
                        '$money',
                        style: TextStyle(
                            fontSize: 36,
                            color: R.color.mainTextColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 0.5,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    color: Colors.black.withOpacity(0.06),
                  ),
                  _buildBottom(me),
                  const SizedBox(height: 8),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  String get _cycleDesc {
    if (_data.card.cycle == 1) {
      return K.everyday;
    } else if (_data.card.cycle == 2) {
      return K.every_week;
    } else if (_data.card.cycle == 3) {
      return K.every_month;
    } else {
      return '';
    }
  }

  Widget _buildGetBtn() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4),
      child: GradientButton(
        K.got_right_now,
        width: 82,
        height: 32,
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
        onTap: () async {
          CommonLoading.show();
          final res =
              await IntimateCardApi.intimateCardOperation(_data.card.cardId, 1);
          CommonLoading.dismiss();
          if (res.success) {
            _data.card.status = _statusGot;
            refresh();
            widget.onStatus(_data.card.status);
            Fluttertoast.showCenter(msg: K.got_success);
            Tracker.instance.track(TrackEvent.receive_card_sucess, properties: {
              'uid': Session.uid,
              'of_uid': _data.card.uid,
              'peiod': _cycleDesc,
              'account': _data.card.totalMoney
            });
          } else {
            Fluttertoast.showCenter(msg: res.msg);
          }
        },
      ),
    );
  }

  Widget _buildBottom(bool me) {
    if (_data.card.status == _statusToGet) {
      return Column(
        children: [
          const SizedBox(height: 8),
          me
              ? Text(K.wait_collect, style: R.textStyle.regular16)
              : _buildGetBtn(),
          SizedBox(height: me ? 0 : 4),
          Text(K.not_got_will_invalid,
              style: TextStyle(
                  fontSize: 11, color: Colors.black.withOpacity(0.5))),
        ],
      );
    } else if (_data.card.status == _statusGot) {
      if (me) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(top: 12, bottom: 4),
          child: Text(K.gift_wall_task_btn_5, style: R.textStyle.regular16),
        );
      } else {
        return Padding(
          padding: const EdgeInsetsDirectional.only(top: 12, bottom: 4),
          child: Container(
            width: 82,
            height: 32,
            decoration: const ShapeDecoration(
                shape: StadiumBorder(), color: Color(0xFFF7F8FA)),
            alignment: AlignmentDirectional.center,
            child: Text(K.gift_wall_task_btn_5,
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withOpacity(0.5))),
          ),
        );
      }
    } else if (_data.card.status == _statusInvalid) {
      return Column(
        children: [
          const SizedBox(height: 8),
          Text(K.personal_has_disable,
              style: TextStyle(
                  fontSize: 16, color: Colors.black.withOpacity(0.5))),
          const SizedBox(height: 0),
          Text(K.not_got_has_canceled,
              style: TextStyle(
                  fontSize: 11, color: Colors.black.withOpacity(0.5))),
        ],
      );
    } else if (_data.card.status == _statusUnbound) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 12, bottom: 4),
        child: Text(K.had_unbind,
            style:
                TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5))),
      );
    }
    return const SizedBox.shrink();
  }
}
