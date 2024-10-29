import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:vip/assets.dart';
import 'package:vip/src/nobility/double_eleven_activity_dialog.dart';
import 'package:vip/src/nobility/model/pb/generated/slp_nobility_activity.pb.dart';
import 'package:vip/src/nobility/model/pb/slp_title_repo.dart';
import 'package:vip/src/nobility/nobility_activity_dialog.dart';
import 'package:vip/src/nobility/xxxx_package_dialog.dart';

class ActivityMiniWidget extends StatefulWidget {
  final Function(bool hasData)? callBack;

  const ActivityMiniWidget({super.key, this.callBack});

  @override
  State<ActivityMiniWidget> createState() => _ActivityMiniWidgetState();
}

class _ActivityMiniWidgetState extends State<ActivityMiniWidget> {
  final List<ActivityMiniData> _datas = [];
  Timer? _countDownTimer;

  RespGiftBagDetail? _respActivityData;

  bool _hasData = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    eventCenter.addListener(EventConstant.EventActivityBuySuccess, _buySuccess);
    eventCenter.addListener(EventConstant.EventActivityDataUpdate, _updateData);
  }

  @override
  void dispose() {
    _stop();
    eventCenter.removeListener(
        EventConstant.EventActivityBuySuccess, _buySuccess);
    eventCenter.removeListener(
        EventConstant.EventActivityDataUpdate, _updateData);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading || (_respActivityData?.success == false) || _datas.isEmpty) {
      return const SizedBox.shrink();
    }
    return _buildBody();
  }

  bool _isLoading = false;

  Future<void> _loadData() async {
    _isLoading = true;
    _respActivityData = await SlpTitleRepo.getNobleActivityData(0);
    _isLoading = false;
    if (_datas.isNotEmpty) {
      _datas.removeRange(0, _datas.length);
    }

    if (_respActivityData?.success ?? false) {
      if (_respActivityData!.titleData.left > 0) {
        _datas.add(
            ActivityMiniData(left: _respActivityData!.titleData.left, type: 1));
      }
      if (_respActivityData!.elevenData.left > 0) {
        _datas.add(ActivityMiniData(
            left: _respActivityData!.elevenData.left, type: 2));
      }
      if (_respActivityData!.cherishData.left > 0) {
        _datas.add(ActivityMiniData(
            left: _respActivityData!.cherishData.left, type: 3));
      }
      _datas.sort((a, b) => a.left.compareTo(b.left));
      if (mounted) {
        setState(() {});
      }
      if (_datas.isNotEmpty) _start();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _hasData = _datas.isNotEmpty;
      if (widget.callBack != null) {
        widget.callBack!(_hasData);
      }
    });
  }

  Widget _buildBody() {
    return SizedBox(
      width: 105,
      height: 48,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          ActivityMiniData miniData = _datas[index];
          return Stack(
            children: [
              R.img(
                miniData.type == 1
                    ? Assets.vip$noble_nobility_activity_mini_bg_webp
                    : (miniData.type == 2
                        ? Assets.vip$double_eleven_activity_mini_bg_webp
                        : Assets.vip$cherish_activity_mini_bg_webp),
              ),
              PositionedDirectional(
                  bottom: 8,
                  end: miniData.type == 2 ? 5 : 0,
                  child: SizedBox(
                    width: 65,
                    child: GradientText(
                      _countDownString(miniData.left),
                      textAlign:
                          miniData.type == 2 ? TextAlign.end : TextAlign.start,
                      gradient: LinearGradient(
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                          colors: miniData.type == 1
                              ? const [Color(0xffFF3F3C), Color(0xffFE923C)]
                              : (miniData.type == 2
                                  ? const [Colors.white, Colors.white]
                                  : const [
                                      Color(0xffFF1A51),
                                      Color(0xffFF82D6)
                                    ])),
                      style: TextStyle(
                        fontFamily: Util.numFontFamily,
                        package: ComponentManager.MANAGER_BASE_CORE,
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: _datas.length,
        autoplay: _datas.length > 1,
        loop: _datas.length > 1,
        duration: 500,
        autoplayDelay: 5000,
        autoplayDisableOnInteraction: false,
        onTap: _onItemClick,
        onIndexChanged: (int index) {},
      ),
    );
  }

  String _countDownString(int time) {
    int hour = _getHour(time);
    int min = _getMin(time);
    int second = _getSecond(time);
    return '${hour < 10 ? '0$hour' : hour.toString()}:${min < 10 ? '0$min' : min.toString()}:${second < 10 ? '0$second' : second.toString()}';
  }

  void _onItemClick(int index) {
    ActivityMiniData miniData = _datas[index];
    if (miniData.left <= 0) return;
    if (miniData.type == 1) {
      NobilityActivityDialog.show(context);
    } else if (miniData.type == 2) {
      DoubleElevenActivityDialog.show(context);
    } else if (miniData.type == 3) {
      XXXXPackageDialog.show(context);
    }
  }

  void _buySuccess(String name, dynamic map) {
    if (name == EventConstant.EventActivityBuySuccess) {
      try {
        Map data = map as Map;
        int type = data['type'];
        if (type > 0) {
          for (int i = 0; i < _datas.length; i++) {
            ActivityMiniData data = _datas[i];
            if (data.type == type) {
              _datas.remove(data);
              break;
            }
          }
        }
        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        Log.d('$e');
      }
    }
  }

  void _updateData(String name, dynamic map) {
    if (name == EventConstant.EventActivityDataUpdate) {
      _loadData();
    }
  }

  _onTimer(Timer timer) {
    for (int i = 0; i < _datas.length; i++) {
      ActivityMiniData data = _datas[i];
      data.left = max(data.left - 1, 0);
      if (data.left == 0) {
        _datas.remove(data);
        i = i - 1;
      }
    }
    if (_datas.isEmpty) {
      _stop();
    }
    setState(() {});

    if (_hasData != _datas.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _hasData = _datas.isNotEmpty;
        if (widget.callBack != null) {
          widget.callBack!(_hasData);
        }
      });
    }
  }

  _start() {
    _stop();
    Duration duration = const Duration(milliseconds: 1000);
    _countDownTimer = Timer.periodic(duration, _onTimer);
  }

  _stop() {
    if (_countDownTimer != null) {
      _countDownTimer?.cancel();
      _countDownTimer = null;
    }
  }

  int _getHour(int time) {
    int hour = (time ~/ 3600).toInt();
    return hour;
  }

  int _getMin(int time) {
    int min = ((time - _getHour(time) * 3600) ~/ 60).toInt();
    return min;
  }

  int _getSecond(int time) {
    int min =
        ((time - _getHour(time) * 3600 - _getMin(time) * 60) % 60).toInt();
    return min;
  }
}

class ActivityMiniData {
  //剩余秒数
  int left;

  //1爵位 2双十一 3惺惺相惜
  int type;

  ActivityMiniData({required this.left, required this.type});
}
