import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';
import 'package:vip/src/vip_mall/api.dart';
import 'package:vip/src/vip_mall/pb/generated/vip_commodity.pb.dart';

/// 公会积分明细
///
class GuildScoreDetailScreen extends StatefulWidget {
  const GuildScoreDetailScreen({super.key});

  static Future show(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GuildScoreDetailScreen(),
        settings: const RouteSettings(name: '/GuildScoreDetailScreen'),
      ),
    );
  }

  @override
  State<GuildScoreDetailScreen> createState() => _GuildScoreDetailScreenState();
}

class _GuildScoreDetailScreenState extends State<GuildScoreDetailScreen> {
  String? _error;
  bool _isLoading = true;
  List<ScoreHistoryItem> _data = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    ResScoreHistory rsp = await Api.getGuildScoreHistory();
    if (rsp.success) {
      _data = rsp.data;
    } else {
      _error = rsp.msg;
      Fluttertoast.showToast(msg: rsp.msg);
    }
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  _reload() {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _error = null;
      });
    }
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar(K.vip_score_detail),
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    if (_isLoading) {
      return const Loading();
    }
    if (_error != null) {
      return ErrorData(error: _error, onTap: _reload);
    }

    if (_data.isEmpty) {
      return EmptyWidget(onTap: _reload);
    }

    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _load();
      },
      child: ListView.separated(
        itemCount: _data.length,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        itemBuilder: (BuildContext context, int index) {
          return _ScoreDetailItem(_data[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: R.color.mainTextColor.withOpacity(0.08),
            height: 0.5,
          );
        },
      ),
    );
  }
}

class _ScoreDetailItem extends StatelessWidget {
  final ScoreHistoryItem item;

  const _ScoreDetailItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                item.subject,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                '${item.value}',
                style: const TextStyle(
                    color: Color(0xFFFCA252),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                K.vip_score,
                style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.6),
                    fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            Utility.formatDate(item.timestamp.toInt()),
            style: TextStyle(
                color: R.color.mainTextColor.withOpacity(0.6), fontSize: 13),
          ),
        ],
      ),
    );
  }
}
