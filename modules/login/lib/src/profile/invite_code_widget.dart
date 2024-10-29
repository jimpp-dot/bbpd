import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/k.dart';

import '../../assets.dart';
import 'invitation_code_dialog.dart';
import 'profile_data.dart';

///填写邀请码
class InviteCodeWidget extends StatefulWidget {
  final bool formStyle;

  const InviteCodeWidget({Key? key, this.formStyle = false}) : super(key: key);

  @override
  _InviteCodeWidgetState createState() {
    return _InviteCodeWidgetState();
  }
}

class _InviteCodeWidgetState extends State<InviteCodeWidget> {
  bool _showInviteCode = false;

  @override
  void initState() {
    super.initState();
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    _showInviteCode = loginManager.getShowInviteCode();
  }

  @override
  Widget build(BuildContext context) {
    if (_showInviteCode) {
      return _buildInvitationCode();
    }
    return const SizedBox.shrink();
  }

  Widget _buildInvitationCode() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        String? code = await InvitationCodeDialog.show(context,
            code: ProfileData.inviteCode);
        ProfileData.inviteCode = code ?? '';
        refresh();
      },
      child: widget.formStyle ? _buildFormStyleBody() : _buildCommonStyleBody(),
    );
  }

  Widget _buildFormStyleBody() {
    String text = ProfileData.inviteCode.isEmpty
        ? K.login_optional
        : ProfileData.inviteCode;
    Color textColor = ProfileData.inviteCode.isEmpty
        ? R.color.secondTextColor
        : R.color.mainTextColor;
    return Container(
      width: Util.width - 40 * 2,
      height: 48 * Util.ratio,
      padding: const EdgeInsetsDirectional.only(start: 24, end: 20),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          Text(
            K.login_invite_code,
            style: TextStyle(color: R.color.secondTextColor, fontSize: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: R.img(
              Assets.login$ic_login_next_svg,
              color: R.color.secondTextColor,
              package: ComponentManager.MANAGER_LOGIN,
              width: 18,
              height: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommonStyleBody() {
    bool hasInviteCode = !Util.isStringEmpty(ProfileData.inviteCode);
    String text;
    if (hasInviteCode) {
      text = K.login_friend_invitation_code([ProfileData.inviteCode]);
    } else {
      text = K.login_invitation_code_input;
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          R.img(Assets.login$ic_invite_code_webp,
              package: ComponentManager.MANAGER_LOGIN, width: 20, height: 20),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              style: R.textStyle.medium16
                  .copyWith(color: Colors.white.withOpacity(0.5)),
            ),
          ),
          if (!hasInviteCode)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 2),
              child: R.img(
                'icon_next_fq.svg',
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 16,
                height: 16,
                color: Colors.white.withOpacity(0.5),
              ),
            )
        ],
      ),
    );
  }
}
