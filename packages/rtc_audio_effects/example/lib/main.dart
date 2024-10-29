import 'package:flutter/material.dart';

import 'package:base_effect_core/base_effect_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    BaseEffectApi.inst.setAudioKMarkFilePath('/sdcard/Download/jay_love_ball_src.mp3', 0);
    BaseEffectApi.inst.setAudioMixingFilePath('/sdcard/Download/jay_love_ball_acc.mp3', 0);

    BaseEffectApi.inst.setAudioOutputFilePath('/sdcard/Download/jay_love_ball_out.mp3');
    BaseEffectApi.inst.enableInEarMonitoring(true);
    BaseEffectApi.inst.setAudioProfile(BaseEffectConstants.audioProfileMusicHighQualityStereo);

    BaseEffectApi.onAudioRouteChanged = _onAudioRouteChanged;
    BaseEffectApi.onStateChanged = _onStateChanged;
    BaseEffectApi.onKMarkSliceScoreUpdate = _onKMarkSliceScoreUpdate;
    BaseEffectApi.onKMarkSentenceScoreUpdate = _onKMarkSentenceScoreUpdate;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Stack(
      children: [
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  BaseEffectApi.inst.start();
                },
                child: const Text('Start'),
              ),
              TextButton(
                onPressed: () {
                  BaseEffectApi.inst.stop();
                },
                child: const Text('Stop'),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _onAudioRouteChanged(int routing) {
    print("_onAudioRouteChanged routing=$routing");
  }

  void _onStateChanged(int state) {
    print("onStateChanged state=$state");
  }

  void _onKMarkSliceScoreUpdate(int beginPosMs, int endPosMs, double pitch, double score) {
    print("onKMarkSliceScoreUpdate beginPosMs=$beginPosMs,endPosMs=$endPosMs,pitch=$pitch,score=$score");
  }

  void _onKMarkSentenceScoreUpdate(int index, double currentScore, double totalScore) {
    print("onKMarkSentenceScoreUpdate index=$index,currentScore=$currentScore,totalScore=$totalScore");
  }
}
