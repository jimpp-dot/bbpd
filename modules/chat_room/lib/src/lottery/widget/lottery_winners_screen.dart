import 'package:shared/shared.dart';
import 'package:shared/util/response_utils.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/lottery/model/lottery_model.dart';
import '../../../k.dart';
import '../lottery_repository.dart';
import 'package:shared/k.dart' as BaseK;
import 'lottery_ui_helper.dart';

/// 中奖者列表
class LotteryWinnersScreen extends StatefulWidget {
  final int roomId;
  final int lotteryId;

  const LotteryWinnersScreen(this.roomId, this.lotteryId, {super.key});

  @override
  _LotteryWinnersScreenState createState() => _LotteryWinnersScreenState();

  static Future<dynamic> launch(
      BuildContext context, int roomId, int lotteryRecordId) {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LotteryWinnersScreen(roomId, lotteryRecordId)));
  }
}

class _LotteryWinnersScreenState extends State<LotteryWinnersScreen> {
  LotteryWinners? _winnerInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.color.mainBgColor,
        appBar: _buildAppBar(),
        body: _buildBody());
  }

  @override
  void initState() {
    super.initState();
    _loadLotteryRecordUsers();
  }

  /// 构建标题栏
  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
        title: Text(
          _winnerInfo?.title ?? '',
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: _deleteLotteryRecordAlertDialog,
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsetsDirectional.only(end: 20),
                  child: Text(K.room_delete,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: R.color.secondTextColor,
                          fontWeight: FontWeight.w500))))
        ]);
  }

  Widget _buildBody() {
    if (_loading) return const Loading(label: '');
    if (_errorMessage?.isNotEmpty == true) {
      return ErrorData(
          error: _errorMessage, onTap: () => _loadLotteryRecordUsers());
    }
    if (_winnerInfo?.winners.isEmpty ?? true) {
      return Center(
          child: ImageEmptyWidget('bb_null.webp', text: K.room_no_data));
    }
    return _buildUserList();
  }

  /// 构建中奖用户列表
  Widget _buildUserList() {
    double itemWidth = Util.width - 20 * 2 - 52 - 12;
    return ListView.builder(
        padding: const EdgeInsetsDirectional.only(start: 20, bottom: 20),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _winnerInfo?.winners.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return LotteryUiHelper.buildUserItem(
              context,
              _winnerInfo!.winners[index],
              itemWidth,
              'room_lottery_result_detail');
        });
  }

  bool _creating = false;

  /// 删除抽奖记录
  void _doDelete() async {
    if (_creating) return;
    _creating = true;
    BaseResponse resp = await LotteryRepository.deleteLotteryRecord(
        widget.roomId, widget.lotteryId);
    _creating = false;
    if (ResponseUtils.handleBaseResponseError(resp, state: this)) return;
    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  /// 弹出确认删除对话框
  void _deleteLotteryRecordAlertDialog() async {
    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(content: K.room_lottery_delete_confirm);
      },
    );
    if (result ?? false) _doDelete();
  }

  bool _loading = false;
  String? _errorMessage;

  /// 加载获奖记录列表
  void _loadLotteryRecordUsers() async {
    _loading = true;
    _errorMessage = null;
    if (_winnerInfo != null) {
      _winnerInfo!.title = '';
      _winnerInfo!.winners.clear();
    }
    DataRsp<LotteryWinners> resp =
        await LotteryRepository.loadLotteryWinners(widget.lotteryId);
    _loading = false;
    if (!mounted) return;
    if ((resp.success) != true) {
      _errorMessage = resp.msg ?? BaseK.K.base_net_error;
      setState(() {});
      return;
    }
    _errorMessage = null;
    setState(() {
      _winnerInfo = resp.data;
    });
  }
}
