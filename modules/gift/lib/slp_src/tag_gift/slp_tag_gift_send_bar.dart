import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/model/pb/slp_gift_extension.dart';
import 'package:gift/k.dart';
import 'package:gift/slp_src/widget/slp_gift_num_select_widget.dart';

import '../../assets.dart';

class RoomTagGiftSendBar extends StatefulWidget {
  final List<BbGiftPanelChooseNumConfig>? chooseNumConfig;
  final BbGiftPanelData? panelData;
  final Function(int selectGiftNum) selectGiftNumDidChange;
  final Function() send;

  const RoomTagGiftSendBar(this.chooseNumConfig, this.panelData,
      this.selectGiftNumDidChange, this.send,
      {Key? key})
      : super(key: key);

  @override
  State<RoomTagGiftSendBar> createState() => _RoomTagGiftSendBarState();
}

class _RoomTagGiftSendBarState extends State<RoomTagGiftSendBar> {
  final GlobalKey _selectNumKey = GlobalKey();
  int _selectGiftNum = 1;
  int realTotalMoney = 0;

  void refreshBalance(String type, dynamic data) {
    if (mounted) {
      setState(() {
        BbGiftPanelData panelData = data as BbGiftPanelData;
        realTotalMoney = panelData.extend.totalMoney;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    realTotalMoney = widget.panelData?.extend.totalMoney ?? 0;
    widget.selectGiftNumDidChange(_selectGiftNum);

    eventCenter.addListener(
        EventConstant.EventGiftPanelDataDidRefreshNotice, refreshBalance);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(
        EventConstant.EventGiftPanelDataDidRefreshNotice, refreshBalance);
  }

  @override
  Widget build(BuildContext context) {
    void switchNum() async {
      RenderBox rowRenderBox =
          _selectNumKey.currentContext?.findRenderObject() as RenderBox;
      Offset? offset = rowRenderBox
          .localToGlobal(Offset(rowRenderBox.size.width / 2.0, -20));
      SlpGiftNumSelectWidget.show(
              context, widget.chooseNumConfig, _selectGiftNum, offset)
          .then((value) {
        if (Util.parseInt(value?[0]) > 0) {
          if (mounted) {
            setState(() {
              _selectGiftNum = value![0];
              widget.selectGiftNumDidChange(_selectGiftNum);
            });
          }
        }
      });
    }

    List<Widget> widgets = [];
    double ratio = min(Util.ratio, 1);
    double numMaxWidth = 68 * Util.ratio;

    widgets = [
      Image.asset(MoneyConfig.moneyIcon, width: 24 * ratio, height: 24 * ratio),
      SizedBox(width: 2 * ratio),
      Container(
        constraints: BoxConstraints(maxWidth: numMaxWidth),
        child: FittedBox(
          fit: BoxFit.contain,
          child: NumText(
            MoneyConfig.moneyNum(realTotalMoney, fractionDigits: 2),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15 * ratio,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      // GestureDetector(
      //   onTap: () {
      //     ISettingManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
      //     manager.openRechargeScreen(context, refer: 'gift');
      //   },
      //   child: Padding(
      //     padding: EdgeInsetsDirectional.only(start: 4 * ratio, end: 4 * ratio),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: <Widget>[
      //         Text(
      //           K.gift_recharge,
      //           style: TextStyle(
      //             color: R.color.mainBrandColor,
      //             fontSize: 15 * ratio,
      //             fontWeight: FontWeight.w600,
      //           ),
      //         ),
      //         Icon(
      //           Icons.navigate_next,
      //           color: R.color.mainBrandColor,
      //           size: 18 * ratio,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    ];

    widgets.addAll([
      const Spacer(),
      // 选择数量
      GestureDetector(
        onTap: switchNum,
        child: Container(
          width: 60 * ratio,
          height: 30 * ratio,
          decoration: BoxDecoration(
            border: Border.all(color: R.color.mainBrandColor, width: 1),
            borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(16 * ratio),
                    bottomStart: Radius.circular(16 * ratio))
                .resolve(Directionality.of(context)),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(end: 4 * ratio),
                child: Text(
                  "x$_selectGiftNum",
                  style: TextStyle(
                    color: R.color.mainBrandColor,
                    fontSize: 13 * ratio,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              R.img(Assets.ic_up_arrow_svg,
                  width: 16 * ratio,
                  height: 16 * ratio,
                  color: R.color.mainBrandColor,
                  package: ComponentManager.MANAGER_GIFT,
                  key: _selectNumKey),
            ],
          ),
        ),
      ),
      // 赠送按钮
      GestureDetector(
        onTap: widget.send,
        child: Container(
          width: 60 * ratio,
          height: 30 * ratio,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(16 * ratio),
              bottomEnd: Radius.circular(16 * ratio),
            ),
          ),
          child: Text(
            K.give_something,
            style: TextStyle(
                color: Colors.white,
                fontSize: 13 * ratio,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ]);

    return Container(
      padding: EdgeInsets.only(left: 16 * ratio, right: 16 * ratio),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: widgets,
      ),
    );
  }
}
