import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/vindicate/model/vindicate_view_model.dart';
import 'package:chat_room/src/vindicate/vindicate_util.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_gift_fly_widget.dart';
import 'package:chat_room/src/vindicate/widgets/vindicate_send_gift_page.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_small_heart.dart';
import 'package:chat_room/src/vindicate/widgets/vindicate_square_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/vindicate_send_gift_view_model.dart';
import 'package:provider/provider.dart' hide Selector;

String get _webpAnimName {
  return 'h22011818242673.webp';
}

/// 表白活动玩法入口主页面
/// 逻辑：
/// 1、可以被表白的用户只能是当前麦位上的用户，且只能单选。当麦位上的用户下麦后，则该处的用户列表也跟随变动
/// 2、选择对应用户后，下方的可送礼物状态只对应当前麦位用户的，不同麦位用户的可送礼物数据相互独立
/// [from] 0 - 默认打开 1 - 一对一打开，顶部麦位列表只显示对方信息 . 当from 为1 时，[uid] 必传
class VindicateActivityMain extends StatefulWidget {
  final ChatRoomData room;
  final int? uid;
  final int? from;

  const VindicateActivityMain(
      {Key? key, required this.room, this.uid, this.from = 0})
      : super(key: key);

  @override
  _VindicateActivityMainState createState() => _VindicateActivityMainState();
}

class _VindicateActivityMainState extends State<VindicateActivityMain>
    with TickerProviderStateMixin {
  late VindicateViewModel _vindicateModel;

  late List<Widget> _tabs;
  late List<Widget> _tabPages;
  late TabController _tabController;

  int _lastTabIndex = 0;

  @override
  void dispose() {
    _vindicateModel.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _loadAssets();

    _vindicateModel =
        VindicateViewModel(VindicateData(), widget.uid, widget.from)
          ..init(widget.room);

    _tabs = [
      Tab(text: K.room_vindicate_tell_you),
      Tab(text: K.room_in_love_square),
    ];

    _tabPages = [
      const VindicateSendGiftPage(),
      const VindicateSquarePage(),
    ];

    safeRun(() {
      _lastTabIndex = 0;
      _tabController = TabController(
          vsync: this, length: _tabs.length, initialIndex: _lastTabIndex);
    });

    /// 打开表白玩法面板时上报
    /// 此时默认tab为"想对你说"
    VindicateUtil.trackGiftPlayShow(tabIndex: _lastTabIndex);
  }

  _loadAssets() {
    /// 加载心形动效资源
    VindicateUtil.cacheWebpAnim(
        Util.getImgUrl('static/commodity/$_webpAnimName'));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _vindicateModel),
        ChangeNotifierProvider.value(value: _vindicateModel.squareViewModel),
        ChangeNotifierProvider.value(value: _vindicateModel.sendGiftViewModel),
      ],
      builder: (context, child) {
        final isAnimating = context.select<VindicateSendGiftViewModel, bool>(
            (model) => model.isAnimating);

        return Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              constraints:
                  BoxConstraints(maxHeight: VindicateUtil.widgetHeight),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(16),
                          topEnd: Radius.circular(16)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFD1F2FE), Color(0xFFC267FD)],
                      ),
                    ),
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height / 2.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        _backgroundWidget,

                        /// 心型动效组件
                        if (isAnimating)
                          Container(
                            margin: const EdgeInsetsDirectional.only(
                                start: 0, bottom: 20),
                            child: MultiframeImage.file(
                              VindicateUtil.getMultiframeFile(_webpAnimName),
                              onComplete: _vindicateModel
                                  .sendGiftViewModel.onHeartWebpPlayCompleted,
                            ),
                          ),
                        Container(
                          padding: EdgeInsetsDirectional.only(
                              bottom: MediaQuery.of(context).padding.bottom),
                          child: Column(
                            children: [
                              _headerWidget,
                              Expanded(child: _bodyWidget(context)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// 说明按钮
                  PositionedDirectional(
                    top: 12,
                    end: 16,
                    child: _instructionBtn,
                  ),

                  /// 当在执行解锁动画时，不允许用户进行任何点击操作
                  Offstage(
                    offstage: isAnimating ? false : true,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              start: 0,
              top: 0,
              end: 0,
              bottom: 0,
              child: IgnorePointer(
                child: VindicateGiftFlyWidget(
                  key: _vindicateModel.sendGiftViewModel.giftFlyWidgetKey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget get _headerWidget {
    return Container(
      height: 48,
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (R.img(RoomAssets.chat_room$confession_confession_tab_bar_webp)
                  as Image)
              .image,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            children: [
              VindicateSmallHeart.yellow(),
              const Spacer(),
              VindicateSmallHeart.yellow(),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 9),
            child: CommonTabBar(
              tabs: _tabs,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: R.textStyle.medium16.copyWith(fontSize: 16),
              indicator: const CommonUnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.white),
                wantWidth: 24,
              ),
              onTap: (index) {
                if (_lastTabIndex != index) {
                  VindicateUtil.trackGiftPlayShow(tabIndex: index);
                }
                _lastTabIndex = index;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    bool isLoading =
        context.select<VindicateViewModel, bool>((model) => model.isLoading);
    Log.d('isLoading : $isLoading');

    return isLoading
        ? _loadingWidget
        : TabBarView(
            controller: _tabController,
            children: _tabPages,
          );
  }

  Widget get _loadingWidget {
    return Container(
      height: MediaQuery.of(context).size.height / 2.0,
      alignment: AlignmentDirectional.center,
      child: const CupertinoActivityIndicator(
        radius: 12,
        animating: true,
      ),
    );
  }

  /// 说明按钮
  Widget get _instructionBtn {
    return GestureDetector(
      onTap: () {
        final url = '${System.getWebDomain("help")}/help?q=k95';
        BaseWebviewScreen.show(
          context,
          url:
              '$url&package=${Constant.packageName}&lan=${Translations.getLan()}&ch=${Uri.encodeComponent(DeviceInfo.channel)}',
        );
      },
      child: R.img(RoomAssets.chat_room$vindicate_vindicate_instruction_webp,
          width: 24, height: 24),
    );
  }

  /// 背景图
  Widget get _backgroundWidget {
    return Positioned.fill(
      child: CachedNetworkImage(
        imageUrl: Util.getImgUrl('static/confess/confession_bg_mask.webp.webp'),
      ),
    );
  }
}
