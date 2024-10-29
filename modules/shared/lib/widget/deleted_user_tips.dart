import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../k.dart';

/// 被封禁用户提示条，在四个列表头部出现, 分别是：粉丝列表/访客记录/招呼列表/互动消息
class DeletedUserTips extends StatelessWidget {
  final double marginStart;

  final double marginEnd;

  final double marginTop;

  const DeletedUserTips(
      {super.key,
      this.marginStart = 0,
      this.marginEnd = 0,
      this.marginTop = 0});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 34,
        margin: EdgeInsetsDirectional.only(
            start: marginStart, end: marginStart, top: marginTop, bottom: 10),
        color: R.colors.mainBrandColor.withOpacity(0.1),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          R.img('ic_prompt.svg',
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_BASE_CORE,
              color: R.colors.mainBrandColor),
          const SizedBox(
            width: 2,
          ),
          Text(
            K.base_has_shield_some_users,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: R.colors.mainBrandColor, fontSize: 13),
          )
        ]),
      ),
    );
  }
}

class DeletedUserTipsUtil {
  /// 我的粉丝列表
  static const LIST_FANS = "my_fans";

  /// 谁访问过我
  static const LIST_VISITOR_SELF = "visitor_self";

  /// 我访问过谁
  static const LIST_VISITOR_OTHER = "visitor_other";

  /// 互动消息
  static const LIST_MOMENT_MSG = "moment_msg";

  static const String _LIST_PREFIX = "deprlist_";

  static bool getAndUpdateShow(String list, int count) {
    String key = _LIST_PREFIX + list;
    int current = Config.getInt(key, 0);
    bool show = count > current;
    if (count != current) {
      Config.set(key, count.toString());
    }
    return show;
  }
}
