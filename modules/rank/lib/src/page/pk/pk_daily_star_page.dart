import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';

class PkDailyStarScreen extends StatefulWidget {
  const PkDailyStarScreen({super.key});

  @override
  _PkDailyStarScreenState createState() => _PkDailyStarScreenState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const PkDailyStarScreen(),
      settings: const RouteSettings(
        name: '/rank/pkDaily',
      ),
    ));
  }
}

class _PkDailyStarScreenState extends State<PkDailyStarScreen> {
  PkDailyStarResponse? _rsp;
  bool _loading = true;
  bool _loadingFailed = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildList() {
    if (_loading && _rsp == null) {
      //首次加载
      return const Center(
        child: Loading(),
      );
    }

    if (_loadingFailed) {
      //首次请求失败
      return Center(
        child: ErrorData(
          onTap: _loadData,
        ),
      );
    }

    if (!_loading && (_rsp?.items == null || _rsp!.items.isEmpty)) {
      //暂无数据
      return Center(
        child: ErrorData(
          error: K.rank_no_data,
          onTap: _loadData,
        ),
      );
    }

    return RefreshIndicatorFactory.of(
      backgroundColor: R.color.mainBgColor,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: (Util.width - 106 * 3 - 40) / 2,
            childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return PkDailyStarItemWidget(
            item: _rsp!.items[index],
          );
        },
        itemCount: _rsp?.items.length ?? 0,
      ),
      onRefresh: _loadData,
    );
  }

  Future _loadData() async {
    _loading = true;
    _rsp = await PkRankRepository.getStarItems(PkDailyRankType.daily);
    _loading = false;
    if (_rsp!.success == true) {
      _loadingFailed = false;
    } else {
      _loadingFailed = true;
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.rank_daily_star_title),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          padding:
              const EdgeInsetsDirectional.only(start: 20, end: 20, top: 16),
          child: _buildList(),
        ),
      ),
    );
  }
}

class PkDailyStarItemWidget extends StatelessWidget {
  final PkDailyStarItem item;

  const PkDailyStarItemWidget({super.key, required this.item});

  Widget _buildDateLabel() {
    return Container(
      width: 68,
      height: 16,
      padding: const EdgeInsetsDirectional.only(start: 22, top: 1),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.imagePath(Assets.bg_date_label_webp,
              package: ComponentManager.MANAGER_RANK)),
        ),
      ),
      child: Text(
        item.date,
        maxLines: 1,
        style: const TextStyle(
            fontSize: 7, color: Colors.white, fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, item.uid,
            refer: const PageRefer('PkDailyStar'));
      },
      child: SizedBox(
        width: 106,
        height: 106,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            CommonAvatar(
              path: item.icon,
              size: 106,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            PositionedDirectional(top: 0, start: 0, child: _buildDateLabel()),
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  item.name,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
