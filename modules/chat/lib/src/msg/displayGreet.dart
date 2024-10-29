import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class DisplayGreet extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final PageRefer? refer;

  const DisplayGreet(
      {super.key, required this.message, required this.extra, this.refer});

  @override
  State<StatefulWidget> createState() {
    return DisplayGreetState();
  }
}

class DisplayGreetState extends State<DisplayGreet> {
  @override
  Widget build(BuildContext context) {
    bool hasCard = widget.extra['card'] != null && widget.extra['card'] is Map;
    String pic = widget.extra['pic'] + "!head750";
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            color: R.colors.mainBgColor,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(12.0),
              topEnd: Radius.circular(12.0),
              bottomEnd: Radius.circular(12.0),
              bottomStart: Radius.circular(12.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openImageScreen(
                      context, Util.parseInt(widget.message.targetId),
                      refer: widget.refer);
                },
                child: ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(12.0),
                    topEnd: Radius.circular(12.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: System.imageDomain + pic,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 12, bottom: 12.0),
                decoration: BoxDecoration(
                  color: R.colors.mainBgColor,
                  border: BorderDirectional(
                    start: BorderSide(color: R.colors.dividerColor, width: 0.5),
                    end: BorderSide(color: R.colors.dividerColor, width: 0.5),
                    bottom:
                        BorderSide(color: R.colors.dividerColor, width: 0.5),
                    top: BorderSide(color: R.colors.dividerColor, width: 0.5),
                  ),
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(12),
                    bottomEnd: Radius.circular(12),
                  ),
                ),
                child: Text(
                  widget.message.content,
                  maxLines: 2,
                  style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 14.0,
                      height: 1.0),
                ),
              )
            ],
          ),
        ),
        if (hasCard &&
            widget.extra['card']['audio'] != null &&
            widget.extra['card']['audio'].toString().isNotEmpty &&
            widget.extra['card']['duration'] != null)
          PositionedDirectional(
            top: MediaQuery.of(context).size.width / 2 - 32,
            start: 12,
            child: SoundButtonSkill(
              audioUrl: widget.extra['card']['audio'],
              duration: Util.parseInt(widget.extra['card']['duration']),
              margin: 0,
              width: 60,
              leftPadding: 6,
              fontSize: 10,
              autoPlay: false,
            ),
          ),
      ],
    );
  }
}
