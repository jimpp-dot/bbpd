import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:shared/shared.dart';
import 'package:flutter/services.dart';
import 'package:search/assets.dart';
import 'package:search/slp_src/slp_search_repo.dart';
import 'package:search/k.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

/// 搜索视频彩蛋
class SlpSearchEggWidget extends StatefulWidget {
  final JointSearchItem item;

  const SlpSearchEggWidget({super.key, required this.item});

  @override
  _SlpSearchEggWidgetState createState() => _SlpSearchEggWidgetState();

  static void show(BuildContext context, JointSearchItem item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SlpSearchEggWidget(item: item),
        settings: const RouteSettings(name: '/SearchEggWidget'),
      ),
    );
  }
}

class _SlpSearchEggWidgetState extends State<SlpSearchEggWidget> {
  bool _canSearch = true;
  late JointSearchItem _item;
  JointSearchEggItem? _eggItem;
  final Map<String, bool> _showCard = {};

  VideoPlayerController? _controller;
  bool _endPlay = false; //第一次播完回调是否已完成

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    WakelockPlus.enable();
    _item = widget.item;
    _eggItem = _item.hasEgg() ? _item.egg : null;

    _refreshVideoPlayer();
  }

  @override
  void dispose() {
    _disposeController();

    WakelockPlus.disable();

    super.dispose();
  }

  void _onProgressListener() {
    if (!mounted) {
      return;
    }

    if (_controller?.value.isInitialized ?? false) {
      final int duration = _controller!.value.duration.inMilliseconds;
      final int elapsedTime = _controller!.value.position.inMilliseconds;
      if (_endPlay || duration - elapsedTime > 100) return;
      _endPlay = true;
      if (_eggItem != null &&
          _eggItem!.cardDisplayType ==
              JointSearchCardDisplayType.CardDisplayTypeAfterVideo &&
          _showCard[_eggItem!.sourcePath] == false) {
        Tracker.instance.track(TrackEvent.search_result_exposure, properties: {
          'keywords': _item.name,
          'search_type': 'Easter_egg_videos',
          'exposure_type': 'card',
        });

        if (mounted) {
          setState(() {
            _showCard[_eggItem!.sourcePath] = true;
          });
        }
      }
    }
  }

  void _disposeController() {
    _controller?.removeListener(_onProgressListener);
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_eggItem == null || !_eggItem!.hasSourcePath())
      return const SizedBox.shrink();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            (_controller?.value.isInitialized ?? false)
                ? _renderPlayer()
                : _renderLoading(),
            PositionedDirectional(
              start: 0,
              top: 0,
              width: Util.width,
              height: Util.height,
              child: IgnorePointer(
                child: Container(
                  width: Util.width,
                  height: Util.height,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            PositionedDirectional(
              start: 20.0,
              top: 0.0,
              end: 20.0,
              bottom: Util.iphoneXBottom + 16.0,
              child: Column(
                children: [
                  _buildSearchBar(),
                  const Spacer(),
                  _buildBottom(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderPlayer() {
    if (_controller == null || !_controller!.value.isInitialized)
      return const SizedBox.shrink();

    return Stack(
      children: [
        SizedBox(
          width: Util.width,
          height: Util.height,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onTapVideo,
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            ),
          ),
        ),
        PositionedDirectional(
          start: 0.0,
          bottom: 0.0,
          end: 0.0,
          child: VideoProgressIndicator(
            _controller!,
            allowScrubbing: false,
            colors: VideoProgressColors(
                playedColor: Colors.white.withOpacity(0.75)),
          ),
        ),
        if (!_controller!.value.isPlaying)
          Center(
            child: _renderAction(),
          ),
      ],
    );
  }

  void _refreshVideoPlayer() {
    if (_eggItem == null || Util.isNullOrEmpty(_eggItem?.sourcePath)) return;

    _endPlay = false;
    _showCard[_eggItem!.sourcePath] = _eggItem!.cardDisplayType ==
        JointSearchCardDisplayType.CardDisPlayTypeContinue;

    _disposeController();

    _controller = VideoPlayerController.network(
        Util.getRemoteImgUrl(_eggItem!.sourcePath))
      ..initialize().then((_) async {
        await _controller?.setLooping(true);
        if (mounted) {
          setState(() {});
          _controller?.play();
        }
      });

    _controller?.addListener(_onProgressListener);

    Tracker.instance.track(TrackEvent.search_result_exposure, properties: {
      'keywords': _item.name,
      'search_type': 'Easter_egg_videos',
      'exposure_type': 'video',
    });

    if (_showCard[_eggItem!.sourcePath] == true) {
      Tracker.instance.track(TrackEvent.search_result_exposure, properties: {
        'keywords': _item.name,
        'search_type': 'Easter_egg_videos',
        'exposure_type': 'card',
      });
    }
  }

  /// 顶部搜索框
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 52,
      ),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 40,
              height: 40,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: R.img(Assets.search$ic_egg_video_back_webp,
                  width: 24, height: 24),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Expanded(
            child: SearchBar(
              _onQueryChanged,
              bgColor: Colors.white.withOpacity(0.2),
              hintText: K.search_video_egg_placeholder,
              height: 40,
              textStyle:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15),
              hintStyle:
                  TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 15),
              showSearchIcon: true,
              searchIcon: R.img(
                Assets.search$ic_search_egg_bar_search_svg,
                width: 16,
                height: 16,
                color: Colors.white.withOpacity(0.6),
                package: ComponentManager.MANAGER_SEARCH,
              ),
              maxLength: 50,
              showLeftTextNum: false,
              autoFocus: false,
              onSubmitted: (text) {
                if (_canSearch == true) {
                  _canSearch = false;
                  _onSubmit(text);
                }
              },
              initialText: _item.name,
              padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
            ),
          ),
        ],
      ),
    );
  }

  void _onQueryChanged(String text) {}

  void _onSubmit(String text) async {
    if (text.isEmpty) return;

    JointSearchResp response = await SlpSearchRepo.searchUser(text);
    if (response.success) {
      JointSearchItem? item = response.data
          .firstWhereOrNull((e) => e.type == JointSearchItemType.ItemTypeEgg);

      if (item != null) {
        _item = item;
        _eggItem = _item.hasEgg() ? _item.egg : null;
        _showCard.clear();

        if (_eggItem != null && _eggItem!.hasSourcePath()) {
          if (!mounted) return;

          setState(() {
            _refreshVideoPlayer();
          });
        }
      }
    }

    _canSearch = true;
  }

  /// 底部用户信息 跳转卡片
  Widget _buildBottom() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Util.parseInt(_eggItem!.sourceUid) > 0) ...[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 4.0, end: 4.0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    _eggItem!.sourceUserName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(width: 4),
                const UserSexWidget(sex: 1, size: 16.0),
              ],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
        ],
        if (_eggItem!.sourceText.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 4.0, end: 4.0),
            child: Text(
              _eggItem!.sourceText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7)),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
        if (Util.parseInt(_eggItem!.objectId) > 0 &&
            (_showCard[_eggItem!.sourcePath] ?? false))
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onTap,
            child: Container(
              width: double.infinity,
              height: 72.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  R.img(Assets.search$search_egg_card_bg_webp,
                      width: 72.0, height: 72.0),
                  PositionedDirectional(
                    start: 12.0,
                    top: 12.0,
                    end: 12.0,
                    bottom: 12.0,
                    child: Row(
                      children: [
                        if (_eggItem!.objectIcon.isNotEmpty)
                          CommonAvatar(
                            path: _eggItem!.objectIcon,
                            size: 48.0,
                            shape: BoxShape.circle,
                          ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: Util.width - 240),
                          child: Text(
                            _eggItem!.cardText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF313131)),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          alignment: AlignmentDirectional.center,
                          width: 94,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: R.color.mainBrandGradientColors),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              R.img(Assets.search$ic_search_egg_chat_webp,
                                  width: 16.0, height: 16.0),
                              const SizedBox(width: 2),
                              Flexible(
                                child: Text(
                                  _eggItem!.cardButtonText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  /// 点击卡片跳转
  void _onTap() {
    if (_eggItem == null) return;

    Tracker.instance.track(TrackEvent.search_result_click, properties: {
      'keywords': _item.name,
      'search_type': 'Easter_egg_videos',
      'exposure_type': 'card',
    });

    int objectId = Util.parseInt(_eggItem?.objectId);

    switch (_eggItem!.redirectType) {
      case JointSearchRedirectType.RedirectTypePersonalPage:
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, _eggItem!.objectId);
        break;

      case JointSearchRedirectType.RedirectTypeRoom:
        IRoomManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        manager.openChatRoomScreenShow(context, _eggItem!.objectId,
            refer: 'search_egg');
        break;

      case JointSearchRedirectType.RedirectTypePrivateChat:
        IChatManager chatManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
        chatManager.openUserChatScreen(
          context,
          type: 'private',
          targetId: _eggItem!.objectId,
          title: _eggItem!.sourceUserName,
        );
        break;

      case JointSearchRedirectType.RedirectTypeDrawAndGuess:
        String type = '';
        if (objectId == 1) {
          //进“你画我猜”匹配
          type = 'guess';
        } else if (objectId == 2) {
          //进“画猜接龙”匹配
          type = 'guess-queue';
        }
        if (type.isNotEmpty) {
          IPremadeManager preMadeManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PREMADE);
          preMadeManager.openPremadeGameScreen(System.context, type: type);
        }
        break;

      case JointSearchRedirectType.RedirectTypeUndercover:
        String type = 'under';
        IPremadeManager preMadeManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PREMADE);
        preMadeManager.openPremadeGameScreen(System.context, type: type);
        break;

      case JointSearchRedirectType.RedirectTypeWolfKiller:
        String type = '';
        if (objectId == 6) {
          //进“狼人6人”匹配
          type = 'newwolf6';
        } else if (objectId == 9) {
          //进“狼人9人”匹配
          type = 'newwolf9';
        } else if (objectId == 12) {
          //进“狼人12人”匹配
          type = 'wolf12';
        }
        if (type.isNotEmpty) {
          IPremadeManager preMadeManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PREMADE);
          preMadeManager.openPremadeGameScreen(System.context, type: type);
        }
        break;

      default:
        break;
    }
  }

  Widget _renderAction() {
    return IconButton(
      iconSize: 64.0,
      padding: const EdgeInsets.all(0.0),
      color: Theme.of(context).primaryColor,
      icon: R.img(
        "player_btn_play.png",
        width: 80.0,
        height: 80.0,
        package: ComponentManager.MANAGER_VIDEO,
      ),
      onPressed: _onTapVideo,
    );
  }

  Center _renderLoading() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Color(0x80000000),
        valueColor: AlwaysStoppedAnimation(Colors.white),
        strokeWidth: 3.0,
      ),
    );
  }

  void _onTapVideo() async {
    bool isPlaying = _controller?.value.isPlaying ?? false;

    if (isPlaying) {
      await _controller?.pause();
      WakelockPlus.disable();
    } else {
      await _controller?.play();
      WakelockPlus.enable();
    }
    if (mounted) setState(() {});
  }
}
