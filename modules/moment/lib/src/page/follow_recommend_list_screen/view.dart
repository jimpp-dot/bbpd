import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/src/model/recommend_follow_item_bean.dart';
import 'package:moment/src/widget/moment_follow_button.dart';
import 'package:fmodifier/fmodifier.dart';
import 'package:get/get.dart';

import '../../../moment.dart';
import 'logic.dart';

class MomentFollowRecommendListScreen extends StatefulWidget {
  final bool isNewUser;
  final String? fromRefer;

  const MomentFollowRecommendListScreen(
      {super.key, this.isNewUser = false, this.fromRefer});

  static openMomentFollowRecommendListPage(
    BuildContext context, {
    Key? key,
    bool isNewUser = false,
    String? fromRefer,
  }) {
    return Navigator.of(context).push(
      DisappearBottomRoute(
        builder: (context) {
          return MomentFollowRecommendListScreen(
            key: key,
            isNewUser: isNewUser,
            fromRefer: fromRefer,
          );
        },
        settings: const RouteSettings(name: '/momentFollowRecommendList'),
      ),
    );
  }

  @override
  _MomentFollowRecommendListScreenState createState() =>
      _MomentFollowRecommendListScreenState();
}

class _MomentFollowRecommendListScreenState
    extends State<MomentFollowRecommendListScreen> {
  final MomentFollowRecommendListScreenLogic logic =
      Get.put(MomentFollowRecommendListScreenLogic());

  @override
  void initState() {
    super.initState();

    logic.loadData();

    Tracker.instance.track(
      TrackEvent.suggested_follow_page_show,
      properties: {
        'refer': '${widget.fromRefer}',
      },
    );
  }

  @override
  void dispose() {
    Get.delete<MomentFollowRecommendListScreenLogic>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !widget.isNewUser;
      },
      child: Scaffold(
        backgroundColor: R.colors.homeBgColor,
        appBar: BaseAppBar.custom(
          backgroundColor: R.colors.homeBgColor,
          showBack: !widget.isNewUser,
          title: Text(K.moment_no_follow_recommend_title),
          statusBrightness: darkMode ? Brightness.dark : Brightness.light,
          onBackPressedCallback: () {
            Navigator.of(context).pop();
            Tracker.instance.track(
              TrackEvent.suggested_follow_page_close,
              properties: {
                'refer': '${widget.fromRefer}',
              },
            );
          },
          actions: widget.isNewUser
              ? [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _confirmCancelQuit,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Text(
                          K.moment_skip,
                          style: TextStyle(
                              color: R.color.mainBrandColor, fontSize: 16.0),
                        ),
                      ),
                    ).paddingExt(const EdgeInsetsDirectional.only(end: 16)),
                  )
                ]
              : null,
        ),
        body: Stack(
          children: [
            Obx(() => ListView.separated(
                  itemBuilder: (context, index) =>
                      _buildItem(logic.items[index]),
                  separatorBuilder: (context, index) => Divider(
                    color: R.color.dividerColor,
                    height: 1,
                  ),
                  itemCount: logic.items.length,
                ).paddingExt(const EdgeInsetsDirectional.only(bottom: 72))),
            Column(
              children: [
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 72,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0,
                          1
                        ],
                        colors: [
                          R.color.homeBgColor.withOpacity(0),
                          R.color.homeBgColor.withOpacity(1)
                        ]),
                  ),
                ),
                Container(
                  color: R.color.homeBgColor,
                  alignment: Alignment.topCenter,
                  height: 64 + MediaQuery.of(context).padding.bottom,
                  child: Obx(() => _buildBottomBtns()),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row _buildBottomBtns() {
    double screenW = MediaQuery.of(Constant.context).size.width;
    double buttonW = screenW - 2 * 16;
    if (widget.isNewUser) {
      buttonW = (screenW - 3 * 16) / 3.0;
      return Row(
        children: [
          const Spacer(),
          NegativeButton(
            text: K.moment_cancel_select,
            onPressed: _confirmCancelQuit,
            width: buttonW,
            height: 48,
          ),
          const Spacer(),
          PositiveButton(
              text: K.moment_no_follow_recommend_onekey_follow(
                  ["${logic.checkedItems.length}"]),
              onPressed: logic.checkedItems.isNotEmpty
                  ? () {
                      logic.followAllChecked(
                          isNewUser: widget.isNewUser,
                          fromRefer: widget.fromRefer);
                    }
                  : null,
              width: buttonW * 2,
              height: 48,
              textSize: 16,
              canDisable: true),
          const Spacer(),
        ],
      );
    }

    return Row(
      children: [
        const Spacer(),
        PositiveButton(
            text: K.moment_no_follow_recommend_onekey_follow(
                ["${logic.checkedItems.length}"]),
            onPressed: logic.checkedItems.isNotEmpty
                ? () {
                    logic.followAllChecked(
                        isNewUser: widget.isNewUser,
                        fromRefer: widget.fromRefer);
                  }
                : null,
            width: buttonW,
            height: 48,
            textSize: 16,
            canDisable: true),
        const Spacer(),
      ],
    );
  }

  Widget _buildItem(RecommendFollowItem item) {
    List<Widget> botlists = [];
    if (item.latestFeed != null) {
      botlists = [
        Flexible(
            fit: FlexFit.loose,
            child: Text(item.latestFeed?.content ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400))),
        const SizedBox(
          width: 6,
        ),
      ];

      if (item.latestFeed?.imgs != null) {
        botlists.addAll(item.latestFeed!.imgs!
            .take(2)
            .map((e) => CachedNetworkImage(
                  imageUrl: e,
                  width: 32,
                  height: 24,
                  fit: BoxFit.cover,
                ).paddingExt(const EdgeInsetsDirectional.only(end: 8)))
            .toList());
      }
    }

    return Column(
      key: ValueKey(item),
      children: [
        Row(
          children: [
            Obx(() => RepaintBoundary(child: _buildIcon(item))
                    .overlayExt(
                        R.img(
                          logic.checkedItems.contains(item.uid)
                              ? "ic_checkbox_true.svg"
                              : "ic_checkbox_false.svg",
                          package: ComponentManager.MANAGER_MOMENT,
                          width: 20.0,
                          height: 20.0,
                        ),
                        alignment: AlignmentDirectional.bottomEnd)
                    .onTapExt(() {
                  logic.checkOrNotItem(item);
                })),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child:
                                  _buildTitle(item.name ?? '', item.titleNew),
                            ),
                            const SizedBox(width: 8),
                            if (item.age != 0)
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 4.0),
                                child: UserSexAndAgeWidget(
                                  sex: Util.parseInt(item.sex),
                                  age: item.age,
                                ),
                              ),
                          ],
                        ),
                      ),
                      _buildFollow(item), //followButton
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "粉丝数：${item.fansNum}  |  ${item.playtip}",
                        style: TextStyle(
                            color: R.color.secondTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: item.tags!
                          .take(4)
                          .map((element) => _buildTagItem(element))
                          .toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ).sizeFixedExt(width: double.infinity, height: 64),
        botlists.isEmpty
            ? const SizedBox(
                height: 20,
              )
            : Row(
                children: botlists,
              ).paddingExt(const EdgeInsetsDirectional.only(top: 12)),
      ],
    ).paddingExt(const EdgeInsetsDirectional.only(
        start: 20, end: 20, top: 20, bottom: 20));
  }

  Widget _buildTitle(String name, int titleNew) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: R.color.mainTextColor,
          fontSize: 16,
          fontFamily: Util.fontFamily),
    );
  }

  Widget _buildIcon(RecommendFollowItem item) {
    bool haveFrame = item.headFrame != null && item.headFrame!.isNotEmpty;
    bool isInRoom = item.roomTag != null && item.roomTag!.isNotEmpty;
    if (haveFrame) {
      return RepaintBoundary(child: _buildAvatarFrame(item, isInRoom, true));
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 4),
        child: RoundNetIcon(
          url: item.icon,
          size: 64,
          inRoom: isInRoom,
          isOnline: false,
        ),
      );
    }
  }

  /// 头像框
  Widget _buildAvatarFrame(
          RecommendFollowItem item, bool inRoom, bool isOnline) =>
      Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            alignment: AlignmentDirectional.center,
            child: RoundNetIcon(
              url: item.icon,
              size: 52,
            ),
          ),
          CachedNetworkImage(
            imageUrl: item.headFrame,
            width: 60,
            height: 60,
          ),
          if (inRoom)
            PositionedDirectional(
              bottom: 0,
              end: 2,
              child: Container(
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: R.color.mainBrandColor,
                ),
                alignment: Alignment.center,
                child: RepaintBoundary(
                  child: R.img(
                    "living_small.webp",
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 12.0,
                    height: 12.0,
                  ),
                ),
              ),
            ),
          if (inRoom == false && isOnline)
            const PositionedDirectional(
              bottom: 0,
              end: 4,
              child: OnlineDot(),
            ),
        ],
      );

  /// 关注按钮
  Widget _buildFollow(RecommendFollowItem item) {
    return Obx(() => FollowButton(
          isFollow: logic.followedItems.contains(item.uid),
          onFollowTap: logic.followedItems.contains(item.uid)
              ? null
              : () {
                  logic.followItem(item, widget.fromRefer);
                },
        ));
  }

  Widget _buildTagItem(String name) {
    return Text(
      name,
      style: TextStyle(
        color: R.color.secondTextColor,
        fontSize: 10,
      ),
    )
        .paddingExt(const EdgeInsetsDirectional.only(
            top: 3, bottom: 3, start: 10, end: 10))
        .backgroundColorExt(R.color.thirdBgColor)
        .cornerRadiusExt(radius: 10)
        .paddingExt(const EdgeInsetsDirectional.only(end: 6));
  }

  // 仅新用户调用
  _confirmCancelQuit() {
    double screenW = MediaQuery.of(Constant.context).size.width;
    double buttonW = (screenW - 3 * 16) / 2.0;

    displayModalBottomSheet(
        context: Constant.context,
        builder: (BuildContext context) {
          return Container(
            color: R.colors.homeBgColor,
            width: double.infinity,
            height: 200,
            child: Column(
              children: [
                Text(K.moment_confirm_skip_title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, color: R.color.mainTextColor))
                    .paddingExt(
                        const EdgeInsetsDirectional.only(top: 30, bottom: 30)),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    NegativeButton(
                      text: K.moment_confirm_skip,
                      onPressed: () {
                        logic.gotoBoot(widget.fromRefer ?? '');
                      },
                      width: buttonW,
                      height: 48,
                    ),
                    const Spacer(),
                    BaseButton(
                      K.moment_back_select,
                      (e) {
                        Navigator.of(context).pop();
                      },
                      minWidth: buttonW,
                      height: 48,
                      fontSize: 16,
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 10,
                )
              ],
            ),
          ).cornerRadiusExt(topLeft: 10, topRight: 10);
        });
  }
}
