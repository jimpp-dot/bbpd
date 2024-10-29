import 'package:chat/k.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import '../model/share_moment_data.dart';

/// @Author bobzhou
/// @Description
/// @Date 2022-03-31 16:18

class DisplayShareMoment extends StatelessWidget {
  final MessageContent message;
  final ShareMomentData data;

  const DisplayShareMoment(
      {super.key, required this.message, required this.data});

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (data.atype == 'video') {
      content = _buildVideoCard();
    } else if (data.atype == 'picture') {
      content = _buildPicture();
    } else {
      content = _buildContent();
    }

    return InkWell(
      onTap: () => _onTap(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 236,
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 12, top: 10, bottom: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(R.imagePath(
                  darkMode
                      ? 'ic_chat_moment_bg_dark.webp'
                      : 'ic_chat_moment_bg.webp',
                  package: ComponentManager.MANAGER_CHAT)),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(),
              const SizedBox(height: 12),
              content,
              _buildRecommendTip(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildContent(),
        const SizedBox(height: 8),
        SizedBox(
          width: 152,
          height: 152,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(data.cover),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              PositionedDirectional(
                  child: R.img(Assets.chat$chat_ic_video_play_png,
                      width: 40,
                      height: 40,
                      package: ComponentManager.MANAGER_CHAT)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPicture() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildContent(),
        if (!Util.isCollectionEmpty(data.attach)) ...[
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: _images(),
          ),
        ],
      ],
    );
  }

  List<Widget> _images() {
    List<Widget> images =
        data.attach!.take(3).map((e) => _buildImageItem(e!)).toList();
    return images
        .expand((_) => (_ == images.last) ? [_] : [_, const SizedBox(width: 8)])
        .toList();
  }

  Widget _buildImageItem(String icon) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(icon),
        width: 52,
        height: 52,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContent() {
    if (!Util.isStringEmpty(data.content)) {
      return Text(
        data.content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: R.colors.mainTextColor, fontSize: 16),
      );
    }
    return const SizedBox();
  }

  Widget _buildRecommendTip(BuildContext context) {
    if (data.recommend && Util.parseInt(message.user?.id) != Session.uid) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              ISettingManager settingManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_SETTINGS);
              settingManager.showMsgSetting(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.chat_share_moment_recommend_tip,
                  style:
                      TextStyle(color: R.colors.secondTextColor, fontSize: 11),
                ),
                R.img(BaseAssets.shared$box_ic_next_small_svg,
                    width: 12,
                    height: 12,
                    color: R.colors.secondTextColor,
                    package: ComponentManager.MANAGER_BASE_CORE),
              ],
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }

  Widget _buildHeader() {
    return SizedBox(
      width: double.infinity,
      height: 28,
      child: data.recommend
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(K.chat_share_moment_recommend_title,
                    style: TextStyle(
                        color: R.colors.secondTextColor, fontSize: 13)),
                const Spacer(),
                if (data.hasProfileAudio)
                  SoundStadiumButton(
                    audioUrl: data.profileAudio,
                    duration: data.profileAudioDuration,
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                  ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonAvatar(path: data.icon, shape: BoxShape.circle, size: 24),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    data.name,
                    style: TextStyle(
                        color: R.colors.secondTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
    );
  }

  void _onTap(BuildContext context) {
    if (data.recommend) {
      /// 系统推荐的动态消息 点击上报
      String clickPage = (data.atype == 'video' || data.atype == 'picture')
          ? 'click_moment_photo'
          : 'click_moment';
      Tracker.instance.track(TrackEvent.click, properties: {
        'click_page': clickPage,
        'topic_id': data.topicId,
        'uid': data.uid
      });
    }
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentDetailScreen(context,
        topicId: data.topicId,
        topicUid: data.uid,
        parentPage: MomentFlowPage.Chat);
  }
}
