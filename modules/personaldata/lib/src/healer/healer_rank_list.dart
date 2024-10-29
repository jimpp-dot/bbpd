import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:personaldata/src/api/healer_api.dart';
import 'package:personaldata/src/model/pb/generated/healer.pb.dart';

/// 聊愈师UP助力榜单列表
class HealerRankList extends StatefulWidget {
  final int uid;
  final int type;
  const HealerRankList({super.key, required this.type, required this.uid});

  @override
  State<HealerRankList> createState() => _HealerRankListState();
}

class _HealerRankListState extends State<HealerRankList>
    with RefreshAndLoadMoreListMixin<HealerRankList, ResHealerUpCardSender> {
  @override
  Color? get tipsColor => R.color.mainTextColor;

  @override
  Future<RespModel<ResHealerUpCardSender>> loadData(
      int pageIndex, int lastId) async {
    ResHealerHistory resp =
        await HealerApi.history(widget.uid, widget.type, pageIndex);
    return RespModel(
        isSuccess: resp.success, hasMore: resp.data.more, list: resp.data.list);
  }

  @override
  Widget build(BuildContext context) {
    return buildList(
      listPadding:
          EdgeInsetsDirectional.only(top: 8, bottom: Util.bottomMargin),
    );
  }

  @override
  Widget buildItem(int index, ResHealerUpCardSender item) {
    double width = Util.width - 16 * 2;
    return GestureDetector(
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, item.uid);
      },
      child: Container(
        width: width,
        height: 90,
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 8),
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFD5FDF4), Colors.white, Color(0xFFF4E0FF)]),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Row(
          children: [
            RoundNetIcon(
              url: item.icon,
              size: 74,
              showBorder: false,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (item.title > 0)
                        UserNobilityWidget(
                            titleNew: item.title,
                            height: 20,
                            padding:
                                const EdgeInsetsDirectional.only(end: 2.0)),
                      if (item.popular > 0)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 3),
                          child: UserPopularity(
                              popularityLevel: item.popular, height: 20),
                        ),
                      if (item.vip > 0)
                        UserVipWidget(
                            vip: item.vip,
                            height: 20,
                            padding: const EdgeInsetsDirectional.only(end: 2.0))
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'UP卡使用时间：${DateUtils.format(item.sendTime * 1000, 'yyyy-MM-dd HH:mm')}',
                    style:
                        TextStyle(color: R.color.tipsTextColor, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            NumText(
              '*${item.count}',
              style: const TextStyle(
                  color: Color(0xFFFF5F7D),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
