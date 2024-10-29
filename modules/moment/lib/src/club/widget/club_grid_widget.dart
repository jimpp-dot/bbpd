import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../k.dart';
import '../all_club_page.dart';
import '../club_detail_screen.dart';
import '../model/club_bean.dart';

/// 冲鸭在用 后期迁移到pb
///
class ClubGridWidget extends StatelessWidget {
  final List<ClubBean>? clubList;
  final bool showTitle;

  const ClubGridWidget({Key? key, this.clubList, this.showTitle = true})
      : super(key: key);

  List _handleList() {
    List list = [];
    if (clubList != null) {
      if (clubList!.length <= 5) {
        list = clubList!;
      } else if (clubList!.length < 10) {
        list = clubList!.sublist(0, 4);
        list.add(null); //最后显示"更多"
      } else if (clubList!.length == 10) {
        list = clubList!.sublist(0, 10);
      } else {
        list = clubList!.sublist(0, 9);
        list.add(null); //最后显示"更多"
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    if (Util.isCollectionEmpty(clubList)) {
      return const SizedBox.shrink();
    }
    List list = _handleList();
    int rowCount = 5;
    double mainAxisSpacing = 12;
    double crossAxisSpacing = 16;
    double itemSize =
        (Util.width - 18 * 2 - crossAxisSpacing * (rowCount - 1)) / rowCount;
    double height = list.length <= 5
        ? 24 + itemSize
        : (24 + itemSize) * 2 + mainAxisSpacing;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Text(
              K.moment_join_club,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        SizedBox(height: showTitle ? 12 : 8),
        SizedBox(
          width: Util.width,
          height: height,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: rowCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: itemSize / (24 + itemSize),
            padding: const EdgeInsetsDirectional.only(
                start: 18, end: 18, top: 0, bottom: 0),
            children: list.map((club) {
              return _clubItemView(context, itemSize, club);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _clubItemView(BuildContext context, double size, ClubBean? data) {
    String? name = data == null ? K.moment_more : data.name;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (data == null) {
          _onTapMore(context);
        } else {
          _onTapClub(context, data);
        }
      },
      child: SizedBox(
        height: size + 24,
        child: Column(
          children: [
            data == null
                ? R.img('club/ic_club_more.webp',
                    width: size,
                    height: size,
                    package: ComponentManager.MANAGER_MOMENT)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CommonAvatar(
                      path: data.icon ?? '',
                      size: size,
                      suffix: null,
                    ),
                  ),
            const Spacer(),
            Text(
              name ?? '',
              style: TextStyle(
                color: R.color.thirdTextColor,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _onTapClub(BuildContext context, ClubBean data) {
    ClubDetailScreen.show(context, data.clubId, clubName: data.name);
  }

  void _onTapMore(BuildContext context) {
    AllClubPage.show(context);
  }
}
