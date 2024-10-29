import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:gift/src/widget/page_gift_item.dart';
import 'repo/wish_gift_repo.dart';

/// 心愿礼物选择面板
///
class WishGiftChoosePanel extends StatefulWidget {
  final ChatRoomData room;
  final double? maxHeight;
  final String? title;
  final bool showNum;

  const WishGiftChoosePanel(
      {Key? key,
      required this.room,
      required this.maxHeight,
      required this.title,
      required this.showNum})
      : super(key: key);

  static Future<SelectGiftInfo?> show(BuildContext context, ChatRoomData room,
      {required double maxHeight, required String title, bool showNum = true}) {
    return displayModalBottomSheet(
        context: context,
        isBarrierDismissible: true,
        defineBarrierColor: Colors.transparent,
        maxHeightRatio: 0.7,
        builder: (BuildContext context) {
          return WishGiftChoosePanel(
            room: room,
            maxHeight: maxHeight,
            title: title,
            showNum: showNum,
          );
        });
  }

  @override
  _WishGiftChoosePanelState createState() => _WishGiftChoosePanelState();
}

class _WishGiftChoosePanelState extends BaseScreenState<WishGiftChoosePanel> {
  List<Gift>? _list;

  int crossAxisCount = 4;
  double childAspectRatio = 0.9;
  double horizontalPadding = 5.0;

  int _selectNum = 10;

  Gift? _selectGift;

  bool isMate = false;

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  void _loadData() async {
    _loadJsonData();
  }

  void _loadJsonData() async {
    DataRsp<List<Gift>> resp =
        await WishGiftRepo.getWishGiftListResp(widget.room.rid);
    if (resp.success == true) {
      _list = resp.data;
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
          child: Container(
            constraints: BoxConstraints(
                maxHeight: (widget.maxHeight ?? 410.0) + Util.iphoneXBottom),
            padding: EdgeInsetsDirectional.only(
                bottom: widget.showNum == false ? Util.iphoneXBottom : 0),
            decoration: const BoxDecoration(
              color: Color(0xCC171621),
              borderRadius:
                  BorderRadiusDirectional.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                _buildTitleBar(),
                Container(
                  height: 1,
                  color: Colors.white.withOpacity(0.1),
                ),
                Expanded(child: buildStatusContent()),
                if (widget.showNum == true)
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
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color(0x33000000),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 32,
                                padding: const EdgeInsetsDirectional.only(
                                    start: 12, end: 12),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFC56AFF)
                                        .withOpacity(0.4),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: Center(
                                    child: Text(
                                  K.gift_number_suffix(['$_selectNum']),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              GestureDetector(
                                onTap: _openInput,
                                child: Text(
                                  K.gift_other_count,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    fontSize: 11,
                                  ),
                                ),
                              )
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
        decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            gradient:
                LinearGradient(colors: [Color(0xFF6D5DFF), Color(0xFFC56AFF)])),
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

    /// price单位是元，转化为分，需要*100
    SelectGiftInfo data = SelectGiftInfo(_selectNum, _selectGift!.id,
        _selectGift!.name ?? '', Util.parseInt(_selectGift!.price * 100));
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
          if (widget.showNum == false)
            PositionedDirectional(end: 16, child: _buildCommitBtn())
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
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
      children: showCurContentWidget(),
    );
  }

  List<Widget> showCurContentWidget() {
    return _list!.map((gift) {
      return _buildGiftItem(gift);
    }).toList();
  }

  Widget _buildGiftItem(Gift gift) {
    bool selected = _selectGift != null && gift.id == _selectGift?.id;
    return PageGiftItem(
      key: ValueKey('${gift.id}'),
      gift: gift,
      isInRoom: true,
      selected: selected,
      selectImg: 'ic_gift_select_new.svg',
      onGiftTaped: (Gift gift) {
        _selectGift = gift;
        setState(() {});
      },
    );
  }

  void _openInput() async {
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
  late FocusNode _focusNode;
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
