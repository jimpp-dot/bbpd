import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';

class PkHistoryItemWidget extends StatelessWidget {
  final PkHistoryItem item;
  final PageRefer? refer;

  const PkHistoryItemWidget({super.key, required this.item, this.refer});

  static double get widgetHeight {
    return 200;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10),
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 16, bottom: 16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          gradient: LinearGradient(
              colors: [Color(0xFFF0F8FF), Color(0xFFFEF4FF)],
              begin: FractionalOffset(1, 0),
              end: FractionalOffset(0, 1))),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(
              //胜负
              start: 0,
              top: 0,
              child: _winLoseCornerMark(context)),
          PositionedDirectional(
            top: 32,
            width: Util.width - 32,
            child: _buildHeaderBattle(context),
          ),
          PositionedDirectional(
            end: 8,
            top: 8,
            child: Text(
              Utility.getDateDiff(item.pkTime),
              style: TextStyle(fontSize: 11, color: Colors.black),
            ),
          ),
          PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 0,
              height: 20,
              child: PkScoreWidget(
                item.anchorScore.toDouble(),
                item.competeScore.toDouble(),
                height: 20,
                marginLR: 0,
              )),
        ],
      ),
    );
  }

  _winLoseCornerMark(BuildContext context) {
    return Container(
        width: 40,
        height: 16,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(R.imagePath(_getCornerMarkImgPath()),
              package: ComponentManager.MANAGER_RANK),
          fit: BoxFit.fill,
        )),
        child: Text(_getCornerMarkTitle(),
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
            )));
  }

  _getCornerMarkImgPath() {
    if (item.win == 1) {
      return Assets.pk_pk_rank_history_win_webp;
    } else if (item.win == 2) {
      return Assets.pk_pk_rank_history_lose_webp;
    } else {
      return Assets.pk_pk_rank_history_tie_webp;
    }
  }

  _getCornerMarkTitle() {
    if (item.win == 1) {
      return K.pk_win;
    } else if (item.win == 2) {
      return K.pk_lose;
    } else {
      return K.pk_tie;
    }
  }

  _buildUserWidget(BuildContext context, int uid, String icon, String name) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, uid, refer: refer);
          },
          child: CommonAvatar(
            path: icon,
            size: 64,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ],
    );
  }

  _buildPkWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 8),
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          R.img(Assets.pk_pk_rank_history_pk_webp,
              width: 86 / 2,
              height: 116 / 2,
              package: ComponentManager.MANAGER_RANK),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 87,
            height: 24,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                  R.imagePath(Assets.pk_pk_rank_history_punish_webp),
                  package: ComponentManager.MANAGER_RANK),
              fit: BoxFit.fill,
            )),
            child: Text(
              item.punishContent,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontSize: 11, color: Colors.black.withOpacity(0.4)),
            ),
          ),
        ],
      ),
    );
  }

  _buildHeaderBattle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildUserWidget(
              context, item.anchorUid, item.anchorIcon, item.anchorName),
          flex: 1,
        ),
        Expanded(
          child: _buildPkWidget(),
          flex: 1,
        ),
        Expanded(
          child: _buildUserWidget(
              context, item.competeUid, item.competeIcon, item.competeName),
          flex: 1,
        ),
      ],
    );
  }
}
