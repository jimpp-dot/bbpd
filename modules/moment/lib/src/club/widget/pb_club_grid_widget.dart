import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moment/k.dart';

import '../model/club_repo.dart';
import '../model/pb/generated/home_club_item.pb.dart';

class PbClubGridWidget extends StatefulWidget {
  final bool showTitle;

  const PbClubGridWidget({super.key, this.showTitle = true});

  @override
  State<PbClubGridWidget> createState() => PbClubGridWidgetState();
}

class PbClubGridWidgetState extends State<PbClubGridWidget> {
  List<HomeClubItem?> _clubs = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _load() async {
    _clubs.clear();
    ResClub rsp = await ClubRepo.getCircleClub();
    if (rsp.success) {
      Log.d('getCircleClub:${rsp.data.clubs}');
      _clubs = _handleList(rsp.data.clubs);
      if (mounted) setState(() {});
    } else {
      Log.d('getCircleClub error:${rsp.msg}');
    }
  }

  reload() {
    _load();
  }

  List<HomeClubItem?> _handleList(List<HomeClubItem> clubs) {
    List<HomeClubItem?> list = [];
    if (clubs.length <= 5) {
      list = clubs;
    } else if (clubs.length < 10) {
      list = clubs.sublist(0, 4);
      list.add(null); //最后显示"更多"
    } else if (clubs.length == 10) {
      list = clubs.sublist(0, 10);
    } else {
      list = clubs.sublist(0, 9);
      list.add(null); //最后显示"更多"
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    if (Util.isCollectionEmpty(_clubs)) {
      return const SizedBox.shrink();
    }
    List<HomeClubItem?> list = _clubs;
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
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
          child: Text(
            K.moment_join_club,
            style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
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
        Container(
          margin: const EdgeInsetsDirectional.only(
              start: 20, top: 24, end: 20, bottom: 12),
          height: 0.5,
          color: R.colors.dividerColor,
        ),
      ],
    );
  }

  Widget _clubItemView(BuildContext context, double size, HomeClubItem? data) {
    String name = data == null ? K.moment_more : data.name;
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
                : CommonAvatar(
                    path: data.icon,
                    borderRadius: BorderRadius.circular(12),
                    size: size,
                    suffix: null),
            const Spacer(),
            Text(
              name,
              style: TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _onTapClub(BuildContext context, HomeClubItem data) {
    IMomentManager mgr =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    mgr.openClubDetailScreen(context, data.clubId, clubName: data.name);
  }

  void _onTapMore(BuildContext context) {
    IMomentManager mgr =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    mgr.openAllClubScreen(context);
  }
}
