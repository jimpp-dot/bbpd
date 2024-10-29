import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/level/level_api.dart';
import 'package:vip/src/level/model/welfare_history_bean.dart';
import 'package:vip/src/level/widget/welfare_pondItem_widget.dart';
import 'package:loading_more_list/loading_more_list.dart';
import '../../../k.dart';

// 福利领取历史记录
class WelfareHistoryPage extends StatefulWidget {
  final WelfareType? type;

  const WelfareHistoryPage({super.key, this.type});

  @override
  WelfareHistoryState createState() {
    return WelfareHistoryState();
  }

  static void show(BuildContext context, WelfareType type) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WelfareHistoryPage(
              type: type,
            )));
  }
}

class WelfareHistoryState extends State<WelfareHistoryPage> {
  late GlobalKey<PageLoadingListState> _listKey;

  @override
  void initState() {
    super.initState();
    _listKey = GlobalKey<PageLoadingListState>();
  }

  Future<WelfareHistoryBean> _loadData(int page) async {
    int lastId = 0;
    if (page > 1 && (_listKey.currentState?.data.isNotEmpty ?? false)) {
      WelfareHistoryData lastItem = _listKey.currentState?.data.last;
      lastId = lastItem.id;
    }
    try {
      String url =
          '${System.domain}benefit/record?type=${widget.type == WelfareType.Vip ? 'vip' : 'popular'}&page=$page&last_id=$lastId';
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.value();
      WelfareHistoryBean json =
          WelfareHistoryBean.fromJson(res as Map<String, dynamic>);

      return json;
    } catch (e) {
      Log.d(e.toString());
      return WelfareHistoryBean(
          msg: e.toString(), success: false, data: [], limit: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.vip_welfare_history_title(
              [(widget.type == WelfareType.Vip ? 'VIP' : K.vip_popularity)]),
          style: R.textStyle.title,
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return PageLoadingList<WelfareHistoryData>(
      key: _listKey,
      itemExtent: 72,
      loadData: (page) => _loadData(page),
      indicatorBuilder: (context, status) {
        if (status == IndicatorStatus.noMoreLoad)
          return const LoadingFooter(hasMore: false);
        return null;
      },
      itemBuilder: (context, item, index) {
        return _buildCommodity(item);
      },
    );
  }

  Widget _buildCommodity(WelfareHistoryData item) {
    String periodOrNum;
    if ('coin' == item.cType) {
      periodOrNum = 'x${item.cNum}';
    } else if ('piece' == item.type) {
      periodOrNum = 'x${item.cNum}';
    } else {
      periodOrNum = item.period;
    }

    return Container(
      width: Util.width - 40,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
      height: 72,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: R.color.dividerColor,
            width: 0,
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${K.vip_welfare_history_get} ${item.name} $periodOrNum',
                style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                item.time,
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.secondTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 60,
            height: 60,
            child: WelfarePondItemWidget(
              data: item,
              showName: false,
            ),
          ),
        ],
      ),
    );
  }
}
