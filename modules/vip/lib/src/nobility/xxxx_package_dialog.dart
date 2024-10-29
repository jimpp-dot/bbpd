import 'package:shared/shared.dart';
import 'package:shared/widget/custom_count_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:vip/assets.dart';
import 'package:vip/k.dart';

import 'model/pb/generated/slp_nobility_activity.pb.dart';
import 'model/pb/slp_title_repo.dart';

/// 惺惺相惜礼包弹窗
class XXXXPackageDialog extends StatefulWidget {
  const XXXXPackageDialog({super.key});

  static bool _showing = false;

  static Future show(BuildContext context) {
    if (_showing) return Future.value(0);
    _showing = true;
    return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) {
        return const AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: XXXXPackageDialog(),
        );
      },
    );
  }

  @override
  State<XXXXPackageDialog> createState() => _XXXXPackageDialogState();
}

class _XXXXPackageDialogState extends State<XXXXPackageDialog> {
  int selectIndex = 1;
  bool active = true;

  RespGiftBagDetail? _respActivityData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.emit(EventConstant.EventActivityDataUpdate);
    XXXXPackageDialog._showing = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: Loading());
    }
    return _buildBody();
  }

  bool _isLoading = false;

  Future<void> _loadData() async {
    _isLoading = true;
    _respActivityData = await SlpTitleRepo.getNobleActivityData(3);
    _isLoading = false;
    if (_respActivityData?.success ?? false) {
      if (mounted) {
        setState(() {});
      }
    } else {
      if (mounted) {
        Navigator.maybePop(context);
        Fluttertoast.showToast(msg: _respActivityData?.msg ?? '');
      }
    }
  }

  Widget _buildBody() {
    double ratio = Util.width / 375.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            R.img(Assets.x4_x4_dialog_bg_webp,
                width: 280 * ratio,
                height: 350 * ratio,
                package: Assets.package),
            PositionedDirectional(
              top: -28 * ratio,
              end: 0,
              child: R.img(Assets.x4_x4_dialog_fg_webp,
                  width: 154.5 * ratio,
                  height: 136 * ratio,
                  package: Assets.package),
            ),
            PositionedDirectional(
              start: 4 * ratio,
              end: 4 * ratio,
              bottom: 19 * ratio,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(R.imagePath(Assets.x4_x4_content_bg_webp,
                      package: Assets.package)),
                  fit: BoxFit.contain,
                )),
                width: 266 * ratio,
                height: 243 * ratio,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 13 * ratio,
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [
                            Color(0xFF00201C),
                            Color(0xFF004940),
                            Color(0xFF00201C)
                          ],
                        ).createShader(bounds,
                            textDirection: TextDirection.ltr);
                      },
                      blendMode: BlendMode.srcATop,
                      child: const Text(
                        '叮当！恭喜收到小伙伴赠送的心意礼物啦～\n趁热打铁，赶紧给TA也准备一份小惊喜吧！',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 22 * ratio,
                    ),
                    SizedBox(
                      height: 78 * ratio,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _respActivityData!.cherishData.rewards
                            .mapIndexed((index, e) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectIndex = index;
                                    });
                                  },
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60 * ratio,
                                          height: 60 * ratio,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                10 * ratio),
                                            border: selectIndex == index
                                                ? Border.all(
                                                    color:
                                                        const Color(0xFF00C1AB))
                                                : null,
                                            gradient: LinearGradient(
                                                colors: selectIndex == index
                                                    ? [
                                                        const Color(0xFFDBFFED),
                                                        const Color(0xFFC0F0EA)
                                                      ]
                                                    : [
                                                        const Color(0xFFEDFAF5),
                                                        const Color(0xFFE9F5EE)
                                                      ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter),
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                Util.getRemoteImgUrl(e.icon),
                                            width: 50 * ratio,
                                            height: 50 * ratio,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6 * ratio,
                                        ),
                                        Text(
                                          e.name,
                                          style: TextStyle(
                                              fontSize: 12,
                                              height: 1,
                                              fontWeight: selectIndex == index
                                                  ? FontWeight.w600
                                                  : FontWeight.w400,
                                              color: selectIndex == index
                                                  ? const Color(0xFF007063)
                                                  : const Color(0x80007063)),
                                        ),
                                      ]),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 24 * ratio,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!active) return;
                        await _buyBag();
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 212 * ratio,
                            height: 45 * ratio,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(R.imagePath(
                                  active
                                      ? Assets.x4_x4_button_bg_webp
                                      : Assets.x4_x4_button_disable_bg_webp,
                                  package: Assets.package)),
                              fit: BoxFit.fill,
                            )),
                            child: active &&
                                    _respActivityData!
                                        .cherishData.rewards.isNotEmpty
                                ? Container(
                                    alignment: const Alignment(-0.45, 0),
                                    child: SizedBox(
                                      width: 60 * ratio,
                                      child: Text(
                                        '${_respActivityData!.cherishData.rewards[selectIndex].price}',
                                        textAlign: TextAlign.end,
                                        style: Util.numStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF3E3907),
                                        ),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          PositionedDirectional(
                            top: 0,
                            start: 0,
                            child: Container(
                              width: 78 * ratio,
                              height: 18 * ratio,
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(R.imagePath(
                                    Assets.x4_x4_button_badge_webp,
                                    package: Assets.package)),
                                fit: BoxFit.fill,
                              )),
                              child: _buildCountDownWidget(
                                  _respActivityData!.cherishData.left),
                            ),
                          ),
                          PositionedDirectional(
                            top: -20 * ratio,
                            end: -16 * ratio,
                            child: R.img(Assets.x4_x4_button_fg_webp,
                                width: 47, height: 47, package: Assets.package),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24 * ratio,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: R.img(
              Assets.ic_dialog_close_webp,
              width: 48,
              height: 48,
              package: Assets.package,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCountDownWidget(int time) {
    return CustomCountDownWidget(
      counter: time,
      customChild: (int hour, int min, int second) {
        print("$hour, $min, $second");
        if (hour <= 0 && min <= 0 && second <= 0) {
          active = false;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            if (mounted) {
              setState(() {});
            }
          });
        }
        return Text(
          '限时福利 ${hour.toString().padLeft(2, '0')}:${min.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}',
          style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFeatures: [FontFeature.tabularFigures()]),
        );
      },
    );
  }

  // 购买礼包
  Future _buyBag() async {
    GiftBagRewardData item =
        _respActivityData!.cherishData.rewards[selectIndex];
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(context, item.price); // 价格是钻
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    payManager.pay(context,
        key: 'gift-bag',
        type: result.value?.key ?? '',
        args: {
          'money': item.price,
          'type': 'gift-bag',
          'params': {'type': '1', 'buy_id': item.id}
        },
        onPayed: () {
          Fluttertoast.showCenter(msg: K.buy_success);
          Navigator.of(context).pop();
          eventCenter.emit(EventConstant.EventActivityBuySuccess, {'type': 3});
        },
        onError: (_) => Fluttertoast.showCenter(msg: K.buy_fail));
  }
}
