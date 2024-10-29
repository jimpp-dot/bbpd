import 'dart:io';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart' hide TagItem;
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/publish_at_bean.dart';
import 'package:moment/src/page/at_list_screen.dart';
import 'package:moment/src/page/group_select_screen.dart';
import 'package:moment/src/page/tag_select_screen.dart';
import 'package:permission_handler/permission_handler.dart';

typedef OnImagesSelected = void Function(List<File>? files);
typedef OnVideoSelected = void Function(File videoFile);
typedef OnAudioConfirm = void Function(String result, int duration);
typedef OnAtFriendUpdate = void Function(List<PublishATBean> atBeans);
typedef ATBeansCount = int Function();

const int MAX_VIDEO_SIZE = 250 * 1024 * 1024; // 259MB
const int MAX_VIDEO_DURATION = 2 * 60; // 2 minute
const int MAX_OFFSET_TIME = 48 * 60 * 60 * 1000; // 48 小时

/// 发布动态底部位置选择 and 分组
class PublishBottom extends StatefulWidget {
  final OnImagesSelected? onImagesSelected;
  final OnVideoSelected? onVideoSelected;
  final OnAudioConfirm? onAudioConfirm;
  final OnAtFriendUpdate? onAtFriendUpdate;
  final ATBeansCount atBeansCount;
  final bool isCircleAtAccountWhiteList;

  final bool showGroupSelect; // 展现分组
  final bool showPlaySelect; // 展现约玩
  final bool showTag; // 展现标签
  final String? from; // 上一级界面
  final String? selectTag;
  final List<String>? recommendTags;
  final int verifyType;

  const PublishBottom(
      {super.key,
      required this.onImagesSelected,
      required this.onVideoSelected,
      required this.onAudioConfirm,
      required this.atBeansCount,
      this.showGroupSelect = false,
      this.showPlaySelect = false,
      this.showTag = true,
      this.from,
      this.selectTag,
      this.recommendTags,
      this.verifyType = 0,
      required this.onAtFriendUpdate,
      required this.isCircleAtAccountWhiteList});

  @override
  PublishBottomState createState() => PublishBottomState();
}

class PublishBottomState extends State<PublishBottom> {
  _Extend _extend = _Extend.None;
  PublishMomentModel? state;
  VoidCallback? listener;
  String result = "";
  bool isShowGroupSelectMenu = false;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  void dispose() {
    super.dispose();
    Location.shutdown();
    HiveUtil.closeBox<int>(
        '${Session.uid}_${HiveBoxConstant.refuseLocationTime}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state ??= MomentPublishStateContainer.of(context);
  }

  _getLocation() async {
    PermissionStatus permission = await Permission.location.status;
    if (permission == PermissionStatus.granted) {
      // 获取定位权限的状态
      BBLocationData? loc =
          await Location.updateLocation(needPermissionDialog: false);
      if (loc != null && loc.isValid()) {
        if (loc.city != null && loc.city!.isNotEmpty) {
          state?.selectLocation = loc.city;
        }
        state?.latitude = loc.latitude.toString();
        state?.longitude = loc.longitude.toString();
        if (mounted) {
          setState(() {});
        }
      }
    } else {
      int nowTime = DateTime.now().millisecondsSinceEpoch;
      int lastShowTime = (await HiveUtil.get<int>(
              '${Session.uid}_${HiveBoxConstant.refuseLocationTime}',
              defaultValue: 0)) ??
          0;
      if (lastShowTime == 0 || (nowTime - lastShowTime) > MAX_OFFSET_TIME) {
        BBLocationData? loc =
            await Location.updateLocation(needPermissionDialog: true);
        if (loc != null && loc.isValid()) {
          if (loc.city != null && loc.city!.isNotEmpty) {
            state?.selectLocation = loc.city;
          }
          state?.latitude = loc.latitude.toString();
          state?.longitude = loc.longitude.toString();
          if (mounted) {
            setState(() {});
          }
        } else {
          // 关闭权限弹窗，记录当前关闭时间戳
          HiveUtil.put<int>(
              '${Session.uid}_${HiveBoxConstant.refuseLocationTime}',
              DateTime.now().millisecondsSinceEpoch);
        }
      }
    }
  }

  closePanel() {
    _closeExtend();
  }

  _onDeleteSelectTag(String tag) {
    Log.d('_onDeleteSelectTag');
    if (state?.selectTags != null && state!.selectTags!.isNotEmpty) {
      state!.selectTags!.removeWhere((item) => item == tag);
      setState(() {});
    }
  }

  _onDeletePlayTag() {
    Log.d('_onDeletePlayTag');
    SelectGame? selectGame = state?.selectPlayTags.value;
    if (selectGame != null || selectGame!.game != null) {
      state?.selectPlayTags.value = null;
      setState(() {});
    }
  }

  Future<void> _onATTaped() async {
    List<PublishATBean>? atList = await ATListScreen.openAddATScreen(context,
        maxATNum: 10 - widget.atBeansCount(),
        isCircleAtAccountWhiteList: widget.isCircleAtAccountWhiteList);
    if (atList != null && atList.isNotEmpty) {
      if (widget.onAtFriendUpdate != null) {
        widget.onAtFriendUpdate!(atList);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.colors.homeBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _renderTop(),
          _renderRecommendSection(),
          _renderBottomPanel(),
          _renderExtendPanel(),
        ],
      ),
    );
  }

  Widget _renderRecommendSection() {
    var listView = ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 9),
      itemCount: widget.recommendTags!.length,
      separatorBuilder: (context, index) {
        return const VerticalDivider(width: 8, color: Colors.transparent);
      },
      itemBuilder: (context, index) {
        String name = widget.recommendTags![index];
        bool isSelected =
            state?.selectTags != null && state!.selectTags!.contains(name);
        final backgroundColors = isSelected
            ? R.colors.tagGradientColors
            : [R.colors.dividerColor, R.colors.dividerColor];
        final textColor =
            isSelected ? R.colors.mainTextColor : R.colors.thirdTextColor;
        return _builderRecommendTag(
            text: name,
            textColor: textColor,
            backgroundColors: backgroundColors);
      },
    );
    return SizedBox(
      height: 30,
      child: listView,
    );
  }

  Widget _builderRecommendTag(
      {String? text, Color? textColor, required List<Color> backgroundColors}) {
    textColor ??= R.colors.thirdTextColor;

    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: backgroundColors,
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: () {
          _onRecommendTagSelect(text ?? '');
        },
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 11,
            fontFamily: Util.fontFamily,
          ),
          foregroundColor: textColor,
          minimumSize: const Size(20, 20),
          padding: const EdgeInsetsDirectional.fromSTEB(10, 1, 10, 2),
          shape: const StadiumBorder(),
        ),
        child: Text(text ?? ''),
      ),
    );
  }

  Widget _renderTop() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // tags
          if (state?.selectTags != null &&
              state!.selectTags!.isNotEmpty &&
              widget.showTag)
            _renderTags(),
          _builderWhereRow(),
          if (state?.canAddTags ?? false)
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 6.0, bottom: 8),
              child: _builderTagSection(),
            ),
        ],
      ),
    );
  }

  Widget _builderTagSection() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTagSelect,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTag(),
          const Spacer(),
          R.img("icon_next.svg",
              width: 16,
              height: 16,
              color: R.colors.thirdTextColor,
              package: ComponentManager.MANAGER_BASE_CORE)
        ],
      ),
    );
  }

  /// 在哪 @ta 公开
  Widget _builderWhereRow() {
    final atColor = R.colors.mainTextColor.withOpacity(0.7);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 6.0, bottom: 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  child: _buildLocation(),
                ),
                const SizedBox(width: 2),
                GestureDetector(
                  onTap: _onATTaped,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, //自适应到最小
                      children: <Widget>[
                        R.img(
                          'moment_at_icon.svg',
                          width: 11,
                          height: 11,
                          color: atColor,
                          package: ComponentManager.MANAGER_MOMENT,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          K.moment_at_him,
                          style: TextStyle(color: atColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.showGroupSelect) _buildGroupSelect(),
        ],
      ),
    );
  }

  /// 底部三个按钮
  Widget _renderBottomPanel() {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Divider(
              height: 1,
              color: R.colors.dividerColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
              child: Row(
                children: <Widget>[
                  PublishBottomButton(
                    icon: darkMode
                        ? 'ic_publish_image_dark.png'
                        : 'ic_publish_image.png',
                    iconSize: 34,
                    onTap: () => _onSelectImageTaped(),
                  ),
                  PublishBottomButton(
                    icon: darkMode
                        ? 'ic_publish_video_dark.png'
                        : 'ic_publish_video.png',
                    iconSize: 34,
                    onTap: () => _onSelectVideoTaped(),
                  ),
                  PublishBottomButton(
                    icon: darkMode
                        ? 'ic_publish_audio_dark.png'
                        : 'ic_publish_audio.png',
                    iconSize: 34,
                    onTap: () => _onAudioTaped(),
                    selected: _extend == _Extend.Audio,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 底部展开窗口
  Widget _renderExtendPanel() {
    IMomentManager momentManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    switch (_extend) {
      case _Extend.Audio:
        return RecorderPanel(
          onCompleted: _onRecordComplete,
          isRecording: state!.isRecording,
          progressColor:
              momentManager.themeConfig.audioProgressColor ?? Colors.red,
        );
      default:
        return Container(height: 0);
    }
  }

  /// 位置选择
  Widget _buildLocation() {
    if (state?.selectLocation == null) return const SizedBox.shrink();
    return TagItem(
      supportDark: true,
      tag: state!.selectLocation ?? K.moment_location,
      bgColors: R.colors.tagGradientColors,
      textStyle: state!.isLocationSelect()
          ? TextStyle(
              color: R.colors.tagTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: Util.fontFamily,
            )
          : TextStyle(
              color: R.colors.tagTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: Util.fontFamily,
            ),
      icon: 'ic_location.svg',
      leading: 8,
      iconColor: R.colors.tagTextColor,
      iconUseTextColor: true,
      onDeleteTap: state!.isLocationSelect() ? _onClearLocation : null,
    );
  }

  /// 已选中的标签
  Widget _renderTags() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 8,
        children: state!.selectTags!.map((item) {
          bool canDeleteTag = false;
          if (state!.unDeleteTags != null) {
            if (state!.unDeleteTags!.contains(item)) {
              canDeleteTag = true;
            }
          }
          return TagItem(
            tag: item,
            supportDark: true,
            bgColors: R.colors.tagGradientColors,
            textStyle: TextStyle(
              color: R.colors.tagTextColor,
              fontSize: 13,
              fontFamily: Util.fontFamily,
            ),
            iconUseTextColor: true,
            onDeleteTap: canDeleteTag ? null : () => _onDeleteSelectTag(item),
          );
        }).toList(),
      ),
    );
  }

  /// 标签入口
  Widget _buildTag() {
    if (!state!.canAddTags) {
      return Container(
        width: 8.0,
      );
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 0.0),
      child: TagItem(
        supportDark: true,
        tag: K.moment_add_title,
        bgColors: R.colors.tagGradientColors,
        textStyle: TextStyle(
          fontSize: 13,
          color: R.colors.mainTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: Util.fontFamily,
        ),
        leading: 8,
        onTap: _onTagSelect,
      ),
    );
  }

  /// 分组选择
  Widget _buildGroupSelect() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onGroupSelect,
      child: Container(
        height: 32,
        padding: const EdgeInsetsDirectional.only(start: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              state?.selectGroup.title ?? '',
              style: TextStyle(color: R.colors.secondTextColor, fontSize: 13),
            ),
            R.img(
              isShowGroupSelectMenu
                  ? BaseAssets.ic_expand_up_svg
                  : BaseAssets.ic_expand_down_svg,
              width: 16,
              height: 16,
              color: R.colors.thirdTextColor,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ],
        ),
      ),
    );
  }

  _onClearLocation() {
    if (!_canTaped()) {
      return;
    }
    setState(() {
      state?.selectLocation = null;
    });
  }

  _onGroupSelect() async {
    if (!_canTaped()) {
      return;
    }

    double bottom = 44.0 +
        24 +
        16 +
        8; // BottomPanel高度 + top高度 + top paddingBottom + top paddingtop
    double menuHeight = 3.0 * 48 + 2 * 8; // 3个菜单项（3x48),垂直padding（2x8）
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    if (keyboard > 0) {
      bottom += keyboard;
    } else if (_extend == _Extend.Audio) {
      bottom += 216.0;
      if (Util.isIphoneX) {
        bottom += 34.0;
      }
    } else if (Util.isIphoneX) {
      bottom += 34.0;
    }

    isShowGroupSelectMenu = true;
    GroupItem? select = await GroupSelectScreen.showGroupSelectMenu(
        context, Util.height - bottom - menuHeight,
        select: state?.selectGroup);
    if (select != null && state!.selectGroup.id != select.id) {
      Config.set('moment.group.selected.id', select.id);
      setState(() {
        state?.selectGroup = select;
        isShowGroupSelectMenu = false;
      });
    } else {
      setState(() {
        isShowGroupSelectMenu = false;
      });
    }
  }

  _onRecommendTagSelect(String tag) {
    if (!_canTaped()) {
      return;
    }

    if (state?.selectPlayTags.value != null) {
      Fluttertoast.showToast(
          msg: K.moment_tag_tips, gravity: ToastGravity.CENTER);
      return;
    }
    String errMsg = "";
    int maxTagNum = 1;
    if (state?.selectPlayTags.value != null) {
      errMsg = K.moment_tag_tips;
    }
    if (state?.selectTags != null) {
      if (state!.selectTags!.contains(tag)) {
        errMsg = K.moment_tag_already_add;
      } else if (state!.selectTags!.length >= maxTagNum) {
        errMsg = K.moment_add_tag_max_num(['$maxTagNum']);
      }
    }

    if (errMsg.isNotEmpty) {
      Fluttertoast.showToast(msg: errMsg, gravity: ToastGravity.CENTER);
      return;
    } else {
      setState(() {
        state?.selectTags = [tag];
      });
    }
  }

  // 标签选择
  _onTagSelect() async {
    if (!_canTaped()) {
      return;
    }

    if (state?.selectPlayTags.value != null) {
      Fluttertoast.showToast(
          msg: K.moment_tag_tips, gravity: ToastGravity.CENTER);
      return;
    }
    // 1.0.7只维护一个标签
    List<String>? tags = await TagSelectScreen.openTagSelectScreen(context,
        model: state!,
        text: '',
        from: widget.from,
        selectTag: widget.selectTag,
        maxTagNum: 1,
        verifyType: widget.verifyType);
    if (tags != null && tags.isNotEmpty) {
      Log.d(tags.toString());
      setState(() {
        state?.selectTags = tags;
      });
    }
  }

  _onSelectImageTaped() async {
    if (!_canTaped()) {
      return;
    }
    if (state?.status == PageStatus.Video ||
        state?.status == PageStatus.Audio) {
      Fluttertoast.showToast(
          msg: K.moment_publish_only_one_kind_type,
          gravity: ToastGravity.CENTER);
      return;
    }
    if (state?.selectImageNum == 9) {
      Fluttertoast.showToast(
          msg: K.moment_publish_image_limit, gravity: ToastGravity.CENTER);
      return;
    }
    _closeExtend();

    FocusScope.of(context).requestFocus(FocusNode());
    List<File>? imgList = await MomentUtils.pickImage(context,
        maxSelected: 9 - (state?.selectImageNum ?? 0));

    if (imgList == null) {
      if (widget.onImagesSelected != null) {
        widget.onImagesSelected!(null);
      }
    } else {
      if (widget.onImagesSelected != null) {
        widget.onImagesSelected!(imgList);
      }
    }
  }

  _onSelectVideoTaped() async {
    if (!_canTaped()) {
      return;
    }
    if (state?.status == PageStatus.Image ||
        state?.status == PageStatus.Audio) {
      Fluttertoast.showToast(
          msg: K.moment_publish_only_one_kind_type,
          gravity: ToastGravity.CENTER);
      return;
    }

    _closeExtend();
    FocusScope.of(context).requestFocus(FocusNode());

    File? video = await ImagePicker.pickVideo(source: ImageSource.gallery);

    if (video == null) {
      return;
    }

    if (widget.onVideoSelected != null) {
      widget.onVideoSelected!(video);
    }
  }

  _onAudioTaped() {
    if (!_canTaped()) {
      return;
    }
    if (state?.status == PageStatus.Image ||
        state?.status == PageStatus.Video) {
      Fluttertoast.showToast(
          msg: K.moment_publish_only_one_kind_type,
          gravity: ToastGravity.CENTER);
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());
    if (_extend == _Extend.Audio) {
      _closeExtend();
      return;
    }

    setState(() {
      _extend = _Extend.Audio;
    });
  }

  void _closeExtend() async {
    if (_extend != _Extend.None) {
      if (mounted) {
        setState(() {
          _extend = _Extend.None;
        });
      }
    }
  }

  void _onRecordComplete(String localFile, int tmpDuration) {
    if (widget.onAudioConfirm != null) {
      widget.onAudioConfirm!(localFile, tmpDuration);
    }
    _closeExtend();
  }

  bool _canTaped() {
    if (state != null && state!.isRecording.value) {
      Fluttertoast.showToast(
          msg: K.moment_recording, gravity: ToastGravity.CENTER);
      return false;
    } else {
      return true;
    }
  }
}

enum _Extend {
  None,
  Image,
  Audio,
  Video,
}
