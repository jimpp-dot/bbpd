import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/api/intimate_card_api.dart';
import 'package:personaldata/src/intimate_card/intimate_card_choose_type_panel.dart';
import 'package:personaldata/src/intimate_card/intimate_card_list_item_widget.dart';

import '../../k.dart';

class IntimateCardMainListWidget extends StatefulWidget {
  final int type; //0我赠送的亲密卡列表，1我收到的亲密卡列表
  final bool isUnbind;
  final Function(int sendCount, int receiveCount, String? docUrl)?
      finishRequest;
  const IntimateCardMainListWidget(
      {super.key, this.type = 0, this.isUnbind = false, this.finishRequest});

  @override
  State<IntimateCardMainListWidget> createState() =>
      _IntimateCardMainListWidgetState();
}

class _IntimateCardMainListWidgetState extends State<IntimateCardMainListWidget>
    with
        RefreshAndLoadMoreListMixin<IntimateCardMainListWidget,
            IntimateCardInfo> {
  int _sendCount = 0; //我赠送的亲密卡数量
  int _receiveCount = 0; //我收到的亲密卡数量
  String? _docUrl; //说明文档地址

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
        child: buildList());
  }

  @override
  Widget buildItem(int index, IntimateCardInfo item) {
    if (widget.type == 0 && index == 0 && !widget.isUnbind) {
      return _buildSendItem();
    } else {
      return IntimateCardListItemWidget(
        itemCardInfo: item,
        unbindSuccess: (IntimateCardInfo cardInfo) {
          _unbindSuccess(cardInfo, widget.type == 0);
        },
        finishBindCard: _finishBindCard,
      );
    }
  }

  @override
  Future<RespModel<IntimateCardInfo>> loadData(
      int pageIndex, int lastId) async {
    ResIntimateCardList resp = await IntimateCardApi.getIntimacyCardList(lastId,
        isSend: widget.type == 0, isUnbind: widget.isUnbind);
    if (lastId == 0) {
      _sendCount = resp.data.sendCount;
      _receiveCount = resp.data.receiveCount;
      _docUrl = resp.data.docUrl;
      if (widget.type == 0 && !widget.isUnbind) {
        ///赠送的默认添加一个
        resp.data.list.insert(0, IntimateCardInfo());
      }
      if (widget.finishRequest != null) {
        widget.finishRequest!(_sendCount, _receiveCount, _docUrl);
      }
    }
    return RespModel(
        isSuccess: resp.success,
        hasMore: resp.data.more,
        list: resp.data.list,
        lastId: resp.data.cursor);
  }

  @override
  Widget buildEmptyData() {
    if (widget.isUnbind) {
      return super.buildEmptyData();
    }
    return Container(
      alignment: Alignment.center,
      child: Text(
        K.no_receive_intimacy_card,
        style: TextStyle(
          color: Colors.black.withOpacity(0.4),
          fontSize: 14.dp,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSendItem() {
    return GestureDetector(
      onTap: () {
        IntimateCardChooseTypePanel.show(context,
            finishBindCard: _finishBindCard);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 6.dp, bottom: 6.dp),
        height: 60.dp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.dp),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            R.img(
              Assets.personaldata$ic_intimacy_card_webp,
              width: 21,
              height: 21,
            ),
            const SizedBox(width: 4),
            Text(
              K.send_receive_intimacy_card,
              style: TextStyle(
                color: Colors.black.withOpacity(0.9),
                fontSize: 16.dp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            R.img(Assets.personaldata$ic_next_small_svg,
                width: 14, height: 14, color: Colors.grey),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  void _unbindSuccess(IntimateCardInfo itemCardInfo, bool isSend) {
    source.list.remove(itemCardInfo);
    if (isSend) {
      _sendCount = max(0, _sendCount - 1);
    } else {
      _receiveCount = max(0, _sendCount - 1);
    }
    if (mounted) {
      setState(() {});
    }
    if (widget.finishRequest != null) {
      widget.finishRequest!(_sendCount, _receiveCount, _docUrl);
    }
  }

  void _finishBindCard() {
    source.refreshData();
  }
}
