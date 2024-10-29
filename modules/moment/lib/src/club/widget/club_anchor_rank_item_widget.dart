import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../model/club_anchor_rank_beans.dart';

class ClubAnchorRankItemWidget extends StatelessWidget {
  final int index;
  final ClubAnchorRankItem rankItem;
  final GestureTapCallback onTap;

  const ClubAnchorRankItemWidget(this.index, this.rankItem, this.onTap,
      {super.key});

  Widget _buildIndex() {
    return Container(
      height: 23,
      width: 36,
      alignment: Alignment.center,
      child: Text(
        '${index + 1}',
        maxLines: 1,
        style: TextStyle(fontSize: 13, color: R.color.thirdTextColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.color.mainBgColor,
      padding: EdgeInsetsDirectional.only(
          top: index == 3 ? 20 : 10, bottom: 10, start: 2, end: 18),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            _buildIndex(),
            _buildIcon(context),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 250),
                    child: Text(
                      rankItem.name ?? '',
                      style: TextStyle(
                          fontSize: 16,
                          color: R.color.mainTextColor,
                          fontFamily: 'PingFang SC'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  if (!NobilityUtil.titleIsInvalid(rankItem.titleNew))
                    UserNobilityWidget(
                      titleNew: rankItem.titleNew,
                    ),
                  if (rankItem.vipLevel > 0)
                    UserVipWidget(vip: rankItem.vipLevel),
                ]),
                buildScoreText(rankItem),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return CommonAvatarWithFrame(
      childWidget: CommonAvatar(
        path: rankItem.icon,
        shape: BoxShape.circle,
        size: 52,
      ),
      uid: 0,
    );
  }
}

Widget buildScoreText(ClubAnchorRankItem rankItem, {Color? textColor}) {
  return Text(
    rankItem.text ?? '',
    style: TextStyle(
      color: textColor ?? R.color.thirdBrightColor,
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
  );
}
