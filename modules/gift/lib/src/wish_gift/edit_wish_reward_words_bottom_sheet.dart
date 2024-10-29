import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

/// 编辑心愿答谢文案

class EditWishRewardWordsBottomSheet extends StatefulWidget {
  final String? rewardWords; // 答谢文案
  final int rewardWordsAudit; // 答谢文案审核状态：1-审核中
  const EditWishRewardWordsBottomSheet(
      {Key? key, this.rewardWords, this.rewardWordsAudit = 0})
      : super(key: key);

  @override
  State<EditWishRewardWordsBottomSheet> createState() =>
      _EditWishRewardWordsBottomSheetState();

  /// 打开编辑心愿答谢文案页面
  static Future<String> show(BuildContext context,
      {Key? key, String? rewardWords, int rewardWordsAudit = 0}) async {
    return await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.transparent,
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return EditWishRewardWordsBottomSheet(
            key: key,
            rewardWords: rewardWords,
            rewardWordsAudit: rewardWordsAudit);
      },
    );
  }
}

class _EditWishRewardWordsBottomSheetState
    extends State<EditWishRewardWordsBottomSheet> {
  late FocusNode _focusNode;
  late TextEditingController _textController;

  int _currentLength = 0;

  final int _maxLength = 16;

  String get value {
    return _textController.value.text.trim();
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode();

    if (Util.validStr(widget.rewardWords)) {
      _textController.text = widget.rewardWords!;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
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
                    K.gift_edit_wish_reward_words_text,
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
                  )
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                        color: const Color(0x1AFFFFFF),
                        border: Border.all(
                            color: const Color(0x33F6F7F9), width: 0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SizedBox(
                              height: 85,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                                focusNode: _focusNode,
                                controller: _textController,
                                autocorrect: true,
                                autofocus: false,
                                maxLength: _maxLength,
                                onSubmitted: (value) {
                                  _onSendTapped();
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: K
                                      .gift_please_input_edit_wish_reward_words_text,
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 15),
                                ),
                                buildCounter: (BuildContext context,
                                    {required int currentLength,
                                    int? maxLength,
                                    required bool isFocused}) {
                                  refresh(() {
                                    _currentLength = currentLength;
                                  });
                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '$_currentLength',
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  '/$_maxLength',
                                  style: const TextStyle(
                                      fontSize: 10, color: Color(0x80FFFFFF)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (widget.rewardWordsAudit == 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          R.img(Assets.ic_auditing_webp,
                              width: 16,
                              height: 16,
                              package: ComponentManager.MANAGER_GIFT),
                          const SizedBox(width: 6),
                          Text(
                            K.gift_before_modify_reward_words_auditing,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                ],
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
                        onTap: _onSendTapped,
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

  void _onSendTapped() async {
    if (!Util.validStr(value)) {
      Fluttertoast.showCenter(
          msg: K.gift_please_input_edit_wish_reward_words_text);
      return;
    }
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
    Navigator.of(context).pop(value);
  }
}
