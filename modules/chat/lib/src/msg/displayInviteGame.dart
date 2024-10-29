import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat/src/msg/config.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import '../../k.dart';

class DisplayInviteGame extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;
  final double maxWidth;
  final int? uid;

  const DisplayInviteGame(
      {super.key,
      required this.message,
      required this.extra,
      required this.direction,
      required this.maxWidth,
      this.uid});

  @override
  DisplayInviteGameState createState() {
    return DisplayInviteGameState();
  }
}

enum InviteGameState {
  Normal,
  Accept,
  Reject,
  Expired,
}

class DisplayInviteGameState extends State<DisplayInviteGame> {
  InviteGameState? state;
  late double width;

  late String msgId;
  Map<String, String> card1 = <String, String>{};
  Map<String, String> card2 = <String, String>{};

  @override
  void initState() {
    super.initState();

    width = min(widget.maxWidth, 247);

    msgId = '${widget.extra['msgId']}';

    if (widget.extra['cards'] != null && widget.extra['cards'] is List) {
      List cards = widget.extra['cards'];
      if (cards.isNotEmpty) {
        card1['certify'] = cards[0]['certify'] ?? '0';
        card1['level'] = cards[0]['level'] ?? '';
      }

      if (cards.length > 1) {
        card2['certify'] = cards[1]['certify'] ?? '0';
        card2['level'] = cards[1]['level'] ?? '';
      }
    }

    _loadState();
  }

  void _loadState() async {
    String url = '${System.domain}rush/message/reservePlayStatus?msgId=$msgId';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        int status = Util.parseInt(res['data']['status'], 0);
        switch (status) {
          case 0:
            state = InviteGameState.Normal;
            break;
          case 1:
            state = InviteGameState.Accept;
            break;
          case 2:
            state = InviteGameState.Reject;
            break;
          case 3:
            state = InviteGameState.Expired;
            break;
          default:
            state = InviteGameState.Expired;
            break;
        }
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      Log.d(e);
    }
  }

  bool isAnswering = false;
  void _answerInvite(String type) async {
    if (isAnswering) {
      return;
    }
    isAnswering = true;

    List config = widget.extra['config'];
    String gameDetailTxt = '';
    for (var item in config) {
      gameDetailTxt += '$item / ';
    }
    Tracker.instance.track(TrackEvent.dingdong, properties: {
      'response': type == 'accept' ? 'accept' : 'ingnore',
      'order_uid': widget.uid,
      'game_name': widget.extra['name'],
      'game_detail': gameDetailTxt,
    });

    Map<String, String> post = {
      'type': type,
      'msgId': msgId,
    };

    String url = '${System.domain}rush/message/answerReservePlay';

    try {
      XhrResponse response = await Xhr.postJson(url, post);
      Map res = response.value();
      if (res['success'] == true) {
        if (mounted) {
          setState(() {
            state = type == 'accept'
                ? InviteGameState.Accept
                : InviteGameState.Reject;
          });
        }
      }
    } catch (e) {
      Log.d(e.toString());
    } finally {
      isAnswering = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 293,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: R.colors.fourthBgColor,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage('${widget.extra['bg_icon']}'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTitle(),
          _buildGameName(),
          const SizedBox(
            height: 6,
          ),
          _buildIcons(),
          const SizedBox(
            height: 2,
          ),
          _buildGameGrades(),
          const SizedBox(
            height: 20,
          ),
          _buildMatchConditions(widget.extra['config']),
          const SizedBox(
            height: 16,
          ),
          _buildControlButtons(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 26,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(8), topStart: Radius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            width: 8,
          ),
          R.img(Assets.chat$chat_game_default_icon_png,
              width: 13, package: ComponentManager.MANAGER_CHAT),
          const SizedBox(
            width: 4,
          ),
          Text(
            '${widget.extra['title']}',
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(
            width: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildGameName() {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 55,
        ),
        CachedNetworkImage(
          imageUrl: '${widget.extra['icon']}',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        Flexible(
          child: Text(
            '${widget.extra['name']}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        const SizedBox(width: 2),
      ],
    );
  }

  Widget _buildControlButtons() {
    if (state == null) {
      return Container();
    }

    List<Widget> widgets = <Widget>[];

    if (state == InviteGameState.Normal) {
      if (MessageDisplayDirection.Right == widget.direction) {
        widgets.add(Container(
          width: 165,
          height: 31,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: R.colors.mainBrandGradientColors,
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15.5)),
          ),
          child: Text(
            K.chat_game_waiting,
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
        ));
      } else {
        double buttonWidth = 96;
        if (width < 247) {
          buttonWidth = 80;
        }
        widgets.add(
          GestureDetector(
              onTap: () {
                _answerInvite('reject');
              },
              child: Container(
                width: buttonWidth,
                height: 31,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15.5)),
                ),
                child: Text(
                  K.chat_reject,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
              )),
        );
        widgets.add(const SizedBox(
          width: 15,
        ));
        widgets.add(
          GestureDetector(
              onTap: () {
                _answerInvite('accept');
              },
              child: Container(
                width: buttonWidth,
                height: 31,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: R.colors.mainBrandGradientColors,
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15.5)),
                ),
                child: Text(
                  K.chat_accept,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
              )),
        );
      }
    } else if (state == InviteGameState.Accept) {
      widgets.add(_buildUnTapButton(K.chat_has_accept));
    } else if (state == InviteGameState.Reject) {
      widgets.add(_buildUnTapButton(K.chat_has_reject));
    } else {
      widgets.add(_buildUnTapButton(K.chat_has_timeout));
    }

    return Container(
      width: width,
      height: 31,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }

  Widget _buildUnTapButton(String text) {
    return Container(
      width: 165,
      height: 31,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15.5)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
  }

  Widget _buildMatchConditions(List? conditions) {
    List<Widget> widgets = <Widget>[];

    if (conditions != null && conditions.isNotEmpty) {
      for (int i = 0; i < conditions.length; i++) {
        widgets.add(_buildMatchCondition('${conditions[i]}'));
        if (i != conditions.length - 1) {
          widgets.add(const SizedBox(
            width: 4,
          ));
        }
      }
    } else {
      return Container(
        height: 25,
      );
    }

    return Container(
      width: width,
      height: 25,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }

  Widget _buildMatchCondition(String condition) {
    double padding = 10;
    if (width < 247) {
      padding = 5;
    }

    return Container(
      height: 25,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: R.colors.mainTextColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Text(
        condition,
        style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7)),
      ),
    );
  }

  Widget _buildGameGrades() {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildGameGrade(card1['certify'], card1['level']),
          _buildGameGrade(card2['certify'], card2['level']),
        ],
      ),
    );
  }

  Widget _buildGameGrade(String? certify, String? grade) {
    if (certify == null || certify.isEmpty || grade == null || grade.isEmpty) {
      return Container(
        height: 16,
        width: 80,
        alignment: Alignment.center,
        child: Text(
          K.chat_no_game_level,
          style: const TextStyle(fontSize: 11, color: Colors.white),
        ),
      );
    }
    return Container(
      width: 80,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          R.img(
              certify == '1'
                  ? Assets.chat$ic_game_verify_svg
                  : Assets.chat$ic_game_verify_false_svg,
              width: 12,
              height: 12,
              package: ComponentManager.MANAGER_CHAT),
          Text(
            grade,
            maxLines: 1,
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildIcons() {
    String icon1 = '';
    String icon2 = '';
    if (widget.extra['icons'] != null && widget.extra['icons'] is List) {
      List icons = widget.extra['icons'];
      if (icons.isNotEmpty) {
        icon1 = '${icons[0]}';
      }
      if (icons.length > 1) {
        icon2 = '${icons[1]}';
      }
    }
    return Container(
      width: width,
      height: 80,
      alignment: Alignment.center,
      child: SizedBox(
        width: 154,
        height: 80,
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              start: 74,
              top: 0,
              child: _buildIcon(icon2),
            ),
            PositionedDirectional(
              start: 0,
              top: 0,
              child: _buildIcon(icon1),
            ),
            Align(
              child: R.img(Assets.chat$ic_invite_game_aad_png,
                  width: 34,
                  height: 34,
                  package: ComponentManager.MANAGER_CHAT),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String icon) {
    return Container(
      width: 80.0,
      height: 80.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 2.0),
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(39)),
          child: CachedNetworkImage(
            errorWidgetType: ErrorWidgetType.defaultUserIcon,
            imageUrl: icon, // ${System.imageDomain}${userInfo.icon}!head150
            width: 78.0,
            height: 78.0,
          )),
    );
  }
}
