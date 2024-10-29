import 'package:gift/slp_src/widget/slp_page_gift_item.dart';
import 'package:gift/k.dart';
import 'dart:ui';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/wish_gift/repo/wish_gift_repo.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/k.dart' as BaseK;

import '../../assets.dart';

class SlpWishGiftChoosePanel extends StatefulWidget {
  final ChatRoomData? room;
  final double? maxHeight;
  final String? title;
  final bool showNum;
  final String? subTitle;
  final String? cancelDialogContent;
  final int selectNum;

  const SlpWishGiftChoosePanel({
    Key? key,
    this.room,
    this.maxHeight,
    this.title,
    this.showNum = false,
    this.subTitle,
    this.cancelDialogContent,
    this.selectNum = 0,
  }) : super(key: key);

  static Future<SelectGiftInfo?> show(
    BuildContext context,
    ChatRoomData room, {
    double maxHeight = 0,
    String? title,
    bool showNum = true,
    String? subTitle,
    String? cancelDialogContent,
    int selectNum = 10,
  }) {
    return displayModalBottomSheet(
        context: context,
        isBarrierDismissible: true,
        defineBarrierColor: Colors.transparent,
        maxHeightRatio: 0.7,
        builder: (BuildContext context) {
          return SlpWishGiftChoosePanel(
            room: room,
            maxHeight: maxHeight,
            title: title,
            showNum: showNum,
            subTitle: subTitle,
            cancelDialogContent: cancelDialogContent,
            selectNum: selectNum,
          );
        });
  }

  @override
  _SlpWishGiftChoosePanelState createState() => _SlpWishGiftChoosePanelState();
}

class _SlpWishGiftChoosePanelState
    extends BaseScreenState<SlpWishGiftChoosePanel> {
  List<BbGiftPanelGift>? _list;

  int crossAxisCount = 4;
  double childAspectRatio = 0.9;
  double horizontalPadding = 5.0;

  BbGiftPanelGift? _selectGift;

  int _selectNum = 0;

  @override
  void initState() {
    super.initState();

    _selectNum = widget.selectNum;
    _loadData();
  }

  void _loadData() async {
    ResBbGiftPanel resp =
        await WishGiftRepo.getBBWishGiftListResp(widget.room?.rid ?? 0);
    if (resp.success) {
      _list = resp.data.gift;
      if (!Util.isCollectionEmpty(_list)) {
        setScreenReady();
      } else {
        setScreenEmpty();
      }
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                    maxHeight:
                        (widget.maxHeight ?? 410.0) + Util.iphoneXBottom),
                padding: EdgeInsetsDirectional.only(
                    bottom: widget.showNum == false ? Util.iphoneXBottom : 0),
                decoration: const BoxDecoration(
                    color: Color(0xCC171621),
                    borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(16))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    _buildTitleBar(),
                    if (Util.validStr(widget.subTitle)) ...[
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 16, end: 16),
                        child: Text(
                          widget.subTitle ?? '',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                    Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.1),
                    ),
                    Expanded(child: buildStatusContent()),
                    Container(
                      height: 52 + Util.iphoneXBottom + 12,
                      color: const Color(0xCC171621),
                      padding: EdgeInsetsDirectional.only(
                          start: 16, end: 16, bottom: Util.iphoneXBottom + 12),
                      child: Row(
                        children: [
                          Container(
                            height: 32,
                            padding: const EdgeInsetsDirectional.only(end: 12),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0x33000000),
                            ),
                            child: Row(
                              children: [
                                if (widget.showNum) ...[
                                  Text(
                                    K.select_num,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                ],
                                GestureDetector(
                                  onTap: _openInput,
                                  child: Container(
                                    height: 32,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 12, end: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: R.color.mainBrandColor,
                                          width: 1),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(16),
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '$_selectNum',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        R.img(
                                          Assets.ic_up_arrow_svg,
                                          width: 16,
                                          height: 16,
                                          color: R.color.mainBrandColor,
                                          package:
                                              ComponentManager.MANAGER_GIFT,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          _buildCommitBtn()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  onPressed: () async {
                    if (Util.validStr(widget.cancelDialogContent)) {
                      bool result = await showDialog(
                        context: context,
                        builder: (context) {
                          return ConfirmDialog(
                            title: K.gift_cancel_set_gift,
                            content: widget.cancelDialogContent,
                          );
                        },
                      );

                      if (result != true) {
                        return;
                      }
                    }

                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommitBtn() {
    return InkWell(
      onTap: _commit,
      child: Container(
        width: 68,
        height: 32,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        ),
        child: Center(
          child: Text(
            BaseK.K.sure,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),
          ),
        ),
      ),
    );
  }

  void _commit() {
    if (_selectNum <= 0) {
      Fluttertoast.showToast(
          msg: K.gift_input_gift_num, gravity: ToastGravity.CENTER);
      return;
    }

    if (_selectGift == null) {
      Fluttertoast.showToast(
          msg: K.gift_please_choose_gift, gravity: ToastGravity.CENTER);
      return;
    }

    SelectGiftInfo data = SelectGiftInfo(_selectNum, _selectGift?.id ?? 0,
        _selectGift?.name ?? '', _selectGift?.price ?? 0);
    Navigator.of(context).pop(data);
  }

  Widget _buildTitleBar() {
    return SizedBox(
      height: 44,
      width: Util.width,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(
            child: Text(
              widget.title ?? K.gift_choose_gift_title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildContent() {
    return GridView.count(
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      childAspectRatio: childAspectRatio,
      padding: EdgeInsetsDirectional.only(
        start: horizontalPadding,
        end: horizontalPadding,
        bottom: 0,
      ),
      children: _list?.isNotEmpty == true
          ? _list!.map((gift) {
              return _buildGiftItem(gift);
            }).toList()
          : [],
    );
  }

  Widget _buildGiftItem(BbGiftPanelGift gift) {
    bool selected = _selectGift != null && gift.id == _selectGift?.id;
    return SlpPageGiftItem(
      key: ValueKey('${gift.id}'),
      gift: gift,
      isInRoom: true,
      selected: selected,
      onGiftTaped: (BbGiftPanelGift gift) {
        _selectGift = gift;
        setState(() {});
      },
    );
  }

  void _openInput() async {
    if (widget.showNum != true) {
      Fluttertoast.showCenter(msg: K.gift_cant_select_gift_num);
      return;
    }
    String num = await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      builder: (BuildContext context) {
        return _InputNumWidget();
      },
      maxHeightRatio: 0.75,
    );

    if (Util.parseInt(num) > 0 && mounted) {
      _selectNum = Util.parseInt(num);
      setState(() {});
    }
  }
}

class _InputNumWidget extends StatefulWidget {
  @override
  _InputNumWidgetState createState() => _InputNumWidgetState();
}

class _InputNumWidgetState extends State<_InputNumWidget> {
  FocusNode? _focusNode;
  final TextEditingController _textController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    double ext = 0.0;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.0 + ext,
        padding: const EdgeInsetsDirectional.only(start: 0.0),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom +
                ((keyboard == 0.0 && Util.isIphoneX) ? 34.0 : 0.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 50.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(start: 0),
                      child: TextField(
                        cursorColor: R.color.mainBrandColor,
                        keyboardAppearance: Brightness.light,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 16,
                            fontFamily: Util.fontFamily,
                          ),
                          hintText: K.gift_input_gift_num,
                          isDense: true,
                          counterText: '',
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.send,
                        textAlign: TextAlign.start,
                        maxLines: 30,
                        minLines: 1,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: Util.fontFamily),
                        focusNode: _focusNode,
                        controller: _textController,
                        autocorrect: true,
                        autofocus: true,
                        onSubmitted: _onSubmitted,
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _onSubmitted(_textController.value.text),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(end: 12, start: 8),
                      child: Container(
                        width: 58,
                        height: 28,
                        decoration: BoxDecoration(
                          color: R.color.mainBrandColor,
                          borderRadius: BorderRadius.circular(15.5),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          BaseK.K.sure,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSubmitted(String value) async {
    Navigator.of(context).pop(value);
  }
}
