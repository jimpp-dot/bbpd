import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';

///
///
class WolfGuideGetRoleDialog extends StatefulWidget {
  final GetRoleData? data;
  final WolfModel wolfModel;

  const WolfGuideGetRoleDialog({super.key, this.data, required this.wolfModel});

  static show(BuildContext context,
      {Key? key, GetRoleData? data, required WolfModel wolfModel}) async {
    eventCenter.emit(EventConstant.EventWolfDialogClose);

    await showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: _buildMaterialDialogTransitions,
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return WolfGuideGetRoleDialog(
              key: key, data: data, wolfModel: wolfModel);
        });
  }

  static Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  @override
  _WolfGuideGetRoleDialogState createState() => _WolfGuideGetRoleDialogState();
}

class _WolfGuideGetRoleDialogState extends State<WolfGuideGetRoleDialog> {
  RoleItem? _selectedItem;

  RoleItem? get selectedItem {
    if (_selectedItem != null) return _selectedItem;

    RoleResultItem? roleResultItem;
    for (var item in widget.data!.positionRoles) {
      if (item.uid == Session.uid) {
        roleResultItem = item;
        break;
      }
    }
    if (roleResultItem == null) return null;

    for (var item in widget.data!.roles) {
      if (item.roleKey == roleResultItem.roleKey) {
        _selectedItem = item;
        break;
      }
    }
    return _selectedItem;
  }

  Widget buildBottom() {
    return Text(
      R.string('room_un_get_identity_no_consume'),
      style: R.textStyle.caption.copyWith(color: const Color(0xB3622817)),
    );
  }

  Widget _buildRoleItem(BuildContext context, RoleItem item) {
    String rolePath = _getImgPath(item.role);
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 100,
        height: 166,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            if (selectedItem != null && selectedItem!.role == item.role)
              R.img('wolfv2/wolf_get_role_selected_bg.svg',
                  width: 100,
                  height: 166,
                  package: ComponentManager.MANAGER_WERE_WOLF),
            R.img(rolePath,
                width: 94,
                height: 156,
                package: ComponentManager.MANAGER_WERE_WOLF),
            if (item.price >= 0)
              PositionedDirectional(
                bottom: 15,
                end: 12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      MoneyConfig.moneyIcon,
                      fit: BoxFit.contain,
                      width: 14.0,
                      height: 14.0,
                    ),
                    const SizedBox(width: 3),
                    Text(MoneyConfig.moneyNum(item.price * 100),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  String _getImgPath(WolfRole role) {
    switch (role) {
      case WolfRole.Werewolf:
        return 'wolfv2/role/img_role_wolf.webp';
      case WolfRole.Seer:
        return 'wolfv2/role/img_role_seer.webp';
      case WolfRole.Witch:
        return 'wolfv2/role/img_role_witch.webp';
      case WolfRole.Guard:
        return 'wolfv2/role/img_role_guard.webp';
      case WolfRole.Hunter:
        return 'wolfv2/role/img_role_hunter.webp';
      case WolfRole.Popular:
        return 'wolfv2/role/img_role_popular.webp';
      default:
        return 'wolfv2/role/img_role_popular.webp';
    }
  }

  Widget _buildRoles(BuildContext context) {
    return Wrap(
      spacing: 9,
      runSpacing: 16,
      children:
          widget.data!.roles.map((_) => _buildRoleItem(context, _)).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventWolfDialogClose, _close);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null || widget.data!.roles.isEmpty)
      return const SizedBox();
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor: const Color(0xFF503E9D),
            body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Container(
                  height: Util.height,
                  width: Util.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(R.imagePath(
                        "wolfv2/wolf_get_role_bg.webp",
                        package: ComponentManager.MANAGER_WERE_WOLF)),
                    fit: BoxFit.fill,
                  )),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 80),
                      Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 66, end: 66),
                          child: R.img('wolfv2/wolf_get_role_title.webp',
                              package: ComponentManager.MANAGER_WERE_WOLF,
                              fit: BoxFit.contain)),
                      const SizedBox(height: 12),
                      _buildRoles(context),
                      const Spacer(),
                      _buildPayBtn(),
                      const SizedBox(height: 30),
                      _buildTimer(),
                      const SizedBox(height: 5),
                      Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 91, end: 91),
                          child: R.img('wolfv2/wolf_get_role_bottom_icon.webp',
                              package: ComponentManager.MANAGER_WERE_WOLF,
                              fit: BoxFit.contain)),
                      SizedBox(height: 40 + Util.iphoneXBottom)
                    ],
                  ),
                ))));
  }

  Widget _buildPayBtn() {
    return GestureDetector(
        onTap: () {
          if (ModalRoute.of(context)?.isCurrent == true) {
            Navigator.of(context).pop();
            //购买身份点击
            Tracker.instance
                .track(TrackEvent.wolf_ai_role_click, properties: {'op': '1'});
          }
        },
        child: Container(
          width: 113,
          height: 37,
          alignment: Alignment.topCenter,
          padding: const EdgeInsetsDirectional.only(top: 3),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(R.imagePath("wolfv2/wolf_role_pay_btn.webp",
                package: ComponentManager.MANAGER_WERE_WOLF)),
            fit: BoxFit.fill,
          )),
          child: Text(K.wolf_role_pay,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
        ));
  }

  Widget _buildTimer() {
    int timer = widget.wolfModel.data.currentStateLeaveTime;
    return TimerWidget(
        key: GlobalKey(),
        stop: Duration(seconds: timer),
        onTick: () {
          int curtTimer = widget.wolfModel.data.currentStateLeaveTime;
          if (curtTimer <= 1) {
            if (ModalRoute.of(context)?.isCurrent == true) {
              Navigator.of(context).pop();
            }
          }
        },
        builder: (context) {
          int curtTimer = widget.wolfModel.data.currentStateLeaveTime;
          if (curtTimer <= 0) {
            return Container();
          }

          return Text.rich(TextSpan(children: [
            TextSpan(
                text: K.wolf_get_role_timer,
                style: const TextStyle(color: Colors.white, fontSize: 13)),
            TextSpan(
                text: '（$curtTimer）',
                style: const TextStyle(color: Color(0xFFFCAA0B), fontSize: 13))
          ]));
        });
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventWolfDialogClose, _close);
    super.dispose();
  }

  _close(String type, dynamic data) async {
    if (ModalRoute.of(context)?.isCurrent == true) {
      Navigator.of(context).pop();
    }
  }
}
