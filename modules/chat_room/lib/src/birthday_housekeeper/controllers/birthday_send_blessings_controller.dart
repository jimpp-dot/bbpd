import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';

import '../model/birthday_gift_item.dart';
import '../model/birthday_repository.dart';
import '../model/generated/gs_birthday.pb.dart';
import 'birthday_send_blessings_state.dart';

/// 生日送祝福控制器
class BirthdaySendBlessingsController extends GetxController {
  final state = BirthdaySendBlessingsState();
  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);
  final IChatManager _chatManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  final Debounce submitDebounce =
      Debounce(duration: const Duration(milliseconds: 1000));

  TextEditingController textController = TextEditingController();
  ScrollController listScrollController = ScrollController();
  FocusNode focusNode = FocusNode();

  ValueNotifier<bool> timeSendSwitchController = ValueNotifier<bool>(false);

  int _uid = 0;

  String get birthdayRemarkValue {
    return textController.value.text.trim();
  }

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(_onFocus);
    timeSendSwitchController.addListener(() async {
      state.isTimeSend = timeSendSwitchController.value;
    });
  }

  @override
  void onClose() {
    textController.dispose();
    listScrollController.dispose();
    focusNode.removeListener(_onFocus);
    focusNode.dispose();
    submitDebounce.dispose();
    super.onClose();
  }

  /// 数据请求
  void loadData(int uid, int birthday) async {
    _uid = uid;
    final resp = await BirthdayRepository.getGsBirthdayDetailData(
        uid: uid, birthday: birthday);
    if (resp.success && resp.hasData()) {
      state.data = resp.data;
      if (Util.validStr(resp.data.defaultWithContent)) {
        textController.text = resp.data.defaultWithContent;
        state.textFieldValue = textController.text;
      }
      if (Util.validList(resp.data.gifts)) {
        for (int i = 0; i < resp.data.gifts.length; i++) {
          GsBirthdayGiftInfo item = resp.data.gifts[i];
          BirthdayGiftItem giftItem =
              BirthdayGiftItem(gift: item, selected: i == 0 ? true : false);
          if (i == 0) {
            state.selectedGiftItem = giftItem;
          }
          state.gifts.add(giftItem);
        }
      }
      update();
    } else {
      Fluttertoast.showCenter(msg: resp.message);
    }
  }

  /// 生日备注值变化
  void onChanged(String value) {
    state.textFieldValue = value;
    update();
  }

  /// 发送逻辑
  void onSubmitted() async {
    if (focusNode.hasFocus) {
      focusNode.unfocus();
    }

    if (state.selectedGiftItem == null ||
        Util.parseInt(state.selectedGiftItem?.gift.giftId) <= 0) {
      Fluttertoast.showCenter(msg: K.room_please_select_birthday_gift);
      return;
    }

    if (Util.isStringEmpty(birthdayRemarkValue)) {
      Fluttertoast.showCenter(msg: K.room_please_input_birthday_remark);
      return;
    }

    if (state.isTimeSend) {
      // 生日当天送礼
      _onPayed();
    } else {
      // 立即送礼
      int giftId = Util.parseInt(state.selectedGiftItem?.gift.giftId);
      int price = Util.parseInt(state.selectedGiftItem?.gift.price);
      String? giftType = Util.parseStr(state.selectedGiftItem?.gift.giftType);

      _payManager.pay(
        System.context,
        key: 'gift',
        type: 'available',
        refer: 'gift',
        args: {
          'money': price,
          'type': 'chat-gift',
          'params': {
            'to': _uid,
            'giftId': giftId,
            'giftNum': 1,
            'version': 2,
            'gift_type': Util.validStr(giftType) ? giftType : 'normal',
          }
        },
        onPayed: () => _onPayed(),
        onError: (isErrorCatch) => _onPayError(isErrorCatch),
        onPayAppOpen: () {},
      );
    }
  }

  void _onPayed() async {
    int giftId = Util.parseInt(state.selectedGiftItem?.gift.giftId);
    int cid = Util.parseInt(state.selectedGiftItem?.gift.cid);
    String wish = Util.validStr(birthdayRemarkValue) ? birthdayRemarkValue : '';
    int delay = state.isTimeSend ? 1 : 0;
    NormalNull resp = await BirthdayRepository.postGsBirthdayWishDeliver(
        uid: _uid, giftId: giftId, cid: cid, wish: wish, delay: delay);
    if (resp.success) {
      Tracker.instance.track(TrackEvent.click, properties: {
        'click_page': 'click_send',
        'timingsend': delay,
        'giftId': giftId,
        'remarks': wish
      });
      if (state.isTimeSend) {
        // 定时发送生日礼物
        Fluttertoast.showCenter(msg: K.room_birthday_bless_succeed);
      } else {
        // 立即发送生日礼物

        // 打开私聊消息页
        _chatManager.openUserChatScreen(System.context,
            type: 'private', targetId: _uid, title: state.data?.name ?? '');

        Future.delayed(const Duration(milliseconds: 1000), () async {
          if (Util.validStr(birthdayRemarkValue)) {
            // 发送生日祝福的消息
            MessageContent content = MessageContent('text',
                SendUser(Session.uid.toString(), Session.name, Session.icon));
            content.content = birthdayRemarkValue;
            await Im.sendMessage(
                ConversationType.Private, _uid.toString(), content);
          }
        });
      }
    } else if (Util.validStr(resp.msg)) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  void _onPayError(bool isErrorCatch) {}

  /// 打开个人主页面
  void openImageScreen(BuildContext context, int uid) {
    _personalDataManager.openImageScreen(context, uid);
  }

  /// 生日备注输入框的焦点
  _onFocus() {
    if (focusNode.hasFocus) {
      Future.delayed(const Duration(seconds: 1), () {
        _onScrollToBottom();
      });
    }
  }

  /// 生日备注输入框获取到焦点后滚动到底部
  void _onScrollToBottom() {
    if (listScrollController.hasClients) {
      final position = listScrollController.position.maxScrollExtent;
      listScrollController.animateTo(position,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    }
  }

  /// 生日礼物item点击
  void onGiftItemTapped(int index) {
    if (!Util.validList(state.gifts)) return;
    for (BirthdayGiftItem item in state.gifts) {
      item.selected = false;
    }
    BirthdayGiftItem item = state.gifts[index];
    item.selected = true;
    state.selectedGiftItem = item;
    update();
  }

  /// 格式化生日日期
  String formatBirthday(int time) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String month =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    String day = dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
    return '$month.$day';
  }
}
