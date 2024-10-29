import 'package:vip/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import 'model/pb/slp_title_repo.dart';
import 'model/pb/generated/slp_title.pb.dart';

/// 贵族中心特权详情dialog

const int slpCanNotApply = 0; // 平台首页推荐-不能申请
const int slpCanApply = 1; // 平台首页推荐-可以申请
const int slpHasApplied = 2; // 平台首页推荐-已经申请

class NobilityPrivilegeDetailDialog extends StatefulWidget {
  final List<PrivilegeInfoItem> items;
  final int selectedIndex;
  final int level;

  /// 平台首页推荐里面本月进度扩展数据
  final NobilityExtend? extend;

  /// 刷新数据回调
  final VoidCallback? onRefresh;

  const NobilityPrivilegeDetailDialog(
      {super.key,
      required this.items,
      required this.selectedIndex,
      required this.level,
      this.extend,
      this.onRefresh});

  static show(BuildContext context, int level, List<PrivilegeInfoItem> items,
      int initIndex,
      {NobilityExtend? extend, VoidCallback? onRefresh}) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return NobilityPrivilegeDetailDialog(
            level: level,
            items: items,
            selectedIndex: initIndex,
            extend: extend,
            onRefresh: onRefresh,
          );
        });
  }

  @override
  State<NobilityPrivilegeDetailDialog> createState() =>
      _NobilityPrivilegeDetailDialogState();
}

class _NobilityPrivilegeDetailDialogState
    extends State<NobilityPrivilegeDetailDialog> {
  int _selectedIndex = 0;
  final ValueNotifier<bool> _controller = ValueNotifier<bool>(false); // 皇帝宝座
  final ValueNotifier<bool> _micNickBgController =
      ValueNotifier<bool>(false); // 麦坑名字背景

  int applyBanner = slpCanNotApply;

  /// 记录贵族麦坑佩戴数据
  TitleMicSofaData? _sofaData;
  String _wearName = '';

  /// 佩戴更换Key
  final GlobalKey _wearChangeContainerKey = GlobalKey();
  bool _isWearOpen = false;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
    _micSofaSetting(initial: true);
    refresh(() {
      applyBanner = Util.parseInt(widget.extend?.applyBanner);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _micNickBgController.dispose();
    super.dispose();
  }

  /// 贵族专属麦座开关设置 on：0代表关，1代表开
  Future<void> setExclusiveMic(String settingType, int on) async {
    try {
      XhrResponse response = await Xhr.post(
        'go/yy/title/setExclusiveMic',
        {'setting_type': settingType, 'on': '$on'},
        pb: true,
      );
      NormalNull resp = NormalNull.fromBuffer(response.bodyBytes);
      if (resp.success) {
        Fluttertoast.showCenter(msg: R.string('setting_success'));
      } else if (Util.validStr(resp.msg)) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    } catch (_) {
      Fluttertoast.showCenter(msg: K.vip_open_box_failed);
    }
    refresh(() {});
  }

  /// 申请制作专属banner
  /// POST  /go/yy/title/applyPersonalBanner
  Future<void> applyPersonalBanner() async {
    try {
      XhrResponse response = await Xhr.post(
        'go/yy/title/applyPersonalBanner',
        {},
        pb: true,
      );
      NormalNull resp = NormalNull.fromBuffer(response.bodyBytes);
      if (resp.success) {
        Fluttertoast.showCenter(msg: R.string('setting_apply_success'));
        refresh(() {
          applyBanner = slpHasApplied;
        });
        if (widget.onRefresh != null) {
          widget.onRefresh!();
        }
      } else if (Util.validStr(resp.msg)) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    } catch (_) {
      Fluttertoast.showCenter(msg: R.string('personal_apply_fail_tips'));
    }
  }

  /// 获取专属麦座设置
  void _micSofaSetting({bool initial = false}) async {
    ResTitleMicSofaSetting resp = await SlpTitleRepo.micSofaSetting();
    if (resp.success && resp.hasData()) {
      refresh(() {
        _sofaData = resp.data;
        for (TitleMicSofaInfo item in resp.data.dropbox) {
          if (item.selected) {
            _wearName = item.name;
            break;
          }
        }
        if (initial) {
          _controller.value = Util.parseBool(_sofaData?.enable);
          _micNickBgController.value =
              Util.parseBool(_sofaData?.micNickBgEnable);
        }
      });
    }

    if (initial) {
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) {
          return;
        }
        _controller.addListener(() async {
          bool value = _controller.value;
          await setExclusiveMic('7', value ? 1 : 0);
          Tracker.instance.track(TrackEvent.click,
              properties: {'click_page': 'click_sofabt', 'on': value ? 1 : 0});
        });
        _micNickBgController.addListener(() async {
          bool value = _micNickBgController.value;
          await setExclusiveMic('11', value ? 1 : 0);
          Tracker.instance.track(TrackEvent.click, properties: {
            'click_page': 'click_nick_mic_bg',
            'on': value ? 1 : 0
          });
        });
      });
    }
  }

  /// 佩戴专属麦座
  Future<void> setMicSofa(TitleMicSofaInfo item) async {
    NormalNull resp =
        await SlpTitleRepo.setMicSofa(sofaLevel: item.level, id: item.id);
    if (resp.success) {
      Fluttertoast.showCenter(msg: R.string('change_success'));
      _micSofaSetting();
    } else if (Util.validStr(resp.msg)) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildSwiper();
  }

  Widget _buildSwiper() {
    int length = widget.items.length;
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Util.width,
                height: 420,
                child: Swiper(
                  key: ValueKey(length),
                  outer: true,
                  loop: false,
                  scale: 0.7,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 275 / Util.width,
                  itemCount: length,
                  index: _selectedIndex,
                  physics: length == 1
                      ? const NeverScrollableScrollPhysics()
                      : const PageScrollPhysics(
                          parent: BouncingScrollPhysics()),
                  onIndexChanged: (index) {
                    _selectedIndex = index;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    PrivilegeInfoItem item = widget.items[index];
                    return _buildContent(item);
                  },
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (Navigator.canPop(Constant.context)) {
                    Navigator.pop(Constant.context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: R.img('privilege_detail_close.webp',
                      width: 30,
                      height: 30,
                      package: ComponentManager.MANAGER_VIP),
                ),
              )
            ],
          ),
        ),
        if (_isWearOpen && Util.validList(_sofaData?.dropbox))
          PositionedDirectional(
            start: 0,
            top: 0,
            end: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                refresh(() {
                  _isWearOpen = !_isWearOpen;
                });
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        if (_isWearOpen && Util.validList(_sofaData?.dropbox))
          PositionedDirectional(
            start: (_currentWearChangeOffset()?.dx ?? 0),
            top: (_currentWearChangeOffset()?.dy ?? 0) - 20,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentWearChangeSize()?.width ?? 0,
              height: _isWearOpen
                  ? (Util.parseInt(_sofaData?.dropbox.length) > 5
                      ? 150
                      : Util.parseInt(_sofaData?.dropbox.length) * 30)
                  : 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(4),
                  color: const Color(0xFF3F3E43),
                ),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: Util.parseInt(_sofaData?.dropbox.length),
                    itemBuilder: (context, index) {
                      TitleMicSofaInfo dropbox = _sofaData!.dropbox[index];
                      return InkWell(
                        onTap: () async {
                          refresh(() {
                            _isWearOpen = !_isWearOpen;
                          });
                          await setMicSofa(dropbox);
                        },
                        child: Container(
                          width: _currentWearChangeSize()?.width ?? 0,
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(start: 8),
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            dropbox.name,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 11),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
      ],
    );
  }

  Widget _buildContent(PrivilegeInfoItem item) {
    return Container(
      width: 275,
      height: 420,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: const LinearGradient(
          colors: [Color(0xFFFCDDC1), Color(0xFF998585), Color(0xFFFCDDC1)],
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: const Color(0xFF2A292E),
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            (Util.validStr(item.key) && item.key == 'room_ticket')
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 227,
                      height: 190,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  Util.getRemoteImgUrl(item.popIcon ?? ''),
                              width: 227,
                              height: 434,
                              fit: BoxFit.fill,
                              errorWidget: Container(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: Util.getRemoteImgUrl(item.popIcon ?? ''),
                      width: 227,
                      height: 190,
                      fit: BoxFit.fill,
                      errorWidget: Container(
                        color: Colors.black,
                      ),
                    ),
                  ),
            const SizedBox(height: 20),
            Text(
              item.name ?? '',
              style: const TextStyle(
                  fontSize: 17,
                  color: Color(0xFFF4D49C),
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
              child: Text(
                item.popDesc(widget.level),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            _buildBottomWidget(item),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 1,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0x002A292E), Color(0xB3A3844B)])),
                ),
                const SizedBox(width: 4),
                Text(
                  item.popBottomDesc ?? '',
                  style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF726550),
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 40,
                  height: 1,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xB3A3844B), Color(0x002A292E)])),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomWidget(PrivilegeInfoItem item) {
    if (!Util.validStr(item.key)) return const SizedBox.shrink();
    if (item.key == 'gift_update' && Session.titleNew >= item.start) {
      // 专属礼物上新
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 10),
        child: GestureDetector(
          onTap: () {
            Tracker.instance.track(TrackEvent.click, properties: {
              'click_page': 'click_seegiftnew',
            });
            final IPersonalDataManager personalDataManager = ComponentManager
                .instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            // 跳转到礼物图鉴
            personalDataManager.openGiftWallScreen(context, Session.uid);
          },
          child: Container(
            width: 84,
            height: 24,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFFDBAF63), Color(0xFFF4D49C)],
                )),
            child: Text(
              K.vip_go_see,
              style: const TextStyle(
                  color: Color(0xFF533400),
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    } else if (item.key == 'mic_sofa' &&
        Session.titleNew >= item.start &&
        _sofaData != null) {
      // 贵族麦坑
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (Util.validList(_sofaData?.dropbox))
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    K.vip_throne_select,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 11),
                  ),
                  const SizedBox(width: 3),
                  InkWell(
                    onTap: () {
                      refresh(() {
                        _isWearOpen = !_isWearOpen;
                      });
                    },
                    child: Container(
                      key: _wearChangeContainerKey,
                      width: 76,
                      height: 20,
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(4),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 8),
                              child: Text(
                                _wearName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          R.img('ic_arrow_down.png',
                              width: 10,
                              height: 10,
                              package: ComponentManager.MANAGER_BASE_ROOM,
                              color: R.color.mainTextColor)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            if (Util.validList(_sofaData?.dropbox)) const SizedBox(height: 14),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.vip_wear_or_not,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 11),
                ),
                const SizedBox(width: 3),
                AdvancedSwitch(
                  activeColor: const Color(0xFFF4D49C),
                  inactiveColor: Colors.grey.withOpacity(0.5),
                  thumb: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      // border: Border.all(color: Color(0xFFFFD782), width: 1.0),
                      color: Colors.white,
                    ),
                  ),
                  width: 30,
                  height: 16,
                  controller: _controller,
                ),
              ],
            ),
          ],
        ),
      );
    } else if (item.key == 'personal_banner' &&
        Session.titleNew >= item.start) {
      // 平台首页推荐
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  K.vip_month_progress,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 11),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Stack(
                    children: [
                      PositionedDirectional(
                        start: 0,
                        end: 0,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Container(
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          },
                        ),
                      ),
                      if (widget.extend != null)
                        PositionedDirectional(
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Container(
                                width: constraints.maxWidth /
                                    Util.parseInt(
                                        widget.extend?.monthlyPayRequire) *
                                    Util.parseInt(widget.extend?.monthlyPay),
                                height: 4,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFFDBAF63),
                                    Color(0xFFF4D49C)
                                  ]),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${Util.parseInt(widget.extend?.monthlyPay) >= 10000 ? '${(Util.parseInt(widget.extend?.monthlyPay) / 10000).floor()}w' : '${Util.parseInt(widget.extend?.monthlyPay)}'}/${Util.parseInt(widget.extend?.monthlyPayRequire) >= 10000 ? '${(Util.parseInt(widget.extend?.monthlyPayRequire) / 10000).floor()}w' : '${Util.parseInt(widget.extend?.monthlyPayRequire)}}'}',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 11),
                )
              ],
            ),
            const SizedBox(height: 14),
            GestureDetector(
              onTap: () async {
                if (applyBanner == slpCanApply) {
                  Tracker.instance.track(TrackEvent.click, properties: {
                    'click_page': 'click_okreachedbt',
                  });
                  await applyPersonalBanner();
                }
              },
              child: Container(
                width: 84,
                height: 24,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: applyBanner == slpCanApply
                          ? [const Color(0xFFDBAF63), const Color(0xFFF4D49C)]
                          : [const Color(0xFFCACACA), const Color(0xFFFFFFFF)],
                    )),
                child: Text(
                  applyBanner == slpCanApply
                      ? K.vip_apply_make
                      : (applyBanner == slpHasApplied
                          ? K.vip_applied_make
                          : K.vip_not_achieve),
                  style: TextStyle(
                      color: const Color(0xFF533400)
                          .withOpacity(applyBanner == slpCanApply ? 1 : 0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (item.key == 'mic_nick_bg' &&
        Session.titleNew >= item.start &&
        _sofaData != null) {
      // 麦位昵称背景
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              K.vip_wear_or_not,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11),
            ),
            const SizedBox(width: 3),
            AdvancedSwitch(
              activeColor: const Color(0xFFF4D49C),
              inactiveColor: Colors.grey.withOpacity(0.5),
              thumb: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.white,
                ),
              ),
              width: 30,
              height: 16,
              controller: _micNickBgController,
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Offset? _currentWearChangeOffset() {
    RenderBox? renderBox = _wearChangeContainerKey.currentContext
        ?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero);
  }

  Size? _currentWearChangeSize() {
    RenderBox? renderBox = _wearChangeContainerKey.currentContext
        ?.findRenderObject() as RenderBox?;
    return renderBox?.size;
  }
}
