import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/rankManager.dart';

/// cp item
class CpItem extends StatelessWidget {
  final Map data;
  final int index;

  const CpItem({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.0,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(
              index < 3 ? Assets.bg_rank_cp1_png : Assets.bg_rank_cp2_png,
              package: ComponentManager.MANAGER_RANK,
            ),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: <Widget>[
          _renderItem(context),
          _renderIndex(),
          PositionedDirectional(
            end: 4.0,
            top: 7.0,
            height: 19,
            child: Container(
              decoration: BoxDecoration(
                color: Util.parseInt(data['position']) == 1
                    ? const Color(0xFFFF5353)
                    : const Color(0x8027B5FF),
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(8.0),
                  topEnd: Radius.circular(8.0),
                  bottomEnd: Radius.circular(8.0),
                ),
              ),
              padding: const EdgeInsetsDirectional.only(start: 6, end: 7),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  R.img(
                    Assets.icon_day_png,
                    width: 15.0,
                    height: 12,
                    package: ComponentManager.MANAGER_RANK,
                  ),
                  const SizedBox(width: 3),
                  NumText(
                    _getDayString(),
                    textScaleFactor: 1.0,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderIndex() {
    int rank = Util.parseInt(data['rank']);
    if (rank <= 3) {
      return Container(
        alignment: Alignment.center,
        width: 46.0,
        padding: const EdgeInsets.only(left: 16),
        child: R.img(
          Assets.rank_rank_big_x_png(rank),
          width: 30.0,
          height: 27.0,
          package: ComponentManager.MANAGER_RANK,
        ),
      );
    } else {
      return Container(
        alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.only(left: 23),
        width: 46.0,
        child: Text(
          "${index + 1}",
          style: TextStyle(
              color: R.color.secondTextColor,
              fontSize: 17.0,
              fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  Widget _renderItem(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 50.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  RankManager.showImage(
                      context, data['defend'], const PageRefer('RankCp'));
                },
                child: CommonAvatar(
                  path: data['toicon'] ?? '',
                  size: 64,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                data['toname'] ?? '',
                maxLines: 1,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
              )
            ],
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          margin: const EdgeInsets.only(top: 24),
          child: R.img(
            Util.parseInt(data['position']) == 1
                ? Assets.rank_cp_png
                : Assets.rank_sweet_png,
            width: 71.0,
            height: 54.0,
            package: ComponentManager.MANAGER_RANK,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  RankManager.showImage(
                      context, data['uid'], const PageRefer('RankCp'));
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                  child: CachedNetworkImage(
                    imageUrl: "${System.imageDomain}${data['uicon']}",
                    suffix: '!head150',
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                data['uname'] ?? '',
                maxLines: 1,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
              )
            ],
          ),
        ),
        const SizedBox(width: 50.0),
      ],
    );
  }

  String _getDayString() {
    int seconds = Util.parseInt(data['dateline_expire']) -
        DateTime.now().millisecondsSinceEpoch ~/ 1000;
    String day;
    if (seconds >= 86400) {
      day = (seconds ~/ 86400).toString() + K.rank_day;
    } else if (seconds >= 3600) {
      day = (seconds ~/ 3600).toString() + K.rank_hour;
    } else {
      day = (seconds ~/ 60).toString() + K.rank_minute;
    }

    return day;
  }
}
