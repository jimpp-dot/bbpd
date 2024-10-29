import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

typedef OnRecordSuccess = Function(Map recordDetail);

/// IM说话面板
class RecorderPanel extends StatefulWidget {
  final OnRecordSuccess? onRecordSuccess;

  const RecorderPanel({super.key, this.onRecordSuccess});

  @override
  _RecorderPanelState createState() => _RecorderPanelState();
}

class _RecorderPanelState extends State<RecorderPanel> {
  String _msgText = K.press_to_talk;
  String _timeText = "00:00";
  bool _recording = false;

  @override
  void initState() {
    super.initState();

    eventCenter.addListener(
        Im.EventRecordDurationChanged, _onRecordDurationChanged);
  }

  @override
  void dispose() {
    super.dispose();

    eventCenter.removeListener(
        Im.EventRecordDurationChanged, _onRecordDurationChanged);

    if (_recording) stopRecord();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onRecordDurationChanged(String type, dynamic duration) {
    String secStr = duration as String;
    int sec = double.parse(secStr).toInt();
    Log.d('_onRecordDurationChanged: $sec');
    if (sec >= 60) {
      stopRecord();
      return;
    }

    if (sec >= 1 && sec <= 60) {
      if (mounted) {
        setState(() {
          _timeText = "00:${sec.toString().padLeft(2, "0")}";
        });
      }
//      if (60 - sec <= 10) {
//        int left = (60 - sec);
//
//        //Fluttertoast.showToast(msg: '还能录音 $left s', gravity: ToastGravity.CENTER);
//      } else {
//        setState(() {
//          _timeText = "00:${sec.toString().padLeft(2, "0")}";
//        });
//        // if(_recording) Fluttertoast.showToast(msg: '已录音 $sec s', gravity: ToastGravity.CENTER );
//      }
    }
  }

  void startRecord() async {
    if (Platform.isIOS) {
      bool can = await PulseIMWrapper.canRecordVoice();
      if (!can) {
        Fluttertoast.showToast(
            msg: K.chat_need_record_permission_ios,
            gravity: ToastGravity.CENTER);
        return;
      }
    }

    if (_recording) {
      return;
    }

    _recording = true;
    Map? res = await PulseIMWrapper.startRecordVoice();
    bool success = Util.parseBool(res['success'], false);
    if (success) {
      bool isTimeTooShort =
          res['data'] != null && res['data']['duration'].toInt() == 0;
      bool isContentTooShort =
          res['data'] != null && Util.isStringEmpty(res['data']['base64']);
      if (isTimeTooShort || isContentTooShort) {
        Fluttertoast.showToast(
            msg: K.record_time_too_short, gravity: ToastGravity.CENTER);
        return;
      }
      if (widget.onRecordSuccess != null) widget.onRecordSuccess!(res['data']);
    } else {
      resetState();

//      String errMsg = res['errMsg'];
//      if(errMsg != null && errMsg != 'recorder cancelled') _msgText = res['errMsg'];
      String errMsg = K.record_failed_has_mic_authority;
      Fluttertoast.showToast(msg: errMsg, gravity: ToastGravity.CENTER);
    }
  }

  void stopRecord() async {
    _recording = false;
    await PulseIMWrapper.finishRecordVoice();
  }

  void cancelRecord() async {
    _recording = false;
    await PulseIMWrapper.cancelRecordVoice();
    Fluttertoast.showToast(
        msg: K.record_has_cancel, gravity: ToastGravity.CENTER);
  }

  void resetState() {
//      _buttonColor = Colors.green[600];
    _msgText = K.press_to_talk;
    _timeText = "00:00";
  }

  void updateState(String state) {
    switch (state) {
      case 'start':
//      _buttonColor = Colors.green[300];
        _msgText = K.upglide_to_cancel;
        startRecord();
        break;
      case 'end':
        resetState();
        stopRecord();
        break;
      case 'cancel':
        resetState();
        cancelRecord();
        break;
      case 'out':
        _msgText = K.loosen_to_cancel;
        break;
      case 'in':
        _msgText = K.upglide_to_cancel;
        break;
    }

    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.0,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: !_recording,
            child: Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsetsDirectional.only(top: 75),
              child: HierarchicalRipple(
                beginRadius: 52,
                endRadius: 133,
                beginColor: R.colors.mainBrandColor.withOpacity(0.24),
                endColor: R.colors.mainBrandColor.withOpacity(0),
                autoStart: true,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 4,
                      height: 4,
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF32D97B),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      _timeText,
                      style: TextStyle(
                        color: R.colors.secondTextColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 104.0,
                  width: 104,
                  margin: const EdgeInsets.only(top: 34.0, bottom: 12.0),
                  child: RecordButton(
                      onRecordStateChange: (String state) =>
                          updateState(state)),
                ),
                Text(
                  _msgText,
                  style: TextStyle(
                      color: R.colors.secondTextColor, fontSize: 13.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

typedef OnRecordStateChange = Function(String state);

class RecordButton extends StatefulWidget {
  final OnRecordStateChange? onRecordStateChange;

//  final Color buttonColor;
  const RecordButton({
    super.key,
    this.onRecordStateChange,
    /*this.buttonColor*/
  });

  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  String _recordState = 'start';

  void updateState(String state) {
    _recordState = state;

    if (widget.onRecordStateChange != null) widget.onRecordStateChange!(state);
  }

  void onPanDown(BuildContext context, DragDownDetails details) {
    updateState('start');
  }

  void onPanEnd(BuildContext context, DragEndDetails details) {
    if (_recordState == 'out') {
      updateState('cancel');
    } else {
      updateState('end');
    }
  }

  void onPanCancel() {
    updateState('cancel');
  }

  void onPanUpdate(BuildContext context, DragUpdateDetails details) {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    Offset? position = renderBox?.globalToLocal(details.globalPosition);
    if (position != null && position.dy < 0) {
      updateState('out');
    } else {
      if (_recordState == 'out') {
        updateState('in');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(52.0)),
      child: GestureDetector(
        onVerticalDragDown: (DragDownDetails details) =>
            onPanDown(context, details),
        onVerticalDragEnd: (DragEndDetails details) =>
            onPanEnd(context, details),
        onVerticalDragUpdate: (DragUpdateDetails details) =>
            onPanUpdate(context, details),
        child: Container(
          height: 104.0,
          width: 104.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: R.colors.mainBrandGradientColors,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color(0XFF57D7FE).withOpacity(0.5),
                blurRadius: 6.0,
                spreadRadius: 0,
                offset: const Offset(0.0, 2.0),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              R.imagePath('chat_voice_record.svg',
                  package: ComponentManager.MANAGER_CHAT),
              width: 40.0,
              height: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
