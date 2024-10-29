import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:group/src/images.dart';

import 'groupPersonInfoScreen.dart';

class GroupBlackScreen extends StatefulWidget {
  final int? groupId;
  final String? title;

  static Future openGroupBlackScreen(BuildContext context,
      {Key? key, int? groupId, String? title}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GroupBlackScreen(
          key: key,
          groupId: groupId,
          title: title,
        ),
        settings: const RouteSettings(name: '/groupblack'),
      ),
    );
  }

  const GroupBlackScreen({Key? key, this.groupId, this.title})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<GroupBlackScreen> {
  List _members = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    String url = "${System.domain}go/yy/group/black";
    XhrResponse response = await Xhr.postJson(
        url, {"groupId": widget.groupId.toString()},
        formatJson: true, throwOnError: true);
    if (response.error == null) {
      Map res = response.response as Map<dynamic, dynamic>;
      if (res['success'] == true) {
        Map data = res['data'];
        _members = data['members'];

        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (_members.isNotEmpty) {
      for (var item in _members) {
        widgets.add(
          ListTile(
            dense: false,
            title: ContactItem(data: item),
            trailing: IntrinsicWidth(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Images.img(
                    "icn_next.svg",
                    width: 15.0,
                    height: 15.0,
                  ),
                ])),
            onTap: () {
              GroupPersonInfoScreen.openGroupPersonInfoScreen(context,
                  groupId: widget.groupId, uid: Util.parseInt(item['uid']));
            },
          ),
        );
      }
    } else {
      widgets.add(
        SizedBox(
            height: Util.height - Util.iphoneXBottom,
            child: ErrorData(
              error: R.string('no_one_in_blacklist'),
              onTap: () {
                _load();
              },
            )),
      );
    }

    return Scaffold(
      appBar: BaseAppBar(widget.title ?? R.string('manage_group')),
      body: ListView(
        children: widgets,
      ),
    );
  }
}

class ContactItem extends StatefulWidget {
  final Map? data;

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
  final int _suspensionHeight = 40;
  final int _itemHeight = 55;
  final bool _selected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            child: Image.network(
              "${System.imageDomain}${widget.data!['icon']}!head375",
              width: 40,
              height: 40,
            )),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.data!['name'],
                textScaleFactor: 1.0,
                style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  widget.data!['uid'].toString(),
                  textScaleFactor: 1.0,
                  style:
                      TextStyle(fontSize: 12.0, color: R.color.secondTextColor),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
