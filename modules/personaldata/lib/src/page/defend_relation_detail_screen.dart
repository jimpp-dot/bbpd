import 'package:chat_room/assets.dart';
import 'package:personaldata/k.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:personaldata/src/page/diy_relation_name_dialog.dart';
import 'package:personaldata/src/widget/defend_mic_line_widget.dart';
import '../model/defend_relation_detail_bean.dart';
import '../widget/defend_relation_item.dart';
import 'defend_relation_upgrade_dialog.dart';

class DefendRelationDetailScreen extends StatefulWidget {
  final String? defendId;
  final bool showBottom;

  const DefendRelationDetailScreen(
      {super.key, this.defendId, required this.showBottom});

  @override
  DefendRelationDetailState createState() {
    return DefendRelationDetailState();
  }

  static Future<bool?> show(BuildContext context, String defendId,
      {bool showBottom = false}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DefendRelationDetailScreen(
        defendId: defendId,
        showBottom: showBottom,
      ),
      settings: const RouteSettings(name: '/DefendRelationDetailScreen'),
    ));
  }
}

class DefendRelationDetailState extends State<DefendRelationDetailScreen> {
  bool _needRefresh = false;
  DefendRelationDetailBean? defendDetail;
  String errorMsg = '';

  bool get diyChecking => (defendDetail?.diyStatus == 3); // DIY 审核中
  bool get diyCheckFailure => ((defendDetail?.diyStatus == 4) ||
      (defendDetail?.diyStatus == 2 &&
          defendDetail?.diyFailReason.isNotEmpty == true)); // DIY 审核失败

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}defend/relationDetail?id=${widget.defendId}",
        throwOnError: true,
      );
      DefendRelationDetailResponse defendDetailResponse =
          DefendRelationDetailResponse.fromJson(
              response.value() as Map<String, dynamic>);
      if (defendDetailResponse.success == true &&
          defendDetailResponse.data != null) {
        defendDetail = defendDetailResponse.data;
      } else if (Util.validStr(defendDetailResponse.msg)) {
        errorMsg = defendDetailResponse.msg ?? '';
      } else {
        errorMsg = BaseK.K.base_net_error;
      }
    } catch (e) {
      Log.d(e);
      errorMsg = BaseK.K.base_net_error;
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (mounted) {
          Navigator.of(context).pop(_needRefresh);
        }
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children: [
              buildColorBg(),
              buildImgBg(),
              SafeArea(
                child: Column(
                  children: [
                    BaseAppBar.custom(
                      title: Text(
                        K.personal_defend_detail_title,
                        style: R.textStyle.title.copyWith(color: Colors.white),
                      ),
                      backgroundColor: Colors.transparent,
                      backColor: Colors.white,
                      onBackPressedCallback: () {
                        Navigator.of(context).pop(_needRefresh);
                      },
                      actions: [
                        GestureDetector(
                          onTap: () {
                            String url = Util.getHelpUrlWithQStr('k63');
                            BaseWebviewScreen.show(context, url: url);
                          },
                          child: Container(
                            padding: const EdgeInsetsDirectional.only(end: 20),
                            alignment: AlignmentDirectional.center,
                            child: R.img('ic_info.svg',
                                color: Colors.white,
                                width: 24,
                                height: 24,
                                package: ComponentManager.MANAGER_BASE_ROOM),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: _buildBody()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColorBg() {
    return Container(
      width: Util.width,
      height: Util.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFFFCA9EB), Color(0xFFDBE0FF), Color(0xFFA55FFF)],
        ),
      ),
    );
  }

  Widget buildImgBg() {
    return R.img(
      'defend/defend_relation_detail_bg.png',
      width: Util.width,
      height: 372,
      package: ComponentManager.MANAGER_PERSONALDATA,
      fit: BoxFit.fill,
    );
  }

  Widget _buildBody() {
    if (errorMsg.isEmpty && defendDetail == null) {
      return const Loading();
    } else if (errorMsg.isNotEmpty) {
      return Center(
        child: ErrorData(
          error: errorMsg,
          onTap: () {
            if (!mounted) return;
            setState(() {
              errorMsg = '';
            });
            _loadData();
          },
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(12),
                bottomEnd: Radius.circular(12),
              ).resolve(Directionality.of(context)),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: buildTop(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 12,
                    ),
                  ),
                  if ((Session.uid == defendDetail?.uid ||
                          Session.uid == defendDetail?.toUid) &&
                      (defendDetail?.diyStatus ?? 0) >= 2)
                    SliverToBoxAdapter(
                      child: _buildDiyStatus(),
                    ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 12,
                    ),
                  ),
                  buildLevelTitle(),
                  ...buildLevelDetails(),
                ],
              ),
            ),
          ),
        ),
        ...buildBottom(),
      ],
    );
  }

  Widget _buildDiyStatus() {
    String diyName = (defendDetail?.diyName.isNotEmpty == true)
        ? defendDetail!.diyName
        : defendDetail?.title ?? '';
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 15, bottom: 15),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                K.personal_defend_diy_title,
                style: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 13,
                ),
              ),
              _buildDiyName(defendDetail?.level ?? 0,
                  defendDetail?.levelName ?? '', diyName),
              const Spacer(),
              ..._buildDiyStatusRight(),
            ],
          ),
          if (diyCheckFailure) ...[
            const SizedBox(height: 6),
            Text(
              K.personal_defend_diy_check_failure_reason(
                  ['${defendDetail?.diyFailReason}']),
              style: TextStyle(
                color: R.color.thirdTextColor,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildDiyStatusRight() {
    List<Widget> result = [];
    if (diyChecking) {
      /// 审核中
      result.add(R.img(
          R.imagePath('defend/ic_defend_checking.webp',
              package: ComponentManager.MANAGER_PERSONALDATA),
          width: 16,
          height: 16));
      result.add(const SizedBox(width: 2));
      result.add(Text(K.personal_defend_diy_checking,
          style: TextStyle(color: R.color.mainTextColor, fontSize: 13)));
    } else if (diyCheckFailure) {
      /// 审核失败
      result.add(R.img(
          R.imagePath('defend/ic_defend_check_failure.webp',
              package: ComponentManager.MANAGER_PERSONALDATA),
          width: 16,
          height: 16));
      result.add(const SizedBox(width: 2));
      result.add(Text(K.personal_defend_diy_check_failure,
          style: const TextStyle(color: Color(0xFFFF5F7D), fontSize: 13)));
      result.add(const SizedBox(width: 6));
      result.add(_buildDiyNameBtn());
    } else {
      /// 有DIY权限，暂未使用
      result.add(_buildDiyNameBtn());
    }
    return result;
  }

  Widget _buildDiyNameBtn() {
    return InkWell(
      onTap: () async {
        var result = await DiyRelationNameDialog.show(context, defendDetail);
        if (result != null && result == 1) {
          _loadData();
        }
      },
      child: Container(
        height: 30,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.personal_relation_diy,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDiyName(int level, String? title, String? diyName) {
    Color textColor = Colors.white;
    if (level == 2) {
      textColor = const Color(0xFF8A3E1B);
    } else if (level == 3) {
      textColor = const Color(0xFF25234B);
    }
    return Container(
      width: 64,
      height: 22,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(
              RoomAssets.defend_ic_defend_tips_x_webp(level),
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$title$diyName",
            style: R.textStyle.medium12.copyWith(fontSize: 9, color: textColor),
          ),
        ],
      ),
    );
  }

  Widget buildTop() {
    Color textColor = Colors.white;
    if (defendDetail?.level == 2) {
      textColor = const Color(0xFF8A3E1B);
    } else if (defendDetail?.level == 3) {
      textColor = const Color(0xFF25234B);
    }

    String timeText;
    if (Util.isVerify) {
      timeText = _formatStartTime(defendDetail?.startTime ?? 0);
    } else {
      timeText = _formatStartTime(defendDetail?.startTime ?? 0) +
          (Util.validStr(defendDetail?.expire)
              ? '｜${K.remain(['', "${defendDetail?.expire}"])}'
              : '');
    }

    return Container(
      width: Util.width - 24,
      height: 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 13),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    /// 进关系对象的个人主页
                    IPersonalDataManager manager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    manager.openImageScreen(
                        System.context, defendDetail?.uid ?? 0,
                        refer: const PageRefer('UserDefendItem'));
                  },
                  child: DefendRelationHeader(
                    defendRelationModel: defendDetail,
                    iconSize: 62,
                    showBorderIcon: true,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        defendDetail?.name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF313131),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            K.personal_defend_level,
                            style: TextStyle(
                              fontSize: 13,
                              color: R.color.thirdTextColor,
                            ),
                          ),
                          Text(
                            'Lv.${defendDetail?.level}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: R.color.mainTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if ((defendDetail?.level ?? 0) > 1)
                      Container(
                        width: 64,
                        height: 22,
                        alignment: AlignmentDirectional.center,
                        margin: const EdgeInsetsDirectional.only(bottom: 11),
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  R.imagePath(
                                    RoomAssets.defend_ic_defend_tips_x_webp(
                                        defendDetail!.level!),
                                    package: ComponentManager.MANAGER_BASE_ROOM,
                                  ),
                                ),
                                fit: BoxFit.fill)),
                        child: Text(
                          (defendDetail?.levelName ?? '') +
                              (defendDetail?.title ?? ''),
                          style: R.textStyle.medium12
                              .copyWith(fontSize: 9, color: textColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          K.personal_defend_core,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0x66313131),
                          ),
                        ),
                        Text(
                          defendDetail?.defendValue ?? '',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF313131),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 88, end: 12),
              child: Text(
                timeText,
                style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.5),
                    fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }

  String _formatStartTime(int startTime) {
    DateTime startDateTime =
        DateTime.fromMicrosecondsSinceEpoch(startTime * 1000000);
    Duration difference = DateTime.now().difference(startDateTime);
    int days = difference.inDays;
    String startDateTime0 = DateFormat('yyyy.MM.dd').format(startDateTime);
    return startDateTime0 +
        (days >= 0
            ? K.personaldata_distance_now_days(['${days > 0 ? days : 1}'])
            : '');
  }

  double get normalGradeWidth {
    return (Util.width - 24) * 148 / (148 + 204);
  }

  double get highGradeWidth {
    return (Util.width - 24) * 204 / (148 + 204);
  }

  Widget buildLevelTitle() {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Container(
            width: normalGradeWidth,
            height: 48,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadiusDirectional.only(topStart: Radius.circular(12)),
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: [Color(0xFF9183FF), Color(0xFF9B8EFF)],
              ),
            ),
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                R.img(
                  'defend/ic_defend_normal_grade.webp',
                  width: 36,
                  height: 36,
                  package: ComponentManager.MANAGER_PERSONALDATA,
                ),
                Text(
                  K.personal_defend_normal_grade_title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          Container(
            width: highGradeWidth,
            height: 48,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadiusDirectional.only(topEnd: Radius.circular(12)),
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: [Color(0xFFBEA3FF), Color(0xFF9E79FF)],
              ),
            ),
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                R.img(
                  'defend/ic_defend_high_grade.webp',
                  width: 38,
                  height: 36,
                  package: ComponentManager.MANAGER_PERSONALDATA,
                ),
                Text(
                  K.personal_defend_high_grade_title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildLevelDetails() {
    List<Widget> widgets = [];

    /// 目前最多支持6档
    int length = min(
        6,
        min(defendDetail?.normalPrivilege.length ?? 0,
            defendDetail?.upgradePrivilege.length ?? 0));
    for (int i = 0; i < length; i++) {
      widgets.add(SliverToBoxAdapter(
        child: i == length - 1
            ? ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(12),
                        bottomEnd: Radius.circular(12))
                    .resolve(Directionality.of(context)),
                child: buildLevel(i, length),
              )
            : buildLevel(i, length),
      ));
    }

    return widgets;
  }

  Widget buildLevel(int levelIndex, int maxLength) {
    return Stack(
      children: [
        buildNormalLevel(levelIndex) ?? const SizedBox.shrink(),
        PositionedDirectional(
          start: normalGradeWidth,
          child: buildHighLevel(levelIndex) ?? const SizedBox.shrink(),
        ),
        PositionedDirectional(
          start: normalGradeWidth - 1,
          child: Container(
            width: 2,
            height: 40,
            color: (defendDetail?.level ?? 0) >=
                    (defendDetail?.normalPrivilege[levelIndex].defendLevel ?? 0)
                ? const Color(0xFFFFE751)
                : const Color(0xFFDED9FF),
          ),
        ),
        if (levelIndex < maxLength - 1)
          PositionedDirectional(
            start: normalGradeWidth - 1,
            top: 56,
            child: Container(
              width: 2,
              height: 40,
              color: (defendDetail?.level ?? 0) >
                      (defendDetail?.normalPrivilege[levelIndex].defendLevel ??
                          0)
                  ? const Color(0xFFFFE751)
                  : const Color(0xFFDED9FF),
            ),
          ),
        PositionedDirectional(
          start: normalGradeWidth - 21,
          top: 31,
          child: Container(
            width: 42,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.imagePath(
                    (defendDetail?.level ?? 0) >=
                            (defendDetail
                                    ?.normalPrivilege[levelIndex].defendLevel ??
                                0)
                        ? 'defend/ic_defend_has_level.webp'
                        : 'defend/ic_defend_hasnt_level.webp',
                    package: ComponentManager.MANAGER_PERSONALDATA)),
                fit: BoxFit.fill,
              ),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              'Lv.${defendDetail?.normalPrivilege[levelIndex].defendLevel}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: (defendDetail?.level ?? 0) >=
                        (defendDetail
                                ?.normalPrivilege[levelIndex].defendLevel ??
                            0)
                    ? const Color(0xFF984D02)
                    : Colors.white,
                height: 1,
              ),
            ),
          ),
        ),
        if (levelIndex < maxLength - 1)
          PositionedDirectional(
            top: 95,
            child: Container(
              width: Util.width - 24,
              height: 1,
              color: const Color(0x14AC89FF),
            ),
          ),
      ],
    );
  }

  Widget? withWhiteBg({Widget? child, bool hasLevel = false}) {
    if (hasLevel) {
      return Container(
        color: Colors.white,
        child: child,
      );
    }
    return child;
  }

  Widget? buildNormalLevel(int levelIndex) {
    bool hasLevel = (defendDetail?.level ?? 0) >=
        (defendDetail?.normalPrivilege[levelIndex].defendLevel ?? 0);
    return withWhiteBg(
      hasLevel: hasLevel,
      child: Container(
        width: normalGradeWidth,
        height: 96,
        decoration: BoxDecoration(
          gradient: hasLevel
              ? const LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [Color(0x80FFFCD9), Color(0x80FFF7B2)],
                )
              : null,
          color: hasLevel ? null : Colors.white,
        ),
        child: Column(
          children: [
            buildNormalLevelDetail(levelIndex),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  defendDetail?.normalPrivilege[levelIndex].defendLevel == 1
                      ? (defendDetail?.normalPrivilege[levelIndex].desc ?? '')
                      : '${defendDetail?.normalPrivilege[levelIndex].desc}${K.personal_defend_normal_level_suffix}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0x66202020),
                  ),
                ),
                R.img(
                  hasLevel
                      ? 'defend/ic_defend_level_done.webp'
                      : 'defend/ic_defend_level_lock.webp',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_PERSONALDATA,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNormalLevelDetail(int levelIndex) {
    if (defendDetail?.normalPrivilege[levelIndex].defendLevel == 1) {
      /// 普通关系卡
      return Container(
        width: 57,
        height: 57,
        margin: const EdgeInsetsDirectional.only(top: 10, bottom: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          color: Colors.white,
        ),
        child: Container(
          width: 57,
          height: 57,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(12),
            border: Border.all(
                color: DefendRelationItem.getBorderColor(
                    defendDetail?.category ?? 0),
                width: 1),
            gradient: LinearGradient(
              begin: AlignmentDirectional.bottomCenter,
              end: AlignmentDirectional.topCenter,
              colors: DefendRelationItem.getBodyBgColors(
                  defendDetail?.category ?? 0),
            ),
          ),
          padding: const EdgeInsetsDirectional.only(top: 6),
          alignment: AlignmentDirectional.topCenter,
          child: DefendRelationHeader(
            defendRelationModel: defendDetail,
            iconSize: 30,
            showBorderIcon: true,
          ),
        ),
      );
    } else {
      int level = defendDetail?.normalPrivilege[levelIndex].defendLevel ?? 0;
      Color textColor = Colors.white;
      if (level == 2) {
        textColor = const Color(0xFF8A3E1B);
      } else if (level == 3) {
        textColor = const Color(0xFF25234B);
      }
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 36, bottom: 10),
        child: Container(
          width: 64,
          height: 22,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    R.imagePath(
                      RoomAssets.defend_ic_defend_tips_x_webp(level),
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                  fit: BoxFit.fill)),
          child: Text(
            (defendDetail?.normalPrivilege[levelIndex].desc ?? '') +
                (defendDetail?.title ?? ''),
            style: R.textStyle.medium12.copyWith(fontSize: 9, color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
  }

  Widget? buildHighLevel(int levelIndex) {
    bool hasLevel = (defendDetail?.upgrade == 1 &&
        (defendDetail?.level ?? 0) >=
            (defendDetail?.upgradePrivilege[levelIndex].defendLevel ?? 0));
    return withWhiteBg(
      hasLevel: hasLevel,
      child: Container(
        width: highGradeWidth,
        padding: const EdgeInsetsDirectional.only(start: 21),
        height: 96,
        decoration: BoxDecoration(
          gradient: hasLevel
              ? const LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [Color(0x80FFFCD9), Color(0x80FFF7B2)],
                )
              : null,
          color: hasLevel ? null : Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHighLevelDetail(levelIndex),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  defendDetail?.upgradePrivilege[levelIndex].desc ?? '',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0x66202020),
                  ),
                ),
                R.img(
                  hasLevel
                      ? 'defend/ic_defend_level_done.webp'
                      : 'defend/ic_defend_high_level_lock.webp',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_PERSONALDATA,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHighLevelDetail(int levelIndex) {
    int level = defendDetail?.upgradePrivilege[levelIndex].defendLevel ?? 0;
    if (level == 1 || level == 4) {
      /// 关系卡
      return Container(
        width: 57,
        height: 57,
        margin: const EdgeInsetsDirectional.only(top: 10, bottom: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          color: Colors.white,
        ),
        child: Container(
          width: 57,
          height: 57,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(12),
            border: Border.all(
                color: DefendRelationItem.getBorderColor(
                    defendDetail?.category ?? 0),
                width: 1),
            gradient: LinearGradient(
              begin: AlignmentDirectional.bottomCenter,
              end: AlignmentDirectional.topCenter,
              colors: DefendRelationItem.getBodyBgColors(
                  defendDetail?.category ?? 0),
            ),
            image: Util.validStr(
                    defendDetail?.upgradePrivilege[levelIndex].background)
                ? DecorationImage(
                    image: NetworkImage(Util.getRemoteImgUrl(
                        defendDetail?.upgradePrivilege[levelIndex].background ??
                            '')),
                    fit: BoxFit.fill,
                  )
                : null,
          ),
          padding: const EdgeInsetsDirectional.only(top: 6),
          alignment: AlignmentDirectional.topCenter,
          child: DefendRelationHeader(
            defendRelationModel: defendDetail,
            iconSize: 30,
            showBorderIcon: true,
          ),
        ),
      );
    } else if (level == 2) {
      /// 麦位连线
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 27, bottom: 10),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          CommonAvatar(
            path: defendDetail?.icon,
            size: 28,
            shape: BoxShape.circle,
          ),
          DefendMicLineWidget(
            width: 26,
            position: defendDetail?.position ?? 0,
            level: 2,
            category: defendDetail?.category ?? 0,
          ),
          CommonAvatar(
            path: defendDetail?.toIcon,
            size: 28,
            shape: BoxShape.circle,
          ),
        ]),
      );
    } else if (level == 3 || level == 5) {
      /// 双人上麦特效
      double width = highGradeWidth - 21 - 24 - 24;
      double height = 44 / 292 * width;
      return Padding(
        padding: EdgeInsetsDirectional.only(top: 59 - height, bottom: 10),
        child: CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(
              defendDetail?.upgradePrivilege[levelIndex].background ?? ''),
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
      );
    } else if (level == 6) {
      /// 双人进场特效
      double width = highGradeWidth - 21 - 24 - 24;
      double height = 62 / 287 * width;
      return Padding(
        padding: EdgeInsetsDirectional.only(top: 59 - height, bottom: 10),
        child: CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(
              defendDetail?.upgradePrivilege[levelIndex].background ?? ''),
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
      );
    }

    return const SizedBox(
      height: 69,
    );
  }

  List<Widget> buildBottom() {
    List<Widget> widgets = [];
    if (widget.showBottom == false) {
      widgets.add(const SizedBox(height: 10));
      return widgets;
    }
    if (defendDetail?.upgrade != null && (defendDetail?.upgrade ?? 0) > 0) {
      /// 已进阶
      widgets.add(Container(
        margin: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.personal_has_upgrade_defend_relation,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ));
      return widgets;
    }

    /// 开放时间/单双向
    bool canUpgrade =
        (defendDetail?.direction == 2 && defendDetail?.upgradeOpen == true);
    String btnImg = canUpgrade
        ? 'defend/defend_upgrade_btn_bg.webp'
        : 'defend/defend_cant_upgrade_btn_bg.webp';
    String btnText = K.personal_upgrade_defend_btn_text;
    if (defendDetail?.upgradeOpen != true) {
      /// 不在开放进阶时限内
      btnText = K.personal_defend_cant_ugrade_time;
    } else if (defendDetail?.direction != 2) {
      /// 非双向关系，不能进阶
      btnText =
          K.personal_defend_cant_ugrade_relation(['${defendDetail?.title}']);
    }
    widgets.add(GestureDetector(
      onTap: () async {
        if (canUpgrade == true) {
          upgradeDefend();
        }
      },
      child: Container(
        width: Util.width - 24,
        height: 66,
        margin: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.imagePath(btnImg,
                package: ComponentManager.MANAGER_PERSONALDATA)),
            fit: BoxFit.fill,
          ),
        ),
        alignment: AlignmentDirectional.topCenter,
        padding: const EdgeInsetsDirectional.only(top: 17),
        child: Text(
          btnText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF984D02),
          ),
        ),
      ),
    ));

    String tips = defendDetail?.upgradeTips ?? '';
    if (defendDetail?.upgradeOpen == true &&
        (defendDetail?.direction ?? 0) < 2) {
      tips = K.personal_defend_cant_upgrade_tips;
    }

    if (Util.validStr(tips)) {
      widgets.add(Container(
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        alignment: AlignmentDirectional.center,
        child: Text(
          tips,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ));
    }

    widgets.add(const SizedBox(
      height: 5,
    ));

    return widgets;
  }

  void upgradeDefend() async {
    bool? succ = await DefendRelationUpgradeDialog.show(
        context: context, defendId: widget.defendId ?? '', data: defendDetail);
    if (succ == true) {
      _needRefresh = true;
      _loadData();
    }
  }
}
