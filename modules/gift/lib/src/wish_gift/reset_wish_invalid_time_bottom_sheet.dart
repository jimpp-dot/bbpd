import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

/// 重置心愿时间

typedef ResetWishTimeCallback = void Function(int, int, int);

class ResetWishInvalidTimeBottomSheet extends StatefulWidget {
  final int day; // 天
  final int hour; // 小时
  final int reserveRank; // 是否保留榜单，0-不保留，1-保留
  final ResetWishTimeCallback? resetWishTimeCallback;

  const ResetWishInvalidTimeBottomSheet({
    Key? key,
    this.day = 0,
    this.hour = 0,
    this.reserveRank = 0,
    this.resetWishTimeCallback,
  }) : super(key: key);

  @override
  State<ResetWishInvalidTimeBottomSheet> createState() =>
      _ResetWishInvalidTimeBottomSheetState();

  /// 打开重置心愿时间页面
  static Future<void> show(
    BuildContext context, {
    Key? key,
    int day = 0,
    int hour = 0,
    int reserveRank = 0,
    ResetWishTimeCallback? resetWishTimeCallback,
  }) {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.transparent,
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return ResetWishInvalidTimeBottomSheet(
          key: key,
          day: day,
          hour: hour,
          reserveRank: reserveRank,
          resetWishTimeCallback: resetWishTimeCallback,
        );
      },
    );
  }
}

class _ResetWishInvalidTimeBottomSheetState
    extends State<ResetWishInvalidTimeBottomSheet> {
  var _switchValue = false;
  final TextEditingController _dayTextEditingController =
      TextEditingController();
  final TextEditingController _hourTextEditingController =
      TextEditingController();
  final FocusNode _dayFocusNode = FocusNode();
  final FocusNode _hourFocusNode = FocusNode();

  int _day = 0;
  int _hour = 0;

  @override
  void initState() {
    super.initState();
    _day = widget.day;
    _hour = widget.hour;
    _switchValue = widget.reserveRank == 1;
  }

  @override
  void dispose() {
    _dayTextEditingController.dispose();
    _hourTextEditingController.dispose();
    _dayFocusNode.dispose();
    _hourFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: Container(
        width: Util.width,
        height: Util.height * 0.6,
        decoration: const BoxDecoration(
          color: Color(0xFF171621),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: Util.width,
              height: 44,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    K.gift_reset_wish_duration,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  PositionedDirectional(
                    start: 10,
                    child: BackButton(
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context)),
                  ),
                  PositionedDirectional(
                    end: 10,
                    child: GestureDetector(
                      onTap: () {
                        BaseWebviewScreen.show(context,
                            url: Util.getHelpUrlWithQStr('k156'));
                      },
                      child: R.img(
                        'mall/ic_question_mark.svg',
                        color: Colors.white.withOpacity(0.5),
                        width: 24,
                        height: 24,
                        package: ComponentManager.MANAGER_VIP,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 1,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            K.gift_duration,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 38,
                                height: 40,
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0x0FFFFFFF),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.transparent),
                                      focusNode: _dayFocusNode,
                                      controller: _dayTextEditingController,
                                      maxLength: 2,
                                      scrollPadding: EdgeInsets.zero,
                                      cursorWidth: 0,
                                      onSubmitted: (value) {
                                        if (_dayFocusNode.hasFocus) {
                                          _dayFocusNode.unfocus();
                                        }
                                      },
                                      onChanged: _onDayChanged,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '',
                                        hintStyle: TextStyle(
                                            color: Colors.transparent),
                                      ),
                                      buildCounter: (BuildContext context,
                                          {required int currentLength,
                                          int? maxLength,
                                          required bool isFocused}) {
                                        return const SizedBox.shrink();
                                      },
                                    ),
                                    IgnorePointer(
                                      child: Text(
                                        _day > 0 ? '$_day' : '00',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                K.gift_day,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 38,
                                height: 40,
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0x0FFFFFFF),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.transparent),
                                      focusNode: _hourFocusNode,
                                      controller: _hourTextEditingController,
                                      maxLength: 2,
                                      scrollPadding: EdgeInsets.zero,
                                      cursorWidth: 0,
                                      onSubmitted: (value) {
                                        if (_hourFocusNode.hasFocus) {
                                          _hourFocusNode.unfocus();
                                        }
                                      },
                                      onChanged: _onHourChanged,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '',
                                        hintStyle: TextStyle(
                                            color: Colors.transparent),
                                      ),
                                      buildCounter: (BuildContext context,
                                          {required int currentLength,
                                          int? maxLength,
                                          required bool isFocused}) {
                                        return const SizedBox.shrink();
                                      },
                                    ),
                                    IgnorePointer(
                                      child: Text(
                                        _hour > 0 ? '$_hour' : '00',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                K.gift_hour,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            K.gift_reserve_rank,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          CupertinoSwitch(
                            value: _switchValue,
                            activeColor: R.color.mainBrandColor,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
              child: Text(
                K.gift_reset_wish_desc,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5), fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 48,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFD5D8E0).withOpacity(0.5),
                                const Color(0xFFE4E7EE).withOpacity(0.5)
                              ],
                            ),
                          ),
                          child: Text(
                            K.gift_prop_cancel,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (_day <= 0 && _hour <= 0) {
                            Fluttertoast.showCenter(
                                msg: K.gift_please_input_duration);
                            return;
                          }
                          if (_day > 14) {
                            Fluttertoast.showCenter(
                                msg: K.gift_duration_cannot_over_14_day);
                            return;
                          }
                          if (_hour > 23) {
                            Fluttertoast.showCenter(
                                msg: K.gift_duration_cannot_over_23_hour);
                            return;
                          }
                          widget.resetWishTimeCallback
                              ?.call(_day, _hour, _switchValue ? 1 : 0);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 48,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            gradient: LinearGradient(
                              colors: R.color.mainBrandGradientColors,
                            ),
                          ),
                          child: Text(
                            K.gift_sure,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  void _onDayChanged(String value) {
    refresh(() {
      _day = Util.parseInt(value);
    });
  }

  void _onHourChanged(String value) {
    refresh(() {
      _hour = Util.parseInt(value);
    });
  }
}
