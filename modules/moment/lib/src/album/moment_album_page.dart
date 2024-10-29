import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/k.dart';
import 'package:moment/src/api/album_list_repo.dart';
import 'package:moment/src/model/moment_album_bean.dart';
import 'package:moment/src/page/photo_view_gallery_screen.dart';

/// 动态相册
class MomentAlbumPage extends StatefulWidget {
  final int uid;
  final AlbumUserInfo? albumUserInfo;

  final GestureTapCallback onFollowTaped;

  const MomentAlbumPage({super.key, required this.uid, this.albumUserInfo, required this.onFollowTaped});

  @override
  _MomentAlbumPageState createState() => _MomentAlbumPageState();
}

class _MomentAlbumPageState extends State<MomentAlbumPage> {
  late double _ratio;
  late AlbumListRepo _repository;

  @override
  void initState() {
    super.initState();

    _ratio = (Util.width - 24) / (375 - 24);
    _repository = AlbumListRepo(widget.uid);
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

  void reload() {
    _repository.refresh();
  }

  _onChatTaped() {
    if (Session.isLogined == false) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(
      context,
      type: 'private',
      targetId: widget.uid,
      title: widget.albumUserInfo?.name ?? '',
      refer: PhotoViewGalleryScreen.routeName,
    );

    Tracker.instance.track(TrackEvent.moment_picture_click, properties: {
      'click': 'chat_last',
      'chat_uid': widget.uid,
    });
  }

  _onSendGiftTaped() {
    IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showPrivateGiftPanel(context, uid: widget.uid);

    Tracker.instance.track(TrackEvent.moment_picture_click, properties: {
      'click': 'send_gift',
      'gift_uid': widget.uid,
    });
  }

  _onItemTaped(CirclePicItem item) {
    IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentDetailScreen(context, topicId: item.tpid.toInt(), topicUid: widget.uid, parentPage: MomentFlowPage.Album);
  }

  @override
  Widget build(BuildContext context) {
    double paddingBottom = Util.iphoneXBottom + 12;
    if (Session.uid != widget.uid) {
      paddingBottom = Util.iphoneXBottom + 12 + 48;
    }
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 100),
      child: Stack(
        children: <Widget>[
          LoadingMoreList(
            ListConfig<CirclePicItem>(
              itemBuilder: _buildItem,
              sourceList: _repository,
              shrinkWrap: true,
              indicatorBuilder: _indicatorBuilder,
              padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, paddingBottom),
              extendedListDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4 * _ratio,
                mainAxisSpacing: 4 * _ratio,
              ),
              lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
            ),
          ),
          if (Session.uid != widget.uid && widget.albumUserInfo != null)
            PositionedDirectional(
              bottom: 0,
              child: IgnorePointer(
                child: Container(
                  width: Util.width,
                  height: 170,
                  alignment: AlignmentDirectional.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.6)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          if (Session.uid != widget.uid && widget.albumUserInfo != null)
            PositionedDirectional(
              bottom: 0,
              child: _renderFooter(),
            ),
        ],
      ),
    );
  }

  Widget _renderFooter() {
    List<Widget> widgets = [];
    if (widget.albumUserInfo?.isfollow == 0) {
      // 未关注
      widgets.add(BottomBasicButton(
        icon: 'ic_follow_add.svg',
        label: R.string('attention'),
        iconSize: const Size(16, 16),
        onTap: widget.onFollowTaped,
        bgColor: R.color.mainBrandColor,
        labelColor: Colors.white,
      ));
    } else {
      // 关注后变成送礼物
      widgets.add(BottomBasicButton(
        icon: 'ic_album_gift.svg',
        label: R.string('personal_send_gift'),
        labelColor: R.color.unionRankText2,
        onTap: _onSendGiftTaped,
        bgColor: R.color.mainBrandColor,
      ));
    }
    widgets.add(const SizedBox(width: 19));
    // 聊天
    widgets.add(BottomBasicButton(
      icon: 'ic_album_chat.svg',
      label: R.string('chat'),
      onTap: _onChatTaped,
      bgColor: R.color.mainBrandColor,
      labelColor: Colors.white,
    ));

    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.bottomCenter,
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom + 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }

  Widget _buildItem(BuildContext context, CirclePicItem item, int index) {
    return GestureDetector(
      onTap: () => _onItemTaped(item),
      child: SizedBox(
        width: 114 * _ratio,
        height: 114 * _ratio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl: Util.cover375(Util.splitPx(item.url)),
            width: 114 * _ratio,
            height: 114 * _ratio,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(hasMore: true, textColor: Colors.white.withOpacity(0.6));
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(hasMore: false, textColor: Colors.white.withOpacity(0.6));
    } else if (status == IndicatorStatus.fullScreenError) {
      return _buildError(
        bgImg: 'bg_error_data.webp',
        text: R.string('server_return_error_retry'),
        onTap: () {
          Log.d('server_return_error_retry');
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: R.string('server_return_error_retry'),
        textColor: Colors.white.withOpacity(0.6),
        loadMore: _repository.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      return _buildError(
        bgImg: 'bg_no_data.webp',
        text: K.moment_album_empty,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return LoadingFooter(hasMore: true, textColor: Colors.white.withOpacity(0.6));
  }

  Widget _buildError({required String bgImg, required String text, required GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsetsDirectional.only(top: 150 * Util.ratio),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 12.0, start: 16, end: 16),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomBasicButton extends StatefulWidget {
  final String icon;
  final String label;
  final GestureTapCallback onTap;
  final Color? labelColor;
  final Color? bgColor;

  final Size? iconSize;

  const BottomBasicButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.labelColor,
    required this.bgColor,
    this.iconSize,
  });

  @override
  _BottomBasicButtonState createState() => _BottomBasicButtonState();
}

class _BottomBasicButtonState extends State<BottomBasicButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 144,
        height: 48,
        decoration: BoxDecoration(
          color: widget.bgColor ?? const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              R.img(
                widget.icon,
                package: ComponentManager.MANAGER_MOMENT,
                width: widget.iconSize?.width ?? 24,
                height: widget.iconSize?.height ?? 24,
              ),
              const SizedBox(width: 4),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.labelColor ?? Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
