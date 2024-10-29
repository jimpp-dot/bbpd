import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:vip/src/vip_mall/api.dart';
import 'package:vip/src/vip_mall/model/vip_mall_second_bean.dart';
import 'package:vip/src/vip_mall/widget/vip_mall_goods_item.dart';

class GuildMallSubPage extends StatefulWidget {
  final String type;

  const GuildMallSubPage(this.type, {super.key});

  @override
  State<GuildMallSubPage> createState() => _GuildMallSubPageState();
}

class _GuildMallSubPageState extends State<GuildMallSubPage> {
  List<VipMallSecondBean> _dataList = [];
  String? _error;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    DataRsp<List<VipMallSecondBean>> response =
        await Api.getCommodityList(widget.type);
    if (response.success == true) {
      _dataList = response.data ?? [];
    } else {
      _error = response.msg ?? '';
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _reload() {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _error = null;
        _dataList.clear();
      });
    }
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (_error != null) {
      return ErrorData(error: _error, onTap: _reload);
    }

    if (_dataList.isEmpty) {
      return EmptyWidget(onTap: _reload);
    }

    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return _renderGroupItem(_dataList[index]);
      },
      itemCount: _dataList.length,
    );
  }

  Widget _renderGroupItem(VipMallSecondBean item) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 12, bottom: 12, start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: TextStyle(
                fontSize: 18,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 104 / 139,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...item.items.map((e) => _renderItem(e)).toList(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderItem(ShopMailCommodity item) {
    return VipMallGoodsItem(commodity: item, from: 'second', onBuy: _loadData);
  }
}
