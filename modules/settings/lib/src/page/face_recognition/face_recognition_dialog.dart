/*
 *
 *  Created by yao.qi on 2022/4/18 上午10:24
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/4/18 上午10:24
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

/// 人脸识别弹框
class FaceRecognitionDialog extends StatelessWidget {
  final String? tip;
  final bool canSkip;
  final VoidCallback? onConfirmCallback;
  final VoidCallback? onCancelCallback;

  const FaceRecognitionDialog({
    Key? key,
    this.tip,
    this.canSkip = false,
    this.onConfirmCallback,
    this.onCancelCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 312,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    K.setting_face_recognition_title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF313131),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 20, end: 20, top: 16, bottom: 28),
                  child: Text(
                    !Util.isStringEmpty(tip)
                        ? tip!
                        : !Util.isStringEmpty(faceRecognitionFirstTips)
                            ? faceRecognitionFirstTips
                            : K.setting_first_face_recognition_content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF313131),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Tracker.instance
                        .track(TrackEvent.scanface_pop_click, properties: {
                      'button_type': 'next',
                    });
                    if (onConfirmCallback != null) {
                      onConfirmCallback!();
                    }
                  },
                  child: Container(
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        K.setting_immediately_face_recognition_btn,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                if (canSkip)
                  GestureDetector(
                    onTap: () {
                      Tracker.instance
                          .track(TrackEvent.scanface_pop_click, properties: {
                        'button_type': 'close',
                      });
                      if (onCancelCallback != null) {
                        onCancelCallback!();
                      }
                    },
                    child: Container(
                      height: 48,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Center(
                        child: Text(
                          K.setting_later_face_recognition_btn,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0x99202020),
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
