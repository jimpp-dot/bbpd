import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/api/healer_api.dart';
import 'package:personaldata/src/healer/healer_up_card_count_select_widget.dart';
import 'package:personaldata/src/healer/healer_up_card_send_tip_dialog.dart';
import 'package:personaldata/src/model/pb/generated/healer.pb.dart';

import '../../k.dart';

/// 聊愈师使用弹窗
class HealerUseSheet extends StatefulWidget {
  final int uid;
  final String uname;

  const HealerUseSheet({super.key, required this.uid, required this.uname});

  static Future show(BuildContext context, int uid, String uname) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return HealerUseSheet(uid: uid, uname: uname);
      },
    );
  }

  @override
  State<HealerUseSheet> createState() => _HealerUseSheetState();
}

class _HealerUseSheetState extends State<HealerUseSheet>
    with BaseScreenStateMixin {
  final GlobalKey<HealerUpCardCountSelectWidgetState> _countKey = GlobalKey();

  late HealerCardData _cardData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    ResHealerCardInfo resp = await HealerApi.userCardInfo();
    if (resp.success) {
      _cardData = resp.data;
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  /// 赠送
  Future _send() async {
    int count = _countKey.currentState?.count ?? 1;
    if (count > _cardData.cardCount) {
      bool? result = await HealerUpCardSentTipDialog.show(
          context, _cardData, count - _cardData.cardCount);
      if (result == true && mounted) {
        _loadData();
      }
      return;
    }
    NormalNull normalNull = await HealerApi.sendCard(widget.uid, count);
    if (!mounted) return;
    if (normalNull.success) {
      Fluttertoast.showCenter(msg: K.healer_send_successful);
      Navigator.pop(context);
    } else {
      Fluttertoast.showCenter(msg: normalNull.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      constraints: const BoxConstraints(minHeight: 300, maxHeight: 540),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
      ),
      child: Stack(children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(21)),
          child: CachedNetworkImage(
            imageUrl: 'static/healer/bg_healer_send_head.webp',
            width: Util.width,
            fit: BoxFit.fitWidth,
            cachedWidth: Util.width.px,
          ),
        ),
        buildStatusContent(),
      ]),
    );
  }

  @override
  Widget buildContent() {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 18),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 56),
                Text(
                  K.healer_us_up_title,
                  style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                _cardData.docUrl.isNotEmpty
                    ? GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          BaseWebviewScreen.show(context,
                              url: _cardData.docUrl);
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 16, end: 16),
                          child: R.img(Assets.personaldata$ic_question_webp,
                              width: 24, height: 24),
                        ),
                      )
                    : const SizedBox(width: 56),
              ],
            ),
            Text(
              K.healer_use_up_desc([widget.uname]),
              style: TextStyle(color: R.color.mainTextColor, fontSize: 12),
            ),
            const SizedBox(height: 20),
            Container(
              width: 150,
              height: 150,
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: CachedNetworkImage(
                  imageUrl: _cardData.icon, width: 120, height: 120),
            ),
            const SizedBox(height: 16),
            HealerUpCardCountSelectWidget(key: _countKey),
            const SizedBox(height: 8),
            Text(K.healer_cost_up_count,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            Text('${K.healer_my_up_count}${_cardData.cardCount}',
                style: TextStyle(color: R.color.mainTextColor, fontSize: 12)),
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 16,
                  end: 16,
                ),
                child: Text(_cardData.desc,
                    style:
                        TextStyle(color: R.color.tipsTextColor, fontSize: 12))),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _send,
              child: Container(
                width: Util.width - 16 * 2,
                height: 52,
                margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                child: Text(K.sure,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(height: Util.bottomMargin),
          ],
        ),
      ),
    );
  }
}
