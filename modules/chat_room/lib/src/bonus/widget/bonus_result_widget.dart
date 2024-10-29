import 'package:shared/assets.dart';
import 'package:shared/model/loading_widget.dart';
import 'package:flutter/material.dart';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';
import 'package:chat_room/src/bonus/model/bonus_repo.dart';
import 'package:chat_room/src/bonus/model/bonus_util.dart';
import 'package:chat_room/src/bonus/widget/bonus_theme.dart';

class BonusResultDialog extends StatelessWidget {
  final int rid;
  final int bonusId;

  const BonusResultDialog({Key? key, required this.bonusId, required this.rid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Spacer(),
            IconButton(
                icon: R.img(BaseAssets.shared$box_ic_close_svg),
                onPressed: () => Navigator.pop(context)),
          ],
        ),
        Container(
          width: 312.dp,
          height: 465.dp,
          decoration: BoxDecoration(
              color: const Color(0xFFFFFCF5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1CC9E), width: 1)),
          child: Stack(
            children: [
              R.img(RoomAssets.chat_room$bonus_bg_bonus_result_header_webp,
                  width: 312.dp),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LoadingWidget<BonusResult>(
                  futureBuilder: () => BonusRepo.getBonusResult(bonusId, rid),
                  builder: (context, result) => BonusResultWidget(
                    result: result,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static show(BuildContext context, int bonusId, int rid) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Material(
            color: Colors.transparent,
            child: BonusResultDialog(
              bonusId: bonusId,
              rid: rid,
            )));
  }
}

class BonusResultWidget extends StatelessWidget {
  final BonusResult result;

  const BonusResultWidget({Key? key, required this.result}) : super(key: key);

  Widget _buildAvatar() {
    return CommonAvatar(
      path: result.creator?.icon,
      shape: BoxShape.circle,
      size: 64,
    );
  }

  Widget _buildName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            result.creator?.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, color: Color(0xFF744639)),
          ),
        ),
        Text(
          K.room_whoes_bonus,
          maxLines: 1,
          style: const TextStyle(fontSize: 16, color: Color(0xFF744639)),
        ),
      ],
    );
  }

  bool get hasMoney => (result.money) > 0;

  List<Widget> _buildMoney(BuildContext context) {
    return [
      if (hasMoney)
        RichText(
          text: TextSpan(
              text: BonusUtil.getMoneyStr(result.money),
              style: TextStyle(
                  fontSize: 48,
                  color: BonusTheme.hlColor,
                  fontFamily: Util.numFontFamily),
              children: [
                TextSpan(
                  text: MoneyConfig.moneyName,
                  style: TextStyle(
                      fontSize: 18,
                      color: BonusTheme.hlColor,
                      fontFamily: Util.numFontFamily),
                ),
              ]),
        ),
      if (result.cont?.isNotEmpty ?? false)
        Text(
          '${result.cont}',
          style: TextStyle(
              fontSize: 18,
              color: hasMoney ? const Color(0x99744639) : BonusTheme.hlColor,
              fontFamily: Util.numFontFamily),
        ),
    ];
  }

  Widget _buildDesc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 0.5,
          color: const Color(0x1A744639),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          result.desc ?? '',
          style: const TextStyle(fontSize: 11, color: Color(0x99744639)),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          width: 40,
          height: 0.5,
          color: const Color(0x1A744639),
        ),
      ],
    );
  }

  Widget _buildList() {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => BonusResultItemWidget(
                item: result.list[index],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
          itemCount: result.list.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 42,
        ),
        _buildAvatar(),
        const SizedBox(
          height: 12,
        ),
        _buildName(),
        ..._buildMoney(context),
        const SizedBox(
          height: 20,
        ),
        _buildDesc(),
        const SizedBox(
          height: 12,
        ),
        _buildList(),
      ],
    );
  }
}

class BonusResultItemWidget extends StatelessWidget {
  final BonusGrabItem item;

  const BonusResultItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonAvatar(
          path: item.icon,
          size: 44,
          shape: BoxShape.circle,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            item.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, color: Color(0xFF744639)),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '${BonusUtil.getMoneyStr(item.money)}${MoneyConfig.moneyName}',
          style: const TextStyle(fontSize: 13, color: BonusTheme.hlColor),
        ),
      ],
    );
  }
}
