import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vip/src/bag/model/bag_bean.dart';
import 'package:vip/src/bag/model/pb/generated/killer_exchange.pb.dart';
import '../../../k.dart';
import '../bag_api.dart';

class KillerCommoditySellDialog extends StatefulWidget {
  const KillerCommoditySellDialog({super.key, required this.bagGoods});

  final BagGoods bagGoods;

  @override
  _KillerCommoditySellDialogState createState() =>
      _KillerCommoditySellDialogState();
}

class _KillerCommoditySellDialogState extends State<KillerCommoditySellDialog> {
  final TextEditingController _textController = TextEditingController(text: '');
  KillerCommodityValue? _commodityValue;

  @override
  void initState() {
    super.initState();
    _loadData();
    _textController.text = '${widget.bagGoods.num}';
  }

  _loadData() async {
    _commodityValue = await BagApi.commodityUnitPrice(widget.bagGoods.cid);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 312,
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 22,
              ),
              Text(K.vip_killer_sell_title,
                  style: TextStyle(
                    fontSize: 17,
                    color: R.color.mainTextColor,
                  )),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      int currentValue = Util.parseInt(_textController.text);
                      currentValue--;
                      if (currentValue <= 1) {
                        currentValue = 1;
                      }
                      _textController.text = '$currentValue';
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 34,
                      height: 34,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: R.color.secondTextColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontSize: 17, color: R.color.mainTextColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  _buildInputWidget(),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      int currentValue = Util.parseInt(_textController.text);
                      currentValue++;
                      if (currentValue >= (widget.bagGoods.num ?? 0)) {
                        currentValue = widget.bagGoods.num ?? 0;
                      }
                      _textController.text = '$currentValue';
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 34,
                      height: 34,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: R.color.secondTextColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: 17, color: R.color.mainTextColor),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${K.vip_killer_sell_will_get}$_pearlValue',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFFFC76A),
                    ),
                  ),
                  CommonAvatar(
                    path: _commodityValue?.icon ?? '',
                    size: 14,
                    suffix: null,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCancelButton(),
                  const SizedBox(
                    width: 16,
                  ),
                  _buildConfirmButton(),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _pearlValue {
    bool containHour = _commodityValue?.value.containsKey('h') ?? false;
    bool containDay = _commodityValue?.value.containsKey('d') ?? false;
    bool containHourPeriod = _commodityValue?.period.containsKey('h') ?? false;
    bool containDayPeriod = _commodityValue?.period.containsKey('d') ?? false;
    int hValue = Util.parseInt(containHour ? _commodityValue?.value['h'] : 0);
    int dValue = Util.parseInt(containDay ? _commodityValue?.value['d'] : 0);
    int hPValue =
        Util.parseInt(containHourPeriod ? _commodityValue?.period['h'] : 0);
    int dPValue =
        Util.parseInt(containDayPeriod ? _commodityValue?.period['d'] : 0);

    int unitPrice = hValue * hPValue + dValue * dPValue;

    return '${unitPrice * Util.parseInt(_textController.text)}';
  }

  Widget _buildInputWidget() {
    return SizedBox(
      width: 50,
      height: 34,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
          hintText: '${widget.bagGoods.num}',
          hintStyle: TextStyle(fontSize: 17, color: R.color.secondTextColor),
          border: InputBorder.none,
        ),
        cursorColor: R.color.mainTextColor,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, //数字，只能是整数
        ],
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, color: R.color.mainTextColor),
        controller: _textController,
        autocorrect: true,
        autofocus: false,
        maxLines: 1,
        maxLength: 100,
        buildCounter: (BuildContext context,
            {required int currentLength,
            required int? maxLength,
            required bool isFocused}) {
          return const SizedBox();
        },
        onChanged: (val) {
          int inputValue = Util.parseInt(val);
          if (inputValue >= (widget.bagGoods.num ?? 0)) {
            _textController.text = '${widget.bagGoods.num}';
          }
          if (mounted) {
            setState(() {});
          }
        },
        onSubmitted: (val) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }

  Widget _buildCancelButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 120,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: R.color.secondBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Text(
          K.vip_killer_sell_cancel,
          style: TextStyle(
              fontSize: 16,
              color: R.color.secondTextColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  _buildConfirmButton() {
    return GestureDetector(
      onTap: () async {
        KillerExchangeResp res = await BagApi.sellCommodity(
            widget.bagGoods.cid, Util.parseInt(_textController.text));
        if (res.success) {
          Fluttertoast.showCenter(msg: K.vip_killer_sell_success);
          eventCenter.emit(EventConstant.BagItemNumChanged);
        } else {
          Fluttertoast.showCenter(msg: res.msg);
        }
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Container(
        width: 120,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: R.color.mainBrandColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Text(
          K.vip_killer_sell_confirm,
          style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
