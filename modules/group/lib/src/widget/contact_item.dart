import 'package:group/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../model/pb/generated/group_setting.pb.dart';

class ContactItem extends StatefulWidget {
  final GroupMembers? data;

  const ContactItem({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ContactItemState();
  }
}

class ContactItemState extends State<ContactItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CommonAvatar(
          path: widget.data!.icon,
          size: 52,
          shape: BoxShape.circle,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsetsDirectional.only(
                start: 10, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Text(
                        widget.data?.name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: 16.0, color: R.color.mainTextColor),
                      ),
                    ),
                    if (widget.data!.isCreator == 1 ||
                        widget.data!.isManager == 1)
                      Container(
                        margin: const EdgeInsetsDirectional.only(start: 4),
                        padding: const EdgeInsetsDirectional.only(
                            start: 4, end: 4, top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(
                              color: R.color.mainBrandColor, width: 0.5),
                        ),
                        child: Text(
                          widget.data!.isCreator == 1
                              ? K.group_creator
                              : K.group_manager,
                          style: TextStyle(
                              color: R.color.mainBrandColor, fontSize: 11),
                        ),
                      )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 4),
                  child: IDWidget(
                    uid: widget.data!.uid,
                    fontSize: 13,
                    fontColor: R.color.secondTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: R.color.thirdTextColor,
        )
      ],
    );
  }
}
