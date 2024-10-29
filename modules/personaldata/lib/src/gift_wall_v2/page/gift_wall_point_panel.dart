import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/api/gift_wall_api.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/gift_wall_v2/page/gift_wall_point_rank_page.dart';

class GiftWallPointPanel extends StatefulWidget {
  const GiftWallPointPanel({Key? key}) : super(key: key);

  @override
  State<GiftWallPointPanel> createState() => _GiftWallPointPanelState();

  static Future<void> show(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 0.7,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return const GiftWallPointPanel();
      },
    );
  }
}

class _GiftWallPointPanelState extends State<GiftWallPointPanel>
    with SingleTickerProviderStateMixin {
  LightScoreHomeRsp? _pointRsp;
  bool _isLoading = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _requestData();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.addStatusListener((status) {
      if ((status == AnimationStatus.completed ||
              status == AnimationStatus.dismissed) &&
          !_isLoading) {
        _controller.stop();
        _controller.reset();
      } else if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return _loadingWidget();
    if (_pointRsp != null && !_pointRsp!.success) return _errorWidget();
    return _buildBody();
  }

  Widget _loadingWidget() {
    return Stack(
      children: [
        R.img(
          Assets.personaldata$gift_wall_point_bg_webp,
          width: Util.width,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
            child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            _titleWidget(),
          ],
        )),
        const Positioned.fill(
          child: Center(
            child: Loading(),
          ),
        ),
      ],
    );
  }

  Widget _errorWidget() {
    return Stack(
      children: [
        R.img(
          Assets.personaldata$gift_wall_point_bg_webp,
          width: Util.width,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
            child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            _titleWidget(),
          ],
        )),
        Positioned.fill(
          child: Center(
            child: ErrorData(
              error: _pointRsp?.msg,
              fontColor: Colors.white,
              onTap: () {
                _requestData();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        R.img(
          Assets.personaldata$gift_wall_point_bg_webp,
          width: Util.width,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
            child: Column(
          children: [
            const SizedBox(
              height: 51,
            ),
            _titleWidget(),
            const SizedBox(
              height: 14,
            ),
            _pointWidget(),
            const SizedBox(
              height: 21,
            ),
            _offGiftWidget(),
            const SizedBox(
              height: 21,
            ),
            _mallButtonWidget(),
          ],
        )),
      ],
    );
  }

  Widget _titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 24,
          width: 44,
        ),
        R.img(
          Assets.personaldata$gift_wall_point_on_text_png,
          height: 25,
          fit: BoxFit.fitHeight,
        ),
        GestureDetector(
          onTap: () {
            GiftWallPointRankPage.show(context);
          },
          child: Container(
            margin: const EdgeInsetsDirectional.only(end: 10),
            width: 44,
            height: 30,
            alignment: Alignment.bottomCenter,
            child: R.img(
              Assets.personaldata$gift_wall_point_rank_icon_webp,
              height: 25,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }

  Widget _pointWidget() {
    double allWidth = 156.dp;
    double width = (_pointRsp?.data.selfScore.toDouble() ?? 0) /
        max(_pointRsp?.data.totalScore ?? 0, 1) *
        allWidth;
    if (width != 0) {
      width = max(width, 10);
      width = min(width, allWidth);
    }

    return SizedBox(
      height: 153.dp,
      child: Stack(
        children: [
          PositionedDirectional(
              top: 0,
              start: 16.dp,
              child: Container(
                width: Util.width - 32.dp,
                height: 86.dp,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.dp),
                  color: Colors.black.withOpacity(0.24),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                      const Color(0xFF664AC4),
                      const Color(0xff1C165C).withOpacity(0)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 16.dp, top: 16.dp),
                        child: R.img(
                            Assets.personaldata$gift_wall_point_text_webp,
                            height: 20.dp,
                            fit: BoxFit.fitHeight)),
                    GestureDetector(
                      onTap: () {
                        _showPointRule(_pointRsp?.data.description ?? '');
                      },
                      child: Container(
                        height: 22.dp,
                        width: 54.dp,
                        margin:
                            EdgeInsetsDirectional.only(end: 16.dp, top: 16.dp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11.dp),
                          color: const Color(0xffA6BDF5).withOpacity(0.24),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          K.point_rule,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 10.dp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          PositionedDirectional(
              top: 53.dp,
              start: 16.dp,
              end: 16.dp,
              bottom: 0,
              child: R.img(
                Assets.personaldata$gift_wall_point_card_bg_webp,
                width: Util.width - 32.dp,
                height: 100.dp,
                fit: BoxFit.cover,
              )),
          PositionedDirectional(
              top: 53.dp,
              start: 16.dp,
              end: 16.dp,
              bottom: 0,
              child: Container(
                width: Util.width - 32.dp,
                height: 100.dp,
                alignment: Alignment.center,
                padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            NumText(
                              _pointRsp?.data.selfScore.toString() ?? '0',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(bottom: 5),
                              child: Text(
                                K.gift_point,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.dp,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 9.dp,
                              width: allWidth,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.24),
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(5.dp),
                                    bottomStart: Radius.circular(5.dp)),
                              ),
                            ),
                            Container(
                              height: 9.dp,
                              width: width,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xffF0A672),
                                    Color(0xffF0D7C1)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5.dp),
                              ),
                            ),
                            PositionedDirectional(
                                end: -20.dp,
                                child: R.img(
                                    Assets
                                        .personaldata$gift_wall_point_max_webp,
                                    width: 20.dp,
                                    height: 9.dp)),
                          ],
                        ),
                        SizedBox(
                          height: 6.dp,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 13.dp),
                      child: R.img(
                        Assets.personaldata$gift_wall_point_big_icon_webp,
                        width: 91.dp,
                        height: 87.dp,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  ///未点亮的礼物
  Widget _offGiftWidget() {
    if (_pointRsp != null && _pointRsp!.data.unlitList.isEmpty) {
      return Container(
        height: 180,
        alignment: Alignment.center,
        child: Text(
          K.gift_wall_light_all,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      );
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              R.img(
                Assets.personaldata$gift_wall_gift_off_text_png,
                width: 84.dp,
                height: 25.dp,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (!_isLoading) {
                    _controller.forward();
                    _requestData();
                  }
                },
                child: Container(
                  width: 44.dp,
                  height: 25.dp,
                  alignment: AlignmentDirectional.centerEnd,
                  child: (RotationTransition(
                    turns: _animation,
                    child: R.img(
                      Assets.personaldata$gift_wall_point_gift_refresh_webp,
                      width: 16.dp,
                      height: 16.dp,
                    ),
                  )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _pointRsp?.data.unlitList.map((e) {
                  return _giftItemWidget(e);
                }).toList() ??
                [],
          ),
        ],
      ),
    );
  }

  Widget _giftItemWidget(LightScoreHomeRsp_Data_UnlitGiftItem giftItem) {
    double edgePadding = 16.dp;
    double itemPadding = 8.dp;
    double width = (Util.width - edgePadding * 2 - itemPadding * 2) / 3;
    double height = 144 / 109 * width;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: width,
                height: height - 48.dp,
                decoration: BoxDecoration(
                  color: const Color(0xff3F408F),
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(12.dp),
                      topEnd: Radius.circular(12.dp)),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(
                      imageUrl: Util.giftImgUrl(giftItem.id),
                      width: 55.dp,
                      height: 55.dp,
                      suffix: '!cover375',
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      giftItem.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xffFBFAFD)),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 48.dp,
                decoration: BoxDecoration(
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                        colors: [Color(0xFF664AC4), Color(0xff1C165C)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    width: 0.5,
                  ),
                  color: const Color(0xff1C165C),
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(12.dp),
                      bottomEnd: Radius.circular(12.dp)),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    R.img(
                      Assets.personaldata$gift_wall_point_icon_webp,
                      width: 12.dp,
                      height: 12.dp,
                    ),
                    NumText(
                      '+${giftItem.score}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.dp,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (giftItem.url.isNotEmpty) {
                          SchemeUrlHelper.instance().checkSchemeUrlAndGo(
                              System.context, giftItem.url);
                        } else if ((_pointRsp?.data.jumpRid ?? 0) > 0) {
                          IRoomManager roomManager = ComponentManager.instance
                              .getManager(ComponentManager.MANAGER_BASE_ROOM);

                          ///如果是缺少发出的礼物图鉴则进房的同时打开礼物面板
                          if (giftItem.send) {
                            roomManager.openRoomWithGiftPanel(
                                context, _pointRsp!.data.jumpRid,
                                giftId: giftItem.id,
                                tab: giftItem.panelTab == 1
                                    ? DisplayPage.privilege
                                    : DisplayPage.gift);
                          } else {
                            roomManager.openChatRoomScreenShow(
                                context, _pointRsp!.data.jumpRid);
                          }
                        }
                      },
                      child: Container(
                        width: 40.dp,
                        height: 28.dp,
                        decoration: BoxDecoration(
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFE5C2),
                                    Color(0xffFFFFFF)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              width: 1,
                            ),
                            color: const Color(0xff1C165C),
                            borderRadius: BorderRadius.circular(14.dp),
                            gradient: const LinearGradient(colors: [
                              Color(0xffF0A672),
                              Color(0xffF0D7C1),
                            ])),
                        alignment: Alignment.center,
                        child: Text(
                          K.personal_lighten,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xff0D021D)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              )
            ],
          ),
          PositionedDirectional(
              start: 4,
              top: 4,
              child: Container(
                alignment: Alignment.center,
                height: 14,
                padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  giftItem.send ? K.send : K.receive,
                  style: TextStyle(
                      fontSize: 10, color: Colors.white.withOpacity(0.7)),
                ),
              )),
        ],
      ),
    );
  }

  Widget _mallButtonWidget() {
    return GestureDetector(
      onTap: () {
        IVipManager vipManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.show(context, mainIndex: 4, subIndex: 2);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientText(K.go_to_mall,
              gradient: const LinearGradient(colors: [
                Color(0xffF0A672),
                Color(0xffF0D7C1),
              ])),
          R.img(
            Assets.personaldata$gift_wall_ic_next_webp,
            width: 14.dp,
            height: 14.dp,
          ),
        ],
      ),
    );
  }

  void _showPointRule(String ruleString) {
    if (ruleString.isEmpty) return;
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              width: Util.width - 96.dp,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21.dp),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    K.point_rule,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 16.dp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 24.dp, end: 24.dp),
                    child: Text(
                      ruleString,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 14.dp,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 1,
                    color: R.color.dividerColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: Util.width - 96.dp,
                      height: 49.dp,
                      child: Text(
                        K.personal_i_know,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontSize: 18.dp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _requestData() async {
    if (_isLoading) return;
    _isLoading = true;
    _pointRsp = await GiftWallApi.getLightPoints();
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}
