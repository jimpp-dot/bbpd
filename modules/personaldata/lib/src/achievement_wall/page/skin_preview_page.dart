import 'package:shared/src/tool/imagecrop/ImageClipper.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/achievement_wall/model/pb/generated/slp_achieve.pb.dart';
import 'package:personaldata/src/achievement_wall/model/skin_config.dart';

import '../../../K.dart';
import '../../../assets.dart';
import '../api/achievement_wall_repo.dart';
import 'dart:ui' as ui;

typedef OnSkinPreview = Function(int skinId);

///皮肤预览面板
class SkinPreviewPage extends StatefulWidget {
  final int skinId;
  final int userAchieveNum;
  final List<AchieveSkin> skinList;

  const SkinPreviewPage({
    Key? key,
    this.skinId = 0,
    required this.userAchieveNum,
    required this.skinList,
  }) : super(key: key);

  static Future<bool?> show(BuildContext context,
      {int skinId = 0,
      required int userAchieveNum,
      required List<AchieveSkin> skinList}) async {
    return displayModalBottomSheet(
        defineBarrierColor: Colors.transparent,
        disableTapDismissible: true,
        context: context,
        maxHeightRatio: 0.68,
        settings: const RouteSettings(name: 'SkinPreviewPage'),
        builder: (BuildContext context) {
          return SkinPreviewPage(
            skinId: skinId,
            userAchieveNum: userAchieveNum,
            skinList: skinList,
          );
        });
  }

  @override
  State<StatefulWidget> createState() => SkinPreviewPageState();
}

class SkinPreviewPageState extends State<SkinPreviewPage> {
  int _selectedSkinId = 0;
  List<ui.Image> previewAssets = [];

  @override
  void initState() {
    super.initState();
    _selectedSkinId = widget.skinId;
    _loadAsset();
  }

  void _loadAsset() async {
    for (int i = 0; i < SkinConfig.configs.length; i++) {
      previewAssets
          .add(await Util.loadImageFromAssets(SkinConfig.configs[i].bg));
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
        borderGradient: const LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Color(0xFF505078), Color(0xFF1D1D2B)]),
        borderRadius: 21.dp,
        borderWidth: 0.5,
        child: Padding(
            padding:
                EdgeInsetsDirectional.only(top: 1.dp, start: 1.dp, end: 1.dp),
            child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1D2B),
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(21.dp),
                      topEnd: Radius.circular(21.dp)),
                ),
                child: Column(
                  children: [
                    _buildTitle(context),
                    Expanded(flex: 1, child: _buildContent()),
                  ],
                ))));
  }

  Widget _buildTitle(BuildContext context) {
    return BaseAppBar.custom(
        title: Text(
          K.achieve_skin_preview_title,
          style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.w900),
        ),
        backColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: _onSkinSave,
              child: Text(K.personaldata_save,
                  style: TextStyle(
                      color: (widget.userAchieveNum >=
                                  widget.skinList[_selectedSkinId].achieveNum &&
                              _selectedSkinId > 0)
                          ? Colors.white
                          : Colors.white.withOpacity(0.3))))
        ]);
  }

  Widget _buildContent() {
    List<Widget> res = [];
    for (int i = 1; i < SkinConfig.configs.length; i++) {
      res.add(_buildItem(SkinConfig.configs[i], i));
    }
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: 16.dp, end: 16.dp, top: 16.dp, bottom: 20.dp),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 20.dp,
        crossAxisSpacing: 8.dp,
        shrinkWrap: true,
        childAspectRatio: 109 / 210,
        children: res,
      ),
    );
  }

  /// 预览item，注意这里的index是从1开始的
  Widget _buildItem(SkinItem item, int index) {
    bool selected = _selectedSkinId == index;

    return GestureDetector(
        onTap: () {
          if (_selectedSkinId != index) {
            _selectedSkinId = index;
            refresh();
            SkinConfig.setPreviewId(_selectedSkinId);
            eventCenter.emit(EventConstant.EventAchieveSkinChange);
          }
        },
        child: Column(
          children: [
            Container(
                alignment: AlignmentDirectional.topStart,
                height: 150.dp,
                width: 109.dp,
                decoration: BoxDecoration(
                    border: selected
                        ? Border.all(color: Colors.white, width: 1.5.dp)
                        : Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1.0.dp),
                    borderRadius: BorderRadius.all(Radius.circular(16.dp))),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16.dp)),
                    child: Stack(
                      children: [
                        (previewAssets.isNotEmpty &&
                                index < previewAssets.length)
                            ? CustomPaint(
                                size: Size(109.dp, 150.dp),
                                painter: ImageClipper(
                                    previewAssets[index],
                                    Rect.fromLTRB(
                                        500,
                                        0,
                                        previewAssets[index].width.toDouble(),
                                        previewAssets[index]
                                            .height
                                            .toDouble())))
                            : const SizedBox.shrink(),
                        if (selected)
                          PositionedDirectional(
                              top: 8.dp,
                              start: 8.dp,
                              child: R.img(
                                  Assets
                                      .personaldata$achievement_wall_ic_selected_webp,
                                  width: 19))
                      ],
                    ))),
            SizedBox(height: 9.dp),
            Text(widget.skinList[index].name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 4.dp),
            Text(
                K.achieve_skin_preview_unreach(
                    ["${widget.skinList[index].achieveNum}"]),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 11,
                    fontWeight: FontWeight.normal)),
          ],
        ));
  }

  _onSkinSave() async {
    if (_selectedSkinId <= 0) {
      return;
    }
    if (widget.userAchieveNum < widget.skinList[_selectedSkinId].achieveNum) {
      Fluttertoast.showCenter(msg: K.achieve_skin_tips);
      return;
    }
    ResAchieveChangeSkin res =
        await AchievementWallRepo.saveSkin(_selectedSkinId);
    if (res.success) {
      Fluttertoast.showCenter(msg: K.achieve_skin_save);
      Navigator.pop(context, true);
    } else {
      Fluttertoast.showCenter(msg: res.msg);
    }
  }

  @override
  void dispose() {
    super.dispose();
    previewAssets.clear();
  }
}
