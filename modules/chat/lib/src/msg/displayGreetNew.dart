import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat/src/model/chat_greet_user_model.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

class DisplayGreetNew extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final PageRefer? refer;

  const DisplayGreetNew(
      {super.key, required this.message, required this.extra, this.refer});

  @override
  State<StatefulWidget> createState() {
    return _DisplayGreetNewState();
  }
}

class _DisplayGreetNewState extends State<DisplayGreetNew> {
  static const LOG_TAG = "_DisplayGreetNewState";

  late ChatGreetUserModel _chatGreetModel;

  @override
  void initState() {
    super.initState();
    Log.d(tag: LOG_TAG, "extra data = ${widget.extra.toString()}");
    _chatGreetModel =
        ChatGreetUserModel.fromJson(widget.extra as Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(
            context, Util.parseInt(_chatGreetModel.uid),
            refer: widget.refer);
      },
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: Util.width - 24,
      color: R.colors.mainBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 1),
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 12, bottom: 12),
            decoration: BoxDecoration(
                color: R.colors.mainBgColor,
                border: Border.all(color: R.colors.secondBgColor, width: 1),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(16))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4,
                  width: Util.width - 24,
                ),
                if (!Util.isCollectionEmpty(_chatGreetModel.tags))
                  _buildNormalText(K.chat_greet_desc(
                      [getSexDesc(), getTags(_chatGreetModel.tags)])),
                if (!Util.isCollectionEmpty(_chatGreetModel.friendTags))
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 4),
                    child: _buildNormalText(K.chat_greet_want_know(
                        [getSexDesc(), getTags(_chatGreetModel.friendTags)])),
                  ),
                if (!Util.isCollectionEmpty(_chatGreetModel.mark))
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 4),
                    child: _buildNormalText(_chatGreetModel.mark.join("、")),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      width: Util.width - 24,
      height: 102,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            top: 12,
            child: Container(
              height: 90,
              width: Util.width - 24,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage(R.imagePath("chat_friend_card_bg.png",
                        package: ComponentManager.MANAGER_CHAT)),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          PositionedDirectional(
            top: 68,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getUserLevelTags(),
            ),
          ),
          PositionedDirectional(
              top: 0,
              child: CommonAvatar(
                  size: 60,
                  shape: BoxShape.circle,
                  path: Util.getUserSmallIcon(_chatGreetModel.icon ?? ''))),
          if (_chatGreetModel.audioInfo != null &&
              !Util.isStringEmpty(_chatGreetModel.audioInfo!.audio))
            PositionedDirectional(
                start: 16,
                top: 24,
                child: SoundButtonSkill(
                  audioUrl: _chatGreetModel.audioInfo!.audio!,
                  duration: _chatGreetModel.audioInfo!.duration,
                  margin: 0,
                  width: 60,
                  leftPadding: 6,
                  fontSize: 10,
                  autoPlay: false,
                ))
        ],
      ),
    );
  }

  Widget _buildNormalText(String text) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: R.colors.mainTextColor.withOpacity(0.6), fontSize: 11),
    );
  }

  String getTags(List<UserTag> list) {
    if (Util.isCollectionEmpty(list)) {
      return "";
    }

    List<String> results = [];
    for (var tag in list) {
      results.add(tag.name ?? '');
    }

    return results.join("、");
  }

  List<Widget> getUserLevelTags() {
    double padding = 4.0;

    List<Widget> tagList = [];

    tagList.add(
      UserSexAndAgeWidget(sex: _chatGreetModel.sex, age: _chatGreetModel.age),
    );

    //人气等级
    tagList.add(UserPopularity(
      popularityLevel: Util.parseInt(_chatGreetModel.popularity),
      padding: EdgeInsetsDirectional.only(start: padding),
    ));

    //vip等级
    tagList.add(UserVipWidget(
        vip: Util.parseInt(_chatGreetModel.vipLevel),
        padding: EdgeInsetsDirectional.only(start: padding)));

    // 爵位
    tagList.add(UserNobilityWidget(
      titleNew: Util.parseInt(_chatGreetModel.titleNew),
      padding: EdgeInsetsDirectional.only(start: padding),
    ));
    return tagList;
  }

  String getSexDesc() {
    return _chatGreetModel.sex == ChatGreetUserModel.SEX_MALE
        ? BaseK.K.common_he
        : BaseK.K.common_she;
  }
}
