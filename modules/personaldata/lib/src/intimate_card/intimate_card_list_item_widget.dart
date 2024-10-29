import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:personaldata/src/api/intimate_card_api.dart';
import 'package:personaldata/src/intimate_card/intimate_card_bind_page.dart';

import '../../k.dart';

class IntimateCardListItemWidget extends StatefulWidget {
  final IntimateCardInfo itemCardInfo;
  final Function(IntimateCardInfo cardInfo)? unbindSuccess;
  final VoidCallback? finishBindCard;
  const IntimateCardListItemWidget(
      {super.key,
      required this.itemCardInfo,
      this.unbindSuccess,
      this.finishBindCard});

  @override
  State<IntimateCardListItemWidget> createState() =>
      _IntimateCardListItemWidgetState();
}

class _IntimateCardListItemWidgetState
    extends State<IntimateCardListItemWidget> {
  final List<Color> _bgColor = [Colors.white, Colors.white];

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _buildItem(widget.itemCardInfo);
  }

  Widget _buildItem(IntimateCardInfo cardInfo) {
    List<Color>? gradientColors;
    if (cardInfo.color.isEmpty || Util.parseColors(cardInfo.color).length < 2) {
      gradientColors = _bgColor;
    } else {
      List<Color> colorList = Util.parseColors(cardInfo.color);
      gradientColors = colorList.map((e) => e.withOpacity(0.4)).toList();
    }
    return Stack(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(top: 6.dp, bottom: 6.dp),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.dp),
              gradient: LinearGradient(
                colors: gradientColors,
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Stack(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      CommonAvatar(
                        path: cardInfo.icon,
                        size: 44.dp,
                        shape: BoxShape.circle,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardInfo.isSend
                                  ? K.send_name_intimacy_card([cardInfo.name])
                                  : (cardInfo.name +
                                      K.send_intimacy_card_to_me),
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontSize: 16.dp,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  getCycleString(cardInfo.cycle) + K.all_quota,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 12.dp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                R.img(MoneyConfig.moneyIcon,
                                    width: 12.dp,
                                    height: 12.dp,
                                    wholePath: true),
                                NumText(
                                  cardInfo.totalMoney.toString(),
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 12.dp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (cardInfo.addMoney > 0) ...[
                                  Text(
                                    '（${K.temp_quota}',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 12.dp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  R.img(MoneyConfig.moneyIcon,
                                      width: 12.dp,
                                      height: 12.dp,
                                      wholePath: true),
                                  NumText(
                                    '${cardInfo.addMoney}）',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 12.dp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  if (cardInfo.status != 4)
                    PositionedDirectional(
                      top: 0,
                      end: 10.dp,
                      child: GestureDetector(
                        onTap: () {
                          _showUnbindDialog();
                        },
                        child: Container(
                          width: 28.dp,
                          height: 44.dp,
                          alignment: Alignment.topCenter,
                          child: Container(
                            // margin: const EdgeInsetsDirectional.only(top: -2),
                            height: 16.dp,
                            width: 28.dp,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(8.dp),
                            ),
                            child: Text(
                              K.unbind,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.2),
                                fontSize: 10.dp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 12),
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 5.dp),
                    child: Text(
                      K.last_quota,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 16.dp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  R.img(MoneyConfig.moneyIcon,
                      width: 24.dp, height: 24.dp, wholePath: true),
                  NumText(
                    cardInfo.leftMoney.toString(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 36.dp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Container(
                height: 0.5,
                color: R.color.dividerColor,
                margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
              ),
              SizedBox(
                height: 56.dp,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Text(
                      cardInfo.relation,
                      style: TextStyle(
                        color:
                            Util.parseColor(cardInfo.fontColor, Colors.black),
                        fontSize: 16.dp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    _getStatusWidget(cardInfo, cardInfo.isSend),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (cardInfo.status == 4)
          Positioned.fill(
            child: Container(
                margin: EdgeInsetsDirectional.only(top: 6.dp, bottom: 6.dp),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16.dp),
                )),
          ),
      ],
    );
  }

  Widget _getStatusWidget(IntimateCardInfo cardInfo, bool isSend) {
    if (cardInfo.status == 2) {
      if (isSend) {
        return GestureDetector(
          onTap: () {
            IntimateCardBindPage.launch(System.context,
                cardId: cardInfo.cardId, finishBindCard: widget.finishBindCard);
            Tracker.instance
                .track(TrackEvent.click_intimate_card_give_more, properties: {
              'uid': Session.uid,
              'to_uid': widget.itemCardInfo.uid,
            });
          },
          child: Container(
            width: 69.dp,
            height: 32.dp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.dp),
                color: Colors.white.withOpacity(0.9)),
            alignment: Alignment.center,
            child: Text(
              getStatusString(cardInfo.status, isSend, cardInfo.unbindTime),
              style: TextStyle(
                color: Colors.black.withOpacity(0.9),
                fontSize: 13.dp,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: () {
            requestStillWantCard();
            Tracker.instance
                .track(TrackEvent.click_intimate_card_want_more, properties: {
              'uid': Session.uid,
              'to_uid': widget.itemCardInfo.uid,
            });
          },
          child: Container(
            width: 69.dp,
            height: 32.dp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.dp),
                color: Colors.white.withOpacity(0.9)),
            alignment: Alignment.center,
            child: Text(
              getStatusString(cardInfo.status, isSend, cardInfo.unbindTime),
              style: TextStyle(
                color: Colors.black.withOpacity(0.9),
                fontSize: 13.dp,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }
    }

    return Text(
      getStatusString(cardInfo.status, isSend, cardInfo.unbindTime),
      style: TextStyle(
        color: (cardInfo.status == 3 || cardInfo.status == 4)
            ? Colors.black.withOpacity(0.5)
            : Colors.black.withOpacity(0.9),
        fontSize: 16.dp,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  void _showUnbindDialog() {
    showDialog(
        context: System.context,
        builder: (context) {
          return Center(
            child: Container(
              width: Util.width - 96.dp,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21.dp),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    K.unbind + K.intimacy_card_text,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 16.dp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 24.dp, end: 24.dp),
                    child: Text(
                      K.unbind_des,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 14.dp,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: Util.width - 96.dp,
                    height: 49.dp,
                    padding:
                        const EdgeInsetsDirectional.only(start: 24, end: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_isLoading) {
                              Fluttertoast.showCenter(msg: K.unbinding_wait);
                              return;
                            }
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 110.dp,
                            height: 48.dp,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffF7F8FA),
                              borderRadius: BorderRadius.circular(24.dp),
                            ),
                            child: Text(
                              K.cancel,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16.dp,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            requestUnbindCard(context);
                          },
                          child: Container(
                            width: 110.dp,
                            height: 48.dp,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color(0xffF7F8FA),
                                borderRadius: BorderRadius.circular(24.dp),
                                gradient: const LinearGradient(colors: [
                                  Color(0xffDD7AE6),
                                  Color(0xff8C35FF)
                                ])),
                            child: Text(
                              K.confirm_unbind,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.dp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          );
        });
  }

  String getCycleString(int cycle) {
    switch (cycle) {
      case 1:
        return K.everyday;
      case 2:
        return K.every_week;
      case 3:
        return K.every_month;
    }
    return '';
  }

  //1待领取，2已领取，3已失效，4已解绑
  String getStatusString(int cycle, bool isSend, int unBindTime) {
    switch (cycle) {
      case 1:
        return K.wait_collect;
      case 2:
        return isSend ? K.give_more : K.still_want;
      case 3:
        return K.had_expired;
      case 4:
        return '${K.had_unbind}(${DateTime.fromMillisecondsSinceEpoch(unBindTime * 1000).toyyyyMMdd(dateSplit: '.')})';
    }
    return '';
  }

  ///解绑
  Future<void> requestUnbindCard(BuildContext context) async {
    if (_isLoading) return;
    _isLoading = true;
    NormalNull normalNull = await IntimateCardApi.intimateCardOperation(
        widget.itemCardInfo.cardId, 2);
    _isLoading = false;
    if (normalNull.success) {
      if (widget.unbindSuccess != null) {
        widget.unbindSuccess!(widget.itemCardInfo);
      }
      Navigator.pop(context);
      Fluttertoast.showCenter(msg: K.unbind_success);

      Tracker.instance
          .track(TrackEvent.untie_intimate_card_success, properties: {
        'uid':
            widget.itemCardInfo.isSend ? Session.uid : widget.itemCardInfo.uid,
        'to_uid':
            widget.itemCardInfo.isSend ? widget.itemCardInfo.uid : Session.uid,
        'peiod': widget.itemCardInfo.cycle,
        'rest_account': widget.itemCardInfo.leftMoney,
      });
    } else {
      Fluttertoast.showCenter(msg: normalNull.msg);
    }
  }

  ///还想要
  Future<void> requestStillWantCard() async {
    if (_isLoading) return;
    _isLoading = true;
    NormalNull normalNull = await IntimateCardApi.intimateCardOperation(
        widget.itemCardInfo.cardId, 3);
    _isLoading = false;
    if (normalNull.success) {
      IChatManager chatManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(
        context,
        type: 'private',
        targetId: widget.itemCardInfo.uid,
        refer: 'intimate_card',
      );
    } else {
      Fluttertoast.showCenter(msg: normalNull.msg);
    }
  }
}
