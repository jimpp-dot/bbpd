import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import '../pia_drama_repo.dart';

typedef OnGiftChange = Function(PiaJuBenPayNeed gift);
typedef OnDefaultPay = Function(PiaJuBenPayNeed defaultGift);

/// 礼物设置Widget
class EditGiftList extends StatefulWidget {
  /// 已选礼物及个数
  final PiaJuBenPayNeed? selectGiftAndNum;

  /// type: 1.设置接待费  2.表演费用
  final int type;

  /// 新增剧本时，只能设置GS表演费用，默认接待费由服务端下发（礼物接口下发）
  final OnDefaultPay? onDefaultPay;
  final OnGiftChange onGiftChange;

  const EditGiftList({
    Key? key,
    required this.selectGiftAndNum,
    required this.type,
    this.onDefaultPay,
    required this.onGiftChange,
  }) : super(key: key);

  @override
  EditGiftState createState() {
    return EditGiftState();
  }
}

class EditGiftState extends State<EditGiftList> {
  List<PiaJuBenPayConfig>? giftConfig;

  int selectId = -1;
  late int selectNum;
  int selectPrice = 0;
  int selectIndex = 0;
  String selectIcon = '';
  String selectName = '';

  double giftWidth = 58;
  double giftPadding = 12;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    selectNum = widget.selectGiftAndNum?.giftNum ?? 1;
    _scrollController = ScrollController(keepScrollOffset: true);

    load();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant EditGiftList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if ((selectId != (widget.selectGiftAndNum?.giftId ?? 0)) ||
        (selectNum != (widget.selectGiftAndNum?.giftNum ?? 0))) {
      initSelectGift();
    }
  }

  void load() async {
    ResPiaJuBenPayConfig res =
        await PiaDramaRepo.getGiftConfig(type: widget.type);
    if (res.success) {
      giftConfig = res.data.list;

      if (widget.onDefaultPay != null) {
        widget.onDefaultPay!(res.data.defaultPay);
      }
    }
    initSelectGift();
  }

  void initSelectGift() {
    /// 刷新选中的gift，并滑动到当前屏幕展示
    if (Util.validList(giftConfig) &&
        selectId != (widget.selectGiftAndNum?.giftId ?? 0)) {
      selectId = (widget.selectGiftAndNum?.giftId ?? 0);
      refreshGiftList();
    }

    if (mounted) {
      setState(() {
        selectNum = (widget.selectGiftAndNum?.giftNum ?? 0);
      });
    }
  }

  void refreshGiftList() {
    if (Util.validList(giftConfig)) {
      int index =
          giftConfig!.indexWhere((element) => element.giftId == selectId);
      bool needCallBack = false;
      if (index < 0) {
        /// 未在礼物列表中,或者新增剧本时，强制选中第一个
        selectNum = 1;
        index = 0;
        selectId = giftConfig![index].giftId;
        needCallBack = true;
      }

      selectIndex = index;
      selectPrice = giftConfig![index].giftPrice;
      selectIcon = giftConfig![index].giftIcon;
      selectName = giftConfig![index].giftName;
      scrollToIndex();

      if (needCallBack) {
        callback();
      }
    }
  }

  void scrollToIndex() {
    int scrollIndex = 0;

    if (selectIndex >= giftConfig!.length - 4) {
      scrollIndex = giftConfig!.length - 4;
    } else if (selectIndex > 2) {
      scrollIndex = selectIndex - 2;
    }

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.animateTo((giftPadding + giftWidth) * scrollIndex,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: 130,
      child: Util.validList(giftConfig) ? buildBody() : null,
    );
  }

  int get totalMoney => selectPrice * selectNum;

  Widget buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          width: Util.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            padding: const EdgeInsetsDirectional.only(start: 16),
            itemBuilder: (context, index) {
              PiaJuBenPayConfig gift = giftConfig![index];
              return GestureDetector(
                onTap: () {
                  setSelectIndex(index);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: giftPadding),
                  child: buildGift(gift, index),
                ),
              );
            },
            itemCount: giftConfig!.length,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              K.room_drama_price,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            Image.asset(MoneyConfig.moneyIcon, width: 18, height: 18),
            Text(
              MoneyConfig.moneyNum(totalMoney, fractionDigits: 2),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: _reduce,
              child: Container(
                width: 32,
                height: 24,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.3), width: 1),
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(8),
                    bottomStart: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  '-',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    height: 1.1,
                  ),
                ),
              ),
            ),
            Container(
              width: 46,
              height: 24,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                border: BorderDirectional(
                  top: BorderSide(
                      color: Colors.white.withOpacity(0.3), width: 1),
                  bottom: BorderSide(
                      color: Colors.white.withOpacity(0.3), width: 1),
                ),
              ),
              child: Text(
                "$selectNum",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
            ),
            GestureDetector(
              onTap: _add,
              child: Container(
                width: 32,
                height: 24,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.3), width: 1),
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(8),
                    bottomEnd: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  "+",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildGift(PiaJuBenPayConfig gift, int index) {
    String priceStr = MoneyConfig.moneyNum(Util.parseInt(gift.giftPrice));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              width: giftWidth,
              height: giftWidth,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
            ),
            PositionedDirectional(
              top: 4,
              start: 9,
              child: CachedNetworkImage(
                placeholder: const CupertinoActivityIndicator(),
                imageUrl: Util.getRemoteImgUrl(gift.giftIcon) +
                    Util.getGiftUrlSuffix(),
                width: 40,
                height: 40,
                cachedWidth: Util.getCommonCacheSize(60),
                cachedHeight: Util.getCommonCacheSize(60),
                fit: BoxFit.contain,
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              child: Container(
                width: giftWidth,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(4),
                    topEnd: Radius.circular(4),
                    bottomStart: Radius.circular(12),
                    bottomEnd: Radius.circular(12),
                  ),
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  gift.giftName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (selectIndex == index)
              Container(
                width: giftWidth,
                height: giftWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadiusDirectional.circular(12),
                  border: Border.all(color: R.color.mainBrandColor, width: 1),
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(MoneyConfig.moneyIcon, width: 15, height: 15),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: giftWidth),
              child: Text(
                priceStr,
                style: const TextStyle(
                  color: Color(0xFF62CAFF),
                  fontSize: 12,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void setSelectIndex(int index) {
    if (selectIndex == index) return;

    setState(() {
      selectIndex = index;
      selectId = giftConfig![index].giftId;
      selectPrice = giftConfig![index].giftPrice;
      selectIcon = giftConfig![index].giftIcon;
      selectName = giftConfig![index].giftName;
    });
    callback();
  }

  _add() {
    if (selectNum >= giftConfig![selectIndex].max) {
      return;
    }
    setState(() {
      selectNum++;
    });
    callback();
  }

  _reduce() {
    if (selectNum <= giftConfig![selectIndex].min) {
      return;
    }
    setState(() {
      selectNum--;
    });
    callback();
  }

  void callback() {
    widget.onGiftChange(PiaJuBenPayNeed(
      giftIcon: selectIcon,
      giftId: selectId,
      giftName: selectName,
      giftNum: selectNum,
      giftPrice: selectPrice,
    ));
  }
}
