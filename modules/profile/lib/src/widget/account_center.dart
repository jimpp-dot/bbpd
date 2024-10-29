import 'package:shared/shared.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/model/account_center_bean.dart';
import 'package:profile/src/profile_page.dart'
    hide ProfilePage, ProfilePageState;

import '../../assets.dart';

import 'package:vip/assets.dart' as VipAssets;

import '../../k.dart';
import 'package:provider/provider.dart' hide Selector;

class AccountCenter extends StatefulWidget {
  final bool isShowVipLevel;
  final AccountCenterBean? bean;
  final OnReloadTypeChanged? changed;

  const AccountCenter(
      {super.key, required this.isShowVipLevel, this.bean, this.changed});

  @override
  State<StatefulWidget> createState() {
    return _AccountState();
  }

  static AccountCenterBean? getBean() {
    Map? map = Session.getMap("account_center");
    if (map.isEmpty) {
      return null;
    }

    return AccountCenterBean.fromJson(map as Map<String, dynamic>);
  }
}

class _AccountState extends State<AccountCenter>
    with VipMixin, VipRenqMixin, VipGuiZuMixin {
  final IVipManager _vipManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
  NobilityCenterResponse? _response;

  @override
  void initState() {
    super.initState();
    Future.wait([
      NobilityRepository.getNobilityInfo(),
    ]).then((result) => {
          if (result.isNotEmpty)
            {
              setState(() {
                _response = result[0] as NobilityCenterResponse;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bean == null) {
      return const SizedBox.shrink();
    }
    List<Color> listVipColor = [
      const Color(0xFF4AC0FF).withOpacity(0.2),
      const Color(0xFF247496).withOpacity(0.2)
    ];

    bool isVip = widget.isShowVipLevel;
    int levelVip = widget.bean?.vipNewLevel ?? 0;
    int popularityLevel = widget.bean?.popularityNewLevel ?? 0;
    Log.d('levelVip:${levelVip}');
    Log.d('popularityLevel:${popularityLevel}');
    String assetsImg =
        'assets/images/icon_v_${getVipLevelIcon(levelVip)}_vip.png';
    if (isVip) {
      assetsImg = 'assets/images/icon_v_${getVipLevelIcon(levelVip)}_vip.png';
    } else {
      assetsImg =
          'assets/images/vip_rq_${getVipRenQiIcon(popularityLevel)}_icon.png';
    }
    Log.d('levelVip:${getVipLevelIcon(levelVip)}');
    Log.d('popularityLevel:${getVipRenQiIcon(popularityLevel)}');
    Widget iconVip = R.img(assetsImg,
        fit: BoxFit.fitHeight,
        package: VipAssets.Assets.package,
        width: 96,
        height: 96 * 1);
    String assetsGuiZuImg = 'assets/images/guizu_icon_10_vip.png';
    bool? openedNobility = _response?.openedNobility ?? false;
    int guiZuLevel = _response?.myInfo?.level ?? 0;
    if (openedNobility == true) {
      //已经购买贵族
      Log.d('guiZuLevel:${getVipGuiZuIcon(guiZuLevel)}');
      assetsGuiZuImg =
          'assets/images/guizu_icon_${getVipGuiZuIcon(guiZuLevel)}_vip.png';
    }

    return Container(
      width: Util.width,
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 我的贵族
              _buildItemCard(
                title: '贵族等级',
                icon: 'wallet_item.webp',
                isExpand: true,
                isLinear: true,
                radius: 14,
                leftWidget: R.img(assetsGuiZuImg,
                    fit: BoxFit.fitHeight,
                    package: Assets.package,
                    width: 96,
                    height: 96 * 1),
                linearColors: [
                  const Color(0xFFFFB949).withOpacity(0.2),
                  const Color(0xFFBE7A0C).withOpacity(0.2)
                ],
                children: _buildVIPImPort(openedNobility, guiZuLevel),
                onTap: _onVipGuiZu,
              ),
              const SizedBox(width: 12),
              isVip
                  ? _buildItemCard(
                      title: K.profile_vip_level,
                      icon: 'vip_item.webp',
                      isExpand: true,
                      isLinear: true,
                       radius: 14,
                      linearColors: listVipColor,
                      leftWidget: iconVip,
                      children: _buildLevel(
                        icon: 'vip/profile_vip_${widget.bean!.vipLevel}.png',
                        level: widget.bean!.vipNewLevel,
                        showRedPoint:
                            context.watch<ProfilePayload>().showVipRedPoint,
                      ),
                      onTap: _onLevelTap,
                    )
                  : _buildItemCard(
                      title: K.profile_popularity_level,
                      icon: 'vip_item.webp',
                      isExpand: true,
                      isLinear: true,
                       radius: 14,
                      linearColors: listVipColor,
                      leftWidget: iconVip,
                      children: _buildLevel(
                        icon:
                            'popular/profile_popular_${widget.bean!.popularityLevel}.png',
                        level: widget.bean!.popularityNewLevel,
                        showRedPoint: context
                            .watch<ProfilePayload>()
                            .showPopularityRedPoint,
                      ),
                      onTap: _onLevelTap,
                    ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          _buildItemCard(
            radius: 16,
            title: K.profile_my_account,
            isLinear: true,
            icon: 'wallet_item.webp',
            padding: 16.0,
            linearColors: [const Color(0xFF27252D), const Color(0xFF27252D)],
            children: _buildMyAccount(),
            onTap: _onAccountTap,
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(
      {required String title,
      required String icon,
      required List<Widget> children,
      double? padding = 0,
      Color? backgroundColor,
      bool? isExpand = false,
      bool? isLinear = false,
      List<Color>? linearColors,
      String? webpPath,
      Widget? leftWidget,
      double? radius = 8,
      GestureTapCallback? onTap}) {
    BoxDecoration? boxDecoration;
    var isWbepPathEmpty = webpPath?.isEmpty == true || webpPath == null;
    if (isWbepPathEmpty && isLinear == false) {
      boxDecoration = BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius ?? 8),
      );
    } else {
      var isLinearColors = isLinear == true && linearColors?.isNotEmpty == true;
      if (isLinearColors) {
        boxDecoration = commonBoxDecorationWithParamsBeginAndEnd(
            linearColors, radius, Alignment.centerLeft, Alignment.centerRight);
      } else {
        boxDecoration = BoxDecoration(
            image: DecorationImage(
          image: (R.img(webpPath, package: ComponentManager.MANAGER_PROFILE)
                  as Image)
              .image,
          fit: BoxFit.fill,
        ));
      }
    }

    Widget child = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: boxDecoration!,
        padding: EdgeInsetsDirectional.only(
            top: 3,
            bottom: 3,
            start: 2 + (padding ?? 0),
            end: 2 + (padding ?? 0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (leftWidget != null) leftWidget,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text14(title, textColor: Colors.white),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(mainAxisSize: MainAxisSize.max, children: children),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    if (isExpand == true) {
      return Expanded(
        child: child,
      );
    } else {
      return child;
    }
  }

  List<Widget> _buildMyAccount() {
    return [
      R.img(MoneyConfig.moneyIcon, width: 20, height: 20, wholePath: true),
      const SizedBox(width: 3),
      NumText(
        _getMoneyText(_getMoney()),
        style: TextStyle(
          fontSize: 16,
          color: R.colors.mainTextColor,
          fontWeight: FontWeight.w800,
        ),
        maxLines: 1,
      ),
      const Spacer(),
      Container(
        height: 24,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(
            start: 10, end: 10, top: 4, bottom: 4),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: R.colors.mainBrandGradientColors),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Text(
          K.profile_charge_balance,
          style: TextStyle(
              color: R.colors.brightTextColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              height: 1),
        ),
      ).onTap(() async {
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        await settingManager.openRechargeScreen(context, refer: 'homepage');
      })
    ];
  }

  String _getMoneyText(int num) {
    String result = num.toString();
    if (num > 10000) {
      result = (num / 10000).toStringAsFixed(3);
      result = "${result.substring(0, result.indexOf('.') + 2)}w";
    }
    return result;
  }

  int _getMoney() {
    int money = 0;
    if (widget.bean != null) {
      money += widget.bean!.slpCoin;
      money += widget.bean!.popularityNum;
    }
    return money;
  }

  List<Widget> _buildVIPImPort(bool openedNobility, int guiZuLevel) {
    return [
      openedNobility == false
          ? Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 8, end: 8, top: 4, bottom: 4),
              alignment: Alignment.centerLeft,
              decoration: commonBoxDecorationWithParamsBeginAndEnd(
                  [const Color(0xFFFFCE64), Color(0xFFFF9E3E)],
                  40,
                  Alignment.centerLeft,
                  Alignment.centerRight),
              child: text12('立即开通',
                  textStyle: const TextStyle(
                      fontSize: 10, color: Color.fromRGBO(48, 29, 0, 1))),
            )
          : GradientText(NobilityUtil.nobilityName(newNobility: guiZuLevel),
              gradient: const LinearGradient(
                  colors: [Color(0xffFFE3AE), Color(0xFFFFAC11)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              style: const TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w500,
                  fontSize: 16))
    ];
  }

  List<Widget> _buildLevel(
      {required String icon, required int level, required bool showRedPoint}) {
    return [
      // R.img(icon, width: 25, height: 25, package: ComponentManager.MANAGER_PROFILE),
      // const SizedBox(width: 3),
      NumText(
        K.profile_level_prefix([level.toString()]),
        style: TextStyle(
          fontSize: 16,
          color: R.colors.mainTextColor,
          fontWeight: FontWeight.w800,
        ),
      ),
      // const Spacer(),

      if (showRedPoint)
        Transform(
            transform: Matrix4.translationValues(0, -6, 0.0),
            child: const RedDot(width: 8, height: 8, showBorder: false)),
      // R.img(
      //   'ic_next.svg',
      //   width: 18,
      //   height: 18,
      //   color: R.colors.thirdTextColor,
      //   package: ComponentManager.MANAGER_PROFILE,
      // ),
    ];
  }

  void _onAccountTap() {
    Tracker.instance
        .track(TrackEvent.mine_page, properties: {'mine_page_click': 'wallet'});
    if (!_checkIsLogin()) return;

    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.openBalanceScreen(context);

    _reloadTypeChange();
  }

  _onVipGuiZu() {
    _vipManager.showMyLevelScreen(context, initialTab: MyLevelTab.Title);
  }

  void _onLevelTap() {
    Tracker.instance.track(
      TrackEvent.mine_page,
      properties: {'mine_page_click': 'levels'},
    );
    Tracker.instance.track(
      TrackEvent.click,
      properties: {
        'page':
            widget.isShowVipLevel ? 'mine_vip_level' : 'mine_popularity_level'
      },
    );
    if (!_checkIsLogin()) return;

    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    vipManager.showMyLevelScreen(context,
        initialTab:
            widget.isShowVipLevel ? MyLevelTab.Vip : MyLevelTab.Popularity);

    _reloadTypeChange();
  }

  bool _checkIsLogin() {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return false;
    }
    return true;
  }

  void _reloadTypeChange() {
    if (widget.changed != null) {
      widget.changed!(ReloadType.AccountCenter);
    }
  }
}
