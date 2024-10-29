import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/cp_small_house/model/cp_small_house_repo.dart';

import '../model/pb/generated/slp_cp_house.pb.dart';
import '../page/cp_small_house_detail_screen.dart';

/// 个人主页CP小屋入口
/// https://doc.weixin.qq.com/doc/w3_AFkAxQYUABk2esS0BP1R0qvsDzH0u?scode=ACkAfQfVAAgdiBVv63AFkAxQYUABk

class CpSmallHouseEntryWidget extends StatefulWidget {
  /// 是否有CP小屋，默认没有。如果没有，则展示区创建CP小屋的空页面；如果有，则展示CP小屋
  final bool hasCpHouse;

  /// 当前查看的是哪个用户
  final int uid;

  /// 当前查看的是哪个用户的头像
  final String icon;

  const CpSmallHouseEntryWidget({
    Key? key,
    required this.uid,
    required this.icon,
    this.hasCpHouse = false,
  }) : super(key: key);

  @override
  State<CpSmallHouseEntryWidget> createState() =>
      _CpSmallHouseEntryWidgetState();
}

class _CpSmallHouseEntryWidgetState extends State<CpSmallHouseEntryWidget> {
  HouseProfile? _houseProfile;
  int _houseLevel = 1;
  String _houseName = '';
  int _houseIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.hasCpHouse) {
      _loadData();
    }
    eventCenter.addListener(
        EventConstant.EventCpHouseDataChanged, refreshByEvent);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.EventCpHouseDataChanged, refreshByEvent);
    super.dispose();
  }

  void refreshByEvent(String type, dynamic data) async {
    _loadData();
  }

  void _loadData() {
    CpSmallHouseRepo.getCpHouseProfile(widget.uid).then((resp) {
      if (resp.success && resp.hasHouseProfile()) {
        setState(() {
          _houseProfile = resp.houseProfile;

          // 通过当前等级获取当前小屋名称
          _houseLevel = _houseProfile?.houseLevel ?? 1;
          if (_houseProfile != null &&
              !Util.isCollectionEmpty(_houseProfile?.houseLevelConfig)) {
            HouseLevelConfig firstConfig =
                resp.houseProfile.houseLevelConfig.first;
            HouseLevelConfig lastConfig =
                resp.houseProfile.houseLevelConfig.last;
            if (_houseLevel <= firstConfig.unlockeLevel) {
              _houseName = firstConfig.name;
              _houseIndex = 0;
            } else if (_houseLevel >= lastConfig.unlockeLevel) {
              _houseName = lastConfig.name;
              _houseIndex = resp.houseProfile.houseLevelConfig.length - 1;
            } else {
              for (int i = 0;
                  i < resp.houseProfile.houseLevelConfig.length;
                  i++) {
                HouseLevelConfig config = resp.houseProfile.houseLevelConfig[i];
                if (_houseLevel == config.unlockeLevel) {
                  HouseLevelConfig realConfig =
                      resp.houseProfile.houseLevelConfig[i];
                  _houseName = realConfig.name;
                  _houseIndex = i;
                  break;
                }
                if (_houseLevel < config.unlockeLevel && i > 0) {
                  HouseLevelConfig realConfig =
                      resp.houseProfile.houseLevelConfig[i - 1];
                  _houseName = realConfig.name;
                  _houseIndex = i - 1;
                  break;
                }
              }
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 顶部CP小屋视图
          GestureDetector(
            onTap: _goCpHouseDetailPage,
            child: Container(
              height: 30,
              color: Colors.white,
              alignment: AlignmentDirectional.bottomStart,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    K.personaldata_cp_small_house,
                    style: TextStyle(
                      color: R.color.unionRankText1,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  R.img(
                    'ic_next.svg',
                    width: 16,
                    height: 16,
                    color: R.color.mainTextColor.withOpacity(0.3),
                    package: ComponentManager.MANAGER_PROFILE,
                  ),
                ],
              ),
            ),
          ),
          // 底部CP小屋视图
          GestureDetector(
            onTap: _goCpHouseDetailPage,
            child: SizedBox(
              height: 13 + 88,
              child: Stack(
                children: [
                  // 底部CP小屋视图
                  PositionedDirectional(
                    top: 13,
                    start: 0,
                    end: 0,
                    child: Container(
                      height: 88,
                      // padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFFFFDBF5), Color(0xFFFFD4F4)]),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          // 空CP小屋 + 有CP小屋
                          PositionedDirectional(
                            start: 2,
                            end: 2,
                            top: 2,
                            bottom: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFFFC4E4),
                                  Color(0xFFCCAFFF)
                                ]),
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                    R.imagePath(
                                      'cp_house/cp_small_house_profile_entry_bg.webp',
                                      package:
                                          ComponentManager.MANAGER_PERSONALDATA,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  // 左边头像
                                  PositionedDirectional(
                                    top: 12,
                                    start: 37,
                                    child: Container(
                                      width: 34,
                                      height: 34,
                                      alignment: AlignmentDirectional.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17),
                                        color: Colors.white,
                                      ),
                                      child: CommonAvatar(
                                        path: widget.hasCpHouse
                                            ? (_houseProfile?.from.icon ??
                                                widget.icon)
                                            : widget.icon,
                                        size: 33,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  // 右边头像
                                  PositionedDirectional(
                                    top: 12,
                                    start: 37 + 28,
                                    child: Container(
                                      width: 34,
                                      height: 34,
                                      alignment: AlignmentDirectional.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17),
                                        color: Colors.white,
                                      ),
                                      child: widget.hasCpHouse &&
                                              Util.validStr(
                                                  _houseProfile?.to.icon)
                                          ? CommonAvatar(
                                              path:
                                                  _houseProfile?.to.icon ?? '',
                                              size: 33,
                                              shape: BoxShape.circle,
                                            )
                                          : Container(
                                              width: 33,
                                              height: 33,
                                              alignment:
                                                  AlignmentDirectional.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.5),
                                                color: const Color(0xFFE9D9FF),
                                              ),
                                              child: R.img(
                                                'ic_add.png',
                                                width: 16.0,
                                                height: 16.0,
                                                color: Colors.white,
                                                package: ComponentManager
                                                    .MANAGER_BASE_ROOM,
                                              ),
                                            ),
                                    ),
                                  ),
                                  // 按钮
                                  PositionedDirectional(
                                    start: widget.hasCpHouse ? 37 : 15,
                                    bottom: 12,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          widget.hasCpHouse
                                              ? ((Util.validStr(_houseName)
                                                  ? _houseName
                                                  : K.personaldata_cp_small_house))
                                              : K.personaldata_create_cp_couple_house,
                                          style: const TextStyle(
                                              color: Color(0xFF5829AC),
                                              fontSize: 11),
                                        ),
                                        R.img(
                                          'ic_next.svg',
                                          width: 14,
                                          height: 14,
                                          color: const Color(0xFF5829AC),
                                          package:
                                              ComponentManager.MANAGER_PROFILE,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // 小屋等级
                          if (widget.hasCpHouse &&
                              _houseProfile != null &&
                              (_houseProfile?.houseLevel ?? 0) > 0)
                            PositionedDirectional(
                              top: 0,
                              start: 0,
                              child: Container(
                                height: 16,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                alignment: AlignmentDirectional.center,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusDirectional.only(
                                      topStart: Radius.circular(12),
                                      topEnd: Radius.circular(0),
                                      bottomStart: Radius.circular(0),
                                      bottomEnd: Radius.circular(8),
                                    ),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFF6E6E),
                                      Color(0xFFFF6CD2)
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'LV.${_houseProfile?.houseLevel ?? 0}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // CP小屋图片
                  PositionedDirectional(
                    top: 0,
                    end: 0,
                    child: CachedNetworkImage(
                      imageUrl: Util.getRemoteImgUrl((widget.hasCpHouse &&
                              !Util.isCollectionEmpty(
                                  _houseProfile?.houseLevelConfig))
                          ? (_houseProfile?.houseLevelConfig[_houseIndex].bg ??
                              '')
                          : 'static/cphouse/house1.png'),
                      width: 160,
                      height: 106,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  /// 跳转到CP小屋详情页面
  void _goCpHouseDetailPage() {
    if (!widget.hasCpHouse && _houseProfile != null) {
      _houseProfile = null;
    }
    CpSmallHouseDetailScreen.show(context,
        uid: widget.uid, id: _houseProfile?.houseId ?? 0);
  }
}
