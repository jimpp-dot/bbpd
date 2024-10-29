import 'package:shared/shared.dart';
import 'package:chat/src/model/pbModel/generated/emoticon.pb.dart';
import 'package:chat/src/presenter/EmoticonPresenter.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';

typedef OnEmoticonSelected = Function(EmoticonSearchListItem image);

typedef OnEmoticonClosed = Function();

/// 聊天表情列表（输入框上方表情）

/// 本功能采用MVP编程模式实现，其中：
/// M：Emoticon（数据结构模型）、EmoticonRepo（数据逻辑模型）
/// V：EmoticonListView，表情UI
/// P：EmoticonPresenter，表情业务Presenter
class EmoticonListView extends StatefulWidget {
  /// 表情被选中的回调
  final OnEmoticonSelected? onEmoticonSelected;

  /// 关闭按钮点击回调
  final OnEmoticonClosed? onEmoticonClosed;

  /// 编辑框输入的关键字
  final String keyword;
  final EmoticonPresenter presenter;

  const EmoticonListView(
      {required this.keyword,
      required this.presenter,
      this.onEmoticonSelected,
      this.onEmoticonClosed,
      super.key});

  @override
  State<StatefulWidget> createState() {
    return _EmoticonListViewState();
  }
}

class _EmoticonListViewState extends State<EmoticonListView> {
  List<EmoticonSearchListItem>? _images;

  bool isSmallScreen = false;

  /// 表情图片的尺寸
  double get imageSize => isSmallScreen ? 48 : 64;

  /// 图片的Radius
  double get imageRadius => isSmallScreen ? 9 : 12;

  @override
  Widget build(BuildContext context) {
    isSmallScreen = EmoticonPresenter.isSmallScreen;
    Log.d('isSmallScreen: $isSmallScreen, height: ${Util.height}');
    if (_images == null || _images!.isEmpty == true) return Container();
    return Container(
      margin: EdgeInsetsDirectional.only(
          start: 0,
          top: 0,
          end: 0,
          bottom: EmoticonPresenter.isSmallScreen ? 8 : 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(
                    start: 0, top: 0, end: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: R.colors.secondBgColor,
                  shape: BoxShape.circle,
                ),
                child: _closeButton(),
              ),
            ],
          ),
          SizedBox(height: imageSize, child: _imageListView()),
        ],
      ),
    );
  }

  Widget _closeButton() {
    return GestureDetector(
        onTap: () {
          widget.presenter.closeShow();
          if (widget.onEmoticonClosed != null) widget.onEmoticonClosed!();
        },
        child: R.img(Assets.chat$ic_emoticon_close_webp,
            width: 20, height: 20, package: ComponentManager.MANAGER_CHAT));
  }

  Widget _imageListView() {
    SizedBox separator = SizedBox(width: (isSmallScreen ? 6.4 : 8));
    return ListView.separated(
        padding: const EdgeInsetsDirectional.only(
            start: 12, top: 0, end: 12, bottom: 0),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Util.getListSizeSafely(_images),
        separatorBuilder: (BuildContext context, int index) {
          return separator;
        },
        itemBuilder: (BuildContext context, int index) {
          final EmoticonSearchListItem image = _images![index];

          String imgStr = Util.isNullOrEmpty(image.gif)
              ? (!Util.isStringEmpty(image.webp) ? image.webp : '')
              : image.gif;
          return GestureDetector(
              onTap: () {
                if (widget.onEmoticonSelected != null) {
                  widget.onEmoticonSelected!(image);
                }
              },
              child: _imageItemWidget(imgStr));
        });
  }

  Widget _imageItemWidget(String url) {
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            placeholder: Container(color: R.colors.secondBgColor),
            errorWidget: Container(color: R.colors.secondBgColor),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.presenter.stateActive = true;
    widget.presenter.setOnResultCallback(_refresh);
    if (widget.keyword.isNotEmpty == true) {
      widget.presenter.load(widget.keyword);
    } else {
      widget.presenter.loadFirstChat();
    }
  }

  @override
  void dispose() {
    widget.presenter.clear();
    widget.presenter.stateActive = false;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant EmoticonListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.presenter.load(widget.keyword);
  }

  /// 刷新表情列表（UI）
  void _refresh(List<EmoticonSearchListItem>? images) {
    if (mounted) {
      setState(() {
        _images = images;
      });
    }
  }
}
