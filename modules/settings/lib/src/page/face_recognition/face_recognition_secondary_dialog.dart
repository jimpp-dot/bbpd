/*
 *
 *  Created by yao.qi on 2022/4/18 上午10:57
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/4/18 上午10:57
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

/// 人脸识别二次弹框
class FaceRecognitionSecondaryDialog extends StatelessWidget {
  final String? tip;
  final VoidCallback? onConfirmCloseCallback;
  final VoidCallback? onCancelCallback;

  const FaceRecognitionSecondaryDialog({
    Key? key,
    this.tip,
    this.onConfirmCloseCallback,
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
                      start: 20, end: 20, top: 16, bottom: 32),
                  child: Text(
                    !Util.isStringEmpty(tip)
                        ? tip!
                        : !Util.isStringEmpty(faceRecognitionSecondTips)
                            ? faceRecognitionSecondTips
                            : K.setting_second_face_recognition_content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF313131),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (onCancelCallback != null) {
                            onCancelCallback!();
                          }
                        },
                        child: Container(
                          height: 48,
                          width: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                          child: Center(
                            child: Text(
                              K.cancel,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xB3202020),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (onConfirmCloseCallback != null) {
                            onConfirmCloseCallback!();
                          }
                        },
                        child: Container(
                          height: 48,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            gradient: LinearGradient(
                              colors: R.color.mainBrandGradientColors,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              K.setting_confirm_close_btn,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
