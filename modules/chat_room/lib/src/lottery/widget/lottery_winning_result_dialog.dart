import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/lottery/model/lottery_model.dart';
import '../../../chat_room.dart';
import '../lottery_manager.dart';
import '../lottery_repository.dart';
import 'package:shared/k.dart' as BaseK;
import 'lottery_winners_screen.dart';
import 'lottery_ui_helper.dart';

/// 房间获奖对话框
class LotteryWinningResultDialog extends StatefulWidget {
  final LotteryDraw draw;

  const LotteryWinningResultDialog(this.draw, {super.key});

  @override
  _LotteryWinningResultDialogState createState() =>
      _LotteryWinningResultDialogState();

  static Future show(BuildContext context, LotteryDraw draw) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) => LotteryWinningResultDialog(draw),
    );
  }
}

class _LotteryWinningResultDialogState
    extends State<LotteryWinningResultDialog> {
  List<LotteryWinner>? _winners;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        width: double.infinity,
        height: 440,
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(16)),
        ),
        child: _buildBody(context),
      ),
    );
  }

  @override
  void initState() {
    _winners = widget.draw.winners;
    super.initState();
    eventCenter.addListener(RoomConstant.Event_Room_Lottery_Start, _onEvent);
  }

  @override
  void dispose() {
    eventCenter.removeListener(RoomConstant.Event_Room_Lottery_Start, _onEvent);
    super.dispose();
  }

  void _onEvent(String name, dynamic data) {
    if (!mounted) return;
    if (LotteryManager.instance.isSameLottery(widget.draw.lotteryId)) return;
    if (ModalRoute.of(context)?.isCurrent ?? false) Navigator.of(context).pop();
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Align(alignment: AlignmentDirectional.topCenter, child: _buildTitles()),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Container(
            margin: const EdgeInsetsDirectional.only(
                start: 20, end: 20, top: 95, bottom: 96),
            child: _buildContentArea(),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: _createBottomButton(),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 8, end: 8, top: 8, bottom: 8),
              child: R.img('icon_btn_close.svg',
                  width: 24,
                  height: 24,
                  package: ComponentManager.MANAGER_VIP,
                  color: R.color.thirdTextColor),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTitles() {
    String text = widget.draw.joinWay == LotteryType.TYPE_GIFT
        ? K.room_lottery_result_subtitle_gift
        : K.room_lottery_result_subtitle;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Text(
          K.room_lottery_result,
          style: TextStyle(
              fontSize: 18,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.w400),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildContentArea() {
    if (_loading) return const Loading(label: '');
    if (_errorMessage?.isNotEmpty ?? false) {
      return ErrorData(error: _errorMessage!, onTap: _loadLotteryRecordUsers);
    }
    if (_winners?.isEmpty ?? true)
      return Center(
          child: ImageEmptyWidget('bb_null.webp', text: K.room_no_data));
    return _buildUserList();
  }

  /// 构建中奖用户列表
  Widget _buildUserList() {
    double itemWidth = Util.width - 32 * 2 - 20 * 2 - 52 - 12 - 20;
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: _winners!.length,
      itemBuilder: (BuildContext context, int index) {
        return LotteryUiHelper.buildUserItem(
            context, _winners![index], itemWidth, 'room_lottery_result_dialog');
      },
    );
  }

  /// "查看详情"按钮
  Widget _createBottomButton() {
    return GestureDetector(
      onTap: () async {
        await LotteryWinnersScreen.launch(
            context, widget.draw.rid, widget.draw.lotteryId);
      },
      child: Container(
        height: 48,
        margin:
            const EdgeInsetsDirectional.only(bottom: 24, start: 24, end: 24),
        padding: const EdgeInsetsDirectional.fromSTEB(0, 14, 0, 13),
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              K.room_lottery_review_detail,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  bool _loading = false;
  String? _errorMessage;

  /// 加载获奖记录列表
  void _loadLotteryRecordUsers() async {
    _loading = true;
    _errorMessage = null;
    _winners?.clear();
    DataRsp<LotteryWinners> resp =
        await LotteryRepository.loadLotteryWinners(widget.draw.lotteryId);
    _loading = false;
    if (!mounted) return;
    if (!(resp.success == true)) {
      _errorMessage = resp.msg ?? BaseK.K.base_net_error;
    } else {
      _errorMessage = null;
      _winners = resp.data?.winners;
    }
    refresh();
  }
}
