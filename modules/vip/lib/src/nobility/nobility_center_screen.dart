import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:vip/src/nobility/nobility_privilege_detail_dialog.dart';
import 'package:vip/src/vip_mall/widget/title_animation_widget.dart';

import '../../assets.dart';
import '../../k.dart';
import 'nobility_buy_dialog.dart';
import 'nobility_growth_list_page.dart';

/// 贵族中心
///
class NobilityCenterScreen extends StatefulWidget {
  final VoidCallback? onPayed;

  /// 打开贵族中心后默认展示的页面
  final int? defaultNobilityLevel;

  const NobilityCenterScreen({super.key, this.onPayed, this.defaultNobilityLevel});

  @override
  _NobilityCenterScreenState createState() => _NobilityCenterScreenState();

  static Future show(BuildContext context, {Key? key, VoidCallback? onPayed, int? defaultNobilityLevel}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NobilityCenterScreen(onPayed: onPayed, defaultNobilityLevel: defaultNobilityLevel),
      settings: const RouteSettings(name: 'NobilityCenter'),
    ));
  }
}

class _NobilityCenterScreenState extends State<NobilityCenterScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? _tabBarController;
  SwiperController? _swiperController;
  NobilityCenterResponse? _response;
  NobilityMealsResponse? _mealsResponse;

  /// 贵族沙发：mic_couch；平台banner：personal_banner；礼物上新：gift_update；房间门票：room_ticket；用户禁言：user_mute；踢人 ：kick_out；房间置顶：room_top；
  List<String> privilegeNews = ['room_ticket', 'mic_sofa', 'gift_update', 'personal_banner', 'user_mute', 'kick_out', 'room_top'];

  /// 个人房门票、贵族沙发、礼物上新、平台首页推荐位缓存的本地Key
  String privilegeCachedWithKey(String key) => '${Session.uid}_nobility_privilege_new_cached_$key';

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
    eventCenter.addListener(EventConstant.WebsocketEventMessage, _onMoneyChange);
    _loadData();
  }

  @override
  void dispose() {
    _swiperController?.dispose();
    _tabBarController?.dispose();
    eventCenter.removeListener(EventConstant.WebsocketEventMessage, _onMoneyChange);
    super.dispose();
  }

  _onMoneyChange(String type, dynamic data) {
    String name = data is Map ? data['name'] : null;
    if (name == 'onNobleStatusChanged') {
      if (mounted) {
        _loadData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget forBgWidget = R.img(
      Assets.guizu_bg_new,
      package: Assets.package,
      width: Util.width,
      fit: BoxFit.fitWidth,
    );

    Widget backBgWidget = Container(
      color: const Color(0xFF0D0D0D),
      width: Util.width,
      height: Util.height,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(),
      body: _buildBody(),
    ).withCommonBgLocalImgWithTwo(forBgWidget, backBgWidget);
  }

  BaseAppBar _buildAppBar() {
    return BaseAppBar.custom(
      backgroundColor: Colors.transparent,
      leading: BackButton(color: Colors.white, onPressed: () => Navigator.pop(context)),
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
            child: R.img(
              'titlebar/ic_titlebar_question.svg',
              color: Colors.white,
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        )
      ],
    );
  }

  _loadData() async {
    var result = await Future.wait([NobilityRepository.getNobilityInfo(), NobilityRepository.getNobilitySubscribeList()]);
    if (!mounted) return;
    if (result.isNotEmpty) {
      _response = result[0] as NobilityCenterResponse;
      if (_response!.success == true) {
        /// 优先展示客户端传入的indexNobilityLevel，
        if (widget.defaultNobilityLevel != null) {
          _currentIndex = _response!.getIndexWithNobilityLevel(widget.defaultNobilityLevel!);
        } else {
          _currentIndex = _response?.indexNobilityLevel ?? 0;
        }
        _tabBarController = TabController(length: _response?.tabData.length ?? 0, initialIndex: _currentIndex, vsync: this);
        _swiperController?.move(_currentIndex);
      }
      _mealsResponse = result[1] as NobilityMealsResponse;
      refresh();
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
          onTap: _loadData,
        ),
      );
    }

    if (_response!.items == null || _response!.items!.isEmpty) {
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
                  child: SizedBox(height: 12),
                ),
                SliverToBoxAdapter(
                  child: _buildNobilityProfile(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 29,
                    alignment: AlignmentDirectional.center,
                    margin: const EdgeInsetsDirectional.only(top: 0, bottom: 10),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        R.img('privilege_title.webp', width: 167, height: 29, package: ComponentManager.MANAGER_VIP),
                        PositionedDirectional(
                          start: 94,
                          bottom: 0,
                          child: Text(
                            '${_response?.currentTabPrivilegeNumber(_currentTabInfo) ?? 0}/${_response?.items?.length ?? 0}',
                            style: const TextStyle(fontSize: 14, color: Color(0xFFF4D49C)),
                          ),
                        )
                      ],
                    ),
                  ),
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
      tabs: _response?.tabData.map((e) => Tab(child: Text(e.name ?? ''))).toList() ?? [],
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

  /// 爵位滑块
  Widget _buildNobilityProfile() {
    int length = _response?.tabInfo?.length ?? 0;
    return SizedBox(
      width: Util.width,
      height: (_response?.myInfo?.isExperienceCard ?? false) ? 360 : 320,
      child: Swiper(
        key: ValueKey(length),
        outer: true,
        loop: false,
        scale: 0.85,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        itemCount: length,
        controller: _swiperController,
        index: _currentIndex,
        physics: length == 1 ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(parent: BouncingScrollPhysics()),
        itemBuilder: (BuildContext context, int index) {
          TabInfoItem item = _response!.tabData[index];
          int nextIndex = ((index + 1) == _response!.tabData.length) ? index : index + 1;
          TabInfoItem nextItem = _response!.tabData[nextIndex];
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
          setState(() {
            _tabBarController!.index = _currentIndex;
          });
        },
      ),
    );
  }

  Widget _buildNobilityProfileItem(TabInfoItem item, TabInfoItem nextItem) {
    bool isExperienceCard = _response?.myInfo?.isExperienceCard ?? false;
    bool isShowExperienceCard = isExperienceCard && (_response!.nobilityLevel == item.level);
    // 体验中视图
    // 已过期
    final experienceCard = isShowExperienceCard
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white.withOpacity(0.1),
            ),
            margin: const EdgeInsetsDirectional.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              _experienceTimeText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0x99FFFFFF),
              ),
            ),
          )
        : const SizedBox.shrink();

    // Log.d('item.icon: ${item.icon}');
    // Log.d('item.loopIcon: ${item.loopIcon}');

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TitleAnimation(
          key: ValueKey(item.name),
          image1: item.icon ?? '',
          image2: item.loopIcon ?? '',
          size: 200,
          mWidth: 750 / 2,
          mHeight: 450 / 2,
        ),
        // Text(
        //   item.name,
        //   textAlign: TextAlign.start,
        //   style: const TextStyle(
        //     fontSize: 30,
        //     fontWeight: FontWeight.w600,
        //     color: Color(0xFFF4D49C),
        //   ),
        // ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () => NobilityGrowthList.show(context),
          child: _buildNobilityLevelDesc(item, nextItem),
        ),
        experienceCard,
      ],
    );
  }

  Widget _buildProgress(int value, int total) {
    if (total == 0) return const SizedBox();
    value = value > total ? total : value;
    return Container(
      height: 6,
      width: 90.dp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(0xFF4D4B56),
      ),
      child: Row(
        children: [
          Expanded(
            flex: value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
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

  String _experienceTimeText() {
    int difValue = (_response?.myInfo?.experienceTime ?? 0) - (_response?.curTime ?? 0);
    if (difValue > 86400) {
      //天
      int reduceDays = difValue ~/ 86400;
      return K.nobility_residue_days(['$reduceDays']);
    } else if (difValue > 3600) {
      //时
      int reduceHours = difValue ~/ 3600;
      return K.nobility_residue_hours(['$reduceHours']);
    } else if (difValue > 0) {
      //分
      int reduceMinute = difValue ~/ 60;
      return K.nobility_residue_minutes(['$reduceMinute']);
    } else {
      return K.nobility_experien_expired;
    }
  }

  String _gradingResidueTimeText() {
    int difValue = (_response?.myInfo?.effectiveTime ?? 0) - (_response?.curTime ?? 0);
    if (difValue < 0) {
      return K.vip_experience_after_settlement;
    } else {
      if (difValue > 86400) {
        //天
        int reduceDays = difValue ~/ 86400;
        return K.vip_surplus + K.vip_valid_day(['$reduceDays']);
      } else if (difValue > 3600) {
        //时
        int reduceHours = difValue ~/ 3600;
        return K.vip_surplus + K.vip_valid_hour(['$reduceHours']);
      } else {
        //分
        int reduceMinute = difValue ~/ 60;
        return K.vip_surplus + K.vip_valid_minutes(['$reduceMinute']);
      }
    }
  }

  //保级值
  String gradingValue(TabInfoItem item) {
    bool isExperienceCard = _response?.myInfo?.isExperienceCard ?? false;
    int value = 0;
    int prevLevel = Util.parseInt(_response?.myInfo?.prevLevel);
    var descText = '';
    String prevName = '';
    if (isExperienceCard && prevLevel > 0) {
      TabInfoItem? prevItem = _response!.tabInfo?[_response?.myInfo?.prevLevel.toString()];
      prevName = prevItem?.name ?? '';
      if (prevLevel == 10) {
        return (prevName.isNotEmpty ? '[$prevName] ' : '') + K.nobility_grading_already;
      } else {
        value = (prevItem?.grading ?? 0) - (_response?.grading ?? 0);
      }
    } else {
      value = item.grading - (_response?.grading ?? 0);
    }
    int tempValue = value > 0 ? value : 0;
    if (tempValue > 0) {
      descText =
          '${prevName.isNotEmpty ? '[$prevName] ' : ''}${K.nobility_need}${(tempValue / 100.00).floor().toStringAsFixed(0)}${K.nobility_grading} ${_gradingResidueTimeText()}';
    } else {
      descText = K.nobility_grading_already;
    }
    return descText;
  }

  Widget _buildNobilityLevelDesc(TabInfoItem item, TabInfoItem nextItem) {
    List<Widget> widgets = [];
    if (_response?.openedNobility ?? false) {
      // bool isExperienceCard = _response?.myInfo?.isExperienceCard ?? false;
      // var descText = '';
      // // if(isExperienceCard ) {
      // //   descText = K.nobility_experience_card + _experienceTimeText();
      // // } else
      // if(_response.gradingValue(item) > 0) {
      //   String prevLevel = '';
      //   if (isExperienceCard && Util.parseInt(_response?.myInfo?.prevLevel) > 0) {
      //     TabInfoItem prevItem = _response?.tabInfo[_response?.myInfo?.prevLevel.toString()];
      //     if (prevItem != null) {
      //       prevLevel = prevItem.name;
      //     }
      //   }
      //   descText = (prevLevel != null && prevLevel.isNotEmpty ? '[$prevLevel] ' : '') + K.nobility_need + (_response.gradingValue(item) / 100.00).floor().toStringAsFixed(0) + K.nobility_grading + ' ' + _gradingResidueTimeText();
      // }
      // else {
      //   descText = K.nobility_grading_already;
      // }

      if (_response!.nobilityLevel == item.level) {
        //当前级别
        widgets.add(Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white.withOpacity(0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                K.nobility_growth_value,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(
                width: 8,
              ),
              _buildProgress(_response?.myInfo?.growth ?? 0, nextItem.growth),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${((_response?.myInfo?.growth ?? 0) / 100.00).floor().toStringAsFixed(0)}/${((nextItem.growth) / 100.00).floor().toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
        widgets.add(
          Container(
              margin: const EdgeInsetsDirectional.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black.withOpacity(0.3),
              ),
              child: Text(gradingValue(item), style: const TextStyle(fontSize: 12, color: Colors.white))),
        );
      } else if (_response!.nobilityLevel < item.level) {
        widgets.addAll(
          [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Text(
                K.nobility_current_growth_value + ((_response?.myInfo?.growth ?? 0) / 100.00).floor().toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black.withOpacity(0.3),
              ),
              child: Text(
                K.nobility_need_growth + (_response!.upgradeValue(item) / 100.00).floor().toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      } else {
        widgets.add(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Text(
              K.nobility_exceed_this_level,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    } else {
      //未开通
      widgets = [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white.withOpacity(0.1),
          ),
          child: Text(
            K.nobility_current_growth_value + ((_response?.myInfo?.growth ?? 0) / 100.00).floor().toStringAsFixed(0),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.black.withOpacity(0.3),
          ),
          child: Text(
            K.nobility_not_open,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }

  /// 特权列表
  Widget _buildNobilityPrivilege() {
    return GridView.count(
      primary: true,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      crossAxisCount: 3,
      childAspectRatio: 216 / 238,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: _buildPrivilegeList(),
    );
  }

  List<Widget> _buildPrivilegeList() {
    List<Widget> widgets = [];
    if (_response?.items != null && _response!.items!.isNotEmpty) {
      for (var element in _response!.items!) {
        widgets.add(_buildPrivilegeItem(element));
      }
    }
    return widgets;
  }

  Widget _buildPrivilegeItem(PrivilegeInfoItem item) {
    if (_currentTabInfo == null) return const SizedBox.shrink();
    int currentTabLevel = (_currentTabInfo?.level ?? 0);

    bool showNewTag = Util.validStr(item.key) &&
        privilegeNews.contains(item.key) &&
        Config.getBool(privilegeCachedWithKey(item.key ?? ''), false) == false;

    return GestureDetector(
      onTap: () => _onTapPrivilege(item),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1C1B1A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CommonAvatar(
                  errorWidget: const SizedBox(height: 70),
                  path: currentTabLevel >= item.start ? (item.icon ?? '') : (item.disableIcon ?? ''),
                  suffix: null,
                  size: 70,
                  resizeCacheWidth: true,
                  loadingWidget: const CupertinoActivityIndicator(),
                ),
                // if (showNewTag)
                //   PositionedDirectional(
                //     top: 0,
                //     end: 0,
                //     child: R.img('noble/noble_new_tag.webp', width: 12, height: 12, package: ComponentManager.MANAGER_VIP),
                //   )
              ],
            ),
            const SizedBox(height: 6),
            Text(
              item.name ?? '',
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: Color(0xFF909096)),
            ),
            const SizedBox(height: 2),
            Text(
              item.desc(currentTabLevel),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Color(0xFF4D4C52)),
            ),
          ],
        ),
      ),
    );
  }

  /// 底部操作区域 1,已购买 2，未购买
  Widget _buildBottomOperation() {
    if (_response!.openedNobility) {
      return _buildRenewArea();
    } else {
      return _buildOpenNobilityButton();
    }
  }

  /// 1,自动续期 2，未自动续期
  _buildRenewArea() {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 12, bottom: 12 + Util.iphoneXBottom),
      child: Row(
        children: [
          CommonAvatar(
            path: Session.icon,
            size: 50,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Session.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  K.nobility_validity_to + Utility.formatDateToDay(_response?.myInfo?.subscribeTime ?? 0),
                  style: const TextStyle(fontSize: 12, color: Color(0x66FFFFFF)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildBuyButton(),
        ],
      ),
    );
  }

  Widget _buildBuyButton() {
    if (_mealsResponse == null) return const SizedBox();
    if (_mealsResponse?.autoSubscribedType == AutoSubType.Null) {
      return _buildRenewButton();
    } else {
      return _buildOpenedAutoWidget();
    }
  }

  _buildRenewButton() {
    return GestureDetector(
      onTap: () async {
        await NobilityBuyDialog.show(context, onPayed: widget.onPayed);
        _loadData();
      },
      child: Container(
        width: 119,
        height: 36,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFDBAF63), Color(0xFFF4D49C)]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          K.nobility_renewal,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF533400),
          ),
        ),
      ),
    );
  }

  _buildOpenedAutoWidget() {
    return Container(
      width: 133,
      height: 36,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x66FFFFFF), width: 1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        K.nobility_already_auto_sub + _mealsResponse!.autoSubscribedString,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0x66FFFFFF),
        ),
      ),
    );
  }

  _buildOpenNobilityButton() {
    return GestureDetector(
      onTap: () async {
        bool result = await NobilityBuyDialog.show(context, onPayed: widget.onPayed);
        if (result == true) {
          _loadData();
        }
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 12, bottom: Util.iphoneXBottom + 12),
        width: 255,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFF5D39F), Color(0xFFF6C068)]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          K.nobility_open_privilege,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF533400),
          ),
        ),
      ),
    );
  }

  _onTapPrivilege(PrivilegeInfoItem item) {
    if (Util.validStr(item.key) && privilegeNews.contains(item.key)) {
      Config.setBool(privilegeCachedWithKey(item.key ?? ''), true);
      refresh(() {});
      _reportData(item);
    }
    int index = _response!.items!.indexOf(item);
    NobilityPrivilegeDetailDialog.show(context, _currentTabInfo?.level ?? 0, _response!.items!, index, extend: _response?.extend,
        onRefresh: () {
      _loadData();
    });
  }

  TabInfoItem? get _currentTabInfo {
    if (_response?.tabData != null && _response!.tabData.length > _currentIndex) {
      return _response?.tabData[_currentIndex];
    } else {
      return null;
    }
  }

  void _reportData(PrivilegeInfoItem item) {
    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': 'click_${item.key}',
    });
  }
}
