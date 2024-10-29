import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/achievement_wall/page/medal_detail_page.dart';

import '../../../K.dart';
import '../../../assets.dart';
import '../api/achievement_wall_repo.dart';
import '../model/pb/generated/slp_achieve.pb.dart';
import '../model/skin_config.dart';

class MedalListPage extends StatefulWidget {
  /// 被查看用户id
  final int uid;

  /// 勋章类别id，初始不传默认为0
  final int cateId;

  final AchieveWallData? achieveWallData;

  const MedalListPage(
      {Key? key, required this.uid, this.cateId = 1, this.achieveWallData})
      : super(key: key);

  @override
  State<MedalListPage> createState() => _MedalListPageState();
}

class _MedalListPageState extends State<MedalListPage>
    with AutomaticKeepAliveClientMixin {
  AchieveWallData? data;
  int _realSkinId = 0; // 用户真实的皮肤ID

  @override
  void initState() {
    super.initState();
    _loadData();
    eventCenter.addListener(EventConstant.EventAchieveSkinChange, _onEvent);
  }

  void _loadData() {
    if (widget.achieveWallData != null && mounted) {
      setState(() {
        data = widget.achieveWallData;
        _realSkinId = data?.user.skinId ?? 0;
      });
    } else {
      AchievementWallRepo.getAchieveWall(uid: widget.uid, cateId: widget.cateId)
          .then((resp) {
        if (resp.success && resp.hasData() && mounted) {
          setState(() {
            data = resp.data;
            _realSkinId = data?.user.skinId ?? 0;
          });
        }
      });
    }
  }

  void _onEvent(String type, dynamic data) {
    if (type == EventConstant.EventAchieveSkinChange) {
      refresh();
    }
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(EventConstant.EventAchieveSkinChange, _onEvent);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Log.d("_previewSkinId:${SkinConfig.previewId},_realSkinId:$_realSkinId");
    return Container(
        margin:
            EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp, bottom: 32.dp),
        padding: EdgeInsetsDirectional.only(top: 18.dp),
        decoration: BoxDecoration(
            color:
                SkinConfig.configs[SkinConfig.previewId ?? _realSkinId].bgColor,
            border: Border.all(
                color: Colors.white.withOpacity(0.12), width: 0.5.dp),
            borderRadius: BorderRadiusDirectional.all(Radius.circular(16.dp))),
        child: (data == null)
            ? const SizedBox.shrink()
            : Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    R.img(Assets.personaldata$achievement_wall_ic_title_yam_svg,
                        color: SkinConfig
                            .configs[SkinConfig.previewId ?? _realSkinId]
                            .textColor,
                        height: 3.dp),
                    SizedBox(width: 9.5.dp),
                    GradientText(
                        K.achieve_progress1(
                            ["${data?.unlockNum}", "${data?.totalNum}"]),
                        gradient: SkinConfig
                            .configs[SkinConfig.previewId ?? _realSkinId]
                            .gradient,
                        style: const TextStyle(
                            color: Color(0xFFFADEB5),
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                    SizedBox(width: 9.5.dp),
                    Transform.rotate(
                        angle: pi,
                        child: R.img(
                            Assets
                                .personaldata$achievement_wall_ic_title_yam_svg,
                            color: SkinConfig
                                .configs[SkinConfig.previewId ?? _realSkinId]
                                .textColor,
                            height: 3.dp)),
                  ],
                ),
                SizedBox(height: 16.dp),
                Expanded(
                  flex: 1,
                  child: GridView.builder(
                    padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
                    itemCount: data?.totalNum,
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5.dp,
                      mainAxisSpacing: 5.dp,
                      crossAxisCount: 3,
                      childAspectRatio: 114 / 131,
                    ),
                    itemBuilder: _buildItemWidget,
                  ),
                )
              ]));
  }

  Widget _buildItemWidget(BuildContext context, int index) {
    UserAchieveBadge? item = data?.list[index];
    String subText = "";
    if (item?.level == 0) {
      subText = K.achieve_progress5(["${data?.list[index].unlockCount}"]);
    } else if (item?.level == item?.images.length) {
      subText = K.achieve_progress6([data?.list[index].date ?? ""]);
    } else {
      bool hasProgress = (item?.progressType == 0);
      if (hasProgress && item != null) {
        int nextScore = item.levelScores[item.level >= item.levelScores.length
            ? item.levelScores.length - 1
            : item.level];
        subText = K.achieve_progress4(["${item.score}", "$nextScore"]);
      }
    }
    return InkWell(
        onTap: () {
          if (data != null && item != null) {
            Tracker.instance
                .track(TrackEvent.achievement_click_medal, properties: {
              'name_of_chapter': item.name,
              'unlock_the_level': item.level,
              'unlock_the_number': data!.unlockNum,
              'uid': widget.uid,
              'to_uid': Session.uid
            });
          }
          if (item != null) {
            String ids = '';
            for (UserAchieveBadge badge in data?.list ?? []) {
              if (item.badgeId != badge.badgeId) {
                ids += '${badge.badgeId},';
              }
            }
            MedalDetailPage.show(context,
                initIndex: (item.level - 1) >= 0 ? item.level - 1 : 0,
                uid: widget.uid,
                item: item,
                ids: ids);
          }
        },
        child: Column(
          children: [
            _buildMedalWidget(data?.list[index]),
            Text(data?.list[index].name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w900)),
            Padding(
                padding: EdgeInsetsDirectional.only(start: 5.dp, end: 5.dp),
                child: MarqueeText(
                    speed: 6,
                    text: subText,
                    style: const TextStyle(
                        color: Colors.white30,
                        fontSize: 11,
                        fontWeight: FontWeight.normal))),
          ],
        ));
  }

  Widget _buildMedalWidget(UserAchieveBadge? item) {
    if (item?.level == 0 && item?.images.isNotEmpty == true) {
      /// 未解锁
      return Opacity(
          opacity: 0.3,
          child: ColorFiltered(
              colorFilter: Util.greyFilter,
              child: R.img(
                Util.getRemoteImgUrl(
                  (item?.images[0] ?? ''),
                ),
                width: 70.dp,
                height: 75.dp,
                fit: BoxFit.cover,
              )));
    } else if (item?.images.isNotEmpty == true &&
        (item?.level ?? 0) <= (item?.images.length ?? 0)) {
      return R.img(
          Util.getRemoteImgUrl(
            (item?.images[item.level - 1] ?? ''),
          ),
          width: 70.dp,
          height: 75.dp,
          fit: BoxFit.cover);
    }
    return SizedBox(width: 70.dp, height: 75.dp);
  }

  @override
  bool get wantKeepAlive => true;
}
