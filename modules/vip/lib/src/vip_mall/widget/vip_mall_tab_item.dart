import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:vip/src/vip_mall/page/vip_mall_second_page.dart';

import '../guild_mall/guild_mall_page.dart';
import '../model/vip_mall_bean.dart';

/// 商城顶部tab
class VipMallTabItem extends StatefulWidget {
  final VipMallTab tab;

  const VipMallTabItem({super.key, required this.tab});

  @override
  _VipMallTabItemState createState() => _VipMallTabItemState();
}

class _VipMallTabItemState extends State<VipMallTabItem> {
  _onTabTaped(VipMallTab tab) {
    Tracker.instance.track(TrackEvent.shop_firstpage,
        properties: {'shop_page_click': 'tab'});
    if ("treasure" == tab.type) {
      //夺宝
      BaseWebviewScreen.show(context, url: AppConfig.treasureUrl);
      Tracker.instance.track(TrackEvent.treasure_exposure,
          properties: {'uid': Session.uid, 'source_type': '4'});
    } else if ('broker' == tab.type) {
      GuildMallPage.show(context, tab.name);
    } else {
      if ("credit" == tab.type) {
        /// 积分商城点击上报
        Tracker.instance.track(TrackEvent.new_conversion_click,
            properties: {'page': 'integral_shop'});
      }
      VipMallSecondPage.show(context, tab.name, tab.type);
    }
    if (!Util.isStringEmpty(widget.tab.newCommodityIcon)) {
      tab.newCommodityIcon = '';
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTabTaped(widget.tab),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonAvatar(
                    path: widget.tab.icon,
                    size: constraints.maxWidth,
                    suffix: null,
                    loadingWidget: const CupertinoActivityIndicator(),
                  ),
                  Text(
                    widget.tab.name,
                    style:
                        TextStyle(fontSize: 12, color: R.color.mainTextColor),
                  ),
                ],
              ),
              _buildCorner(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCorner() {
    if (!Util.isStringEmpty(widget.tab.newCommodityIcon)) {
      return PositionedDirectional(
        top: 0,
        end: 0,
        child: CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(widget.tab.newCommodityIcon),
          height: 13,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
