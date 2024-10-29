import 'dart:ui';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../../k.dart';
import '../api/api.dart';
import '../model/pb/generated/near_gs_hi.pb.dart';

/// 一键关注/打招呼
class OneKeyFollowScreen extends StatefulWidget {
  const OneKeyFollowScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OneKeyFollowState();
  }
}

class OneKeyFollowState extends State<OneKeyFollowScreen> {
  ResNearGsHi? gs;

  /// 当前正在展示的index
  int currentIndex = 0;

  /// 已经关注的uid列表
  List<int> hasFollowedUids = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    gs = await Api.getNearGs();
    if (mounted) {
      if (!Util.validList(gs?.data.gs)) {
        /// 没有拉到数据，直接跳过这个流程 _gotoNextPage();
        return;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (gs != null &&
            Util.validList(gs?.data.gs) &&
            currentIndex < (gs?.data.gs.length ?? 0))
          Align(
            alignment: AlignmentDirectional.center,
            child: Transform.scale(
              scale: Util.height / 200,
              child: buildCurrentGsPic(),
            ),
          ),
        Container(
          width: Util.width,
          height: Util.height,
          color: Colors.white30,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              appBar: BaseAppBar(
                Session.sex == 2
                    ? K.login_follow_title_female
                    : K.login_follow_title_male,
                titleColor: const Color(0xFF202020),
                showBack: false,
                actionTitle: K.login_skip,
                actionColor: const Color(0x99202020),
                backgroundColor: Colors.transparent,
                onPressed: () {
                  _gotoNextPage();
                },
              ),
              backgroundColor: Colors.transparent,
              body: buildBody(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBody() {
    if (gs == null || !Util.validList(gs?.data.gs)) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        builGsList(),
        const SizedBox(
          height: 56,
        ),
        buildCurrentGsPic(),
        const SizedBox(
          height: 16,
        ),
        buildCurrentGsName(),
        const SizedBox(
          height: 4,
        ),
        UserSexAndAgeWidget(
          sex: gs?.data.gs[currentIndex].sex ?? 1,
          age: gs?.data.gs[currentIndex].age ?? 0,
        ),
        const SizedBox(
          height: 70,
        ),
        buildOptions(),
      ],
    );
  }

  Widget buildOptions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                nextGs(false, 0);
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                alignment: AlignmentDirectional.center,
                child: R.img(
                  BaseAssets.shared$login_ic_ignore_gs_png,
                  width: 26,
                  height: 26,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              K.login_ignore_gs,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF202020),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                nextGs(true, gs?.data.gs[currentIndex].uid ?? 0);
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFollowing ? const Color(0xFFFF639F) : Colors.white,
                ),
                alignment: AlignmentDirectional.center,
                child: R.img(
                  BaseAssets.login_ic_follow_and_say_hi_svg,
                  width: 26,
                  height: 26,
                  color: isFollowing ? Colors.white : const Color(0xFFFF639F),
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              K.login_follow_and_say_hi,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF202020),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCurrentGsName() {
    return Text(
      gs?.data.gs[currentIndex].name ?? '',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF202020),
        height: 1.2,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildCurrentGsPic() {
    return CommonAvatar(
      path: gs?.data.gs[currentIndex].icon ?? '',
      size: 200,
      shape: BoxShape.circle,
      suffix: '',
    );
  }

  Widget builGsList() {
    List<NearGsHiItem>? gsList =
        (gs?.data.gs.length ?? 0) > 6 ? gs?.data.gs.sublist(0, 6) : gs?.data.gs;
    return SizedBox(
      height: 44,
      child: Center(
        child: Center(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 4),
            itemCount: gsList?.length ?? 0,
            itemBuilder: (context, index) {
              return buildGsItem(index);
            },
          ),
        ),
      ),
    );
  }

  Widget buildGsItem(int index) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: index == currentIndex
                ? Border.all(width: 1, color: R.color.mainBrandColor)
                : null,
          ),
          alignment: AlignmentDirectional.center,
          child: CommonAvatar(
            path: gs?.data.gs[index].icon ?? '',
            size: 40,
            shape: BoxShape.circle,
          ),
        ),
        if (hasFollowedUids.contains(gs?.data.gs[index].uid ?? 0))
          PositionedDirectional(
            top: 26,
            child: R.img(
              Assets.login$ic_has_followed_gs_png,
              width: 18,
              height: 18,
              package: ComponentManager.MANAGER_LOGIN,
            ),
          ),
      ],
    );
  }

  bool isFollowing = false;

  void nextGs(bool follow, int uid) async {
    if (isFollowing == true) {
      return;
    }
    isFollowing = true;
    if (follow == true) {
      NormalNull res = await Api.followNearGs(uid);
      if (res.success == false && Util.validStr(res.msg)) {
        Fluttertoast.showCenter(msg: res.msg);
      }
      if (res.success == true) {
        hasFollowedUids.add(uid);
      }
    }
    if (currentIndex == 5 || currentIndex >= ((gs?.data.gs.length ?? 1) - 1)) {
      _gotoNextPage();
      return;
    }
    if (mounted) {
      setState(() {
        currentIndex++;
      });
    }
    isFollowing = false;
  }

  void _gotoNextPage() async {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    if (Util.isLoginBeforeBoot()) {
      eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
      await Future.delayed(const Duration(milliseconds: 100));
    }
    // 弹新用户礼包
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    if (loginManager.isNoviceGuide) {
      eventCenter.emit(EventConstant.ShowNewUserGuide);
    } else {
      eventCenter.emit(EventConstant.ShowNewUserPackage);
    }
    Api.autoInRoom();
  }
}
