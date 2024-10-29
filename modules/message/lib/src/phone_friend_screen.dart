import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as CoreK;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:message/src/model/message_beans.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import '../k.dart';
import 'package:shared/k.dart' as BaseK;

class PhoneFriendScreen extends StatefulWidget {
  const PhoneFriendScreen({super.key});

  @override
  _PhoneFriendScreenState createState() => _PhoneFriendScreenState();

  static void show(BuildContext context) async {
    PermissionStatus permissionStatus = await PermissionUtil.checkPermissions(
        Constant.context, Permission.contacts);
    if (permissionStatus != PermissionStatus.granted) {
      bool? agreed = await LicenseLocalDialog.show(
        context,
        CoreK.K.license_dialog_title,
        '亲爱的${Util.appName}用户，为向您提供更优质的服务，方便您在${Util.appName}中发现手机通讯录好友，${Util.appName}想访问您的通讯录并上传您的通讯录数据。\n\n${Util.appName}十分重视您的权利及隐私政策并严格按照相关法律法规提供服务，特向您说明。',
        false,
      );

      if (agreed == true) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.contacts);
        if (permissionStatus == PermissionStatus.granted) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PhoneFriendScreen()));
        }
      }
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PhoneFriendScreen()));
    }
  }
}

class _PhoneFriendScreenState extends State<PhoneFriendScreen> {
  String? _errorMsg;
  bool _loading = true;
  List<Contact>? _contacts;
  List<AddressBookUserItem> _data = [];
  late ScrollController _controller;
  bool _more = false;
  int _page = 1;
  int _total = 0;

  @override
  void initState() {
    super.initState();
    _loadPhoneInfo().then((value) {
      _onRefresh();
    });
    _controller = ScrollController();
    _controller.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.msg_phone_address_book,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
      ),
      body: _buildContent(context),
    );
  }

  Future<void> _onRefresh() async {
    _page = 1;
    await _loadData();
  }

  _onScroll() {
    if (_more == true &&
        _loading == false &&
        _controller.position.maxScrollExtent == _controller.offset) {
      _loadData();
    }
  }

  Widget _renderExtend() {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: Text(_more ? BaseK.K.common_loading : BaseK.K.common_no_more,
            textScaleFactor: 1.0,
            style: TextStyle(fontSize: 14.0, color: R.colors.thirdTextColor)),
      ),
    );
  }

  Future<bool> _loadPhoneInfo() async {
    _contacts = await FlutterContacts.getContacts(withProperties: true);
    _contacts ??= [];
    List validContacts = [];
    for (var element in _contacts!) {
      List<String> phones = element.phones.map((e) => e.number).toList();
      for (var p in phones) {
        String phone = Util.parsePhoneNum(p);
        if (phone.isNotEmpty) {
          validContacts
              .add({'name': element.displayName ?? '', 'mobile': phone});
        }
      }
    }
    if (validContacts.isNotEmpty) {
      BaseResponse response = await MessageRepo.uploadAddressBook(
          {'contacts': jsonEncode(validContacts)});
      Log.d('validContacts');
      return response.success ?? false;
    }
    return false;
  }

  _loadData() async {
    _loading = true;
    AddressBookFriendsResp resp =
        await MessageRepo.getAddressBookFriends(_page, 20);
    if (resp.success == true) {
      _errorMsg = null;
      if (_page == 1) {
        _data.clear();
        _data = resp.data?.list ?? [];
      } else {
        _data.addAll(resp.data?.list ?? []);
      }
      _total = resp.data?.total ?? 0;
      _page++;
      _more = resp.data?.more ?? false;
      Provider.of<ProfilePayload>(Constant.context, listen: false)
          .loadRelationNum();
    } else {
      _errorMsg = resp.msg ?? '';
    }
    _loading = false;
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildContent(BuildContext context) {
    if (_loading) {
      return const Loading();
    }
    if (_errorMsg != null) {
      return ErrorData(
        error: _errorMsg ?? '',
        onTap: _loadData,
        fontColor: R.colors.secondTextColor,
      );
    }

    if (_data.isEmpty) {
      return EmptyWidget(
        onTap: _loadData,
        textColor: R.colors.secondTextColor,
      );
    }

    return Container(
      alignment: AlignmentDirectional.center,
      color: R.colors.homeBgColor,
      child: SafeArea(
        top: false,
        child: RefreshIndicatorFactory.of(
            onRefresh: _onRefresh,
            child: CustomScrollView(
              controller: _controller,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 44,
                    margin:
                        const EdgeInsetsDirectional.only(start: 20, end: 20),
                    alignment: AlignmentDirectional.center,
                    child: Row(
                      children: [
                        Text(
                          '$_total',
                          style: R.textStyle.medium16
                              .copyWith(color: const Color(0xFFFCA252)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          K.msg_friend_has_join_num + Util.appName,
                          style: R.textStyle.medium14
                              .copyWith(color: R.colors.thirdTextColor),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return _buildItem(index);
                }, childCount: _data.length)),
                SliverList(
                    delegate: SliverChildListDelegate([_renderExtend()])),
              ],
            )),
      ),
    );
  }

  _handFollow(AddressBookUserItem item) async {
    if (item.follow == 0) {
      NormalNull response =
          await BaseRequestManager.onFollow(item.uid.toString());
      if (response.success) {
        item.follow = 1;
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
      }
    } else {
      NormalNull response =
          await BaseRequestManager.unFollow(item.uid.toString());
      if (response.success) {
        item.follow = 0;
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildItem(int index) {
    AddressBookUserItem item = _data[index];
    bool hasAttention = Util.parseBool(item.follow);
    UserConfig? config = item.roomTag;
    config ??= UserConfig.fromJson({});
    return InkWell(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, item.uid);
      },
      child: Rext.themeCardContainer(
        margin:
            const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 10),
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 10, bottom: 10),
        cornerRadius: 8,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            StatusAvatar(
                roomName: config.roomTypeName ?? '',
                roomIcon: config.acuteIcon ?? '',
                colors: config.bgColors,
                userAvatar: item.icon ?? '',
                uid: item.uid,
                rid: config.room,
                online: (item.online > 0)),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.contactName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: R.textStyle.regular16
                        .copyWith(color: R.colors.mainTextColor),
                  ),
                  Text(
                    Util.appName + K.msg_nick_name + (item.name ?? ''),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: R.textStyle.regular14
                        .copyWith(color: R.colors.secondTextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                _handFollow(item);
              },
              child: Container(
                width: 63,
                height: 28,
                alignment: AlignmentDirectional.center,
                decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    gradient: LinearGradient(
                        colors: hasAttention
                            ? R.colors.darkGradientColors
                            : R.colors.mainBrandGradientColors)),
                child: Text(
                  hasAttention ? K.msg_has_attention : K.msg_attention,
                  style: R.textStyle.medium14
                      .copyWith(color: R.colors.brightTextColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
