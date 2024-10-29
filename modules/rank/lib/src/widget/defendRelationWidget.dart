import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';

import '../../k.dart';

/// 亲密关系 守护控件
class DefendRelationWidget extends StatelessWidget {
  final List<DefendRelationModel>? models;
  final VoidCallback? onPressed;

  const DefendRelationWidget({super.key, this.models, this.onPressed});

  Widget _buildItem(DefendRelationModel model) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            child: DefendRelationHeader(
              defendRelationModel: model,
              iconSize: 54,
              showBorderIcon: true,
            ),
          ),
          Container(
            width: 56,
            height: 18,
            alignment: AlignmentDirectional.center,
            child: Text(
              model.name ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: R.textStyle.regular12
                  .copyWith(color: R.color.secondTextColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmptyItem() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            child: Container(
              width: 56,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: BorderRadius.circular(28)),
              child: R.img(
                Assets.rank_relation_add_png,
                width: 20,
                height: 20,
                package: ComponentManager.MANAGER_RANK,
                color: R.color.mainTextColor,
              ),
            ),
          ),
          Container(
            width: 56,
            height: 18,
            alignment: AlignmentDirectional.center,
            child: Text(
              K.rank_buy_defend,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: R.textStyle.regular12
                  .copyWith(color: R.color.secondTextColor),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsetsDirectional.only(top: 10, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(18),
            color: R.color.mainBgColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      K.rank_defend_relation,
                      style: R.textStyle.title.copyWith(fontSize: 15),
                    ),
                  ),
                  if (models != null && models!.isNotEmpty)
                    R.img(
                      Assets.ic_next_svg,
                      width: 16,
                      height: 16,
                      color: R.color.mainTextColor.withOpacity(0.3),
                      package: ComponentManager.MANAGER_RANK,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: LimitedBox(
                maxHeight: 88,
                child: ListView(
                  padding:
                      const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: (models == null || models!.isEmpty)
                      ? [_buildEmptyItem()]
                      : models!.map((element) => _buildItem(element)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
