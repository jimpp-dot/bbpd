import 'package:azlistview/azlistview.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';

class ContactInfo extends ISuspensionBean {
  String? name;
  String? tagIndex;
  String? namePinyin;
  int? uid;
  String? icon;
  int? title;

  ContactInfo({this.name, this.tagIndex, this.namePinyin, this.uid});

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        icon = json['icon'] ?? "",
        title = Util.parseInt(json['title']),
        uid = Util.parseInt(json['uid']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagIndex': tagIndex,
        'namePinyin': namePinyin,
        'isShowSuspension': isShowSuspension
      };

  @override
  String getSuspensionTag() => tagIndex ?? '';

  @override
  String toString() => '{"name":$name}';
}

/// 创建群组
class GroupCreateScreen extends StatefulWidget {
  final int? groupId;
  final int? uid;

  static Future openGroupCreateScreen(BuildContext context,
      {Key? key, int? groupId, int? uid}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GroupCreateScreen(
          key: key,
          groupId: groupId,
          uid: uid,
        ),
        settings: const RouteSettings(name: '/groupcreate'),
      ),
    );
  }

  const GroupCreateScreen({Key? key, this.groupId, this.uid}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<GroupCreateScreen> {
  final List<ContactInfo> _contacts = [];

  final double _suspensionHeight = 40;
  final double _itemHeight = 55;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController(text: '');
  final Map<int?, ContactInfo> _selectedContact = {};
  ILoginManager? loginManager;

  @override
  void initState() {
    super.initState();
    loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    _load();
  }

  void _load() async {
    String url =
        "${System.domain}group/getFriends?groupId=${widget.groupId}&uid=${widget.uid}";
    XhrResponse response = await Xhr.getJson(url);
    if (response.error == null) {
      Map res = response.response as Map<dynamic, dynamic>;
      if (res['success'] == true) {
        if (res['data'] != null && (res['data'] as List).isNotEmpty) {
          List data = res['data'] as List;
          for (var item in data) {
            ContactInfo info = ContactInfo.fromJson(item);
            _contacts.add(info);

            if (info.uid == widget.uid) {
              _selectedContact[info.uid] = info;

              var text = '';
              if (_selectedContact.isNotEmpty) {
                _selectedContact.forEach((uid, contact) {
                  text += contact.name!;
                  text += ',';
                });
              } else {
                text = '';
              }
              _textController.text = text;
            }
          }
        }

        if (mounted) {
          _handleList(_contacts);
          setState(() {});

          Log.d(_contacts);
        }
      }
    }
  }

  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name!);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(_contacts);
  }

  Widget _buildHeader() {
    return Container(
      width: Util.width,
      height: 44,
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '${R.string('add_member')}:',
            textScaleFactor: 1.0,
            style: TextStyle(fontSize: 12.0, color: R.color.mainTextColor),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 5),
            width: Util.width - 36 - 60,
            height: 44,
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.send,
              cursorColor: R.color.mainBrandColor,
              cursorWidth: 1.0,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.0, color: R.color.mainTextColor),
              focusNode: _focusNode,
              controller: _textController,
              autocorrect: true,
              autofocus: false,
              onChanged: (value) {
                if (!mounted) return;
                setState(() {});
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: R.string('add_member_notice'),
                hintStyle: TextStyle(
                  fontSize: 12.0,
                  color: R.color.thirdTextColor,
                ),
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit() async {
    if (_selectedContact.isEmpty) {
      Fluttertoast.showToast(
          msg: R.string('select_friends_limit_notice'),
          gravity: ToastGravity.CENTER);
      return;
    }

    List<int?> uids = [];
    _selectedContact.forEach((uid, contact) {
      uids.add(contact.uid);
    });

    String url = "${System.domain}go/yy/group/create";
    if (widget.groupId! > 0) {
      url = "${System.domain}go/yy/group/add";
    }

    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'groupId': widget.groupId.toString(),
            'uids': uids.join(','),
            'version': '12',
          },
          formatJson: true,
          throwOnError: true);
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true) {
          try {
            int needVerify = Util.parseInt(res['data']['need_verify'], 0);
            int needVerifyNew =
                Util.parseInt(res['data']['need_verify_new'], 0);
            if (widget.groupId == 0 &&
                (Utility.isNeedVerify(needVerify, needVerifyNew))) {
              loginManager!.openAuthDialog(context,
                  type: needVerify,
                  newType: needVerifyNew,
                  refer: 'create_group');

              return;
            }
            Navigator.of(context).pop();
            Fluttertoast.showToast(
                msg: R.string('add_success'), gravity: ToastGravity.CENTER);
          } catch (e) {
            Log.d(e);
          }
        } else {
          Fluttertoast.showToast(msg: res['msg']);
        }
      }
      if (!mounted) return;
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
  }

  void _onItemClick(ContactInfo? item, bool? selected) {
    if (item == null || selected == null) {
      return;
    }

    if (selected && !_selectedContact.containsKey(item.uid)) {
      _selectedContact[item.uid] = item;
    }

    if (!selected && _selectedContact.containsKey(item.uid)) {
      _selectedContact.remove(item.uid);
    }

    var text = '';
    if (_selectedContact.isNotEmpty) {
      _selectedContact.forEach((uid, contact) {
        text += contact.name!;
        text += ',';
      });
    } else {
      text = '';
    }
    _textController.text = text;

    setState(() {});

    Log.d(_selectedContact);
  }

  Widget _buildListItem(ContactInfo model) {
    return ContactItem(
        data: model,
        selected: _selectedContact.containsKey(model.uid),
        onContactClick: _onItemClick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(widget.groupId! > 0
          ? R.string('add_member')
          : R.string('create_group')),
      body: ScaffoldBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _contacts.isNotEmpty
                ? Expanded(
                    child: AzListView(
                      data: _contacts,
                      itemCount: _contacts.length,
                      itemBuilder: (context, model) =>
                          _buildListItem(model as ContactInfo),
                      indexBarItemHeight: _itemHeight,
                      susItemHeight: _suspensionHeight,
                      indexHintBuilder: (context, hint) {
                        return Container(
                          alignment: Alignment.center,
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: R.color.mainBrandColor.withAlpha(200),
                            shape: BoxShape.circle,
                          ),
                          child: Text(hint,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30.0)),
                        );
                      },
                      indexBarOptions: IndexBarOptions(
                        textStyle: TextStyle(
                            color: R.color.secondTextColor, fontSize: 12),
                        downTextStyle: TextStyle(
                            color: R.color.mainTextColor, fontSize: 12),
                        downColor: R.color.secondBgColor,
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                        width: Util.width,
                        alignment: Alignment.center,
                        child: Text(
                          R.string('no_friends_notice'),
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: R.color.mainTextColor,
                          ),
                        )),
                  ),
            BottomButton.of(
              title: widget.groupId! > 0
                  ? R.string('add_member')
                  : R.string('create_group'),
              onTap: _onSubmit,
            )
          ],
        ),
      ),
    );
  }
}

typedef onContactItemClick = Function(ContactInfo? item, bool? selected);

class ContactItem extends StatefulWidget {
  final ContactInfo? data;
  final bool? selected;
  final onContactItemClick? onContactClick;

  const ContactItem({Key? key, this.data, this.selected, this.onContactClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ContactItemState();
  }
}

class ContactItemState extends State<ContactItem> {
  final int _suspensionHeight = 40;
  final int _itemHeight = 55;
  bool? _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  Widget _buildSusWidget(String susTag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: _suspensionHeight.toDouble(),
      width: double.infinity,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          Text(
            susTag,
            textScaleFactor: 1.2,
            style: TextStyle(color: R.color.secondTextColor),
          ),
          Expanded(
              child: Divider(
            height: .0,
            indent: 10.0,
            color: R.color.dividerColor,
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String susTag = widget.data!.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: widget.data!.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30.5, right: 30.5),
          height: _itemHeight.toDouble(),
          child: InkWell(
            onTap: () {
              setState(() {
                _selected = !_selected!;
                widget.onContactClick!(widget.data, _selected);
              });
            },
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  child: Image.network(
                    "${System.imageDomain}${widget.data!.icon}!head375",
                    width: 40,
                    height: 40,
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 150),
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.data!.name!,
                          textScaleFactor: 1.0,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16.0, color: R.color.mainTextColor),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            widget.data!.uid.toString(),
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: 12.0, color: R.color.secondTextColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: R.img(
                    BaseAssets.shared$icon_select_svg,
                    width: 24,
                    height: 24,
                    color: _selected!
                        ? R.color.mainBrandColor
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
