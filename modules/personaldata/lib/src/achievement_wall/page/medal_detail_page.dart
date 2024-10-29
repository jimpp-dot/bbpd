import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../../K.dart';
import '../../../assets.dart';
import '../api/achievement_wall_repo.dart';
import '../model/pb/generated/slp_achieve.pb.dart';
import '../widget/medal_wear_dialog.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

enum AchieveState {
  /// 未解锁
  STATE_UNLOCK,

  /// 已解锁未到到最高等级
  STATE_GROWING,

  /// 已到最高等级
  STATE_COMPLETED
}

///勋章详情页
class MedalDetailPage extends StatefulWidget {
  final int initIndex;
  final int uid;
  final UserAchieveBadge item;
  final String ids;

  const MedalDetailPage(
      {Key? key,
      this.initIndex = 0,
      this.ids = "",
      required this.uid,
      required this.item})
      : super(key: key);

  static Future<void> show(BuildContext context,
      {int initIndex = 0,
      String ids = "",
      required int uid,
      required UserAchieveBadge item}) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MedalDetailPage(
            initIndex: initIndex, ids: ids, uid: uid, item: item),
        settings: const RouteSettings(name: '/MedalDetailPage'),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => MedalDetailPageState();
}

class MedalDetailPageState extends State<MedalDetailPage> {
  SwiperController? controller;
  final ValueNotifier<int> _currIndex = ValueNotifier<int>(0);
  late AchieveState _currState;
  bool isSelf = true;
  static const String _tag = "MedalDetailPage";

  @override
  void initState() {
    super.initState();
    isSelf = Session.uid == widget.uid;
    controller = SwiperController();
    if (widget.item.level == 0) {
      _currState = AchieveState.STATE_UNLOCK;
    } else if (widget.item.level == widget.item.images.length) {
      _currState = AchieveState.STATE_COMPLETED;
    } else {
      _currState = AchieveState.STATE_GROWING;
    }
    _currIndex.value = widget.initIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            ValueListenableBuilder<int>(
                valueListenable: _currIndex,
                builder: (context, value, child) {
                  return Container(
                    alignment: AlignmentDirectional.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage((widget.item.level > value)
                              ? Assets
                                  .personaldata$achievement_wall_achieve_detail_bg_unlock_webp
                              : Assets
                                  .personaldata$achievement_wall_achieve_detail_bg_locked_webp),
                          fit: BoxFit.cover),
                    ),
                  );
                }),
            Column(
              children: [
                BaseAppBar.custom(
                    backgroundColor: Colors.transparent,
                    backColor: Colors.white,
                    statusBrightness: Brightness.dark),
                SizedBox(height: 63.5.dp),
                SizedBox(height: 280.dp, child: _buildSwiper()),
                _buildTitle(),
                Expanded(flex: 1, child: _buildProgress()),
                if (widget.uid == Session.uid) _buildButtons(),
                SizedBox(height: 82.5.dp),
              ],
            )
          ],
        ));
  }

  Widget _buildSwiper() {
    return Swiper(
      itemCount: widget.item.images.length,
      loop: false,
      index: widget.initIndex,
      viewportFraction: 0.6,
      scale: 0.4,
      controller: controller,
      onIndexChanged: (int index) {
        _currIndex.value = index;
      },
      itemBuilder: (BuildContext context, int index) {
        if (widget.item.level - 1 >= index) {
          return R.img(Util.getRemoteImgUrl(widget.item.images[index]),
              width: 220.dp, height: 220.dp, fit: BoxFit.fitWidth);
        } else {
          return Opacity(
              opacity: 0.3,
              child: ColorFiltered(
                  colorFilter: Util.greyFilter,
                  child: R.img(Util.getRemoteImgUrl(widget.item.images[index]),
                      width: 220.dp, height: 220.dp, fit: BoxFit.fitWidth)));
        }
      },
    );
  }

  ///勋章名称
  Widget _buildTitle() {
    return ValueListenableBuilder<int>(
        valueListenable: _currIndex,
        builder: (context, value, child) {
          String originalRule = value < widget.item.levelRules.length
              ? widget.item.levelRules[value]
              : ""; //"与<-340->名新用户相互关注";
          String showRule =
              originalRule.replaceAll(r'<-', '').replaceAll(r'->', '');
          List<String> highLightStrs = [];
          for (var str in originalRule.split("<-")) {
            if (str.contains("->")) {
              highLightStrs.add(str.split("->")[0]);
            }
          }
          List<Widget> titles = [];
          var textStyle = TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14.dp,
              fontWeight: FontWeight.normal);
          String gotTime = value < widget.item.levelDate.length
              ? widget.item.levelDate[value]
              : "";
          if (widget.item.level - 1 >= value && gotTime.isNotEmpty) {
            titles.add(Text(K.achieve_get_time([gotTime]), style: textStyle));
            titles.add(Text("", style: textStyle));
          } else {
            titles.add(Text(widget.item.description, style: textStyle));
            titles.add(EasyRichText(showRule,
                softWrap: true,
                textAlign: TextAlign.center,
                defaultStyle: textStyle,
                patternList: highLightStrs
                    .map((e) => EasyRichTextPattern(
                        targetString: e,
                        style: TextStyle(
                            color: const Color(0xFFFFF056),
                            fontSize: 14.dp,
                            fontWeight: FontWeight.normal)))
                    .toList()));
          }

          return Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    R.img(Assets.personaldata$achievement_wall_ic_deco_webp,
                        width: 13.5.dp, color: Colors.white70),
                    SizedBox(width: 10.dp),
                    Text("${widget.item.name} ${Util.getRomanNum(value + 1)}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.dp,
                            fontWeight: FontWeight.w900)),
                    SizedBox(width: 10.dp),
                    Transform(
                        alignment: AlignmentDirectional.center,
                        transform: Matrix4.rotationY(pi),
                        child: R.img(
                            Assets.personaldata$achievement_wall_ic_deco_webp,
                            width: 13.5.dp,
                            color: Colors.white70))
                  ]),
              SizedBox(height: 5.dp),
              ...titles,
            ],
          );
        });
  }

  ///当前进度
  Widget _buildProgress() {
    Widget divider = Container(
      height: 1.dp,
      width: 30.dp,
      margin: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white.withOpacity(0), Colors.white]),
          borderRadius: BorderRadiusDirectional.circular(0.5.dp)),
    );

    return ValueListenableBuilder<int>(
        valueListenable: _currIndex,
        builder: (context, value, child) {
          List<Widget> res = [];
          for (int i = 0; i < widget.item.images.length; i++) {
            Widget img;
            double imgSize = _currIndex.value == i ? 50.dp : 32.dp;
            if (widget.item.level - 1 >= i) {
              img = R.img(Util.getRemoteImgUrl(widget.item.images[i]),
                  width: imgSize, height: imgSize);
            } else {
              img = Opacity(
                  opacity: 0.3,
                  child: ColorFiltered(
                      colorFilter: Util.greyFilter,
                      child: R.img(Util.getRemoteImgUrl(widget.item.images[i]),
                          width: imgSize, height: imgSize)));
            }
            res.add(Container(
                alignment: AlignmentDirectional.center,
                width: 60.dp,
                height: 60.dp,
                child: img));
            if (i != widget.item.images.length - 1) {
              res.add(divider);
            }
          }

          return Container(
            alignment: AlignmentDirectional.center,
            padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                res.isEmpty
                    ? const SizedBox.shrink()
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: res,
                        )),
                SizedBox(height: 12.dp),
                if (isSelf) _buildProgressTips(),
              ],
            ),
          );
        });
  }

  Widget _buildProgressTips() {
    bool hasProgress = (widget.item.progressType == 0);
    if (hasProgress == false || widget.item.levelScores.isEmpty) {
      return const SizedBox.shrink();
    }
    String progressTips = "";
    int currScore = widget.item.score;

    /// 下一等级需要的分数，满级则取最高等级
    int nextScore = widget.item.levelScores[
        widget.item.level >= widget.item.levelScores.length
            ? widget.item.levelScores.length - 1
            : widget.item.level];
    var progress = currScore / nextScore;
    if (_currState == AchieveState.STATE_COMPLETED) {
      progressTips = K.achieve_progress3(["$currScore", "$nextScore"]);
      return Text(progressTips,
          style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14.dp,
              fontWeight: FontWeight.normal));
    } else {
      progressTips = _currState == AchieveState.STATE_UNLOCK
          ? K.achieve_progress2(["$currScore", "$nextScore"])
          : K.achieve_progress4(["$currScore", "$nextScore"]);
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(progressTips,
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14.dp,
                fontWeight: FontWeight.normal)),
        SizedBox(width: 5.dp),
        SizedBox(
            width: 120.dp,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Container(
                  height: 12.dp,
                  width: 100.dp,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadiusDirectional.circular(6.dp)),
                ),
                PositionedDirectional(
                  start: 1.5.dp,
                  child: Container(
                    height: 9.dp,
                    width: 100.dp * progress,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white
                        ]),
                        borderRadius: BorderRadiusDirectional.circular(6.dp)),
                  ),
                )
              ],
            ))
      ]);
    }
  }

  Widget _buildButtons() {
    if (_currState == AchieveState.STATE_UNLOCK) {
      return _buildSingleBtn(0);
    } else if (_currState == AchieveState.STATE_COMPLETED) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSingleBtn(1),
          SizedBox(width: 25.dp),
          _buildSingleBtn(3),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSingleBtn(1),
          SizedBox(width: 25.dp),
          _buildSingleBtn(2),
        ],
      );
    }
  }

  /// 0:马上解锁,1:主页展示,2:解锁升级,3:立即佩戴
  Widget _buildSingleBtn(int btnType) {
    String content = "";
    switch (btnType) {
      case 0:
        content = K.achieve_btn_lock;
        break;
      case 1:
        content = K.achieve_btn_show;
        break;
      case 2:
        content = K.achieve_btn_upgrade;
        break;
      case 3:
        content = K.achieve_btn_wear;
        break;
    }
    return GestureDetector(
        onTap: () async {
          if (btnType == 0 || btnType == 2) {
            Tracker.instance
                .track(TrackEvent.achievement_click_goto_unlock, properties: {
              'uid': Session.uid,
            });
            String redirect = widget.item.redirect ?? '';
            Navigator.pop(context);
            if (redirect.isNotEmpty) {
              SchemeUrlHelper.instance().jump(redirect);
            } else {
              ResGetRedirect rsp = await AchievementWallRepo.getRedirectPath(
                  widget.item.badgeId);
              if (rsp.success && rsp.data.redirect.isNotEmpty) {
                SchemeUrlHelper.instance().jump(rsp.data.redirect);
              } else {
                Fluttertoast.showToast(msg: rsp.msg);
              }
            }
          } else if (btnType == 1) {
            Tracker.instance.track(TrackEvent.achievement_click_show_medal,
                properties: {
                  'uid': Session.uid,
                  'chapter_id': widget.item.badgeId
                });
            String sortedIds = '${widget.item.badgeId},${widget.ids}';
            NormalNull resp =
                await AchievementWallRepo.achieveSortBadge(sortedIds);
            if (resp.success == true) {
              eventCenter.emit(EventConstant.EventAchieveWallDataChanged);
              Fluttertoast.showCenter(
                  msg:
                      K.personaldata_display_personal_page([widget.item.name]));
            } else {
              Fluttertoast.showCenter(msg: resp.msg);
            }
            Navigator.pop(context);
          } else if (btnType == 3) {
            Tracker.instance.track(TrackEvent.achievement_click_wear_btn,
                properties: {
                  'uid': Session.uid,
                  'chapter_id': widget.item.badgeId
                });
            ResAchieveWall rsp =
                await AchievementWallRepo.getAchieveWall(uid: widget.uid);
            if (rsp.data.user.isWear) {
              bool? result = await MedalWearDialog.show(context);
              if (result ?? false) {
                NormalNull res =
                    await AchievementWallRepo.wearBadge(widget.item.badgeId);
                if (res.success) {
                  Fluttertoast.showCenter(
                      msg: K.achieve_wear_succeed([widget.item.name]));
                } else {
                  Fluttertoast.showToast(msg: res.msg);
                }
              }
            } else {
              NormalNull res =
                  await AchievementWallRepo.wearBadge(widget.item.badgeId);
              if (res.success) {
                Fluttertoast.showCenter(
                    msg: K.achieve_wear_succeed([widget.item.name]));
              } else {
                Fluttertoast.showToast(msg: res.msg);
              }
            }
            Navigator.popUntil(
                context, ModalRoute.withName('/AchievementWallScreen'));
          }
        },
        child: Container(
          height: 52.dp,
          width: 150.dp,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: btnType == 1
                      ? [
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(0.9)
                        ]
                      : R.dColor.mainBrandGradientColors,
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd),
              borderRadius: BorderRadiusDirectional.circular(30.dp)),
          child: Text(content,
              style: TextStyle(
                  color: const Color(0xFF080A31).withOpacity(0.9),
                  fontSize: 16.dp,
                  fontWeight: FontWeight.w900)),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}
