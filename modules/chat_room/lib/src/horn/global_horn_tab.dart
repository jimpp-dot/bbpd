import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/horn/widget/confirm_dialog_normal.dart';
import 'package:chat_room/src/horn/widget/confirm_dialog_with_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../protobuf/generated/horn.pb.dart';
import '../../k.dart';
import 'api/api.dart';

class GlobalHornTab extends StatefulWidget {
  final List<HornConfig> configList;
  final int hornId;

  const GlobalHornTab({super.key, required this.configList, this.hornId = 0});

  @override
  State<GlobalHornTab> createState() => _GlobalHornTabState();
}

class _GlobalHornTabState extends State<GlobalHornTab>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _textController = TextEditingController();
  final ValueNotifier<int> _countNotifier = ValueNotifier(0);
  String hintContent = "";
  String id = "";
  late HornConfig _selectConfig;

  @override
  void dispose() {
    _textController.dispose();
    _reset();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectConfig = widget.configList[0];
    for (var config in widget.configList) {
      if (config.cid == widget.hornId) {
        _selectConfig = config;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    int len = widget.configList.length;
    Widget listView = _buildList(len);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (len > 2)
            Expanded(child: listView)
          else
            SizedBox(height: 88 * len + 16 * (len - 1), child: listView),
          const SizedBox(height: 12),
          _buildContentTitle(),
          const SizedBox(height: 8),
          _buildContent(),
          len > 2 ? const SizedBox(height: 20) : const Spacer(),
          _buildSubmitBtn(),
        ],
      ),
    );
  }

  Widget _buildList(int len) {
    return ListView.separated(
      itemCount: widget.configList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      padding: EdgeInsetsDirectional.zero,
      itemBuilder: (context, index) => _buildHornItem(widget.configList[index]),
      physics: len > 2
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildHornItem(HornConfig config) {
    double width = Util.width - 40;
    double height = 88;
    bool select = _selectConfig == config;
    return GestureDetector(
      onTap: () {
        if (!select) {
          _selectConfig = config;
          refresh();
        }
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(config.background),
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: width,
              height: height,
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  R.img(Util.getRemoteImgUrl(config.icon),
                      width: 72, height: 72),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        config.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        config.desc,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Spacer(),
                  NumText(
                    '${config.price}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.1),
                  ),
                  const SizedBox(width: 2),
                  R.img(MoneyConfig.moneyIcon,
                      width: 20, height: 20, wholePath: true),
                ],
              ),
            ),
            if (select)
              PositionedDirectional(
                top: 0,
                start: 0,
                child: R.img(RoomAssets.chat_room$horn_ic_select_webp,
                    width: 16, height: 16),
              ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: Container(
                height: 22,
                padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(10),
                      bottomStart: Radius.circular(10)),
                ),
                child: Text(
                  K.horn_available(["${config.lastNum}"]),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 12),
                ),
              ),
            ),
            if (!select)
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentTitle() {
    return Text(
      K.horn_detail,
      style: const TextStyle(
          color: Colors.white54, fontSize: 13, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildContent() {
    return Container(
      width: Util.width,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEFF).withOpacity(0.15),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              textAlign: TextAlign.start,
              onChanged: (text) => _countNotifier.value = text.length,
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.white70, fontSize: 13),
                hintText: K.horn_text_hint,
              ),
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: _countNotifier,
            builder: (_, count, child) {
              return Text(
                '$count/20',
                style: const TextStyle(color: Colors.white, fontSize: 13),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitBtn() {
    return GestureDetector(
      onTap: _onSubmit,
      child: Container(
        width: Util.width,
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF99FFBC),
            Color(0xFF26C4FF),
            Color(0xFF926AFF)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Text(
          K.horn_btn,
          style: const TextStyle(
              color: Color(0xFF080A31),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _onSubmit() async {
    if (_textController.text.isEmpty) {
      Fluttertoast.showCenter(msg: K.horn_empty_hint);
      return;
    }
    if (id.isNotEmpty) {
      _realSubmit();
    } else {
      bool? confirm;
      if (_selectConfig.lastNum > 0) {
        //有剩余喇叭
        confirm = await ConfirmDialogWithImg.show(
          context,
          type: TYPE.TYPE_AVAILABLE,
          price: _selectConfig.price,
          name: _selectConfig.name,
        );
      } else {
        confirm = await ConfirmDialogWithImg.show(
          context,
          type: TYPE.TYPE_PURCHASE,
          price: _selectConfig.price,
          name: _selectConfig.name,
        );
      }
      if (confirm == true) {
        _realSubmit();
      }
    }
  }

  void _realSubmit() async {
    HornCommitRes res = await Api.commit(_selectConfig.cid,
        _selectConfig.ucid.toInt(), _textController.text, _selectConfig.price,
        id: id);
    _reset();
    if (res.success) {
      eventCenter.emit(EventConstant.EventGlobalHorn);
      eventCenter.emit(EventConstant.EventUserMoneyChange);
      ConfirmDialogNormal.show(
        context,
        content: K.horn_dialog_content_send,
        btnName: K.horn_dialog_btn_send,
        onConfirm: () => Navigator.pop(context),
      );
    } else {
      /// 余额不足，去充值
      if (res.errCode == 40001) {
        ConfirmDialogNormal.show(
          context,
          content: K.horn_dialog_content_recharge,
          btnName: K.horn_dialog_btn_recharge,
          onConfirm: () {
            Navigator.pop(context);
            ISettingManager settingManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_SETTINGS);
            settingManager.openRechargeScreen(context);
          },
        );
      } else {
        Fluttertoast.showCenter(msg: res.msg);
      }
    }
  }

  void _reset() {
    id = "";
    hintContent = "";
  }

  @override
  bool get wantKeepAlive => true;
}
