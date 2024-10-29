import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall_v3/mall_api.dart';

import '../../../assets.dart';
import '../../../k.dart';
import 'package:image_picker/image_picker.dart';

import '../../pb/generated/slp_shop_resp.pb.dart';

/// 定制须知
class DiyPage extends StatefulWidget {
  final int cid;
  final int money;
  final int score;

  const DiyPage(
      {super.key, required this.cid, required this.money, required this.score});

  static Future<bool?> show(BuildContext context,
      {required int cid, required int money, required int score}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiyPage(cid: cid, money: money, score: score),
        settings: const RouteSettings(name: '/DiyPage'),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => DiyPageState();
}

class DiyPageState extends State<DiyPage> {
  String cover = '';
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeSecondBgColor,
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: Colors.transparent,
        title: Text(K.mall_diy_title,
            style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 18, bottom: 18),
        child: SingleChildScrollView(
          child: _buildContent(),
        ));
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(K.mall_diy_content,
            style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 12,
            )),
        const SizedBox(height: 28),
        _buildItem(K.mall_diy_item1, _titleController, 5),
        const SizedBox(height: 28),
        _buildItem(K.mall_diy_item2, _descController, 200),
        const SizedBox(height: 28),
        Text(K.mall_diy_example,
            style: TextStyle(
              color: R.colors.mainTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )),
        const SizedBox(height: 12),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: R.colors.mainTextColor.withOpacity(0.04),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ImageUpload(
              source: ImageSource.gallery,
              uploadUrl: '${System.domain}upload/image/',
              child: _renderIcon(),
              onComplete: (String name, int width, int height, Map origin) {
                if (!mounted) return false;
                setState(() {
                  cover = name;
                });
                return true;
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
            child: Container(
              height: 52,
              width: Util.width,
              margin: const EdgeInsetsDirectional.only(top: 20, bottom: 30),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: R.colors.mainBrandGradientColors,
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(K.mall_diy_submit,
                  style: TextStyle(
                    color: R.colors.brightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ),
            onTap: () async {
              if (cover.isEmpty ||
                  _titleController.text.isEmpty ||
                  _descController.text.isEmpty) {
                Fluttertoast.showToast(msg: K.mall_diy_submit_failed);
                return;
              }
              SubmitCustomApplyResp rsp = await MallApi.submitCustomApply(
                  widget.cid,
                  widget.money,
                  widget.score,
                  _titleController.text,
                  _descController.text,
                  cover);
              if (rsp.success) {
                Fluttertoast.showToast(msg: K.mall_diy_submit_succeed);
                Navigator.of(context).pop(true);
              } else {
                if (rsp.msg.isNotEmpty) {
                  Fluttertoast.showToast(msg: rsp.msg);
                }
              }
            }),
      ],
    );
  }

  Widget _renderIcon() {
    if (cover.isEmpty) {
      return R.img(Assets.vip$ic_add_no_border_dark_webp,
          width: 115.0, color: R.colors.mainBrandColor);
    }
    return CommonAvatar(
      path: cover,
      size: 90,
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget _buildItem(
      String title, TextEditingController controller, int maxLength) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              color: R.colors.mainTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 12, end: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: R.colors.moduleBgColor,
          ),
          alignment: Alignment.center,
          child: TextField(
            controller: controller,
            maxLength: maxLength,
            style: TextStyle(color: R.colors.mainTextColor, fontSize: 12),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            enableInteractiveSelection: true,
            decoration: InputDecoration(
              hintText: K.mall_diy_item_hint,
              isDense: true,
              border: InputBorder.none,
              hintStyle:
                  TextStyle(color: R.colors.thirdTextColor, fontSize: 12),
            ),
            autofocus: false,
            autocorrect: false,
            readOnly: false,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descController.dispose();
  }
}
