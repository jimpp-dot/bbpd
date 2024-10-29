import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile/k.dart';
import 'package:profile/src/api/api.dart';
import 'package:profile/src/model/pb/generated/invite_for_gift.pb.dart';
import 'package:shared/k.dart' as BaseK;

/// @Author wangyang
/// @Description 邀请有礼
/// @Date 2022/5/18
class InviteForGiftPage extends StatefulWidget {
  const InviteForGiftPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InviteForGiftPageState();
  }
}

class _InviteForGiftPageState extends BaseScreenState<InviteForGiftPage> {
  InviteDetail? _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  _loadData() async {
    ResInviteInfo response = await Api.getInviteForGiftInfo();
    if (response.success && response.hasData()) {
      _data = response.data;
      setScreenReady();
    } else {
      setScreenError(errorMsg: response.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBgColor(),
      body: buildStatusContent(),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        _buildHeadInfo(),
        Container(
          alignment: AlignmentDirectional.centerStart,
          margin: const EdgeInsetsDirectional.only(start: 20, top: 24),
          child: Text(
            K.profile_invite_list,
            style: const TextStyle(
                color: Color(0xFF202020),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        _buildInviteList(),
        GestureDetector(
          onTap: _gotoInvite,
          child: Container(
            height: 56,
            alignment: Alignment.center,
            margin: EdgeInsetsDirectional.only(
                bottom: Util.isIphoneX ? 38 : (38 + Util.iphoneXBottom),
                start: 20,
                end: 20,
                top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF6D14),
                  Color(0xFFFFC247),
                ],
              ),
            ),
            child: Text(
              K.profile_invite_button_text,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }

  _buildHeadInfo() {
    return Stack(
      children: [
        R.img('invite_gift_head_bg.webp',
            width: Util.width, package: ComponentManager.MANAGER_PROFILE),
        Column(
          children: [
            BaseAppBar.custom(
              backgroundColor: Colors.transparent,
              showBack: true,
              backColor: Colors.white,
              title: Text(
                K.profile_invite_for_gift,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              actions: <Widget>[
                GestureDetector(
                  onTap: _gotoRuleIntroduction,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(end: 20),
                    alignment: AlignmentDirectional.centerEnd,
                    child: R.img('heartpass/ic_setting_rule.webp',
                        width: 26,
                        height: 26,
                        package: ComponentManager.MANAGER_BASE_ROOM),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                        border: Border.all(
                            color: const Color(0x33FFFFFF), width: 2),
                      ),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: CommonAvatar(
                            size: 60,
                            path: Session.icon,
                            shape: BoxShape.circle,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsetsDirectional.only(start: 12),
                          child: Text(
                            Session.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsetsDirectional.only(start: 12),
                          child: Row(
                            children: [
                              Text(
                                K.profile_invite_code_prefix,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                              Container(
                                padding:
                                    const EdgeInsetsDirectional.only(top: 2),
                                child: Text(
                                  _data!.inviteCode,
                                  style: TextStyle(
                                      fontFamily: Util.numFontFamily,
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              GestureDetector(
                                onTap: _copyInviteCode,
                                child: Container(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 4, end: 4, bottom: 1),
                                    margin: const EdgeInsetsDirectional.only(
                                        start: 4),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFFDFF74),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                      K.profile_copy,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFFFDFF74)),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
        Positioned.fill(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 84,
                margin: const EdgeInsetsDirectional.only(
                    start: 20, end: 20, top: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(width: 0.1, color: const Color(0x14202020)),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        spreadRadius: 2,
                        blurRadius: 12,
                        color: Color(0x0A000000))
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _data!.totalReward,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        Container(
                          margin: const EdgeInsetsDirectional.only(top: 3),
                          child: Text(
                            K.profile_invite_reward_total,
                            style: const TextStyle(
                                color: Color(0x66202020), fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _data!.weekReward,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        Container(
                          margin: const EdgeInsetsDirectional.only(top: 3),
                          child: Text(
                            K.profile_invite_reward_week,
                            style: TextStyle(
                                color: const Color(0x66202020),
                                fontSize: 13,
                                fontFamily: Util.fontFamily),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }

  _buildInviteList() {
    if (_data!.inviteList.isEmpty) {
      return Expanded(
          child: Container(
        alignment: Alignment.center,
        child: ErrorData(
          error: BaseK.K.no_data,
        ),
      ));
    }
    return Expanded(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Container(
            margin:
                const EdgeInsetsDirectional.only(start: 20, end: 16, top: 18),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                InvitedList item = _data!.inviteList[index];
                return GestureDetector(
                  onTap: () {
                    _onInviteListItemClick(item);
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CommonAvatar(
                              path: item.icon,
                              size: 52,
                              shape: BoxShape.circle,
                            ),
                            Container(
                              margin:
                                  const EdgeInsetsDirectional.only(start: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 109,
                                      child: Text(item.userName,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF202020)),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      R.img('ic_invite_user_id.png',
                                          width: 16,
                                          height: 16,
                                          package:
                                              ComponentManager.MANAGER_PROFILE),
                                      Container(
                                        margin:
                                            const EdgeInsetsDirectional.only(
                                                start: 2),
                                        child: Text(
                                          Utility.uidToString(
                                              item.userId.toString()),
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Color(0x99202020),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        _buildInviteStatus(item),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _data!.inviteList.length,
            ),
          )),
    );
  }

  _buildInviteStatus(InvitedList item) {
    if (item.status == 0) {
      //待验证
      return Text(K.profile_invite_status_checkin,
          style: const TextStyle(fontSize: 13, color: Color(0x66202020)));
    } else if (item.status == 1) {
      //奖励中
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            item.outReward,
            style: const TextStyle(
                color: Color(0xFFFF8300),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            K.profile_invite_status_success,
            style: const TextStyle(color: Color(0x66202020), fontSize: 11),
          ),
        ],
      );
    } else {
      //验证失败
      return Text(K.profile_invite_status_fail,
          style: const TextStyle(fontSize: 13, color: Color(0xFFFF6A45)));
    }
  }

  _onInviteListItemClick(InvitedList item) {
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, item.userId);
  }

  _gotoRuleIntroduction() {
    BaseWebviewScreen.show(context,
        url: Util.getHelpUrlWithQStr('k99'), title: K.profile_invite_for_gift);
  }

  _gotoInvite() {
    String url =
        'https://page.${System.mainDomain}/tools/hg-share/invite?nickName=${Session.name}&inviteCode=${Session.uid}&avatarUrl=${Session.icon}';
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(context, Session.uid,
        shareInfo: ShareInfo(
            url: url,
            title: K.profile_invite_share_title,
            type: 1,
            desc: K.profile_invite_share_desc,
            wxUsername: '',
            wxPath: '',
            icon:
                'https://proxyimg.happyxq.cc.cn/static/bbpd/highsing2022052501.png'));
  }

  _copyInviteCode() {
    Clipboard.setData(ClipboardData(text: '${Session.uid}'));
    Fluttertoast.showCenter(msg: K.profile_invite_code_cppy_clipboard);
  }
}
