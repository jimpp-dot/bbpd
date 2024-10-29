import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat/k.dart';
import 'package:chat/src/ability/chat_custom_gift_api.dart';

import '../../assets.dart';

class CustomGiftPage extends StatefulWidget {
  const CustomGiftPage({super.key});

  @override
  State<CustomGiftPage> createState() => CustomGiftPageState();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CustomGiftPage(),
      settings: const RouteSettings(name: '/customGift'),
    ));
  }
}

class CustomGiftPageState extends State<CustomGiftPage> {
  List<CloudCustomGift> _gitList = [];
  CloudCustomGift _selectGift = CloudCustomGift();

  @override
  void initState() {
    super.initState();
    _loadCustomGiftList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.homeBgColor,
      appBar: BaseAppBar(
        K.chat_custom_gift,
        suppDark: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildGiftGrid(),
                const SizedBox(
                  height: 20,
                ),
                buildGiftStencil(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGiftGrid() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: R.colors.mainBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 6,
          )
        ],
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            margin:
                const EdgeInsetsDirectional.only(start: 16, end: 16, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  height: 22,
                  child: Text(
                    K.chat_custom_select_gift,
                    style: const TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildGridView(constraints),
                const SizedBox(
                  height: 30,
                ),
                _buildButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridView(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 4, end: 4),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 28,
          childAspectRatio: 80 / 126.0,
        ),
        itemBuilder: (context, index) {
          CloudCustomGift gift = _gitList[index];
          return _createGridViewItem(gift);
        },
        itemCount: _gitList.length,
      ),
    );
  }

  _createGridViewItem(CloudCustomGift gift) {
    BoxDecoration decoration = BoxDecoration(
      color: const Color(0xFFF6F7F9),
      borderRadius: BorderRadius.circular(12),
    );

    if (gift.id == _selectGift.id) {
      decoration = BoxDecoration(
        color: const Color(0xFFF6F7F9),
        border: Border.all(width: 1.5, color: const Color(0xFF79E2FF)),
        borderRadius: BorderRadius.circular(12),
      );
    }

    String giftIcon = '${System.imageDomain}static/$giftSubDir/${gift.id}.png';

    return Column(
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              onTap: () {
                Tracker.instance.track(TrackEvent.gift_change_custom,
                    properties: {
                      'gift-id': '${gift.id}',
                      'gs-id': '${Session.uid}'
                    });
                setState(() {
                  _selectGift = gift;
                });
              },
              child: Container(
                width: constraints.maxWidth,
                height: constraints.maxWidth,
                decoration: decoration,
                child: CachedNetworkImage(
                  imageUrl: giftIcon,
                  fit: BoxFit.fill,
                  width: constraints.maxWidth - 10 * 2,
                  height: constraints.maxWidth - 10 * 2,
                ),
              ),
            );
          },
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(top: 8, bottom: 4),
          alignment: AlignmentDirectional.center,
          child: Text(
            gift.name,
            style: const TextStyle(
                color: Color(0xFF313131),
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(
                Assets.chat$chat_custom_gift_value_webp,
                fit: BoxFit.contain,
                package: ComponentManager.MANAGER_CHAT,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '${gift.price}',
                style: const TextStyle(
                    color: Color(0x99313131),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 25),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GradientButton(
            K.chat_save_gift,
            width: constraints.maxWidth,
            height: 52,
            colors: R.colors.mainBrandGradientColors,
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            onTap: () {
              _saveCustomGift();
            },
          );
        },
      ),
    );
  }

  Widget buildGiftStencil() {
    return Container(
      //height: 445,
      width: Util.width,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: R.colors.mainBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 6,
            //offset: Offset(0, 4),
          )
        ],
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            margin:
                const EdgeInsetsDirectional.only(start: 16, end: 16, top: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  height: 22,
                  //margin: EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
                  child: Text(
                    K.chat_custom_gift_desc,
                    style: const TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  //child: Text(),
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            K.chat_custom_gift_content,
                            style: const TextStyle(
                                color: Color(0x99313131),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  height: 22,
                  //margin: EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
                  child: Text(
                    K.chat_change_gift_show,
                    style: const TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  //child: Text(),
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            K.chat_change_gift_content,
                            style: const TextStyle(
                                color: Color(0x99313131),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    margin:
                        const EdgeInsetsDirectional.only(top: 20, bottom: 35),
                    child: R.img(Assets.chat$chat_custom_gift_stencil_webp,
                        package: ComponentManager.MANAGER_CHAT,
                        fit: BoxFit.contain)),
              ],
            ),
          );
        },
      ),
    );
  }

  void _saveCustomGift() async {
    if (_selectGift.id <= 0) {
      Fluttertoast.showToast(
          msg: K.chat_select_custom_gift,
          gravity: ToastGravity.CENTER,
          duration: const Duration(milliseconds: 1500));
      return;
    }
    NormalNull response = await CustomGiftAPI.saveCustomGift(_selectGift.id);
    if (response.success) {
      Fluttertoast.showToast(
          msg: K.chat_custom_gift_save_success, gravity: ToastGravity.CENTER);
      Navigator.of(context).pop();
    } else if (response.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
    }
  }

  void _loadCustomGiftList() async {
    ResCloudCustomGiftList resp = await CustomGiftAPI.getCustomGiftList();
    if (resp.success) {
      if (mounted) {
        setState(() {
          _gitList = resp.data.gifts;
        });
      }
    }
  }
}
