import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:chat_room/k.dart';

import '../controllers/birthday_send_blessings_controller.dart';
import '../controllers/birthday_send_blessings_state.dart';
import '../model/birthday_gift_item.dart';

/// 生日送祝福

class BirthdaySendBlessingsPage extends StatefulWidget {
  final int uid;
  final int birthday;

  const BirthdaySendBlessingsPage(this.uid, this.birthday, {Key? key})
      : super(key: key);

  @override
  State<BirthdaySendBlessingsPage> createState() =>
      _BirthdaySendBlessingsPageState();

  static Future show(BuildContext context, int uid, int birthday) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BirthdaySendBlessingsPage(uid, birthday),
        settings: const RouteSettings(name: '/BirthdaySendBlessingsPage'),
      ),
    );
  }
}

class _BirthdaySendBlessingsPageState extends State<BirthdaySendBlessingsPage> {
  final BirthdaySendBlessingsController _logic =
      Get.put(BirthdaySendBlessingsController());
  final BirthdaySendBlessingsState _state =
      Get.find<BirthdaySendBlessingsController>().state;

  @override
  void initState() {
    super.initState();
    _logic.loadData(widget.uid, widget.birthday);
  }

  @override
  void dispose() {
    Get.delete<BirthdaySendBlessingsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.room_send_wishes,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: HideKeyboard(
        child: GetBuilder<BirthdaySendBlessingsController>(builder: (logic) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 顶部生日卡片
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                              colors: [Color(0xFFFFD9A4), Color(0xFFFF6356)],
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                Util.getRemoteImgUrl(
                                    'static/birthday_housekeeper/birthday_send_blessings_bg.webp'),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.transparent,
                            border: Border.all(
                                color: const Color(0x80FFF0C5), width: 1),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16),
                              Align(
                                child: ClipOval(
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    color: Colors.white,
                                    alignment: AlignmentDirectional.center,
                                    child: _state.data != null
                                        ? CommonAvatar(
                                            path: _state.data?.icon ?? '',
                                            size: 78,
                                            shape: BoxShape.circle,
                                            onTap: () {
                                              _logic.openImageScreen(context,
                                                  _state.data?.uid ?? 0);
                                            },
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  _state.data?.name ?? '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                _logic.formatBirthday(widget.birthday),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                K.room_gregorian_calendar(
                                    [(_state.data?.gregorianBirthday ?? '')]),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                K.room_traditional_chinese_calendar(
                                    [(_state.data?.lunarBirthday ?? '')]),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                K.room_birthday_twelve_animals([
                                  (_state.data?.chineseZodiac ?? ''),
                                  '${_state.data?.years ?? 0}'
                                ]),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // 生日当天定时发送
                      Container(
                        height: 72,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  K.room_birthday_time_send,
                                  style: TextStyle(
                                      color: R.color.unionRankText1,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  K.room_birthday_time_send_desc,
                                  style: TextStyle(
                                      color: R.color.unionRankText1
                                          .withOpacity(0.4),
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            const Spacer(),
                            AdvancedSwitch(
                              activeColor: const Color(0xFF60C8FF),
                              inactiveColor: Colors.grey.withOpacity(0.2),
                              thumb: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.white,
                                ),
                              ),
                              width: 46,
                              height: 28,
                              controller: _logic.timeSendSwitchController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // 生日礼物
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              K.room_birthday_gift,
                              style: TextStyle(
                                  color: R.color.unionRankText1, fontSize: 16),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 114,
                              child: Util.validList(_state.gifts)
                                  ? ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        BirthdayGiftItem giftItem =
                                            _state.gifts[index];
                                        return _buildGiftItem(giftItem, index);
                                      },
                                      itemCount: _state.gifts.length,
                                    )
                                  : const SizedBox.shrink(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // 生日备注
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              K.room_birthday_remark,
                              style: TextStyle(
                                  color: R.color.unionRankText1, fontSize: 16),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              height: 94,
                              padding: const EdgeInsetsDirectional.only(
                                  start: 12, end: 12, bottom: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: const Color(0xFFF6F7F9)),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.send,
                                textAlign: TextAlign.start,
                                style: R.textStyle.regular14,
                                focusNode: _logic.focusNode,
                                controller: _logic.textController,
                                autocorrect: true,
                                autofocus: false,
                                onSubmitted: (String value) =>
                                    _logic.onSubmitted(),
                                onChanged: _logic.onChanged,
                                maxLength: 200,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: K.room_birthday_remark_hint_text,
                                  hintStyle: TextStyle(
                                      color: R.color.mainTextColor
                                          .withOpacity(0.2),
                                      fontSize: 14),
                                  counterText:
                                      '${_state.textFieldValue.length}/200',
                                  counterStyle: TextStyle(
                                      color: R.color.mainTextColor
                                          .withOpacity(0.2),
                                      fontSize: 11),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.white,
                alignment: AlignmentDirectional.center,
                child: GestureDetector(
                  onTap: () =>
                      _logic.submitDebounce.call(() => _logic.onSubmitted()),
                  child: Container(
                    height: 52,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors,
                      ),
                    ),
                    child: Text(
                      K.room_confirm_gift,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _buildGiftItem(BirthdayGiftItem item, int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            _logic.onGiftItemTapped(index);
          },
          child: Container(
            width: 84,
            height: 114,
            decoration: BoxDecoration(
              border: item.selected
                  ? Border.all(color: const Color(0xFF2ECEFE), width: 1)
                  : null,
              borderRadius: BorderRadius.circular(12.0),
              color: const Color(0xFFF6F7F9),
            ),
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                CachedNetworkImage(
                  imageUrl: Util.giftImgUrl(item.gift.giftId),
                  width: 60.0,
                  height: 60.0,
                ),
                const SizedBox(height: 2.0),
                Text(
                  item.gift.name,
                  style: TextStyle(
                      color: R.color.unionRankText1.withOpacity(0.6),
                      fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${item.gift.price}${K.room_diamond_unit}',
                  style:
                      const TextStyle(color: Color(0xFFFDA252), fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
