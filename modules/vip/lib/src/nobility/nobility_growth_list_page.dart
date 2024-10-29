import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 成长值明细
///
class NobilityGrowthList extends StatefulWidget {
  const NobilityGrowthList({super.key});

  @override
  _NobilityGrowthListState createState() => _NobilityGrowthListState();

  static Future show(BuildContext context, {Key? key}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NobilityGrowthList(),
      settings: const RouteSettings(name: 'NobilityGrowthList'),
    ));
  }
}

class _NobilityGrowthListState extends State<NobilityGrowthList> {
  bool _loading = true;
  NobilityGrowthResponse? _response;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: const Text('成长值明细'),
      ),
      body: _buildBody(),
    );
  }

  _loadData() async {
    _response = await NobilityRepository.getNobilityGrowthList();

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _buildBody() {
    if (_loading) return const Loading();

    if (_response == null || _response?.success == false) {
      return ErrorData(
        error: _response?.msg,
        onTap: _loadData,
      );
    }

    if (Util.isCollectionEmpty(_response?.items)) {
      return const EmptyWidget();
    }

    return RefreshIndicatorFactory.of(
      onRefresh: () => _loadData(),
      child: ListView.builder(
        itemCount: _response?.items?.length ?? 0,
        itemBuilder: (context, index) {
          return _buildGrowthDetailItem(_response?.items?[index]);
        },
      ),
    );
  }

  Widget _buildGrowthDetailItem(GrowthInfo? item) {
    if (item == null) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    _response!.typeDesc?[Util.parseInt(item.type)] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  NumText(
                    item.growth ?? '',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Utility.formatDate(Util.parseInt(item.dateline)),
                    style: TextStyle(
                      fontSize: 13.0,
                      color: R.color.mainTextColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(color: R.color.dividerColor, height: 0.5),
        ],
      ),
    );
  }
}
