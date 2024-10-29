import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:shared/shared.dart' hide TagItem;
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/publish_at_bean.dart';
import 'package:moment/src/page/tag_select_screen.dart';
import 'package:moment/src/widget/at_cupertino_text_selection_controls.dart';
import 'package:moment/src/widget/drag_sort_view.dart';
import 'package:moment/src/widget/moment_publish_bottom.dart';
import 'package:video_compress/video_compress.dart';

import 'at_list_screen.dart';
import 'package:provider/provider.dart' hide Selector;

/// 发表动态screen
class MomentPublishScreen extends StatefulWidget {
  final bool showGroupSelect; // 展现分组
  final bool showPlaySelect; // 展现约玩
  final CaseTag? caseTag;
  final AppraiserTag? appraiserTag;
  final bool isTwoStep;
  final String? selectTag;
  final String? from; // 上一级界面
  final int maxTagNum;
  final List<File>? initImages;
  final File? initVideo;
  final bool needNotify;
  final int? musicId;
  final Map<String, String>? musicVideoParams;

  static Future<Moment?> openMomentPublishScreen(
    BuildContext context, {
    Key? key,
    bool showGroupSelect = false,
    bool showPlaySelect = false,
    bool isTwoStep = false,
    CaseTag? caseTag,
    AppraiserTag? appraiserTag,
    String? tag,
    String? from,
    int maxTagNum = 3,
    List<File>? initImages,
    File? initVideo,
    bool needNotify = false,
    int? musicId,
    Map<String, String>? musicVideoParams,
  }) {
    return Navigator.of(context).push(
      DisappearBottomRoute(
        builder: (context) {
          return MomentPublishScreen(
            key: key,
            showGroupSelect: showGroupSelect,
            showPlaySelect: showPlaySelect,
            caseTag: caseTag,
            appraiserTag: appraiserTag,
            isTwoStep: isTwoStep,
            selectTag: tag,
            from: from,
            maxTagNum: maxTagNum,
            initImages: initImages,
            initVideo: initVideo,
            needNotify: needNotify,
            musicId: musicId,
            musicVideoParams: musicVideoParams,
          );
        },
        settings: const RouteSettings(name: '/MomentPublishScreen'),
      ),
    );
  }

  const MomentPublishScreen({
    super.key,
    this.showGroupSelect = false,
    this.showPlaySelect = false,
    this.caseTag,
    this.appraiserTag,
    this.isTwoStep = false,
    this.selectTag,
    this.from,
    this.maxTagNum = 3,
    this.initImages,
    this.initVideo,
    this.needNotify = false,
    this.musicId,
    this.musicVideoParams,
  });

  @override
  _MomentPublishScreenState createState() => _MomentPublishScreenState();
}

class _MomentPublishScreenState extends State<MomentPublishScreen>
    implements IPublishView {
  static double imageSize = 99;
  final DialogLoadingController _controller = DialogLoadingController();

  final GlobalKey<PublishBottomState> _inputKey =
      GlobalKey<PublishBottomState>();
  late FocusNode _focusNode;
  late TextEditingController _textController;
  late AtCupertinoTextSelectionControls _selectionControls;
  final _textSpanBuilder = ATSpecialTextSpanBuilder();

  late PublishPresenter mPresenter;
  late PublishMomentModel model;

  List<String> _recommendTags = [];
  bool _isCircleWhiteList = false;
  int _verifyType = 0;

  // 是否@白名单用户，可以@好友、关注、粉丝
  bool _isCircleAtAccountWhiteList = false;
  bool _loading = true;
  String? _errorMessage;
  List<PublishATBean> _atBeans = [];
  List<PublishATBean> _atCopys = [];
  TextSelection? _textSelection;

  @override
  void initState() {
    super.initState();
    _textSpanBuilder.atTextAttach = () => _atBeans + _atCopys;
    _textSpanBuilder.updateATTextAttach =
        (List<ATTextRange> atTextAttach) => _atBeans = List.from(atTextAttach);
    _textSpanBuilder.atTextStyle = TextStyle(
        color: const Color(0xFF375E8B),
        fontSize: 16,
        fontFamily: Util.fontFamily);
    _selectionControls = AtCupertinoTextSelectionControls(
        shouldPast: shouldPastText, copyText: copyText);
    _initTags();

    imageSize = (Util.width - 40 - 2 * 10) / 3 - 8;
    model = PublishMomentModel(status: PageStatus.None);
    mPresenter = PublishPresenter(context, model, this,
        from: widget.from,
        fromTag: widget.selectTag,
        getATBeans: () => _atBeans,
        needNotify: widget.needNotify,
        isCircleWhiteList: _isCircleWhiteList,
        compressVideoBeforePublish: true,
        needCompress:
            widget.musicVideoParams == null || widget.musicVideoParams!.isEmpty,
        verifyType: _verifyType);
    mPresenter.initState();
    if (!Util.isCollectionEmpty(widget.initImages)) {
      mPresenter.onImagesSelected(widget.initImages!);
    }

    if (widget.initVideo != null) {
      mPresenter.onVideoSelected(widget.initVideo!);
    }

    if (widget.caseTag?.tag != null) {
      model.selectTags = [(widget.caseTag!.tag!)];
      model.unDeleteTags = [(widget.caseTag!.tag!)];
      model.canAddTags = false;
      model.caseTag = widget.caseTag;
    }

    if (widget.appraiserTag?.tag != null) {
      model.selectTags = [(widget.appraiserTag!.tag!)];
      model.unDeleteTags = [(widget.appraiserTag!.tag!)];
      model.canAddTags = false;
      model.appraiserTag = widget.appraiserTag;
    }

    if (widget.selectTag != null) {
      model.selectTags = [(widget.selectTag!)];
    }

    if (widget.musicVideoParams != null) {
      model.musicVideoParams = widget.musicVideoParams;
    }

    if (Util.parseInt(widget.musicId) > 0) {
      model.musicId = widget.musicId;
    }

    _textController = TextEditingController(text: '');
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);

    if (widget.from != null) {
      Map<String, dynamic> properties = {'from': widget.from};
      if (widget.from == 'net') {
        properties['from_net'] = widget.selectTag;
      } else if (widget.from == 'topic') {
        properties['from_topic'] = widget.selectTag;
      }

      Tracker.instance.track(TrackEvent.send_moment, properties: properties);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
    mPresenter.dispose();
    super.dispose();
  }

  void _reload() {
    _errorMessage = null;
    _loading = true;
    if (mounted) setState(() {});
    _initTags();
  }

  /// 获取推荐话题
  _initTags() async {
    // 获取推荐话题
    DataRsp<TagDetail> response = await Api.getRecommendTagDetail();
    if (response.success == true) {
      _recommendTags = response.data!.tags;
      _isCircleWhiteList = response.data!.isCircleWhiteList;
      _verifyType = response.data!.needVerifyNew;
      mPresenter.updateVerifyType(_verifyType);
      _isCircleAtAccountWhiteList = response.data!.isCircleAtAccountWhiteList;
      mPresenter.onIsCircleWhiteList(_isCircleWhiteList);

      if (_recommendTags.length > 6)
        _recommendTags = _recommendTags.sublist(0, 6);
    } else {
      _errorMessage = response.msg;
    }
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  String get value {
    return _textController.value.text;
  }

  _onFocus() {
    if (_focusNode.hasFocus) {
      if (_inputKey.currentState != null) {
        _inputKey.currentState!.closePanel();
      }
    } else {
      _textSelection = _textController.value.selection.copyWith();
    }
  }

  void copyText(String copyText) {
    final atCopyList = _textSpanBuilder.getAtTextBeansFrom(copyText) ?? [];
    _atCopys = List.from(atCopyList);
  }

  bool shouldPastText(String pastText) {
    final atList = _atCopys;
    if (atList.isEmpty) return true;
    if (_atBeans.length + atList.length > 10) {
      Fluttertoast.showToast(
          msg: K.moment_add_at_max_num(['10']), gravity: ToastGravity.CENTER);
      return false;
    } else {
      _atBeans.addAll(List.from(atList));
      return true;
    }
  }

  void insertATBeans(List<PublishATBean> atBeans) {
    _atBeans.addAll(atBeans);
    if (_atBeans.isEmpty) return;

    final text = atBeans
        .map((e) => e.atNameString())
        .toList()
        .reduce((value, element) => value + element);
    final TextEditingValue value = _textController.value;
    final int start = value.selection.baseOffset;
    int end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = '';
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
        end = start;
      }
      _textController.value = value.copyWith(
          text: newText,
          selection: value.selection.copyWith(
              baseOffset: end + text.length, extentOffset: end + text.length));
    } else if (!_focusNode.hasFocus && _textSelection != null) {
      TextSelection textSelection = _textSelection!;
      String newText =
          value.text.replaceRange(textSelection.start, textSelection.end, text);
      final textLength = text.length;
      _textController.value = value.copyWith(
          text: newText,
          selection: textSelection.copyWith(
            baseOffset: textSelection.start + textLength,
            extentOffset: textSelection.start + textLength,
          ));
    } else {
      final allText = value.text + text;
      _textController.value = TextEditingValue(
          text: allText,
          selection:
              TextSelection.fromPosition(TextPosition(offset: allText.length)));
    }
  }

  _onInputAt() async {
    List<PublishATBean>? atList = await ATListScreen.openAddATScreen(context,
        maxATNum: 10 - _atBeans.length,
        isCircleAtAccountWhiteList: _isCircleAtAccountWhiteList);
    if (atList != null && atList.isNotEmpty) {
      const replaceAt = '';
      TextSelection textSelection = _textSelection!;
      final TextEditingValue value = _textController.value;
      String newText = value.text
          .replaceRange(textSelection.end - 1, textSelection.end, replaceAt);
      const textLength = replaceAt.length;
      _textSelection = textSelection.copyWith(
        baseOffset: textSelection.end - 1 + textLength,
        extentOffset: textSelection.end - 1 + textLength,
      );
      _textController.value =
          value.copyWith(text: newText, selection: _textSelection);
      insertATBeans(atList);
    } else {
      final value = _textController.value;
      _textController.value =
          value.copyWith(text: value.text, selection: _textSelection);
    }
  }

  _onTextChange(String value) {
    final endIndex = _textController.selection.extentOffset;
    if (endIndex <= 0) return;
    final lastSelect = value.substring(endIndex - 1, endIndex);
    if (lastSelect == '@') {
      _onInputAt();
    }
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  _onNextTaped() async {
    if ((model.status == PageStatus.None ||
            PageStatus.TextOnly == model.status) &&
        value.isEmpty) {
      Fluttertoast.showToast(
          msg: K.moment_publish_content_empty, gravity: ToastGravity.CENTER);
      return;
    }

    if (mPresenter.canTaped()) {
      Moment? moment = await TagSelectScreen.openTagSelectScreen(context,
          model: model,
          text: value,
          from: widget.from,
          selectTag: widget.selectTag,
          publish: true,
          getATBeans: () => _atBeans,
          maxTagNum: 1,
          verifyType: _verifyType);
      if (moment != null) {
        if (widget.needNotify == true) {
          MomentModel momentModel =
              Provider.of<MomentModel>(context, listen: false);
          momentModel.notify();
        }
        Navigator.of(context).pop(moment);
      }
    }
  }

  Future<bool> _exit() async {
    if (mPresenter.canTaped()) {
      bool? result = true;
      if ((model.status != PageStatus.None || value.isNotEmpty)) {
        result = await showDialog(
          context: context,
          builder: (context) => ConfirmDialog(
            title: K.moment_exit_tips,
            positiveButton: PositiveButton(text: K.moment_exit_ensure),
          ),
        );
      }
      if (result == true) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MomentPublishStateContainer(
      state: model,
      child: WillPopScope(
        onWillPop: _exit,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: BaseAppBar.custom(
            statusBrightness: darkMode ? Brightness.dark : Brightness.light,
            backgroundColor: Colors.transparent,
            backColor: R.colors.mainTextColor,
            leading: NavigatorClose(
              onTap: () async {
                bool shouldExit = await _exit();
                if (shouldExit) {
                  Navigator.of(context).pop(null);
                }
              },
              iconColor: R.colors.mainTextColor,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: Row(
                  children: <Widget>[
                    if (widget.isTwoStep) _buildNexStep() else _buildPublish(),
                  ],
                ),
              ),
            ],
          ),
          body: _buildBody(),
        ).withCommonBg(),
      ),
    );
  }

  Widget _buildPublish() {
    return GradientButton(
      K.moment_publish,
      onTap: () => mPresenter.onPublishTaped(),
      textStyle: TextStyle(
          color: R.colors.brightTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 13),
      colors: R.colors.mainBrandGradientColors,
      height: 32,
      width: 58,
    );
  }

  Widget _buildNexStep() {
    return GradientButton(
      K.moment_publish_next,
      onTap: _onNextTaped,
      textStyle: TextStyle(
          color: R.colors.brightTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 13),
      colors: R.colors.mainBrandGradientColors,
      height: 32,
      width: 58,
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null && _errorMessage!.isNotEmpty) {
      return ErrorData(
        error: _errorMessage,
        onTap: _reload,
        fontColor: R.colors.secondTextColor,
      );
    }

    if (Util.parseInt(widget.musicId) > 0) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputWidget(),
          ],
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildContent(),
        _buildFooter(),
      ],
    );
  }

  Widget _buildContent() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        const SizedBox(height: 25),
        _buildGameTagInfo(),
        Padding(
          padding:
              const EdgeInsetsDirectional.only(bottom: 140, start: 20, end: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildInputWidget(),
              if (model.status == PageStatus.None ||
                  model.status == PageStatus.Image ||
                  model.status == PageStatus.TextOnly)
                _buildImageSelect(),
              if (model.status == PageStatus.Audio) _buildAudio(),
              if (model.status == PageStatus.Video) _buildVideo(),
            ],
          ),
        ),
      ],
    );
  }

  /// 约玩标签
  Widget _buildGameTagInfo() {
    SelectGame? selectGame = model.selectPlayTags.value;
    if (selectGame == null || selectGame.game == null) {
      return const SizedBox(width: 0, height: 0);
    }

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 13),
      child: Text(
        '【 ${selectGame.displayTag} 】',
        style: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInputWidget() {
    final textColor = R.colors.mainTextColor;
    return Container(
      padding: const EdgeInsetsDirectional.only(bottom: 38),
      child: ExtendedTextField(
        selectionControls: _selectionControls,
        specialTextSpanBuilder: _textSpanBuilder,
        cursorColor: R.colors.mainBrandColor,
        onAppPrivateCommand: (String action, Map map) {},
        scrollPadding: EdgeInsets.zero,
        enabled: !model.isRecording.value,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: textColor, fontSize: 16, fontFamily: Util.fontFamily),
        focusNode: _focusNode,
        controller: _textController,
        onChanged: _onTextChange,
        autofocus: true,
        minLines: 1,
        maxLines: null,
        inputFormatters: [LengthLimitingTextInputFormatter(1000)],
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: _hintText,
          hintStyle: TextStyle(
              color: R.colors.thirdTextColor,
              fontSize: 16,
              fontFamily: Util.fontFamily),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  String get _hintText {
    if (widget.caseTag != null) {
      return K.moment_case_push_to_commit;
    } else if (Util.parseInt(widget.musicId) > 0) {
      return K.moment_good_voice_hint_text;
    } else {
      return K.moment_record_now;
    }
  }

  /// 底部
  Widget _buildFooter() {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    return PositionedDirectional(
      bottom: 0,
      start: 0,
      end: 0,
      child: Container(
        padding: EdgeInsets.only(
            bottom: (keyboard <= 0.0 && Util.isIphoneX) ? 34.0 : 0.0),
        child: PublishBottom(
          key: _inputKey,
          onImagesSelected: (files) => mPresenter.onImagesSelected(files),
          onAtFriendUpdate: (atBeans) => insertATBeans(atBeans),
          onVideoSelected: (videoFile) => mPresenter.onVideoSelected(videoFile),
          onAudioConfirm: (String result, int duration) =>
              mPresenter.onAudioConfirm(result, duration),
          showGroupSelect: widget.showGroupSelect,
          showPlaySelect: widget.showPlaySelect,
          showTag: !widget.isTwoStep,
          from: widget.from,
          selectTag: widget.selectTag,
          recommendTags: _recommendTags,
          atBeansCount: () => _atBeans.length,
          isCircleAtAccountWhiteList: _isCircleAtAccountWhiteList,
        ),
      ),
    );
  }

  Widget _buildImageSelect() {
    double containerWidth = imageSize + 12;

    return DragSortView(
      model.selectImageFiles,
      space: 0,
      width: Util.width - 40,
      itemBuilder: (BuildContext context, int index) {
        DragImageBean bean = model.selectImageFiles[index];
        return _buildImage(bean.file!, index);
      },
      initBuilder: (BuildContext context) {
        return GestureDetector(
          onTap: () => mPresenter.onSelectIconTaped(),
          child: Container(
            width: containerWidth,
            height: containerWidth,
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              decoration: BoxDecoration(
                  color: R.colors.secondTextColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(6)),
              child: R.img(
                'ic_add.svg',
                width: imageSize,
                height: imageSize,
                color: R.colors.mainTextColor,
                package: ComponentManager.MANAGER_MOMENT,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage(File image, int index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.file(
            image,
            fit: BoxFit.cover,
            width: imageSize,
            height: imageSize,
            cacheWidth: (imageSize * window.devicePixelRatio).round(),
          ),
        ),
        PositionedDirectional(
          end: 0,
          top: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => mPresenter.onDeleteImageTaped(image, index),
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 10, start: 10, top: 2, end: 2),
              alignment: AlignmentDirectional.topEnd,
              child: R.img(
                'ic_close_pic.svg',
                width: 20,
                height: 20,
                package: ComponentManager.MANAGER_MOMENT,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAudio() {
    return Row(
      children: <Widget>[
        AudioMoment(
          audioPath: AudioPath.Local,
          audioUrl: model.audioLocalFile!,
          duration: model.audioDuration,
          isLocal: true,
        ),
        IconButton(
          onPressed: () => _deleteAudio(),
          icon: Icon(Icons.close, size: 12, color: R.colors.secondTextColor),
        ),
      ],
    );
  }

  Widget _buildVideo() {
    return Row(
      children: <Widget>[
        MomentSingleImageWidget(
          url: model.videoImagePath ?? '',
          isVideo: true,
          onTap: () => _onVideoTaped(model.videoFile!),
          fromFile: true,
        ),
        IconButton(
          onPressed: () => _deleteVideo(),
          icon: Icon(Icons.close, size: 12, color: R.colors.secondTextColor),
        ),
      ],
    );
  }

  _onVideoTaped(File videoFile) async {
    IVideoManager videoManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIDEO);
    bool? result = await videoManager.playVideoFromFile(context, videoFile);
    if (result != null && result) {
      _deleteVideo();
    }
  }

  _deleteAudio() {
    model.audioLocalFile = null;
    model.audioDuration = 0;
    if (value.isNotEmpty) {
      model.status = PageStatus.TextOnly;
    } else {
      model.status = PageStatus.None;
    }
    _refresh();
  }

  _deleteVideo() {
    model.videoFile = null;
    if (value.isNotEmpty) {
      model.status = PageStatus.TextOnly;
    } else {
      model.status = PageStatus.None;
    }
    _refresh();
  }

  @override
  void dismissLoading() {
    _controller.close();
  }

  @override
  onRefresh() {
    if (mounted) setState(() {});
  }

  @override
  void showLoading({String? message, bool canPop = false}) {
    _controller.show(
        context: context,
        message: message ?? K.moment_uploading,
        canPop: canPop);
  }

  @override
  String getInputValue() {
    return value;
  }
}

abstract class IPublishView {
  void onRefresh();

  void showLoading({String message, bool canPop = false});

  void dismissLoading();

  String getInputValue();
}

typedef GetATBeans = List<PublishATBean> Function();

class PublishPresenter {
  final IPublishView view;
  final BuildContext context;
  final PublishMomentModel model;
  final String? from;
  final String? fromTag;
  final GetATBeans? getATBeans;

  VoidCallback? listener;

  bool _publishing = false;

  bool needNotify = false;

  bool isCircleWhiteList = false;

  bool compressVideoBeforePublish = true; //默认发布前会先压缩视频，嗨歌改成只在发布时才压缩视频

  bool needCompress = true; //从录唱过来的发布，才不需要压缩

  int momentBefore = 0;

  int verifyType = 0;

  PublishPresenter(this.context, this.model, this.view,
      {this.from,
      this.fromTag,
      required this.getATBeans,
      this.needNotify = false,
      this.isCircleWhiteList = false,
      this.compressVideoBeforePublish = true,
      this.needCompress = true,
      this.verifyType = 0});

  void initState() {
    listener = () {
      Log.d('value change : ${model.isRecording.value}');
      view.onRefresh();
    };
    model.isRecording.addListener(listener!);
    model.selectPlayTags.addListener(listener!);
  }

  void dispose() {
    if (listener != null) {
      model.isRecording.removeListener(listener!);
      model.selectPlayTags.removeListener(listener!);
    }
  }

  void updateVerifyType(int verifyType) {
    this.verifyType = verifyType;
  }

  String get value {
    String inputStr = view.getInputValue();
    if (Util.parseInt(model.musicId) > 0) {
      if (Util.isStringEmpty(inputStr)) {
        return K.moment_good_voice_hint_text;
      } else {
        return inputStr;
      }
    } else {
      return inputStr;
    }
  }

  String get textContent {
    if (getATBeans == null) return '';
    String text = value;
    for (var e in getATBeans!().reversed) {
      final textRange = e.textRange;
      text = text.replaceRange(textRange?.start ?? 0, textRange?.end, '');
    }
    text = text.trim();
    return text;
  }

  String get atuids {
    if (getATBeans == null) return '';
    final atuids = getATBeans!().isEmpty
        ? ''
        : json.encode(getATBeans!().map((e) => e.toJson()).toList());
    return atuids;
  }

  bool canTaped() {
    if (model.isRecording.value) {
      Fluttertoast.showToast(
          msg: K.moment_recording, gravity: ToastGravity.CENTER);
      return false;
    } else {
      return true;
    }
  }

  void onPublishTaped() async {
    if (!canTaped()) {
      return;
    }

    if (_publishing) {
      Fluttertoast.showToast(
          msg: K.moment_uploading, gravity: ToastGravity.CENTER);
      return;
    }

    bool hasSensitiveWords = trie.search(view.getInputValue());
    if (hasSensitiveWords) {
      Fluttertoast.showToast(
          msg: K.sensitive_words_warning, gravity: ToastGravity.CENTER);
      return;
    }

    bool verified = await _checkVerify(context, verifyType) ?? false;
    if (!verified) {
      return;
    }

    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    MomentThemeConfig theme = manager.themeConfig;

    switch (model.status) {
      case PageStatus.None:
      case PageStatus.TextOnly:
        if (value.isEmpty) {
          Fluttertoast.showToast(
              msg: K.moment_publish_content_empty,
              gravity: ToastGravity.CENTER);
        } else {
          bool connected = await isNetWorkConnected();
          if (connected) {
            view.showLoading();
            _postMoment('text', textContent, atuids: atuids);
          }
        }
        break;
      case PageStatus.Image:
        bool connected = await isNetWorkConnected();
        if (connected) {
          if (theme.sendMomentMustWithText && value.isEmpty) {
            Fluttertoast.showToast(
                msg: K.moment_send_no_text, gravity: ToastGravity.CENTER);
          } else {
            _uploadImages(model.selectImageFiles);
          }
        }
        break;
      case PageStatus.Video:
        bool connected = await isNetWorkConnected();
        if (connected) {
          if (theme.sendMomentMustWithText && value.isEmpty) {
            Fluttertoast.showToast(
                msg: K.moment_send_no_text, gravity: ToastGravity.CENTER);
          } else {
            _uploadVideo(model.videoFile!);
          }
        }
        break;
      case PageStatus.Audio:
        bool connected = await isNetWorkConnected();
        if (connected) {
          if (theme.sendMomentMustWithText && value.isEmpty) {
            Fluttertoast.showToast(
                msg: K.moment_send_no_text, gravity: ToastGravity.CENTER);
          } else {
            _uploadAudio(model.audioLocalFile!);
          }
        }
        break;
    }
  }

  Future<bool?> _checkVerify(BuildContext context, int verifyTypeNew) async {
    if (Utility.isNeedVerify(0, verifyTypeNew)) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool? res = await loginManager.openAuthDialog(context,
          type: 0, newType: verifyTypeNew, refer: 'moment_publish');
      Log.d("_checkVerify,result:$res");
      return res ?? false;
    } else {
      Log.d("_checkVerify,no need to verify");
      return true;
    }
  }

  Future<bool> isNetWorkConnected() async {
    bool connected = await Util.isNetworkConnected();
    if (!connected) {
      Fluttertoast.showToast(msg: K.moment_publish_check_net_state);
    }
    return connected;
  }

  /// 上传音频
  Future<bool> _uploadAudio(String localFile) async {
    Log.d('_uploadAudio localFile:$localFile');
    if (localFile.isEmpty) {
      Fluttertoast.showToast(msg: K.moment_voice_file_not_found);
      return false;
    }

    view.showLoading();
    String audioBase64 = '';
    bool result = true;
    try {
      File imageFile = File(localFile);
      List<int> fileBytes = imageFile.readAsBytesSync();
      audioBase64 = base64.encode(fileBytes);
      DataRsp<UploadAudioBean> response = await Api.uploadAudio(audioBase64);
      if (response.success == true && response.data != null) {
        result = await _postMoment('audio', textContent,
            audio: response.data!.audio!, atuids: atuids);
      } else {
        Fluttertoast.showToast(msg: response.msg ?? K.post_moment_failed);
        view.dismissLoading();
        _publishing = false;
        return result;
      }
    } catch (e) {
      result = false;
      Log.d(e.toString());
      Fluttertoast.showToast(msg: K.post_moment_failed);
      view.dismissLoading();
    }

    _publishing = false;

    return result;
  }

  /// 上传图片
  _uploadImages(List<DragImageBean> images) async {
    view.showLoading();
    List<String>? resultUrl =
        await MomentUtils.uploadImages(context, images: images);
    if (resultUrl != null && resultUrl.isNotEmpty) {
      await _postMoment('picture', textContent,
          picture: resultUrl, atuids: atuids);
    } else {
      view.dismissLoading();
      Fluttertoast.showToast(msg: K.moment_upload_image_failed);
      _publishing = false;
      view.onRefresh();
    }
  }

  /// 上传视频
  _uploadVideo(File video) async {
    File? uploadFile;

    momentBefore = DateTime.now().millisecondsSinceEpoch;

    ///默认选中视频时就先压缩视频，嗨歌只在发布时才压缩
    if (!compressVideoBeforePublish) {
      uploadFile = await _compressVideo(video);
    } else {
      uploadFile = video;
    }
    if (uploadFile != null) {
      view.showLoading();
      Map? data = await MomentUtils.uploadVideo(context, uploadFile);
      Log.d('Upload video with data: $data');
      if (data != null) {
        bool result = await _postMoment('video', textContent,
            video: data['video'], cover: data['cover'], atuids: atuids);
        if (result) {
          //只有视频文件上传成功才删除 压缩的缓存文件，防止上传失败时重新发布找不到文件
          await VideoCompress.deleteAllCache();
        }
      } else {
        view.dismissLoading();
        _publishing = false;
        view.onRefresh();
      }
    }
  }

  Future<bool> _postMoment(String type, String content,
      {List<String>? picture,
      String? video,
      String? audio,
      String? cover,
      String atuids = ''}) async {
    _publishing = true;

    DataRsp<Moment> response = await Api.postMoment(
      type,
      Session.uid,
      content,
      picture: picture,
      audio: audio,
      video: video,
      cover: cover,
      location: model.selectLocation,
      latitude: model.latitude,
      longitude: model.longitude,
      auth: from == "globalMoment" ? "public" : model.selectGroup.authType,
      tags: model.selectTags,
      gameTag: model.selectPlayTags.value,
      caseTag: model.caseTag,
      appraiserTag: model.appraiserTag,
      atuids: atuids,
      isBroadcast: from == "globalMoment",
      musicId: model.musicId,
      musicVideoParams: model.musicVideoParams,
    );
    view.dismissLoading();

    if (model.musicVideoParams != null) {
      int momentAfter =
          ((DateTime.now().millisecondsSinceEpoch - momentBefore) / 1000)
              .floor();
      Tracker.instance.track(TrackEvent.studio_submit_work, properties: {
        'song_id': Util.parseInt(model.musicVideoParams?['song_id']),
        'moment_id': response.data?.topicId,
        'is_success': response.success == true && response.data != null,
        '#duration': momentAfter,
      });
    }

    _publishing = false;
    if (response.success == true && response.data != null) {
      Fluttertoast.showToast(msg: K.post_moment_success);
      Moment moment = response.data!;
      SelectGame? selectGame = model.selectPlayTags.value;
      Tracker.instance.track(TrackEvent.send_moment, properties: {
        'content': moment.content ?? '',
        'pic_num': moment.getMomentImages().length,
        'with_type': selectGame != null ? 'game' : 'topic',
        'moment_id': response.data!.topicId,
        'success_from': from,
        'media_type': _getMediaType(),
        'owner_uid': moment.uid,
        if (from == 'net') 'success_net': fromTag,
        if (from == 'topic') 'success_topic': fromTag,
        if (selectGame == null && model.selectTags != null)
          'topic_name': jsonEncode(model.selectTags),
        if (selectGame != null && selectGame.game != null)
          'game_name': selectGame.game!.name,
        if (selectGame != null && selectGame.srv != null)
          'game_district': selectGame.srv!.name,
        if (selectGame != null && selectGame.mode != null)
          'game_mode': selectGame.mode!.name,
        if (selectGame != null && selectGame.level != null)
          'game_hopes': selectGame.level!.name,
        if (model.caseTag != null && model.caseTag!.id > 0)
          'true_case_id': model.caseTag!.id,
      });

      if (needNotify == true) {
        MomentModel momentModel =
            Provider.of<MomentModel>(context, listen: false);
        momentModel.notify();
      }

      Navigator.of(context).pop(moment);

      if (from == "globalMoment") {
        //全局广播，消耗喊话卡
        eventCenter.emit(EventConstant.BagItemNumChanged);
      }
    } else {
      Fluttertoast.showToast(
          msg: response.msg ?? K.post_moment_failed,
          gravity: ToastGravity.CENTER);
      return false;
    }
    return true;
  }

  String _getMediaType() {
    switch (model.status) {
      case PageStatus.Image:
        return 'photo';
      case PageStatus.Video:
        return 'video';
      case PageStatus.Audio:
        return 'audio';
      case PageStatus.None:
      case PageStatus.TextOnly:
      default:
        return "";
    }
  }

  void _refresh() {
    view.onRefresh();
  }

  void onDeleteImageTaped(File image, int index) async {
    List<SheetItem> res = [];
    res.add(SheetItem(K.moment_delete, "delete"));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
              data: res, title: K.moment_move_image_tips, suppDarkTheme: true);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == "delete") {
      model.selectImageFiles.removeAt(index);
      if (model.selectImageFiles.isEmpty) {
        if (value.isNotEmpty) {
          model.status = PageStatus.TextOnly;
        } else {
          model.status = PageStatus.None;
        }
      }
    }

    view.onRefresh();
  }

  onSelectIconTaped() async {
    if (!canTaped()) {
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());

    if (model.status == PageStatus.None) {
      List<SheetItem> res = [];
      res.add(SheetItem(K.moment_image, "image", null));
      res.add(SheetItem(K.moment_video, "video", null));
      SheetCallback? result = await displayModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return RadioBottomSheet(data: res, suppDarkTheme: true);
          });
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }

      if (result.value?.key == "video") {
        File? video = await ImagePicker.pickVideo(source: ImageSource.gallery);
        onVideoSelected(video);
      } else {
        _onSelectImageTaped();
      }
    } else {
      _onSelectImageTaped();
    }
  }

  _onSelectImageTaped() async {
    int maxSelected = 9 - model.selectImageNum;
    FocusScope.of(context).requestFocus(FocusNode());

    List<File>? images =
        await MomentUtils.pickImage(context, maxSelected: maxSelected);
    onImagesSelected(images);
  }

  onImagesSelected(List<File>? files) {
    if (files != null && files.isNotEmpty) {
      model.status = PageStatus.Image;
      Set<String> prevSelectedPaths =
          model.selectImageFiles.map((e) => e.file!.path).toSet();
      for (File file in files) {
        if (!prevSelectedPaths.contains(file.path)) {
          model.selectImageFiles.add(DragImageBean(file: file));
        }
      }
      _refresh();
    }
  }

  onVideoSelected(File? videoFile) async {
    if (videoFile == null) {
      return;
    }

    try {
      MediaInfo? mediaInfo = await VideoCompress.getMediaInfo(videoFile.path);
    } catch (e) {
      Fluttertoast.showToast(msg: K.moment_video_error);
      return;
    }

    File? file;
    if (compressVideoBeforePublish) {
      file = await _compressVideo(videoFile);
      if (file == null) {
        return;
      }
    } else {
      file = videoFile;
    }
    try {
      model.videoFile = file;

      final File thumbnailFile = await VideoCompress.getFileThumbnail(
          videoFile.path,
          quality: 80,
          position: -1);
      Log.d('VideoCompress.getFileThumbnail $thumbnailFile');
      view.dismissLoading();
      model.videoImagePath = thumbnailFile.path;
      model.status = PageStatus.Video;
      _refresh();
    } catch (e) {}
  }

  _compressVideo(File videoFile) async {
    if (!needCompress) {
      return videoFile;
    }
    int origin = await videoFile.length();

    Log.d('origin upload video size ${origin / 1024}KB');
    view.showLoading(message: K.moment_video_compress);
    await Future.delayed(const Duration(milliseconds: 10));
    try {
      final MediaInfo? mediaInfo = await VideoCompress.compressVideo(
        videoFile.path,
        quality: isCircleWhiteList
            ? VideoQuality.HighestQuality
            : VideoQuality.MediumQuality,
        deleteOrigin: false,
        includeAudio: true,
      );
      if (mediaInfo == null) {
        Fluttertoast.showToast(msg: K.moment_video_compress_failed);
        view.dismissLoading();
        _refresh();
        return null;
      }
      Log.d('compress upload video size ${mediaInfo.filesize! / 1024}KB');
      Log.d(
          'compress upload video width: ${mediaInfo.width}, height: ${mediaInfo.height}');

      return mediaInfo.file;
    } catch (e) {
      Fluttertoast.showToast(msg: K.moment_video_compress_failed);
      view.dismissLoading();
      _refresh();
      return null;
    }
  }

  onAudioConfirm(String? result, int duration) {
    if (result == null || result.isEmpty) {
      return;
    }

    if (Platform.isIOS) {
      model.audioLocalFile = result.safeSubstring(7);
    } else if (Platform.isAndroid) {
      model.audioLocalFile = result;
    }
    model.status = PageStatus.Audio;
    model.audioDuration = duration;
    _refresh();
  }

  onIsCircleWhiteList(bool isWhiteList) {
    isCircleWhiteList = isWhiteList;
  }
}
