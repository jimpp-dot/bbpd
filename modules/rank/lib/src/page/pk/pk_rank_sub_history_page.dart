import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';
import 'package:rank/src/widget/pk/pk_history_item.dart';
import '../../../k.dart';

class PkSubHistoryPage extends StatefulWidget {
  final int rid;
  final PageRefer? refer;

  const PkSubHistoryPage({super.key, required this.rid, this.refer});

  @override
  _PkSubHistoryPageState createState() => _PkSubHistoryPageState();
}

class _PkSubHistoryPageState extends State<PkSubHistoryPage>
    with AutomaticKeepAliveClientMixin<PkSubHistoryPage> {
  @override
  bool get wantKeepAlive => true;
  PkHistoryResponse? _rsp;
  final GlobalKey<LoadMoreBaseListWidgetState> _key =
      GlobalKey<LoadMoreBaseListWidgetState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ScaffoldBody(
        backgroundColor: Colors.white,
        decorationColor: Colors.white,
        child: Column(
          children: [
            _buildTopWidget(),
            Divider(
              height: 0.5,
              color: Colors.black.withOpacity(0.1),
            ),
            Container(
              height: 8,
              color: Colors.white,
            ),
            Expanded(
                child: LoadMoreBaseListWidget(
              key: _key,
              loadData: loadData,
              itemHeight: PkHistoryItemWidget.widgetHeight,
              itemBuilder: (index, item) => PkHistoryItemWidget(
                item: item,
                refer: widget.refer,
              ),
            )),
          ],
        ),
      ),
    );
  }

  _topItemWidget(String value, String title) {
    return Container(
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontFamily: Util.numFontFamily,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }

  _buildTopWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 0, end: 0),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topItemWidget('${_rsp?.myInfo?.total ?? 0}', K.pk_number),
          // Container(
          //   width: 1,
          //   height: 40,
          //   color:Colors.black.withOpacity(0.1),
          // ),
          _topItemWidget(_getWinRateString(), K.pk_win_rate),
        ],
      ),
    );
  }

  _getWinRateString() {
    int winNumber = _rsp?.myInfo?.winRate ?? 0;
    int totalNumber = _rsp?.myInfo?.total ?? 0;
    if (totalNumber == 0) {
      return "0%";
    } else {
      return '${(100 * winNumber / totalNumber).toStringAsFixed(0)}%';
    }
  }

  Future<ResponseData> loadData(int page) async {
    _rsp = await PkRankRepository.getHistoryItems(widget.rid, page);
    if (_rsp != null && _rsp!.success == true) {
      if (mounted) {
        setState(() {});
      }
      return ResponseData(
          listData: _rsp?.items,
          hasMore: _rsp!.hasMore,
          success: _rsp!.success);
    } else {
      Fluttertoast.showToast(msg: _rsp?.msg);
      return ResponseData(listData: null, hasMore: false, success: false);
    }
  }
}
