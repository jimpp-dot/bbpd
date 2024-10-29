import 'dart:math';

import 'package:shared/shared.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:provider/provider.dart';

import '../../assets.dart';

typedef LikeCallback = void Function(bool isLiked);

/// 点赞用户块
class LikesWidget extends StatelessWidget {
  final int? topicId;
  final int? topicUid;
  final List<LikeBean>? likes;
  final bool gotoList;
  final int maxShowNum;
  final int? totalNum;

  const LikesWidget({
    super.key,
    this.topicId,
    this.topicUid,
    this.likes,
    this.gotoList = false,
    this.maxShowNum = MAX_SHOW_LIKE_NUM,
    this.totalNum,
  });

  @override
  Widget build(BuildContext context) {
    if (likes == null || likes!.isEmpty) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: gotoList ? () => _gotoLikesScreen(context) : null,
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 14),
        constraints: const BoxConstraints(minWidth: double.infinity),
        decoration: BoxDecoration(
          color: R.colors.moduleBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: _buildRichText(context),
      ),
    );
  }

  Widget _buildRichText(BuildContext context) {
    int display = min(likes!.length, maxShowNum);

    List<InlineSpan> widgets = [];
    widgets.add(WidgetSpan(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 6.0, bottom: 2),
        child: R.img(
          'ic_like_small.svg',
          width: 14,
          height: 14,
          package: ComponentManager.MANAGER_MOMENT,
        ),
      ),
    ));

    for (int i = 0; i < display; ++i) {
      if (i == display - 1) {
        widgets.add(_buildLikeText(context, likes![i], ''));

        // 等多少人觉得赞
        if (likes!.length > maxShowNum || (totalNum ?? 0) > maxShowNum) {
          widgets.add(TextSpan(
            text: K.likes_more(['${totalNum ?? likes!.length}']),
            style: TextStyle(
              color:
                  darkMode ? const Color(0xb3647fff) : const Color(0xFF60688E),
              fontSize: 13,
              fontFamily: Util.fontFamily,
            ),
            recognizer: gotoList
                ? (TapGestureRecognizer()
                  ..onTap = () => _gotoLikesScreen(context))
                : null,
          ));
        }
      } else {
        widgets.add(_buildLikeText(context, likes![i], '，'));
      }
    }

    if (gotoList) {
      widgets.add(WidgetSpan(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(end: 2.0, bottom: 1),
          child: R.img(
            'ic_next_small_fq.svg',
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_MOMENT,
            color: R.colors.thirdTextColor,
          ),
        ),
      ));
    }

    return ExtendedText.rich(
      TextSpan(
        style: TextStyle(
          color: const Color(0xFF5B6389),
          fontSize: 13,
          height: 1.6,
          fontFamily: Util.fontFamily,
        ),
        children: widgets,
      ),
    );
  }

  TextSpan _buildLikeText(BuildContext context, LikeBean bean, String ext) {
    return TextSpan(
      text: '${bean.displayName}$ext',
      style: TextStyle(
        color: R.colors.secondTextColor,
        fontSize: 13,
        fontFamily: Util.fontFamily,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () => _gotoImageScreen(context, bean),
    );
  }

  _gotoImageScreen(BuildContext context, LikeBean bean) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, bean.uid,
        refer: const PageRefer('LikesWidget'));
  }

  _gotoLikesScreen(BuildContext context) {
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openLikeListScreen(context,
        topicUid: topicUid ?? 0, topicId: topicId ?? 0);
  }
}

/// 点赞动效
class LikeWidget extends StatefulWidget {
  final Moment moment;
  final LikeCallback? onLikeTaped;
  final Color? mainTextColor;
  final Color? secondTextColor;
  final bool supportDark;

  const LikeWidget({
    super.key,
    required this.moment,
    this.onLikeTaped,
    this.mainTextColor,
    this.secondTextColor,
    this.supportDark = false,
  });

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget>
    with SingleTickerProviderStateMixin {
  bool isAnim = false;

  _offsetAnim() {
    if (isAnim) {
      return;
    }
    isAnim = true;
    if (mounted) setState(() {});
  }

  _onLikeTaped() async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }
    MomentModel model = context.read<MomentModel>();
    if (widget.moment.isLiked) {
      DataRsp response =
          await Api.cancelLike(widget.moment.topicId, widget.moment.uid);
      if (response.success == true) {
        widget.moment.deleteLike(Session.uid, changeNum: true);
        _offsetAnim();
        model.putCachedMoment(widget.moment);

        ///播放音效
        SoundEffectUtil.playSound(
            SoundEffectUtil.SCENE_TYPE_LIKE_CANCEL, widget.moment.sex);
        if (widget.onLikeTaped != null) {
          widget.onLikeTaped!(false);
        }
      } else {
        Fluttertoast.showToast(
            msg: K.cancel_like_failed, gravity: ToastGravity.CENTER);
      }
    } else {
      DataRsp<LikeBean> response = await Api.postLike(
          widget.moment.topicId, widget.moment.uid,
          caseId: widget.moment.tagsCase?.id ?? 0);
      if (response.success == true) {
        widget.moment.addLike(
          LikeBean(
            topicId: widget.moment.topicId,
            uid: Session.uid,
            time: response.data!.time,
            name: Session.name,
            sex: Session.sex,
          ),
          changeNum: true,
          sort: true,
        );
        model.putCachedMoment(widget.moment);
        _offsetAnim();

        ///播放音效
        SoundEffectUtil.playSound(
            SoundEffectUtil.SCENE_TYPE_LIKE, widget.moment.sex);
        if (widget.onLikeTaped != null) {
          widget.onLikeTaped!(true);
        }
      } else {
        Fluttertoast.showToast(
            msg: K.post_like_failed, gravity: ToastGravity.CENTER);
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onLikeTaped(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            child: R.img(
              likeIcon(),
              width: 28,
              height: 28,
              package: Assets.package,
            ),
          ),
          const SizedBox(width: 4),
          NumText(
            '${widget.moment.getLikesNum}',
            style: TextStyle(
              color: widget.secondTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // 日夜间图片后缀不一样
  String likeIcon() {
    if (widget.moment.isLiked) {
      return Assets.moment_ic_rush_like_webp;
    }
    String unLikeIcon = Assets.moment_ic_rush_unlike_webp;
    return unLikeIcon;
  }
}
