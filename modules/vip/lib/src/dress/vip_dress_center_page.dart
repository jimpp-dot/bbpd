import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:shared/assets.dart' as CoreAssets;
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:vip/assets.dart';

import '../../k.dart';
import 'model/vip_dress_repo.dart';
import 'vip_dress_center_controller.dart';
import 'vip_dress_preview_dialog.dart';

class VipDressCenterPage extends GetView<VipDressCenterController> {
  final int? initCateId;
  final int? initDressId;

  const VipDressCenterPage({super.key, this.initCateId, this.initDressId});

  static Future show(BuildContext context, {int? initCateId, int? initDressId}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VipDressCenterPage(
        initCateId: initCateId,
        initDressId: initDressId,
      ),
      settings: const RouteSettings(name: VipDressCenterController.routeName),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VipDressCenterController>(
        id: VipDressCenterController.updateId,
        init: VipDressCenterController(initCateId, initDressId),
        builder: (controller) {
          bool noData = (controller.cateRes?.data.length ?? 0) == 0;
          if (controller.cateRes == null || noData) {
            return const Loading();
          }
          double horizontalPadding = 16;
          Widget bg = R.img(
            Assets.vip$vip_dress_bg_new,
            fit: BoxFit.fitWidth,
            width: Util.width,
          );

          return SafeArea(
            child: Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              appBar: BaseAppBar.custom(
                titleSpacing: 0,
                leadingWidth: 50,
                title: text16('装扮中心', textColor: Colors.white),
                statusBrightness: Brightness.dark,
                backColor: Colors.white,
                backgroundColor: Colors.transparent,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48.0),
                  child: Container(
                    child: noData
                        ? const SizedBox.shrink()
                        : CommonTabBar(
                            labelColor: R.dColor.mainTextColor,
                            unselectedLabelColor: const Color(0x80FFFFFF),
                            tabs: List.generate(controller.cateRes!.data.length, (index) {
                              return Tab(text: controller.cateRes!.data[index].name);
                            }),
                            indicatorPadding: const EdgeInsets.only(bottom: 4),
                            indicator: const CommonUnderlineTabIndicator(
                              borderSide: BorderSide(width: 4.0, color: Color(0xFFD4FA00)),
                              wantWidth: 8,
                              draggingWidth: 12.0,
                            ),
                            controller: controller.tabController,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.tab,
                          ),
                  ),
                ),
              ),
              bottomNavigationBar: GetBuilder<VipDressCenterController>(
                id: VipDressCenterController.userInfoUpdateId,
                builder: (controller) {
                  return userInfoWidget(context, EdgeInsets.symmetric(horizontal: horizontalPadding));
                },
              ),
              body: noData
                  ? (controller.cateRes?.msg != null
                      ? ErrorData(
                          error: controller.cateRes!.msg,
                          fontColor: R.dColor.secondTextColor,
                          onTap: () {
                            controller.loadPageData();
                          },
                        )
                      : const Loading())
                  : TabBarView(
                      physics: const ClampingScrollPhysics(),
                      controller: controller.tabController,
                      children: List.generate(
                        controller.cateRes!.data.length,
                        (index) {
                          VipDressCateData cateData = controller.cateDataMap[controller.cateRes!.data[index].id]!;
                          LoadMoreListSource source = cateData.source!;

                          return GetBuilder<VipDressCenterController>(
                            id: '${VipDressCenterController.dressUpdateId}_${cateData.cateId}',
                            builder: (controller) {
                              double sliverPersistentHeaderHeight = 267;
                              bool hasPreview = hasPreviewBtn(cateData);
                              if (!hasPreview) {
                                sliverPersistentHeaderHeight - 50;
                              }
                              return Stack(
                                children: [
                                  centerPreviewWidget(
                                    context,
                                    EdgeInsets.symmetric(horizontal: horizontalPadding),
                                    sliverPersistentHeaderHeight,
                                    cateData,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: sliverPersistentHeaderHeight),
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 28),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage(R.imagePath(Assets.vip$zhuangban_bottom_bg))),
                                      ),
                                      child: GetBuilder<VipDressCenterController>(
                                        id: '${VipDressCenterController.dressListUpdateId}_${cateData.cateId}',
                                        builder: (controller) {
                                          return dressList(
                                            EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, bottom: 40, top: 0),
                                            source,
                                            cateData,
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
            ),
          ).withCommonBgLocalImg(bg);
        });
  }

  Widget userInfoWidget(BuildContext context, EdgeInsets horizontalPadding) {
    return Padding(
      padding: horizontalPadding.copyWith(top: 12, bottom: 16),
      child: Container(
        // height: 44,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF030E2F),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(width: 0.5, color: const Color(0xFFFFE78A)),
          ),
          child: controller.myRes?.data == null || !controller.myRes!.success
              ? GestureDetector(
                  onTap: () {
                    controller.refreshUserInfo(true);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.myRes?.msg ?? BaseK.K.server_return_error_retry,
                        style: TextStyle(fontSize: 14, color: R.dColor.mainTextColor, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SizedBox(
                            child: CachedNetworkImage(
                              imageUrl: controller.myRes!.data.my.userLevelIcon,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                          // 用户装扮体系等级
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 12,
                                    padding: const EdgeInsets.symmetric(horizontal: 6),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 1),
                                      gradient: const LinearGradient(colors: [Color(0xFFFFBC00), Color(0xFFFF7C00)]),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Lv.${controller.myRes!.data.my.userLevel}',
                                      style: const TextStyle(fontSize: 9, color: Color(0xFFD4FA00), fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    SizedBox(
                      width: 60,
                      height: 12,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: const Color(0xFF372F75)),
                          ),
                          // 经验条
                          Container(
                            width: 60 * controller.levelUpProgress,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: const Color(0xFFD4FA00)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${controller.myRes!.data.my.starScore}/${controller.myRes!.data.my.nextLevelScore}',
                      style: TextStyle(fontSize: 14, color: R.dColor.mainTextColor, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 0.5,
                      height: 20,
                      color: const Color(0x1FFFFFFF),
                    ),
                    const SizedBox(width: 16),
                    R.img(Assets.vip$vip_dress_chip_png, width: 20, height: 20),
                    const SizedBox(width: 4),
                    Text(
                      controller.myRes!.data.my.fragmentNum.toString(),
                      style: TextStyle(fontSize: 14, color: R.dColor.mainTextColor, overflow: TextOverflow.ellipsis),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => BaseWebviewScreen.show(
                        context,
                        url: Util.getHelpUrlWithQStr('k174'),
                      ),
                      child: const Icon(Icons.help_outline, color: Color(0x80FFFFFF), size: 20),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
        ),
      ),
    );
  }

  LoadingMoreList dressList(EdgeInsets horizontalPadding, LoadingMoreBase<PretendGroupDetail> source, VipDressCateData cateData) {
    double width = (Util.width - 32 * 2 - 16 * 2) / 3;
    double maxWidth = (Util.width - 16 * 2) / 3 - 16;
    width = min(maxWidth, width);
    double hMargin = (Util.width - 32 * 2 - width * 3) / 2;

    return LoadingMoreList(
      ListConfig<PretendGroupDetail>(
        padding: horizontalPadding,
        autoRefresh: false,
        itemBuilder: (BuildContext context, PretendGroupDetail data, int index) {
          return dressItem(index, index >= source.length - 3, width, hMargin, data, cateData);
        },
        indicatorBuilder: (context, status) {
          if (status == IndicatorStatus.loadingMoreBusying) {
            return const LoadingFooter(hasMore: true);
          } else if (status == IndicatorStatus.fullScreenBusying) {
            return const CupertinoActivityIndicator(
              color: Colors.white,
            );
          } else if (status == IndicatorStatus.noMoreLoad) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 33),
              child: Container(
                width: Util.width - 32,
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(16), bottomEnd: Radius.circular(16)),
                ),
              ),
            );
          } else if (status == IndicatorStatus.fullScreenError) {
            return ErrorData(
              fontColor: R.dColor.secondTextColor,
              onTap: () {
                source.refresh(true);
              },
            );
          } else if (status == IndicatorStatus.error) {
            return LoadingFooter(errorMessage: BaseK.K.data_error, textColor: R.dColor.secondTextColor, loadMore: source.loadMore);
          } else if (status == IndicatorStatus.empty) {
            return EmptyWidget(
              textColor: R.dColor.secondTextColor,
            );
          }
          return const LoadingFooter(hasMore: true);
        },
        sourceList: source,
        lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        extendedListDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }

  Widget dressItem(int index, bool isLastLine, double width, double hMargin, PretendGroupDetail data, VipDressCateData cateData) {
    double boxWidth = (Util.width - 16 * 2) / 3;
    double centerLeftMargin = hMargin - (boxWidth - width - 16);

    // 通过index来判断位置和尺寸，来填充item之间的颜色
    late AlignmentGeometry alignment;
    late EdgeInsetsGeometry insets;
    double insertBottom = isLastLine ? 0 : 16;
    if (index % 3 == 0) {
      alignment = AlignmentDirectional.topStart;
      insets = EdgeInsets.only(left: 16, bottom: insertBottom);
    } else if (index % 3 == 1) {
      alignment = AlignmentDirectional.topStart;
      insets = EdgeInsets.only(left: centerLeftMargin, bottom: insertBottom);
    } else {
      alignment = AlignmentDirectional.topEnd;
      insets = EdgeInsetsDirectional.only(end: 16, bottom: insertBottom);
    }

    Widget tagWidget = const SizedBox.shrink();
    if (data.isExpired) {
      // 优先判断已过期，已过期的也可能是正在使用中
      tagWidget = Container(
        width: 32,
        height: 14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(colors: [Color(0xFF8F8F8F), Color(0xFFCCCCCC)]),
        ),
        alignment: Alignment.center,
        child: Text(K.vip_dress_outdate, style: const TextStyle(fontSize: 8, color: Color(0xFFFFFFFF))),
      );
    } else if (data.groupInfo.isUse) {
      tagWidget = Container(
        width: 32,
        height: 14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(colors: [Color(0xFFF9599F), Color(0xFFFFE776)]),
        ),
        alignment: Alignment.center,
        child: Text(K.vip_dress_using, style: const TextStyle(fontSize: 8, color: Color(0xFFFFFFFF))),
      );
    }

    return Container(
      alignment: alignment,
      padding: insets,
      child: !data.groupInfo.hasId()
          ? SizedBox(width: width, height: 133)
          : GestureDetector(
              onTap: () {
                controller.selectDress(data);
              },
              child: Container(
                width: width,
                height: 133,
                decoration: data.groupInfo == cateData.currentDress?.groupInfo
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF323E64),
                        border: Border.all(width: 1.5, color: const Color(0xFFB9EEC1)))
                    : BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF323E64)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Opacity(
                      opacity: (data.groupInfo.isHas && !data.isExpired) ? 1 : 0.5,
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CachedNetworkImage(
                              imageUrl: data.groupInfo.icon,
                              suffix: '!lfit_wh200',
                              width: 65,
                              height: 65,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data.groupInfo.name,
                              style: const TextStyle(fontSize: 12, color: Color(0xE6FFFFFF), overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(height: 6),
                            stars(16, data.groupInfo.useStarNum)
                          ],
                        ),
                      ),
                    ),
                    PositionedDirectional(top: 4, start: 4, child: tagWidget),
                    if (!data.groupInfo.isHas) Center(child: R.img(Assets.vip$vip_dress_lock_webp, width: 28, height: 28)),
                  ],
                ),
              ),
            ),
    );
  }

  /// 装扮预览面板
  Widget centerPreviewWidget(BuildContext context, EdgeInsets horizontalPadding, double height, VipDressCateData cateData) {
    List<PretendInfo> currentSexItems = cateData.currentDress?.pretendListForSex(cateData.currentMale) ?? [];
    if (currentSexItems.length > 3) {
      currentSexItems = currentSexItems.sublist(0, 3);
    }
    double currentSexItemH = currentSexItems.isNotEmpty ? 180 : 0;

    double height = 80 + 12 + 16 + 6 + 6 + 80 + currentSexItemH;

    double itemH = 180 - 12;
    if (cateData.currentDress?.groupInfo.periodEndFmt.isNotEmpty ?? false) {
      height = height + 30 + 42;
    } else {
      if (hasPreviewBtn(cateData)) {
        height = height + 72 + 36 - 42;
      } else {
        height = height + 72 - 42;
      }
      itemH = itemH - 30;
    }
    return Container(
      height: height,
      color: const Color(0xFF030E2F),
      child: cateData.currentDress == null || currentSexItems.isEmpty
          ? Center(
              child: Text(
                K.vip_dress_tips_empty,
                style: const TextStyle(fontSize: 14, color: Color(0xE6FFFFFF), fontWeight: FontWeight.w500),
              ),
            )
          : Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 装扮标题行
                    SizedBox(
                      height: 48,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 12),
                              Opacity(
                                opacity: cateData.currentDress!.hasSex ? 1 : 0.5,
                                child: CustomToggleSwitch(
                                  cornerRadius: 12,
                                  width: 70,
                                  height: 24,
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  bgColor: const Color(0xFF372F75),
                                  leftActiveWidget: Container(
                                    width: 35,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    child: R.img(CoreAssets.BaseAssets.shared$core_common_sex_male_webp,
                                        width: 16, height: 16, color: const Color(0xFF0097FF)),
                                  ),
                                  leftInactiveWidget: Container(
                                    width: 35,
                                    height: 20,
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: R.img(CoreAssets.BaseAssets.shared$core_common_sex_male_webp,
                                        width: 16, height: 16, color: const Color(0x80FFFFFF)),
                                  ),
                                  rightActiveWidget: Container(
                                    width: 35,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    child: R.img(CoreAssets.BaseAssets.shared$core_common_sex_female_webp,
                                        width: 16, height: 16, color: const Color(0xFFFA507C)),
                                  ),
                                  rightInactiveWidget: Container(
                                    width: 35,
                                    height: 20,
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: R.img(CoreAssets.BaseAssets.shared$core_common_sex_female_webp,
                                        width: 16, height: 16, color: const Color(0x80FFFFFF)),
                                  ),
                                  value: cateData.currentMale,
                                  didSwitch: (value) {
                                    if (!cateData.currentDress!.hasSex) {
                                      return;
                                    }
                                    controller.selectMale(value);
                                  },
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(width: 12),
                            ],
                          ),
                          IgnorePointer(
                            ignoring: true,
                            child: Center(
                              child: Text(
                                cateData.currentDress!.groupInfo.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xE6FFFFFF),
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 装扮展示区域
                    currentSexItems.isNotEmpty
                        ? SizedBox(
                            width: (80 + 26) * currentSexItems.length - 26,
                            height: itemH,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  PretendInfo item = currentSexItems[index];
                                  Log.d('item:${item}');
                                  return centerPreviewItem(80, itemH, context, item, cateData);
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                      width: 26,
                                      alignment: Alignment.topCenter,
                                      child: SizedBox(
                                          height: 80,
                                          child: R.img(Assets.vip$vip_dress_arrow_right_webp, width: 14, color: Colors.red, height: 14)));
                                },
                                itemCount: currentSexItems.length),
                          )
                        : const SizedBox.shrink(),

                    // 装扮操作按钮区
                    hasPreviewBtn(cateData)
                        ? Container(
                            width: Util.width - 32,
                            alignment: Alignment.center,
                            child: centerPreviewBtnsWidget(context, 80, cateData),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ],
            ),
    );
  }

  /// 装扮预览itemstarNum
  Widget centerPreviewItem(double width, double height, BuildContext context, PretendInfo item, VipDressCateData cateData) {
    double avatarRate = 0;
    double sourceRate = 1.0;
    if (cateData.cateId == 1) {
      // 头像框像素分辨率比较低，整体需要缩小一点
      sourceRate = 0.6;
      avatarRate = 0.8;
    } else if (cateData.cateId == 5) {
      //麦上光圈比头像框小一圈
      avatarRate = 0.65;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (cateData.currentDressState == item || item.isLock) {
          showDialog(
            context: context,
            builder: (buildContext) {
              if (cateData.cateId == 4) {
                // 个人页装扮
                return VipUserBgPreviewDilaog(
                  item,
                  item.mp4Source.url.isNotEmpty ? item.mp4Source.url : item.urlSource,
                  item.extId,
                  item.extId > 0 ? item.vapSize : item.mp4Source.vapSize,
                  cateData.currentDress?.groupInfo.gotType ?? '',
                );
              } else if (cateData.cateId == 6) {
                // 资料卡
                return VipUserCardPrevieDilaog(item.urlSource, cateData.currentDress?.groupInfo.gotType ?? '');
              } else if (item.extId != 0) {
                // 需要手动播放vap动画的
                return VipVapDressPreviewDilaog(item.urlSource, item.extId, item.vapSize);
              } else {
                return VipCommonPreviewDilaog(item.urlSource, sourceRate, avatarRate, cateData.currentDress?.groupInfo.gotType ?? '');
              }
            },
          );
          return;
        }

        controller.selectDressState(item);
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: width,
              height: width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: item.isLock ? 0.5 : 1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // 选中背景
                        // if (cateData.currentDressState == item)
                        //   Container(
                        //     width: width,
                        //     height: width,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(12),
                        //         color: const Color(0xE05D55A3)),
                        //   ),
                        // 头像
                        if (avatarRate > 0)
                          CommonAvatar(
                            path: Session.icon,
                            shape: BoxShape.circle,
                            size: width * 0.875 * avatarRate,
                          ),
                        // 装扮图片
                        CachedNetworkImage(
                          imageUrl: item.urlSource,
                          suffix: '!lfit_wh200',
                          width: width,
                          height: width * 0.875,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  // 锁
                  if (item.isLock) R.img(Assets.vip$vip_dress_lock_webp, width: 28, height: 28)
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(width: width, alignment: Alignment.center, child: stars(16, item.starNum)),
            const SizedBox(height: 6),
            Text(
              '${K.vip_dress_star_value}${cateData.currentDress!.starValue(item.starNum)}',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xE6FFFFFF),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
            if (cateData.currentDress?.groupInfo.periodEndFmt.isNotEmpty ?? false)
              Row(
                children: [
                  ...[
                    R.img(Assets.vip$vip_dress_time_webp, width: 16, height: 16),
                    const SizedBox(width: 2),
                    Text(
                      cateData.currentDress!.groupInfo.periodEndFmt,
                      style: const TextStyle(fontSize: 12, color: Color(0xE6FFFFFF), fontWeight: FontWeight.w500),
                    ),
                  ],
                ],
              )
          ],
        ),
      ),
    );
  }

  /// 装扮操作按钮
  Widget centerPreviewBtnsWidget(BuildContext context, double width, VipDressCateData cateData) {
    List<Widget> btns = [];
    bool useBtn = false;
    bool cancelBtn = false;
    bool getBtn = false;
    bool upgradeBtn = false;
    bool renewalBtn = false;
    if (cateData.currentLocked) {
      // 未解锁
      getBtn = true;
    } else if (cateData.currentDressState != null) {
      // 有选中某个星级
      if (cateData.currentExpired) {
        // 已过期
        renewalBtn = true;
      } else {
        if (cateData.currentUsing) {
          // 有正在使用的
          cancelBtn = (cateData.currentDressState?.starNum == cateData.currentDress?.groupInfo.useStarNum &&
              cateData.currentDressState?.sex == cateData.currentDress?.groupInfo.useSex);
          useBtn = !cancelBtn;
        } else {
          // 没有使用
          useBtn = true;
          cancelBtn = false;
        }
        upgradeBtn = cateData.nextCanLevelUp;
        renewalBtn = !cateData.currentPermanent;
      }
    }
    TextStyle textStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, height: 1.15);
    if (getBtn) {
      String url = cateData.currentDress!.groupInfo.gotUrl;
      btns.add(Opacity(
        opacity: url.isEmpty ? 0.5 : 1,
        child: RadiusInkButton(
          width: width,
          height: 36,
          decoration: commonBoxDecorationWithParams(R.colors.darkGradientColors, 36 / 2),
          enable: true,
          onTap: () {
            // 跳转去获取，返回时需要刷新
            if (url.isNotEmpty) {
              controller.didJumpToget = true;
              SchemeUrlHelper.instance().jump(url);
            } else {
              Fluttertoast.showCenter(msg: K.vip_dress_toast_outdate);
            }
          },
          child: Text(
            K.vip_get,
            style: textStyle.copyWith(color: const Color(0xFF080A31)),
          ),
        ),
      ));
    }
    if (upgradeBtn) {
      bool canUpgrade = (controller.myRes?.data.my.fragmentNum ?? 0) >= cateData.currentDress!.groupInfo.upStarFragmentNum;
      btns.add(Opacity(
        opacity: canUpgrade ? 1 : 0.5,
        child: IgnorePointer(
          ignoring: !canUpgrade,
          child: RadiusInkButton(
            width: width,
            height: 36,
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFDD9CFD), Color(0xFF9CEAFB)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.vip_level_up,
                  style: textStyle.copyWith(color: const Color(0xFF080A31)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    R.img(Assets.vip$vip_dress_chip_png, width: 12, height: 12),
                    const SizedBox(width: 2),
                    Text(
                      cateData.currentDress!.groupInfo.upStarFragmentNum.toString(),
                      style: textStyle.copyWith(fontSize: 10, color: const Color(0xFF080A31), fontWeight: FontWeight.w300),
                    ),
                  ],
                )
              ],
            ),
            onTap: () {
              controller.levelUpDress();
            },
          ),
        ),
      ));
    }
    if (useBtn) {
      btns.add(RadiusInkButton(
        width: width,
        height: 36,
        decoration: const BoxDecoration(color: Color(0xFFEFEFEF)),
        child: Text(
          K.use,
          style: textStyle.copyWith(color: const Color(0xFF080A31)),
        ),
        onTap: () {
          controller.useOrCancelDress(true, controller.currentSource);
        },
      ));
    }
    if (cancelBtn) {
      btns.add(RadiusInkButton(
        width: width,
        height: 36,
        decoration: const BoxDecoration(color: Color(0x80FFFFFF)),
        child: Text(
          K.cancel + K.use,
          style: textStyle.copyWith(color: const Color(0xFF080A31)),
        ),
        onTap: () {
          controller.useOrCancelDress(false, controller.currentSource);
        },
      ));
    }
    if (renewalBtn) {
      bool canRenewal = (controller.myRes?.data.my.fragmentNum ?? 0) >=
          cateData.currentDress!.groupInfo.rechargeFragmentNum * cateData.currentDress!.groupInfo.rechargeDays;
      btns.add(Opacity(
        opacity: canRenewal ? 1 : 0.5,
        child: IgnorePointer(
          ignoring: !canRenewal,
          // ignoring: false,
          child: RadiusInkButton(
            width: width,
            height: 36,
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF9EFF4E), Color(0xFF79D1FF)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.vip_pay_use_date,
                  style: textStyle.copyWith(color: const Color(0xFF080A31)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    R.img(Assets.vip$vip_dress_chip_png, width: 12, height: 12),
                    const SizedBox(width: 2),
                    Text(
                      '${cateData.currentDress!.groupInfo.rechargeFragmentNum * cateData.currentDress!.groupInfo.rechargeDays}/${cateData.currentDress!.groupInfo.rechargeDays}${BaseK.K.base_day}',
                      style: textStyle.copyWith(fontSize: 10, color: const Color(0xFF080A31), fontWeight: FontWeight.w300),
                    ),
                  ],
                )
              ],
            ),
            onTap: () async {
              bool? r = await showDialog(
                  context: context,
                  builder: (context) {
                    return ConfirmDialog(
                      title: '提示',
                      content:
                          '即将花费${cateData.currentDress!.groupInfo.rechargeDays * cateData.currentDress!.groupInfo.rechargeFragmentNum}碎片续期${cateData.currentDress!.groupInfo.rechargeDays}天，确认续期',
                      positiveButton: PositiveButton(text: BaseK.K.confirm),
                      negativeButton: NegativeButton(text: BaseK.K.cancel),
                    );
                  });
              if (r == true) {
                controller.renewalDress();
              }
            },
          ),
        ),
      ));
    }

    if (btns.isEmpty) {
      return const SizedBox.shrink();
    }

    for (int i = btns.length - 1; i > 0; i--) {
      btns.insert(i, const SizedBox(width: 26));
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: btns,
    );
  }

  Widget stars(double size, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        return R.img(Assets.vip$vip_dress_star_webp, width: size, height: size);
      }),
    );
  }

  Widget cornerMask(double radius, Color color, Color bgColor, bool top, {Color? centerColor}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(color: bgColor),
            ),
            Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: color,
                borderRadius: top
                    ? BorderRadiusDirectional.only(topStart: Radius.circular(radius))
                    : BorderRadiusDirectional.only(bottomStart: Radius.circular(radius)),
              ),
            ),
          ],
        ),
        centerColor != null
            ? Expanded(
                child: Container(
                  height: radius,
                  color: centerColor,
                ),
              )
            : const Spacer(),
        Stack(
          children: [
            Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(color: bgColor),
            ),
            Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: color,
                borderRadius: top
                    ? BorderRadiusDirectional.only(topEnd: Radius.circular(radius))
                    : BorderRadiusDirectional.only(bottomEnd: Radius.circular(radius)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool hasPreviewBtn(VipDressCateData cateData) {
    bool useBtn = false;
    bool cancelBtn = false;
    bool getBtn = false;
    bool upgradeBtn = false;
    bool renewalBtn = false;
    if (cateData.currentLocked) {
      // 未解锁
      getBtn = true;
    } else if (cateData.currentDressState != null) {
      // 有选中某个星级
      if (cateData.currentExpired) {
        // 已过期
        renewalBtn = true;
      } else {
        if (cateData.currentUsing) {
          // 有正在使用的
          cancelBtn = (cateData.currentDressState?.starNum == cateData.currentDress?.groupInfo.useStarNum &&
              cateData.currentDressState?.sex == cateData.currentDress?.groupInfo.useSex);
          useBtn = !cancelBtn;
        } else {
          // 没有使用
          useBtn = true;
          cancelBtn = false;
        }
        upgradeBtn = cateData.nextCanLevelUp;
        renewalBtn = !cateData.currentPermanent;
      }
    }
    return (useBtn || cancelBtn || getBtn || upgradeBtn || renewalBtn);
  }
}
