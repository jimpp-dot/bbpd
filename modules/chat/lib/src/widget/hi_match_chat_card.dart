import 'package:shared/shared.dart';
import 'package:shared/widget/audioPlayAnimtion.dart';
import 'package:chat/k.dart';
import 'package:flutter/material.dart';
import 'package:chat/src/util/chat_msg_util.dart';

/// @Author bobzhou
/// @Description 嗨歌匹配聊天卡
/// @Date 2022-05-20 15:03

class HiMatchChatCard extends StatefulWidget {
  final int uid;
  final int matchScore;
  final HomeProfileData? data;

  const HiMatchChatCard(
      {super.key, required this.matchScore, this.data, required this.uid});

  @override
  State<HiMatchChatCard> createState() => _HiMatchChatCardState();
}

class _HiMatchChatCardState extends State<HiMatchChatCard>
    with TickerProviderStateMixin {
  List<CirclePicItem>? _pics;
  int _leftSeconds = -1;
  bool _followed = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Home.Audio.Play', _onAudioPlay);
    eventCenter.addListener('Home.Audio.Stop', _onAudioPlay);
    eventCenter.addListener(EventConstant.UserFollow, _onUserFollow);
    appStateObserver.addListener(onAppStateChanged);
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _loadPics();
  }

  @override
  void didUpdateWidget(covariant HiMatchChatCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    /*  if (widget.data?.validAudio == true &&
        (oldWidget.data != widget.data || oldWidget.data.card?.audio != widget.data.card?.audio)) {
      _leftSeconds = Util.parseInt(widget.data.card.duration);
    }*/
  }

  @override
  void dispose() {
    eventCenter.removeListener('Home.Audio.Play', _onAudioPlay);
    eventCenter.removeListener('Home.Audio.Stop', _onAudioPlay);
    eventCenter.removeListener(EventConstant.UserFollow, _onUserFollow);
    appStateObserver.removeListener(onAppStateChanged);
    _controller.dispose();
    super.dispose();
  }

  void _loadPics() async {
    IMomentManager momentManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    ResCirclePics result = await momentManager.getCirclePics(widget.uid, 0);
    if (result.success && !Util.isCollectionEmpty(result.data.list)) {
      _pics = result.data.list.length > 10
          ? result.data.list.sublist(0, 10)
          : result.data.list;
      if (mounted) setState(() {});
    }
  }

  _onUserFollow(String type, dynamic value) {
    if (value is Map &&
        value.containsKey('follow') &&
        value.containsKey('uid')) {
      bool follow = value['follow'];
      String uid = value['uid'];
      if (widget.uid == Util.parseInt(uid)) {
        setState(() {
          _followed = follow;
        });
      }
    }
  }

  /// 男
  bool get _isMale => widget.data != null && widget.data?.base.sex == 1;

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      return const SizedBox.shrink();
    }
    HomeProfileData data = widget.data!;
    if (!_followed) {
      _followed =
          data.base.followRelation == 1 || data.base.followRelation == 2;
    }
    Color scoreTextColor;
    List<Color> voiceColors;

    if (_isMale) {
      scoreTextColor = const Color(0xFF4AAAFF);
      voiceColors = [const Color(0xFF81C8FF), const Color(0xFF4AAAFF)];
    } else {
      scoreTextColor = const Color(0xFFFF55AA);
      voiceColors = [const Color(0xFFFF80EC), const Color(0xFFFF73B9)];
    }

    return GestureDetector(
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, data.base.uid,
            refer: const PageRefer('HiMatchChatCard'));
      },
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 16),
        child: Container(
          padding: const EdgeInsetsDirectional.only(
              start: 16, end: 16, top: 20, bottom: 16),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(R.imagePath("chat_hi_match_card_bg.webp",
                  package: ComponentManager.MANAGER_CHAT)),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF202020).withOpacity(0.08),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
                SizedBox(
                  width: 80,
                  height: 46,
                  child: Stack(
                    children: [
                      _buildAvatar(Session.icon),
                      PositionedDirectional(
                          start: 36,
                          child: _buildAvatar(widget.data!.base.icon))
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.baseline,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${widget.matchScore}',
                            style: TextStyle(
                                color: scoreTextColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w600)),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(bottom: 3),
                          child: Text('% ${K.chat_match_score_suffix}',
                              style: TextStyle(
                                  color: scoreTextColor, fontSize: 12)),
                        )
                      ],
                    ),
                    if (!Util.isStringEmpty(_getShortDesc()))
                      Container(
                        constraints: const BoxConstraints(maxWidth: 140),
                        child: Text(_getShortDesc(),
                            style: TextStyle(
                                color: R.colors.thirdTextColor, fontSize: 12)),
                      ),
                    const SizedBox(height: 2),
                  ],
                ),
                const Spacer(),
                if (!_followed)
                  GestureDetector(
                    onTap: _onFollow,
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 12, top: 9, end: 12, bottom: 9),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: voiceColors),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          R.img(
                            'icon_add_attention.png',
                            width: 10,
                            height: 10,
                            fit: BoxFit.cover,
                            package: ComponentManager.MANAGER_PERSONALDATA,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            K.chat_follow,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
              ]),
              const SizedBox(height: 16),
              Container(
                  width: Util.width, height: 0.5, color: R.colors.dividerColor),
              const SizedBox(height: 14),
              _buildVoice(),
              if (needShowTags) ...[
                _buildTags(data.tag.tags,
                    K.chat_his_label([(Util.getSexDesc(data.base.sex))])),
                const SizedBox(height: 10),
                _buildTags(data.tag.friendTags,
                    K.chat_he_like([(Util.getSexDesc(data.base.sex))])),
              ],
              if (!Util.isCollectionEmpty(_pics)) const SizedBox(height: 10),
              _buildPics(),
              if (needShowNewerText) ...[
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    K.chat_hi_newer_desc([(Util.getSexDesc(data.base.sex))]),
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF313131).withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  ///	同时拥有标签、语音、动态时，只展示两类，优先展示语音和动态
  bool get needShowTags {
    return !(widget.data?.validAudio ?? false) || Util.isCollectionEmpty(_pics);
  }

  ///	如果是三天内注册的用户，并且标签、语音、动态都没有时，在匹配卡片上展示：“TA是嗨歌新人”
  bool get needShowNewerText {
    bool isNewer = false;
    if (widget.data?.base != null) {
      isNewer = widget.data!.base.isThirdNewer > 0;
    }
    return isNewer &&
        !(widget.data?.validAudio ?? false) &&
        Util.isCollectionEmpty(_pics) &&
        Util.isCollectionEmpty(widget.data!.tag.tags) &&
        Util.isCollectionEmpty(widget.data!.tag.friendTags);
  }

  _buildVoice() {
    if (!(widget.data?.validAudio ?? false)) {
      return const SizedBox.shrink();
    }
    Color mainColor =
        _isMale ? const Color(0xFF50ADFF) : const Color(0xFFFF76C2);
    List<Color> colors = [
      mainColor,
      mainColor.withOpacity(0.95),
      mainColor.withOpacity(0.9),
      mainColor.withOpacity(0.85),
      mainColor.withOpacity(0.8),
      mainColor.withOpacity(0.75),
      mainColor.withOpacity(0.7),
      mainColor.withOpacity(0.65),
      mainColor.withOpacity(0.6),
      mainColor.withOpacity(0.5),
      mainColor.withOpacity(0.4),
      mainColor.withOpacity(0.3),
      mainColor.withOpacity(0.2),
    ];

    return Row(
      children: [
        _buildPrefixText(
            K.chat_his_voice([(Util.getSexDesc(widget.data!.base.sex))])),
        GestureDetector(
          onTap: _playVoice,
          child: Container(
            padding: const EdgeInsetsDirectional.only(
                start: 12, top: 5, bottom: 6, end: 9),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0x14202020), width: 1),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AudioPlayAnimation(
                  _controller,
                  1,
                  colors: colors,
                  refreshOnAnimCallBack: true, //加上这个触发自刷新
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  Utility.formatTimeClock(_leftSeconds > 0
                      ? _leftSeconds
                      : Util.parseInt(widget.data!.card.duration)),
                  style: const TextStyle(
                      fontSize: 13,
                      color: Color(0x66202020),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _buildAvatar(String icon) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1)),
      child: CommonAvatar(
        path: icon,
        size: 42,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildPrefixText(String text) {
    return Text(text,
        style: TextStyle(
            color: R.colors.secondTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w500));
  }

  Widget _buildTags(List<HomeProfileTagItem> tags, String prefix) {
    if (Util.isCollectionEmpty(tags)) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 24,
      child: Row(
        children: [
          _buildPrefixText(prefix),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tags.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildLabelText(tags[index].name);
                  }))
        ],
      ),
    );
  }

  Widget _buildLabelText(String text) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 6),
      child: Container(
        height: 26,
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        decoration: BoxDecoration(
          color: R.colors.secondBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: R.colors.secondTextColor,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPics() {
    if (Util.isCollectionEmpty(_pics)) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          _buildPrefixText(
              K.chat_his_dynamic([(Util.getSexDesc(widget.data!.base.sex))])),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _pics!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(start: 6),
                      child: CommonAvatar(
                          path: Util.splitPx(_pics![index].url),
                          size: 40,
                          borderRadius: BorderRadius.circular(8),
                          suffix: '!head100',
                          shape: BoxShape.rectangle),
                    );
                  }))
        ],
      ),
    );
  }

  String _getShortDesc() {
    return ChatMsgUtil.getHiChatMatchDesc(
        widget.data!.base.birthday, widget.data!.base.distance);
  }

  void _playVoice() {
    AudioPlay.instance().play(
        widget.data!.card.audio, Util.parseInt(widget.data!.card.duration));
  }

  _onAudioPlay(String type, dynamic data) {
    if (widget.data == null && !(widget.data?.validAudio ?? false)) {
      return;
    }
    Log.d("_onStopAudioPlay type=$type");
    Map res = data;
    String? audioUrl = res['url'];
    int seconds = Util.parseInt(res['seconds']);
    Log.d("_onStopAudioPlay type=$type seconds=$seconds audioUrl=$audioUrl");
    if (type == 'Home.Audio.Play') {
      if (audioUrl == widget.data!.card.audio) {
        if (!mounted) {
          return;
        }
        if (seconds == Util.parseInt(widget.data!.card.duration)) {
          _controller.stop();
        } else {
          _controller.repeat();
        }
        setState(() {
          _leftSeconds = seconds;
        });
      }
    } else if (type == 'Home.Audio.Stop') {
      if (!mounted) {
        return;
      }
      _controller.stop();
      setState(() {
        _leftSeconds = Util.parseInt(widget.data!.card.duration);
      });
    }
  }

  void onAppStateChanged() {
    AudioPlay.instance().stop();
  }

  _onFollow() async {
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    NormalNull response =
        await BaseRequestManager.onFollow(widget.uid.toString());
    if (!mounted) return;
    if (response.success) {
      _followed = !_followed;
      Fluttertoast.showToast(msg: K.chat_has_followed);
      setState(() {});
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }
}
