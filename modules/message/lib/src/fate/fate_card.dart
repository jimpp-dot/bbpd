import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:shared/protobuf/lan/generated/people_info_industry.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:message/src/fate/fate_height.dart';
import 'package:message/src/fate/fate_single_selection.dart';
import '../../k.dart';
import '../model/pb/generated/slp_fate.pb.dart' as FateData;
import 'package:flutter_swiper/flutter_swiper.dart';

enum CardType {
  Normal,

  /// 普通卡片，其他人
  Tag1,

  /// 完善资料卡片：关于我标签
  Tag2,

  /// 完善资料卡：希望认识标签
  Photo,

  /// 完善资料卡：相册
  Audio,

  /// 完善资料卡：语音
  extInfoHeight,

  /// 完善资料卡：身高、职业、学历
  extInfoIndustry,

  /// 完善资料卡：职业
  extInfoEducation

  /// 完善资料卡：学历
}

/// 今日缘分卡片
class FateCardData {
  final CardType cardType;
  final FateData.FateCard data;
  final void Function()? setDragLeft;

  var value;

  FateCardData({
    required this.data,
    this.setDragLeft,
    this.cardType = CardType.Normal,
  });

  List<String> get photos => data.photos;

  int get rid => data.rid;

  String? get name => data.name;

  int get uid => data.uid;

  int? get age => data.age;

  int? get sex => data.sex;

  int? get onlineStatus => data.onlineStatus;

  String? get onlineDatelineDiff => data.onlineDatelineDiff;

  String? get distance => data.distance;

  String? get audio => data.audio;

  String? get duration => data.duration;

  List<String> get tags => data.tags;

  List<String> get friendTags => data.friendTags;

  int get match => data.match;
}

class FateCard extends StatefulWidget {
  final FateCardData data;
  final double height;
  final int leftNum;
  final int showUid;

  /// 用于自动播放声音
  final int totalNum;

  const FateCard({
    Key? key,
    required this.data,
    required this.height,
    required this.leftNum,
    required this.showUid,
    required this.totalNum,
  }) : super(key: key);

  @override
  FateCardState createState() {
    return FateCardState();
  }
}

class FateCardState extends State<FateCard> {
  GlobalKey nameKey = GlobalKey();
  GlobalKey<FateSoundState> audioKey = GlobalKey<FateSoundState>();
  double nameWidth = 0;
  final SwiperController _controller = SwiperController();
  int _sliderIndex = 0;
  GlobalKey extIndustryKey = GlobalKey();
  GlobalKey extEducationKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    if (widget.data.cardType == CardType.Audio) {
      /// 语音签名提示，根据名字的长度，需要调整到不同的位置
      WidgetsBinding.instance.addPostFrameCallback((duration) {
        RenderBox? box =
            nameKey.currentContext?.findRenderObject() as RenderBox?;
        if (box?.size.width != nameWidth) {
          if (mounted) {
            setState(() {
              nameWidth = box?.size.width ?? 0;
            });
          }
        }
      });
    }

    init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FateCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.data.cardType == CardType.Audio) {
      /// 语音签名提示，根据名字的长度，需要调整到不同的位置
      WidgetsBinding.instance.addPostFrameCallback((duration) {
        RenderBox? box =
            nameKey.currentContext?.findRenderObject() as RenderBox?;
        if (box?.size.width != nameWidth) {
          if (mounted) {
            setState(() {
              nameWidth = box?.size.width ?? 0;
            });
          }
        }
      });
    }

    if (widget.data.uid != oldWidget.data.uid) {
      _controller.index = 0;
      _sliderIndex = 0;
    }

    init();
  }

  void init() {
    if (widget.data.photos.length > 1) {
      _controller.startAutoplay();
    }
    autoPlayAudio();
  }

  void autoPlayAudio() {
    if (Util.validStr(widget.data.audio) &&
        Util.validStr(widget.data.duration) &&
        widget.showUid == widget.data.uid &&
        widget.data.uid > 0) {
      /// 当前展示的卡片，自动播放声音。（首个不自动播放声音，由fate_bottom_dialog控制）
      WidgetsBinding.instance.addPostFrameCallback((duration) {
        if (audioKey.currentState != null) {
          audioKey.currentState?.play();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 32,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: Colors.white54,
      ),
      child: Stack(
        children: [
          /// 头像
          if (Util.validList(widget.data.photos)) buildImageBg(),
          Container(
            width: Util.width - 32,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(20),
                topEnd: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0)
                ],
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            child: Container(
              width: Util.width - 32,
              height: 182,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(20),
                  bottomEnd: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.264),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.624),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          if (widget.data.cardType == CardType.Normal) ...[
            /// 匹配度/leftNum
            buildMatchAndLeft(),

            /// 房间信息
            buildRoom(),

            /// 特别推荐
            _buildSpecMatch(),
          ],
          PositionedDirectional(
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNameAndAudio(),
                const SizedBox(
                  height: 4,
                ),
                buildInfo(),

                /// tags
                buildTags(),
                const SizedBox(
                  height: 26,
                ),

                /// 图片列表
                buildImageList(),
              ],
            ),
          ),
          if (widget.data.cardType != CardType.Normal)
            Container(
              width: Util.width - 32,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                color: Colors.black.withOpacity(0.34),
              ),
            ),
          if ([
            CardType.extInfoHeight,
            CardType.extInfoIndustry,
            CardType.extInfoEducation
          ].contains(widget.data.cardType))
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(),
              ),
            ),
          if (widget.data.cardType == CardType.Audio) buildAudioTips(),
          if (widget.data.cardType == CardType.Tag1 ||
              widget.data.cardType == CardType.Tag2)
            buildTagTips(),
          if (widget.data.cardType == CardType.Photo) buildPhotoTips(),
          if (widget.data.cardType == CardType.extInfoHeight) buildHeightTips(),
          if (widget.data.cardType == CardType.extInfoIndustry)
            buildIndustryTips(),
          if (widget.data.cardType == CardType.extInfoEducation)
            buildEducationTips()
        ],
      ),
    );
  }

  /// 身高
  Widget buildHeightTips() {
    return FateHeight(
      tapIgnore: () {
        if (widget.data.setDragLeft != null) {
          widget.data.setDragLeft!();
        }
      },
      valueDidChange: (value) {
        widget.data.value = value;
      },
    );
  }

  /// 职业
  Widget buildIndustryTips() {
    return FateSingleSelection(K.message_fate_card_info_industry, () {
      if (widget.data.setDragLeft != null) {
        widget.data.setDragLeft!();
      }
    }, loadData: () async {
      ResAccountIndustryList list =
          await ConversationUserInfoApi.getIndustrySelections();
      if (!list.success || list.data.isEmpty) {
        return SingleSelectionRes(list.msg, null);
      }

      List<SingleSelectionItem> items = [];
      for (var element in list.data) {
        items.add(SingleSelectionItem(element.id, element.name));
      }
      return SingleSelectionRes(null, items);
    }, valueDidChange: (value) {
      widget.data.value = value;
    }, key: extIndustryKey);
  }

  /// 学历
  Widget buildEducationTips() {
    return FateSingleSelection(K.message_fate_card_info_education, () {
      if (widget.data.setDragLeft != null) {
        widget.data.setDragLeft!();
      }
    }, loadData: () async {
      return SingleSelectionRes(null, SingleSelectionItem.ducationSelections());
    }, valueDidChange: (value) {
      widget.data.value = value;
    }, key: extEducationKey);
  }

  /// 图片引导
  Widget buildPhotoTips() {
    return PositionedDirectional(
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 205,
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 12, top: 8, bottom: 12),
            margin: const EdgeInsetsDirectional.only(start: 33),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(8),
              color: Colors.white,
            ),
            child: Text(
              K.msg_complete_photo,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 43),
            child: CustomPaint(
              painter: ArrowPainter(color: Colors.white),
              size: const Size(15, 6),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 58,
            width: 58,
            margin: const EdgeInsetsDirectional.only(start: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(4),
              border:
                  Border.all(color: Colors.white.withOpacity(0.5), width: 0.5),
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: R.img(
              'ic_fate_add.png',
              width: 18,
              height: 18,
              package: ComponentManager.MANAGER_MESSAGE,
            ),
          )
        ],
      ),
    );
  }

  /// tag引导
  Widget buildTagTips() {
    double bottom = (widget.data.photos.length >= 2 ? 78 : 0) + 26;
    return PositionedDirectional(
      bottom: bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 196,
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 12, top: 8, bottom: 12),
            margin: const EdgeInsetsDirectional.only(start: 29),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(8),
              color: Colors.white,
            ),
            child: Text(
              K.msg_complete_tag,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 39),
            child: CustomPaint(
              painter: ArrowPainter(color: Colors.white),
              size: const Size(15, 6),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 28,
            padding: const EdgeInsetsDirectional.only(start: 9, end: 13),
            margin: const EdgeInsetsDirectional.only(start: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(4),
              color: Colors.white,
              border: Border.all(color: const Color(0xFF979797), width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(
                  'ic_fate_add.png',
                  width: 12,
                  height: 12,
                  package: ComponentManager.MANAGER_MESSAGE,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  K.msg_tag,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF313131),
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 语音签名引导
  Widget buildAudioTips() {
    if (nameWidth <= 0) {
      return const SizedBox.shrink();
    }

    double bottom = 4 +
        16 +
        (Util.validList(widget.data.tags) ? 36 : 0) +
        26 +
        (widget.data.photos.length >= 2 ? 78 : 0) +
        3.5;
    late double start;
    late double audioMarginStart;
    if (20 + nameWidth + 5 + 196 > Util.width - 32) {
      start = Util.width - 32 - 9 - 196;
      audioMarginStart = 25 + nameWidth - start;
    } else {
      start = 20 + nameWidth + 5 - 7;
      audioMarginStart = 7;
    }

    return PositionedDirectional(
      bottom: bottom,
      start: start,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 196,
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 12, top: 8, bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(8),
              color: Colors.white,
            ),
            child: Text(
              K.msg_complete_audio,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: audioMarginStart + 10),
            child: CustomPaint(
              painter: ArrowPainter(color: Colors.white),
              size: const Size(15, 6),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 18,
            padding: const EdgeInsetsDirectional.only(start: 2, end: 8),
            margin: EdgeInsetsDirectional.only(start: audioMarginStart),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(9),
              color: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(
                  "home/sound_normal.svg",
                  width: 18,
                  height: 18,
                  fit: BoxFit.cover,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  K.msg_fate_add_audio,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF313131),
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNameAndAudio() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          key: nameKey,
          constraints: const BoxConstraints(
            maxWidth: 190,
          ),
          child: Text(
            widget.data.name ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (Util.validStr(widget.data.audio) &&
            Util.validStr(widget.data.duration))
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 5, top: 1),
            child: buildAudio(),
          ),
      ],
    );
  }

  Widget buildAudio() {
    return FateSoundWidget(
      key: audioKey,
      audioUrl: widget.data.audio,
      duration: Util.parseInt(widget.data.duration),
      color: Colors.white,
      iconTextPadding: 5,
    );
  }

  String getOnlineStatus() {
    if (Util.parseInt(widget.data.onlineStatus) == 0) {
      return BaseK.K.online;
    } else if (Util.validStr(widget.data.onlineDatelineDiff)) {
      return widget.data.onlineDatelineDiff!;
    }

    return '';
  }

  Widget buildInfo() {
    String onlineStatus = getOnlineStatus();
    String text;
    if (Util.validStr(onlineStatus) && Util.validStr(widget.data.distance)) {
      text = '$onlineStatus · ${widget.data.distance}';
    } else {
      text = onlineStatus + (widget.data.distance ?? '');
    }

    return SizedBox(
      height: 16,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 20,
          ),
          UserSexAndAgeWidget(
            sex: widget.data.sex,
            age: widget.data.age,
            width: 31,
            height: 14,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  /// 标签
  Widget buildTags() {
    List<String> tags = widget.data.tags;
    if (widget.data.cardType == CardType.Tag1 ||
        widget.data.cardType == CardType.Tag2) {
      return const SizedBox(
        height: 28 + 8,
      );
    }

    if (Util.validList(tags)) {
      return Container(
        width: Util.width - 32,
        height: 28,
        margin: const EdgeInsetsDirectional.only(top: 8),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return buildTag(tags[index]);
          },
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsetsDirectional.only(start: 20),
          itemCount: tags.length,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget buildTag(String tag) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 6),
      padding: const EdgeInsetsDirectional.only(
        start: 8,
        end: 8,
        top: 6.5,
      ),
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(4),
        color: Colors.white60,
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFF313131),
          height: 1.1,
        ),
      ),
    );
  }

  /// 头像
  Widget buildImageBg() {
    if (widget.data.photos.length > 1) {
      String nextUrl =
          Util.recombineUrl(Util.cover750(widget.data.photos[1]) ?? '');
      _preCache(nextUrl);
    }
    return PositionedDirectional(
      top: 0,
      bottom: 0,
      start: 0,
      end: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Swiper(
          key: ValueKey(widget.data.uid),
          itemBuilder: (BuildContext context, int index) {
            String? url = Util.recombineUrl(
                Util.cover750(widget.data.photos[index]) ?? '');
            return CachedNetworkImage(
              imageUrl: url ?? '',
              fit: BoxFit.cover,
              width: Util.width - 32,
              height: widget.height,
              playback: false,
              placeholder: Container(
                color: R.color.mainBgColor,
                child: const Loading(),
              ),
              errorWidget: Container(
                color: R.color.mainBgColor,
                child: UnconstrainedBox(
                  child: R.img(
                    'error_data.webp',
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 180,
                    height: 180,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          controller: _controller,
          itemCount: widget.data.photos.length,
          // autoplay: widget.data.photos.length > 1,
          loop: widget.data.photos.length > 1,
          autoplayDelay: 3000,
          physics: const NeverScrollableScrollPhysics(),
          onTap: (int index) {
            IPersonalDataManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            manager.openImageScreen(context, widget.data.uid);
          },
          onIndexChanged: (int index) {
            int i = (index + 1) % widget.data.photos.length;
            String nextUrl =
                Util.recombineUrl(Util.cover750(widget.data.photos[i]) ?? '');
            _preCache(nextUrl);
            setState(() {
              _sliderIndex = index;
            });
          },
        ),
      ),
    );
  }

  final Map<String, bool> _preCached = {};

  _preCache(String url) async {
    if (_preCached.containsKey(url)) return;
    _preCached[url] = true;
    CachedImageManager.preCache(context, url);
  }

  /// 图片列表
  Widget buildImageList() {
    if (widget.data.cardType == CardType.Photo) {
      return const SizedBox(
        height: 78,
      );
    }

    if (widget.data.photos.length < 2) {
      return const SizedBox.shrink();
    }

    return Container(
      width: Util.width - 32,
      height: 58,
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              /// 点击切换大图的展示
              _controller.stopAutoplay();
              _controller.move(index);
              _controller.startAutoplay();
              Tracker.instance.track(TrackEvent.luck_click, properties: {
                'page': 'photo',
              });
            },
            child: buildImage(widget.data.photos[index], index),
          );
        },
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsetsDirectional.only(start: 20),
        itemCount: widget.data.photos.length,
        itemExtent: 58 + 8,
      ),
    );
  }

  Widget buildImage(String path, int index) {
    return Container(
      width: 58,
      height: 58,
      margin: const EdgeInsetsDirectional.only(end: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(4),
        border: index == _sliderIndex
            ? Border.all(color: Colors.white.withOpacity(0.9), width: 1.5)
            : Border.all(color: Colors.white.withOpacity(0.5), width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CachedNetworkImage(
          imageUrl: Util.getUserIconUrl(path) ?? '',
          width: 57,
          height: 57,
        ),
      ),
    );
  }

  /// 房间信息
  Widget buildRoom() {
    if (widget.data.rid > 0) {
      return PositionedDirectional(
        top: 11,
        end: 11,
        child: GestureDetector(
          onTap: () {
            IRoomManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            manager.openChatRoomScreenShow(context, widget.data.rid,
                refer: 'fate_dialog_card');
          },
          child: Container(
            width: 68,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(6),
              border: Border.all(width: 0.5, color: const Color(0xFFFFCCED)),
              gradient: const LinearGradient(
                colors: [Color(0xFFFF9ADB), Color(0xFFFE42A5)],
              ),
            ),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  K.msg_fate_room_title,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                R.img(
                  'icon_next_fq.svg',
                  width: 15,
                  height: 15,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildSpecMatch() {
    if (widget.data.data.isSpecMatch) {
      return PositionedDirectional(
        top: 42,
        start: 10,
        child: Container(
          width: 76,
          height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                R.imagePath(
                  'ic_fate_spec_bg.webp',
                  package: ComponentManager.MANAGER_MESSAGE,
                ),
              ),
            ),
          ),
          padding: const EdgeInsetsDirectional.only(start: 30, top: 11),
          child: Text(
            K.message_fate_spec_title,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  /// 匹配度/leftNum
  Widget buildMatchAndLeft() {
    return PositionedDirectional(
      top: 0,
      start: 0,
      child: Container(
        width: 144,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            bottomEnd: Radius.circular(20),
          ),
          color: Colors.black.withOpacity(0.3),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '${widget.totalNum - widget.leftNum + 1}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            Text(
              '/${widget.totalNum}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              K.msg_fate_card_match(['${widget.data.match}']),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white60,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
