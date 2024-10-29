import 'dart:io';

import 'package:gift/slp_src/gift/slp_intimate_pay_mixin.dart';
import 'package:gift/slp_src/gift/widget/slp_balance_widget.dart';
import 'package:gift/slp_src/widget/slp_gift_num_select_widget.dart';
import 'package:gift/k.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:shared/shared.dart' hide Gift;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import '../../assets.dart';
import 'slp_diy_gift_item.dart';
import 'slp_diy_gift_preview.dart';
import '../model/pb/slp_gift_extension.dart';

double diyGiftPanelBodyHeight = 537;

/// DIY礼物预览/赠送panel
/// 暂时仅支持房间礼物面板
class SlpDiyGiftPanel extends StatefulWidget {
  // 各账户money
  final BbGiftPanelExtend? accountMoney;

  // 套装中的礼物列表(一个DIY礼物组，有一套礼物)
  final List<BbGiftPanelDiyGift>? gifts;

  // 麦上用户列表
  final List<RoomPosition>? inMicUids;

  // 礼物选择数量
  final List<BbGiftPanelChooseNumConfig>? chooseNumConfig;

  // 房间ID
  final int rid;

  // refer
  final String? refer;

  // 自己的麦序
  final int myPosition;

  final bool fromChat;

  // 是否显示亲密付
  final bool showIntimate;

  const SlpDiyGiftPanel({
    Key? key,
    this.accountMoney,
    this.gifts,
    this.inMicUids,
    this.chooseNumConfig,
    this.rid = 0,
    this.refer,
    this.myPosition = 0,
    this.fromChat = false,
    required this.showIntimate,
  }) : super(key: key);

  static Future<bool?> show(BuildContext context,
      {BbGiftPanelExtend? accountMoney,
      List<BbGiftPanelDiyGift>? gifts,
      List<RoomPosition>? inMicUids,
      List<BbGiftPanelChooseNumConfig>? chooseNumConfig,
      int rid = 0,
      String? refer,
      bool fromChat = false,
      required bool showIntimate,
      int myPosition = 0}) {
    return displayModalBottomSheet(
        context: context,
        disableTapDismissible: true,
        maxHeightRatio:
            (diyGiftPanelBodyHeight + Util.iphoneXBottom + 64) / Util.height,
        settings: const RouteSettings(name: '/diy_gift_panel'),
        builder: (BuildContext context) {
          return SlpDiyGiftPanel(
            accountMoney: accountMoney,
            gifts: gifts,
            inMicUids: inMicUids,
            chooseNumConfig: chooseNumConfig,
            rid: rid,
            refer: refer,
            myPosition: myPosition,
            fromChat: fromChat,
            showIntimate: showIntimate,
          );
        });
  }

  @override
  SlpDiyGiftPanelState createState() {
    return SlpDiyGiftPanelState();
  }
}

class SlpDiyGiftPanelState extends State<SlpDiyGiftPanel>
    with
        TickerProviderStateMixin<SlpDiyGiftPanel>,
        SlpIntimatePayMixin<SlpDiyGiftPanel> {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  final GlobalKey _selectNumKey = GlobalKey();
  int selectGiftIndex = 0;

  /// 选中礼物组中第几个礼物
  int _selectGiftNum = 1;

  /// 打赏礼物数量
  List<int> selectUids = [];
  Color roomBackgroundColor = const Color(0xFF171621).withOpacity(0.7);
  TabController? _tabController;
  List<String>? _tabString;
  final TextEditingController _signController = TextEditingController();
  // 填写的签名
  String sign = '';

  // 选择照片的类型，目前最多仅支持选择两个头像：1.没选，2.仅选择自己头像，3.仅选择对方头像，4.选择双方的头像
  int imageType = 1;

  @override
  bool get supportSlpIntimate => widget.showIntimate;

  @override
  void initState() {
    super.initState();

    _tabString = [K.gift_diy_tab_group, K.gift_diy_sign, K.gift_diy_avatar];
    safeRun(() {
      _tabController =
          TabController(length: _tabString?.length ?? 0, vsync: this);
      _tabController?.addListener(_onTabChanged);
    });
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    _signController.dispose();
    super.dispose();
  }

  _onTabChanged() {
    if (_tabController?.indexIsChanging == true) return;
    FocusScope.of(context).requestFocus(FocusNode());
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMicUsers(),
        Container(
          clipBehavior: Clip.antiAlias,
          height: diyGiftPanelBodyHeight + Util.iphoneXBottom,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16),
              topEnd: Radius.circular(16),
            ),
          ),
          child: _buildBody(),
        )
      ],
    );
  }

  Widget _buildBody() {
    double paddingTop = 316;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    if (bottom > 50) {
      if (paddingTop > bottom) {
        paddingTop = paddingTop - bottom + 52 + Util.iphoneXBottom;
      } else {
        paddingTop = 52 + Util.iphoneXBottom;
      }
    }

    return SizedBox(
      width: Util.width,
      height: diyGiftPanelBodyHeight + Util.iphoneXBottom,
      child: Stack(
        children: [
          SlpDiyGiftPreview(
            giftBg: Util.getRemoteImgUrl(
                widget.gifts?[selectGiftIndex].diyBg ?? ''),
            giftPreview:
                '${System.imageDomain}static/$giftSubDir/${widget.gifts?[selectGiftIndex].id}_diy_preview.mp4',
            giftAvatars: getSelectAvatars(),
            giftSign: sign,
            giftBgSize: widget.gifts?[selectGiftIndex].diyBgSize ?? 0,
            giftPreviewSize: widget.gifts?[selectGiftIndex].diyPreviewSize ?? 0,
          ),
          _buildGiftTitle(),
          PositionedDirectional(
            top: paddingTop,
            child: _buildGiftDetail(),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftTitle() {
    return SizedBox(
      height: 44,
      child: BaseAppBar.custom(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.gifts?[selectGiftIndex].name ?? '',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backColor: Colors.white,
      ),
    );
  }

  Widget _buildGiftDetail() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: Util.width,
        height: diyGiftPanelBodyHeight - 316 + Util.iphoneXBottom,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.transparent,
              Color(0xFF3C1890),
              Color(0xFF3C194F)
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            stops: [0, 0.2, 0.2, 1],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTab(),
            Container(
              height: 1,
              width: Util.width - 20,
              margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
              color: Colors.white10,
            ),
            Expanded(
              child: ExtendedTabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                cacheExtent: 2,
                children: _buildTabViews(),
              ),
            ),
            _buildHandleBar(),
            SizedBox(height: Util.iphoneXBottom),
          ],
        ),
      ),
    );
  }

  Widget _buildTab() {
    return Container(
      width: Util.width,
      height: 51,
      padding: const EdgeInsetsDirectional.only(top: 7),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(R.imagePath(Assets.diy_gift_top_bg_webp,
              package: ComponentManager.MANAGER_GIFT)),
        ),
      ),
      child: _buildTabWidget(),
    );
  }

  Widget _buildTabWidget() {
    List<Widget> tabs = [];
    for (int i = 0; i < _tabString!.length; i++) {
      /// 签名和头像填了需要打勾
      bool isSelect = false;
      if (i == 1 && sign.isNotEmpty) {
        isSelect = true;
      } else if (i == 2 && imageType > 1) {
        isSelect = true;
      }
      Tab tab = Tab(
        child: Container(
          height: 44,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 11, end: 11),
          decoration: i == _tabController!.index
              ? BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(R.imagePath(
                        Assets.diy_gift_tab_item_bg_webp,
                        package: ComponentManager.MANAGER_GIFT)),
                  ),
                )
              : null,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 16),
                    Text(_tabString![i]),
                    isSelect
                        ? R.img(Assets.diy_gift_tab_selected_png,
                            width: 16,
                            height: 16,
                            package: ComponentManager.MANAGER_GIFT)
                        : const SizedBox(width: 16),
                  ],
                ),
              ),
              if (i == _tabController!.index)
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 8),
                  child: R.img(
                    Assets.diy_gift_tab_indicator_webp,
                    width: 18,
                    height: 3,
                    package: ComponentManager.MANAGER_GIFT,
                  ),
                ),
            ],
          ),
        ),
      );
      tabs.add(tab);
    }

    return CommonTabBar(
      showSplash: false,
      labelPadding: EdgeInsetsDirectional.zero,
      controller: _tabController,
      isScrollable: true,
      tabs: tabs,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.4),
      labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      unselectedLabelStyle:
          const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0, color: Colors.transparent)),
    );
  }

  List<Widget> _buildTabViews() {
    List<Widget> pages = [];
    pages.add(_buildGiftList());
    pages.add(_buildSign());
    pages.add(_buildSelectAvatar());
    return pages;
  }

  Widget _buildGiftList() {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(top: 12, start: 16),
      itemCount: widget.gifts?.length ?? 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (selectGiftIndex != index && mounted) {
              setState(() {
                selectGiftIndex = index;

                if ((widget.gifts?[selectGiftIndex].diyIconNum ?? 0) < 2 &&
                    imageType == 4) {
                  /// 从支持两个变仅支持一个
                  imageType = 1;
                }
              });
            }
          },
          child: SlpDiyGiftItem(
            gift: widget.gifts?[index],
            selected: selectGiftIndex == index,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 10),
    );
  }

  Widget _buildSign() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 42, start: 16, end: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                color: Colors.black.withOpacity(0.2),
              ),
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              alignment: AlignmentDirectional.centerStart,
              child: TextField(
                controller: _signController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                autofocus: false,
                cursorColor: Colors.white.withOpacity(0.4),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                  hintText: K.gift_diy_sign_hint,
                  isDense: true,
                  counterText: '',
                ),
                maxLines: 1,
                maxLength: 20,
                onChanged: (String value) {
                  refresh();
                },
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
              ),
            ),
          ),
          const SizedBox(width: 12, height: 40),
          GestureDetector(
            onTap: () {
              if (sign != _signController.text) {
                sign = _signController.text;

                if (mounted) {
                  setState(() {});
                }
              }
            },
            child: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                gradient: LinearGradient(
                  colors: sign != _signController.text
                      ? [const Color(0xFFFF6AF7), const Color(0xFF9E6AFF)]
                      : [const Color(0x66FF6AF7), const Color(0x669E6AFF)],
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.gift_confirm,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: sign != _signController.text
                      ? Colors.white
                      : Colors.white.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectAvatar() {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 12),
      alignment: AlignmentDirectional.topCenter,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOtherAvatar(),
          const SizedBox(width: 40),
          _buildMyAvatar(),
        ],
      ),
    );
  }

  bool get isSelectOther => (imageType == 3 || imageType == 4);

  bool get isSelectSelf => (imageType == 2 || imageType == 4);

  List<String> getSelectAvatars() {
    List<String> avatars = [];

    if (isSelectOther) {
      String other = selectUids.length == 1
          ? getIconByUid(selectUids[0])
          : 'static/diy/diy_gift_defaut_avatar.webp';
      avatars.add(other);
    }

    if (isSelectSelf) {
      avatars.add(Session.icon);
    }

    return avatars;
  }

  Widget _buildOtherAvatar() {
    String icon = selectUids.length == 1
        ? getIconByUid(selectUids[0])
        : 'static/diy/diy_gift_defaut_avatar.webp';
    return GestureDetector(
      onTap: () {
        setState(() {
          if ((widget.gifts?[selectGiftIndex].diyIconNum ?? 0) > 1) {
            if (imageType == 1) {
              imageType = 3;
            } else if (imageType == 2) {
              imageType = 4;
            } else if (imageType == 3) {
              imageType = 1;
            } else if (imageType == 4) {
              imageType = 2;
            }
          } else {
            if (imageType == 1) {
              imageType = 3;
            } else if (imageType == 2) {
              imageType = 3;
            } else if (imageType == 3) {
              imageType = 1;
            } else if (imageType == 4) {
              imageType = 2;
            }
          }
        });
      },
      child: Container(
        width: 84,
        height: 98,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          gradient: isSelectOther
              ? const LinearGradient(
                  colors: [Color(0xFF9E6AFF), Color(0xFFFF6AF7)],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                )
              : null,
        ),
        alignment: AlignmentDirectional.center,
        child: Container(
          width: 82,
          height: 96,
          decoration: const BoxDecoration(
            color: Color(0xFF301360),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: 82,
                height: 96,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 9,
                    ),
                    ClipOval(
                      child: CommonAvatar(
                        size: 60,
                        shape: BoxShape.circle,
                        path: icon,
                        suffix:
                            (icon.contains('ic_mystery.png')) ? '' : '!head150',
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      K.gitf_other_avatar,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelectOther) _buildSelect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyAvatar() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if ((widget.gifts?[selectGiftIndex].diyIconNum ?? 0) > 1) {
            if (imageType == 1) {
              imageType = 2;
            } else if (imageType == 2) {
              imageType = 1;
            } else if (imageType == 3) {
              imageType = 4;
            } else if (imageType == 4) {
              imageType = 3;
            }
          } else {
            if (imageType == 1) {
              imageType = 2;
            } else if (imageType == 2) {
              imageType = 1;
            } else if (imageType == 3) {
              imageType = 2;
            } else if (imageType == 4) {
              imageType = 3;
            }
          }
        });
      },
      child: Container(
        width: 84,
        height: 98,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          gradient: isSelectSelf
              ? const LinearGradient(
                  colors: [Color(0xFF9E6AFF), Color(0xFFFF6AF7)],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                )
              : null,
        ),
        alignment: AlignmentDirectional.center,
        child: Container(
          width: 82,
          height: 96,
          decoration: const BoxDecoration(
            color: Color(0xFF301360),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: 82,
                height: 96,
                child: Column(
                  children: [
                    const SizedBox(height: 9),
                    ClipOval(
                      child: CommonAvatar(
                        size: 60,
                        shape: BoxShape.circle,
                        path: Session.icon,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      K.gift_my_avatar,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelectSelf) _buildSelect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelect() {
    return PositionedDirectional(
      top: 4,
      end: 4,
      child: Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            colors: [Color(0xFF9E6AFF), Color(0xFFFF6AF7)],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: R.img(
          Assets.diy_gift_avatar_select_icon_png,
          width: 24,
          height: 24,
          package: ComponentManager.MANAGER_GIFT,
        ),
      ),
    );
  }

  /// 房间内打赏的用户列表
  Widget _buildMicUsers() {
    if (widget.inMicUids == null || widget.inMicUids?.isEmpty == true) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 4),
      child: wrapBlurBg(
        Container(
          height: 60,
          width: Util.width - 16,
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: roomBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: <Widget>[
              Text(
                K.gift_send,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 13),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.inMicUids?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildMicAvatar(index);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        radius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildMicAvatar(int index) {
    if (widget.inMicUids == null || widget.inMicUids?.isEmpty == true) {
      return const SizedBox.shrink();
    }
    RoomPosition? user = widget.inMicUids?.elementAt(index);
    String image = user?.icon ?? '';

    bool selected = selectUids.contains(user?.uid ?? 0);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectUids.contains(user?.uid ?? 0)) {
            selectUids.remove(user?.uid ?? 0);
          } else {
            /// DIY礼物仅支持单选
            selectUids.clear();
            selectUids.add(user?.uid ?? 0);
          }
        });
      },
      child: Container(
        height: 38,
        width: 32,
        margin: const EdgeInsetsDirectional.only(start: 6.0, end: 6.0),
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        selected ? R.color.mainBrandColor : Colors.transparent,
                    width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: CommonAvatar(
                key: ValueKey(image),
                size: 32,
                path: image,
                shape: BoxShape.circle,
                suffix: image.contains('ic_mystery.png') ? '' : '!head150',
              ),
            ),
            PositionedDirectional(
              end: -2,
              top: -2,
              child: IgnorePointer(
                child: selected ? _buildSelectMic() : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectMic() {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: R.color.mainBrandGradientColors,
        ),
        shape: BoxShape.circle,
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(Assets.ic_mic_select_svg,
          package: ComponentManager.MANAGER_GIFT, width: 14, height: 14),
    );
  }

  /// 操作条
  Widget _buildHandleBar() {
    List<Widget> widgets = [];

    double ratio = min(Util.ratio, 1);

    BbGiftPanelDiyGift? gift = widget.gifts?[selectGiftIndex];
    if (gift == null) return Container();

    double numMaxWidth = gift.isCombo == 1 ? 68 * Util.ratio : 168 * Util.ratio;

    int realTotalMoney = widget.accountMoney?.money != null
        ? widget.accountMoney!.money.toInt()
        : 0;

    widgets.add(SlpBalanceWidget(
      ratio: ratio,
      numMaxWidth: numMaxWidth,
      selfMoney: realTotalMoney,
      showIntimate: supportSlpIntimate,
      dark: darkMode || !widget.fromChat,
    ));

    if (gift.isLocked) {
      widgets.addAll(
        [
          const Spacer(),
          // 提示文案
          GestureDetector(
            onTap: () {
              if (gift.jumpPage.isNotEmpty) {
                BaseWebviewScreen.show(context, url: gift.jumpPage);
                return;
              }

              if (gift.isVipGift) {
                jumpToVipScreen(context, widget.rid);
              } else if (gift.isKaGift) {
                /// ka跳转客服
                jumpToChatService();
              } else {
                jumpToPrivilegeScreen(context, widget.rid);
              }
            },
            child: Container(
              height: 30 * ratio,
              padding: EdgeInsets.symmetric(horizontal: 19 * ratio),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFF2AF83), Color(0xFFFFEAC7)]),
                borderRadius: BorderRadius.circular(15 * ratio),
              ),
              child: Text(
                gift.privilege.unlockTips,
                style: TextStyle(
                    color: const Color(0xFF613113),
                    fontSize: 13 * ratio,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      );
    } else {
      widgets.addAll(
        [
          const Spacer(),
          // 选择数量
          GestureDetector(
            onTap: _switchNum,
            child: Container(
              width: 60 * ratio,
              height: 30 * ratio,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF56AF8), width: 1),
                borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(16 * ratio),
                        bottomStart: Radius.circular(16 * ratio))
                    .resolve(Directionality.of(context)),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 4 * ratio),
                    child: Text(
                      "x$_selectGiftNum",
                      style: TextStyle(
                        color: R.color.mainBrandColor,
                        fontSize: 13 * ratio,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  R.img(Assets.ic_up_arrow_svg,
                      width: 16 * ratio,
                      height: 16 * ratio,
                      color: const Color(0xFFF56AF8),
                      package: ComponentManager.MANAGER_GIFT,
                      key: _selectNumKey),
                ],
              ),
            ),
          ),
          // 赠送按钮
          GestureDetector(
            onTap: _submit,
            child: Container(
              width: 60 * ratio,
              height: 30 * ratio,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFFF6AF7), Color(0xFF9E6AFF)]),
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(16 * ratio),
                  bottomEnd: Radius.circular(16 * ratio),
                ),
              ),
              child: Text(
                K.give_something,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13 * ratio,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: widgets,
      ),
    );
  }

  _switchNum() async {
    RenderBox rowRenderBox =
        _selectNumKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset =
        rowRenderBox.localToGlobal(Offset(rowRenderBox.size.width / 2.0, -20));
    SlpGiftNumSelectWidget.show(
            context, widget.chooseNumConfig, _selectGiftNum, offset)
        .then((value) {
      if (Util.parseInt(value?[0]) > 0) {
        if (mounted) {
          setState(() {
            _selectGiftNum = value![0];
          });
        }
      }
    });
  }

  Widget wrapBlurBg(Widget child, {BorderRadius? radius}) {
    if (Platform.isIOS) {
      /// IOS不使用BackdropFilter，因为跟PlatformView冲突
      return ClipRRect(
        borderRadius:
            radius ?? const BorderRadius.vertical(top: Radius.circular(16)),
        child: child,
      );
    }

    return ClipRRect(
      borderRadius:
          radius ?? const BorderRadius.vertical(top: Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: child,
      ),
    );
  }

  bool _tryUseAvailable = false; // 尝试使用余额支付
  int _cid = 0; // 背包礼物id
  String _ctype = ''; // // 背包礼物类型
  int _ductionMoney = 0; // 优惠金额
  int _onlyNewPay = 0; // 是否限制为仅新支付账户可用
  int _state = 0; // 券状态，只有账户充值后，才能使用优惠券，避免小号刷券
  int _totalNum = 0;
  int _giftPrice = 0; // 礼物单价
  int _totalPrice = 0; // 礼物总价
  String? _giftType; // 礼物类型：normal、coin（金币礼物,只能用金币赠送）、bean(金豆礼物)
  bool _isPaying = false;

  _submit() async {
    if (ModalRoute.of(context)?.isCurrent == false) return;
    BbGiftPanelDiyGift? gift = widget.gifts?[selectGiftIndex];
    if (gift == null) return;

    int userNum = selectUids.length;
    if (userNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_selecet_a_target_at_least,
          gravity: ToastGravity.CENTER);
      return;
    }
    int finalGiftNum = _selectGiftNum;
    if (finalGiftNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_select_a_gift_num, gravity: ToastGravity.CENTER);
      return;
    }

    _giftType = gift.giftType;

    _giftPrice = gift.price;

    if (_giftPrice <= 0) return;

    _ctype = gift.ctype;
    _cid = gift.cid;
    int cnum = gift.cnum; // 如果背包有该礼物，则返回礼物数量
    Log.d('_submit:$cnum');
    // 重置
    _ductionMoney = 0;
    _onlyNewPay = 0;
    _state = 0;

    if (_cid > 0 &&
        (((_ctype == 'gift' || _ctype == 'key' || _ctype == 'pub_drink') &&
                cnum >= finalGiftNum * userNum) ||
            (_ctype == 'coupon' && cnum >= 1))) {
      _ductionMoney = gift.ductionMoney;
      _onlyNewPay = gift.onlyNewpay;
      _state = gift.state;
    } else {
      _cid = 0;
      _ctype = '';
    }

    _totalPrice = _giftPrice * finalGiftNum * userNum;

    _totalNum =
        _cid > 0 && ((_ctype == 'key') && cnum >= finalGiftNum * userNum)
            ? 0
            : finalGiftNum * userNum;

    int realTotalMoney = widget.accountMoney?.totalMoney ?? 0;

    if (gift.giftType == 'coin' || gift.giftType == 'bean') {
      // 金币礼物，客户端不做金币和背包是否有足够的判断，错误提示由后台返回
      _pay('available');
      return;
    } else if (_cid > 0 && _ctype == 'coupon') {
      if (Util.isAndroid && !Util.isLocale) {
        if ((_onlyNewPay <= 0 || _state > 0) &&
            (widget.accountMoney?.totalMoney ?? 0) + _ductionMoney >=
                _totalPrice) {
          _tryUseAvailable = true;
          _pay('available');
          return;
        } else {
          _displayDiscount();
        }
      } else {
        if ((_onlyNewPay <= 0 || _state > 0) &&
            (widget.accountMoney?.totalMoney ?? 0) + _ductionMoney >=
                _totalPrice) {
          _tryUseAvailable = true;
          _pay('available');
        } else {
          _displayPay();
        }
      }
    } else if (realTotalMoney >= _totalPrice ||
        (_cid > 0 && (_ctype == 'gift' || _ctype == 'pub_drink')) ||
        _totalNum == 0 ||
        useIntimateCardPay) {
      // _totalNum == 0时，表示背包有足够的钥匙，可以直接支付
      _tryUseAvailable = !useIntimateCardPay;
      _pay('available');
    } else {
      _displayPay();
    }
  }

  _displayDiscount() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, _totalPrice - _ductionMoney);
    if (result == null || result.reason == SheetCloseReason.Active) {
      _isPaying = false;
      return;
    }

    if (result.value?.key == null) {
      _isPaying = false;
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      _isPaying = false;
      return;
    }

    _pay(result.value?.key);
  }

  _displayPay() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, _totalPrice - _ductionMoney);
    if (result == null || result.reason == SheetCloseReason.Active) {
      _isPaying = false;
      return;
    }

    if (_onlyNewPay == 1 && _state == 0 && result.value?.key == 'available') {
      _isPaying = false;
      Toast.showCenter(context, K.please_recharge_first);
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      _isPaying = false;
      return;
    }

    _pay(result.value?.key);
  }

  _pay(String? type) {
    int finalGiftNum = _selectGiftNum;
    if (_isPaying) return;
    _isPaying = true;

    _payManager.pay(context,
        key: 'gift',
        type: type ?? '',
        refer: 'gift',
        args: {
          'money': _totalPrice,
          'type': 'package',
          'params': {
            'rid': widget.rid,
            'uids': selectUids.join(','),
            'positions': _getSelectPosition().join(','),
            'position': widget.myPosition,
            'giftId': widget.gifts?[selectGiftIndex].id ?? 0,
            'giftNum': finalGiftNum,
            'price': _giftPrice,
            'cid': _cid,
            'ctype': _ctype,
            'duction_money': _ductionMoney,
            'version': 2,
            'num': _totalNum,
            'gift_type': _giftType,
            'show_pac_man_guide':
                Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
            'refer': '${widget.refer}:room',
            'diy_gift_sign': sign,
            'diy_gift_image_type': imageType,
            // 亲密卡id
            if (intimateCardInfo != null)
              'intimate_card_id': '${intimateCardInfo!.cardId}'
          }
        },
        onPayed: () => _onPayed(),
        onError: (isErrorCatch) => _onPayError(isErrorCatch),
        onPayAppOpen: () {
          _isPaying = false;
        });
  }

  void _onPayed() {
    _isPaying = false;
    int finalGiftNum = _selectGiftNum;

    ChatRoomData? room = ChatRoomData.getInstance();

    Map<String, dynamic> properties = <String, dynamic>{
      'scene': 'room',
      'rid': widget.rid,
      'gift_name': widget.gifts?[selectGiftIndex].name ?? '',
      'gift_id': widget.gifts?[selectGiftIndex].id ?? 0,
      'gift_price': _giftPrice,
      'gift_num': finalGiftNum,
      'user_num': selectUids.length,
      'total_price': _giftPrice * finalGiftNum,
      'gift_type': _giftType,
      'is_combo': 2,
      if (room != null) 'chat_room_type': room.config?.type,
      if (room != null) 'chat_room_property': room.config?.property.toString(),
      if (room != null) 'chat_room_types': room.config?.types.toString(),
      if (!Util.isNullOrEmpty(room?.config?.typeName))
        'type_label': room?.config?.typeName,
      if (!Util.isNullOrEmpty(room?.config?.originalRFT))
        'room_factory_type': room?.config?.originalRFT,
      if (!Util.isNullOrEmpty(room?.config?.settlementChannel))
        'settlement_channel': room?.config?.settlementChannel,
    };

    String roomType = room?.config?.type ?? '';
    properties['time'] = DateTime.now().millisecondsSinceEpoch;
    properties['room_type'] = roomType;
    properties['refer'] = room?.refer ?? '';
    properties['is_pk'] = false;
    if (room?.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_WERE_WOLF);
      properties['game_type'] = wereWolfManager.getGameType();
    }

    for (var element in selectUids) {
      properties['to_uid'] = element;
      Tracker.instance.track(TrackEvent.send_gift, properties: properties);
    }

    _tryUseAvailable = false;

    if (intimateCardInfo != null) {
      refreshIntimateCard(); // 刷新亲密卡余额
    }

    eventCenter.emit("Gift.SendSuccess");
    if (ModalRoute.of(context)?.isCurrent == true) {
      Navigator.of(context).pop(true);
    }
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
    if (_tryUseAvailable) {
      _tryUseAvailable = false;
      _displayPay();
    }
  }

  // 选中的麦序
  List<int> _getSelectPosition() {
    List<int> positions = [];
    if (widget.inMicUids == null || widget.inMicUids?.isEmpty == true) {
      return positions;
    }
    for (int i = 0; i < widget.inMicUids!.length; ++i) {
      RoomPosition p = widget.inMicUids![i];
      if (selectUids.contains(p.uid)) {
        positions.add(p.position);
      }
    }

    return positions;
  }

  String getIconByUid(int uid) {
    if (widget.inMicUids == null || widget.inMicUids?.isEmpty == true) {
      return '';
    }
    for (int i = 0; i < widget.inMicUids!.length; i++) {
      RoomPosition element = widget.inMicUids!.elementAt(i);
      if (element.uid == uid) {
        return element.icon;
      }
    }
    return '';
  }
}
