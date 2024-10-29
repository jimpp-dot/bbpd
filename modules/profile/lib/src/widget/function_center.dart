import 'dart:math';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base_k;
import 'package:flutter/material.dart';
import 'package:profile/src/model/function_center_bean.dart';
import 'package:profile/src/profile_page.dart'
    hide ProfilePage, ProfilePageState;
import 'package:shared/k.dart' as BaseK;
import 'package:provider/provider.dart' hide Selector;

const FUNCTION_CENTER_TAG = "FunctionCenter";

class FunctionCenter extends StatefulWidget {
  final FunctionCenterBean? bean;
  final OnReloadTypeChanged? changed;

  const FunctionCenter({super.key, this.bean, this.changed});

  @override
  State<StatefulWidget> createState() {
    return _FunctionCenterState();
  }
}

class _FunctionCenterState extends State<FunctionCenter> {
  final ILoginManager _loginManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);

  final IVipManager _vipManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);

  @override
  void initState() {
    super.initState();

    Log.d("Util.isAndroidVerify = ${Util.isAndroidVerify}");
  }

  bool isDataEmpty() {
    return widget.bean == null || Util.isCollectionEmpty(widget.bean!.items);
  }

  @override
  Widget build(BuildContext context) {
    if (isDataEmpty()) {
      return const SizedBox.shrink();
    }

    return Rext.themeCardContainer(
      width: Util.width,
      padding: const EdgeInsetsDirectional.only(bottom: 16, top: 16),
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
      cornerRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getRows(),
      ),
    );
  }

  List<Widget> _getRows() {
    List<Widget> list = [];
    List<FunctionItem> itemsNew = widget.bean!.items;
    itemsNew.removeWhere((element) {
      if (Util.needHideAllTitle()) {
        ///爵位
        //if(element.type == FunctionItem.TYPE_TITLE){
        // return true;
        //}
      }
      if (element.type == FunctionItem.TYPE_BLANK) {
        return true;
      }
      return false;
    });
    itemsNew.removeWhere((element) => element.name == '贵族');

    List<List<FunctionItem>> items = FunctionCenterUtil.groupItems(itemsNew);

    for (int i = 0; i < items.length; i++) {
      list.add(Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getFunctionItem(items[i]),
      ));

      if (i < items.length - 1) {
        list.add(const SizedBox(height: 20));
      }
    }
    return list;
  }

  List<Widget> _getFunctionItem(List<FunctionItem> data) {
    List<Widget> widgets = [];
    for (var item in data) {
      if (item.type == FunctionItem.TYPE_BLANK) {
        widgets.add(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 49, height: 49),
            const SizedBox(height: 2),
            Text("",
                style: TextStyle(color: R.colors.mainTextColor, fontSize: 12)),
          ],
        ));
      } else {
        widgets.add(GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onItemTap(item),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(item.icon),
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 2),
                  Text(item.name,
                      style: TextStyle(
                          color: R.colors.mainTextColor, fontSize: 12)),
                ],
              ),
              _getRedTips(item)
            ],
          ),
        ));
      }
    }

    return widgets;
  }

  Widget _getRedTips(FunctionItem item) {
    if (Util.isStringEmpty(item.tipType)) {
      if (item.type == FunctionItem.TYPE_SHOP &&
          (context.watch<ProfilePayload>().showVipMalRedPoint)) {
        return _getRedDot();
      }

      return const SizedBox.shrink();
    }

    switch (item.tipType) {
      case FunctionItem.TIP_TYPE_RED: //红点
        return _getRedDot();

      case FunctionItem.TIP_TYPE_NUM: //数字
        return PositionedDirectional(
          top: -12,
          end: -15,
          child: RedDot(
            num: Util.parseInt(item.tipString),
          ),
        );

      case FunctionItem.TIP_TYPE_STR: //文本
        return PositionedDirectional(
          top: -12,
          end: -18,
          child: Container(
            padding: const EdgeInsetsDirectional.only(
                start: 4, end: 4, top: 2, bottom: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: R.color.thirdBrightColor,
              border: Border.all(color: R.colors.mainBgColor, width: 2),
            ),
            child: Text(
              item.tipString,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        );

      case FunctionItem.TIP_TYPE_BUBBLE: //气泡
        return PositionedDirectional(
          top: -12,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 5, end: 5, top: 2, bottom: 2),
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    gradient: LinearGradient(colors: [
                      Color(0xFF7D2EE6),
                      Color(0xFFFF6BB3),
                      Color(0xFFE4FE7C)
                    ]),
                  ),
                  child: Text(
                    item.tipString,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                R.img('profile_bubble_triangle.png',
                    width: 12,
                    height: 5,
                    package: ComponentManager.MANAGER_PROFILE)
              ],
            ),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _getRedDot() {
    return const PositionedDirectional(
      top: -5,
      end: -1,
      child: RedDot(
        width: 10,
        height: 10,
        showBorder: false,
      ),
    );
  }

  void _onItemTap(FunctionItem item) {
    if (widget.changed != null) {
      widget.changed!(ReloadType.FunctionCenter);
    }

    switch (item.type) {
      case FunctionItem.TYPE_TASK: //任务
        Tracker.instance.track(TrackEvent.mine_page, properties: {
          'mine_page_click': 'tasks',
        });
        if (!Session.isLogined) {
          _loginManager.show(context);
          return;
        }
        MissionManager.gotoMissionCenter(context,
            initTab: MissionManager.TAB_TASK);
        break;
      case FunctionItem.TYPE_SHOP: //商城
        Tracker.instance.track(TrackEvent.mine_page, properties: {
          'mine_page_click': 'shop',
        });
        if (!Session.isLogined) {
          _loginManager.show(context);
          return;
        }
        _vipManager.show(context);
        break;
      case FunctionItem.TYPE_BAG: //背包

        Tracker.instance.track(TrackEvent.mine_page, properties: {
          'mine_page_click': 'backpack',
        });
        if (!Session.isLogined) {
          _loginManager.show(context);
          return;
        }
        IVipManager? manager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        manager?.showBagPage(context);

        break;
      case FunctionItem.TYPE_TITLE: //爵位

        Tracker.instance.track(TrackEvent.mine_page, properties: {
          'mine_page_click': 'levels',
        });
        if (!Session.isLogined) {
          _loginManager.show(context);
          return;
        }
        _vipManager.showMyLevelScreen(context, initialTab: MyLevelTab.Title);
        break;

      case FunctionItem.TYPE_DRESS: //装扮
        _vipManager.openDressCenter(context);
        break;

      case FunctionItem.TYPE_WEB:
        BaseWebviewScreen.show(context, url: item.url);
        break;
    }
  }
}

class FunctionCenterUtil {
  static int limitCount = 3;

  static FunctionCenterBean? getFunctionCenterBean() {
    Map? map = Session.getMap("function_center");

    if (map.isEmpty) {
      return null;
    }
    FunctionCenterBean bean =
        FunctionCenterBean.fromJson(map as Map<String, dynamic>);
    if (!Util.isCollectionEmpty(bean.items)) {
      while (bean.items.length % limitCount != 0) {
        bean.items.add(FunctionItem.type(FunctionItem.TYPE_BLANK));
      }
    }

    return bean;
  }

  static List<List<FunctionItem>> groupItems(List<FunctionItem> data) {
    List<List<FunctionItem>> groupItems = [];
    while (data.length > limitCount) {
      groupItems.add(data.sublist(0, limitCount));
      data = data.sublist(limitCount);
    }
    if (data.isNotEmpty) {
      for (int i = data.length; i < limitCount; i++) {
        data.add(FunctionItem.type(FunctionItem.TYPE_BLANK));
      }
      groupItems.add(data);
    }
    return groupItems;
  }
}
