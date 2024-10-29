import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:vip/src/nobility/nobility_privilege_detail_dialog.dart';
import 'package:vip/src/vip_mall/widget/title_animation_widget.dart';

import '../../k.dart';
import 'model/killer_nobility_bean.dart';

class KillerNobilityCenterScreen extends StatefulWidget {
  const KillerNobilityCenterScreen({super.key});

  @override
  _KillerNobilityCenterScreenState createState() =>
      _KillerNobilityCenterScreenState();

  static Future show(
    BuildContext context, {
    Key? key,
  }) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const KillerNobilityCenterScreen(),
      settings: const RouteSettings(name: 'NobilityCenter'),
    ));
  }
}

class _KillerNobilityCenterScreenState extends State<KillerNobilityCenterScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? _tabBarController;
  SwiperController? _swiperController;
  KillerNobilityCenterResponse? _response;

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
    eventCenter.addListener(EventConstant.EventUserMoneyChange, _onMoneyChange);
    _loadData();
  }

  @override
  void dispose() {
    _swiperController?.dispose();
    _tabBarController?.dispose();
    eventCenter.removeListener(
        EventConstant.EventUserMoneyChange, _onMoneyChange);
    super.dispose();
  }

  _onMoneyChange(String type, dynamic field) {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  BaseAppBar _buildAppBar() {
    return BaseAppBar.custom(
      backgroundColor: Colors.transparent,
      leading: BackButton(
          color: Colors.white, onPressed: () => Navigator.pop(context)),
      statusBrightness: Brightness.dark,
      title: Text(
        K.nobility_center,
        style: R.textStyle.title.copyWith(color: Colors.white),
      ),
      actions: [
        InkWell(
          onTap: () {
            BaseWebviewScreen.show(context, url: Util.getNobilityQA());
          },
          child: Container(
            padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
            alignment: Alignment.center,
            child: R.img('titlebar/ic_titlebar_question.svg',
                color: Colors.white,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_BASE_CORE),
          ),
        )
      ],
    );
  }

  _loadData() async {
    _response = await KillerNobilityRepository.getNobilityInfo();

    if (_response!.success && mounted) {
      setState(() {
        _currentIndex = _response?.indexNobilityLevel ?? 0;
        _tabBarController = TabController(
            length: _response?.tabData.length ?? 0,
            initialIndex: _currentIndex,
            vsync: this);
        _swiperController?.move(_currentIndex);
      });
    } else {
      if (mounted) {
        setState(() {});
      }
    }
  }

  Widget _buildBody() {
    if (_response == null) {
      return const Center(
        child: Loading(),
      );
    }

    if (_response!.success == false) {
      return Center(
        child: ErrorData(
          error: _response?.msg,
          onTap: _loadData,
        ),
      );
    }

    if (_response!.items.isEmpty) {
      return Center(
        child: ErrorData(
          error: BaseK.K.no_data,
          onTap: _loadData,
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: RefreshIndicatorFactory.of(
            onRefresh: () async {
              _loadData();
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _buildTabBar(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),
                SliverToBoxAdapter(
                  child: _buildNobilityProfile(),
                ),
                SliverToBoxAdapter(
                  child: _buildNobilityNumberTitle(),
                ),
                SliverToBoxAdapter(
                  child: _buildNobilityPrivilege(),
                ),
              ],
            ),
          ),
        ),
        _buildBottomOperation()
      ],
    );
  }

  Widget _buildTabBar() {
    return CommonTabBar(
      isScrollable: true,
      controller: _tabBarController,
      tabs: _response?.tabData.map((e) => Tab(child: Text(e.name))).toList() ??
          [],
      marginStart: 5,
      marginEnd: 5,
      labelPadding: const EdgeInsetsDirectional.only(
        start: 15,
        end: 15,
      ),
      labelColor: const Color(0xFFF4D49C),
      unselectedLabelColor: const Color(0x99FFFFFF),
      labelStyle: const TextStyle(
        color: Color(0xFFF4D49C),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Color(0x99FFFFFF),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      indicator: const CommonUnderlineTabIndicator(
        borderSide: BorderSide(width: 0.0, color: Colors.transparent),
        wantWidth: 0,
      ),
      onTap: (index) {
        _swiperController?.move(index);
        _currentIndex = index;
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  /// 爵位特权数title
  Widget _buildNobilityNumberTitle() {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(top: 30, bottom: 5),
      child: Stack(
        children: [
          R.img('privilege_title.webp',
              width: 167, height: 29, package: ComponentManager.MANAGER_VIP),
          PositionedDirectional(
              start: 94,
              bottom: 0,
              child: SizedBox(
                height: 20,
                child: Text(
                  '${_response?.currentTabPrivilegeNumber(_currentTabInfo) ?? 0}/${_response?.items.length ?? 0}',
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xFFF4D49C)),
                ),
              ))
        ],
      ),
    );
  }

  /// 爵位滑块
  Widget _buildNobilityProfile() {
    int length = _response?.tabData.length ?? 0;
    return SizedBox(
      width: Util.width,
      height: 150,
      child: Swiper(
        key: ValueKey(length),
        outer: true,
        loop: false,
        scale: 0.85,
        scrollDirection: Axis.horizontal,
        viewportFraction: 295 / Util.width,
        itemCount: length,
        controller: _swiperController,
        index: _currentIndex,
        physics: length == 1
            ? const NeverScrollableScrollPhysics()
            : const PageScrollPhysics(parent: BouncingScrollPhysics()),
        itemBuilder: (BuildContext context, int index) {
          NobilityTabInfoItem item = _response!.tabData[index];
          int nextIndex = ((index + 1) == (_response?.tabData.length ?? 0))
              ? index
              : index + 1;
          NobilityTabInfoItem nextItem = _response!.tabData[nextIndex];
          return _buildNobilityProfileItem(item, nextItem);
        },
        onIndexChanged: (index) {
          _currentIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        onScrollStart: () {},
        onScrollEnd: () async {
          await Future.delayed(const Duration(milliseconds: 20));
          setState(() {
            _tabBarController!.index = _currentIndex;
          });
        },
      ),
    );
  }

  Widget _buildNobilityProfileItem(
      NobilityTabInfoItem item, NobilityTabInfoItem nextItem) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
            // color: Color(0x33000000),
            image: DecorationImage(
                image: AssetImage(R.imagePath('privilege_card_bg.webp',
                    package: ComponentManager.MANAGER_VIP)),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
                top: 34,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF4D49C),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        // NobilityGrowthList.show(context);
                      },
                      child: _buildNobilityLevelDesc(item, nextItem)),
                ],
              ),
            ),
            PositionedDirectional(
              end: 28 * Util.ratio,
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 10 * Util.ratio),
                child: TitleAnimation(
                  key: ValueKey(item.name),
                  image1: item.icon,
                  image2: item.loopIcon,
                  size: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgress(int value, int total) {
    if (total == 0) return const SizedBox();
    value = value > total ? total : value;
    return Container(
      height: 3,
      width: 114 * Util.ratio,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xFF4D4B56),
      ),
      child: Row(
        children: [
          Expanded(
            flex: value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFFF4D49C),
              ),
            ),
          ),
          Expanded(
            flex: total - value,
            child: const SizedBox(),
          )
        ],
      ),
    );
  }

  Widget _buildNobilityLevelDesc(
      NobilityTabInfoItem item, NobilityTabInfoItem nextItem) {
    String growthDes = '';
    if ((_response?.myInfo?.growth ?? 0) < item.growth) {
      String needValue = '${(item.growth - (_response?.myInfo?.growth ?? 0))}';
      growthDes = K.nobility_need_nobility_value([needValue]);
    } else if ((_response?.myInfo?.growth ?? 0) >= item.growth) {
      if ((_response?.myInfo?.growth ?? 0) < nextItem.growth) {
        growthDes = K.nobility_already_reach_level;
      } else {
        growthDes = K.nobility_exceed_this_level;
      }
    }
    List<Widget> widgets = [];
    if (_response?.openedNobility ?? false) {
      if (_response!.myNobilityLevel == item.level) {
        //当前级别
        widgets.add(
            _buildProgress(_response?.myInfo?.growth ?? 0, nextItem.growth));
        widgets.add(const SizedBox(
          height: 8,
        ));
        String title =
            '${K.nobility_current_value}${_response?.myInfo?.growth ?? 0}';
        widgets.add(Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            color: Color(
              0x99FFFFFF,
            ),
          ),
        ));
      } else if (_response!.myNobilityLevel < item.level) {
        widgets.add(
          Text(
            growthDes,
            style: const TextStyle(
              fontSize: 11,
              color: Color(
                0x99FFFFFF,
              ),
            ),
          ),
        );
      } else {
        widgets.add(Text(
          K.nobility_exceed_this_level,
          style: const TextStyle(
            fontSize: 11,
            color: Color(
              0x99FFFFFF,
            ),
          ),
        ));
      }
    } else {
      //未开通
      widgets = [
        Text(
          growthDes,
          style: const TextStyle(
            fontSize: 11,
            color: Color(
              0x99FFFFFF,
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        if (!_response!.reachRechargeCondition)
          Text(
            K.nobility_unlock,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0x4DFFFFFF),
            ),
          ),
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  /// 特权列表
  Widget _buildNobilityPrivilege() {
    return GridView.count(
      primary: true,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      crossAxisCount: 3,
      childAspectRatio: Util.width / (3 * 108),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: _buildPrivilegeList(),
    );
  }

  List<Widget> _buildPrivilegeList() {
    List<Widget> widgets = [];
    if (_response?.items != null && _response!.items.isNotEmpty) {
      for (var element in _response!.items) {
        widgets.add(_buildPrivilegeItem(element));
      }
    }
    return widgets;
  }

  Widget _buildPrivilegeItem(PrivilegeInfoItem item) {
    if (_currentTabInfo == null) return Container();
    int currentTabLevel = (_currentTabInfo?.level ?? 0);
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          CommonAvatar(
            errorWidget: const SizedBox(
              height: 48,
            ),
            path: currentTabLevel >= item.start
                ? (item.icon ?? '')
                : (item.disableIcon ?? ''),
            suffix: null,
            size: 48,
            loadingWidget: const CupertinoActivityIndicator(),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            item.name ?? '',
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, color: Color(0xFF909096)),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            item.desc(currentTabLevel),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, color: Color(0xFF4D4C52)),
          ),
        ],
      ),
      onTap: () => _onTapPrivilege(item),
    );
  }

  /// 底部操作区域 :充值是否满六元
  Widget _buildBottomOperation() {
    if (_response?.reachRechargeCondition ?? false) {
      return _buildNobilityInfoWidget();
    } else {
      return _buildRechargeWidget();
    }
  }

  Widget _buildRechargeWidget() {
    return GestureDetector(
      onTap: () async {
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openBalanceScreen(context);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 12, bottom: Util.iphoneXBottom + 12),
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFDBAF63), Color(0xFFF4D49C)]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          K.nobility_recharge_six,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF533400),
          ),
        ),
      ),
    );
  }

  Widget _buildNobilityInfoWidget() {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 12, bottom: 12 + Util.iphoneXBottom),
      child: Row(
        children: [
          CommonAvatar(
            path: Session.icon,
            size: 50,
            shape: BoxShape.circle,
          ),
          const SizedBox(
            width: 9,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Session.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                (_response?.nextPeriodNobilityName.isNotEmpty ?? false)
                    ? Text(
                        K.nobility_next_month_level_from_value(
                            [_response!.nextPeriodNobilityName]),
                        style: const TextStyle(
                            fontSize: 12, color: Color(0x66FFFFFF)),
                      )
                    : Text(
                        K.nobility_next_mouth_no,
                        style: const TextStyle(
                            fontSize: 12, color: Color(0x66FFFFFF)),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onTapPrivilege(PrivilegeInfoItem item) {
    int index = _response!.items.indexOf(item);
    NobilityPrivilegeDetailDialog.show(
        context, _currentTabInfo?.level ?? 0, _response!.items, index);
  }

  NobilityTabInfoItem? get _currentTabInfo {
    if (_response?.tabData != null &&
        _response!.tabData.length > _currentIndex) {
      return _response?.tabData[_currentIndex];
    } else {
      return null;
    }
  }
}
