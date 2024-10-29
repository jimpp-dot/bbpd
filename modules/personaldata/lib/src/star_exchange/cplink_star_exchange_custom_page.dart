import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/star_exchange/pb/generated/relation_conver.pb.dart';
import 'package:personaldata/src/star_exchange/star_exchange_repo.dart';

/// 集星兑换-定制主页装扮页
class CpLinkStarExchangeCustomPage extends StatefulWidget {
  final ConvertHomeData_TypeData_ShowItem item;
  final ConvertHomeData_CustomData customData;

  const CpLinkStarExchangeCustomPage(
      {super.key, required this.item, required this.customData});

  static Future show(
      BuildContext context,
      ConvertHomeData_TypeData_ShowItem item,
      ConvertHomeData_CustomData customData) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          CpLinkStarExchangeCustomPage(item: item, customData: customData),
      settings: const RouteSettings(name: '/CpLinkStarExchangeCustomPage'),
    ));
  }

  @override
  State<CpLinkStarExchangeCustomPage> createState() =>
      _CpLinkStarExchangeCustomPageState();
}

class _CpLinkStarExchangeCustomPageState
    extends State<CpLinkStarExchangeCustomPage> {
  int _selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF5F5F5);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: BaseAppBar(
        widget.item.desc,
        backgroundColor: bgColor,
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomButton.of(
        title:
            K.personal_x_count_custom(['${widget.customData.reduceStarNum}']),
        margin: EdgeInsetsDirectional.only(
            bottom: 14, top: 16, start: 16.dp, end: 16.dp),
        onTap: () async {
          if (_selectIndex < 0) {
            Fluttertoast.showCenter(msg: K.personal_plz_select_custom_target);
          } else {
            CommonLoading.show();
            final rsp = await StarExchangeRepo.custom(
                widget.customData.userList[_selectIndex].uid);
            CommonLoading.dismiss();
            if (rsp.success) {
              Fluttertoast.showCenter(msg: K.personal_custom_ok);
              Navigator.pop(context, true);
            } else {
              Fluttertoast.showCenter(msg: rsp.msg);
            }
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildTopBlock(),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: 16.dp, end: 16.dp, top: 15, bottom: 14),
          child: Text(
            widget.customData.desc,
            style: TextStyle(fontSize: 12, color: R.color.mainTextColor),
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.only(start: 16.dp, bottom: 6),
          child: Row(
            children: [
              Text(
                K.personal_select_target,
                style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.customData.userList.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildListItem(widget.customData.userList[index], index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(ConvertHomeData_CustomData_user user, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (_selectIndex != index) {
          _selectIndex = index;
        } else {
          _selectIndex = -1;
        }
        refresh();
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(
            start: 16.dp, end: 16.dp, top: 6, bottom: 6),
        child: Row(
          children: [
            CommonAvatar(
              path: user.icon,
              shape: BoxShape.circle,
              size: 40,
              onTap: () {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, user.uid);
              },
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        color: R.color.mainTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    K.personal_relation_x([user.relationName]),
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            _selectIndex == index
                ? const CheckBoxChecked(width: 21, height: 21)
                : const CheckBoxUnchecked(width: 21, height: 21),
          ],
        ),
      ),
    );
  }

  Widget _buildUserIcon(String icon) {
    double avatarSize = 35.dp;
    return icon.isEmpty
        ? Container(
            width: avatarSize,
            height: avatarSize,
            alignment: AlignmentDirectional.center,
            child: R.img(Assets.personaldata$star_exchange_ic_add_png,
                width: 24.dp, height: 24.dp),
          )
        : CommonAvatar(
            path: icon,
            shape: BoxShape.circle,
            size: avatarSize,
          );
  }

  Widget _buildUserName(String name) {
    return Container(
      width: 60.dp,
      height: 14.dp,
      alignment: AlignmentDirectional.center,
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 7.dp,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildTopBlock() {
    return Container(
      width: 343.dp,
      height: 138.dp,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 65.dp,
            start: 25.dp,
            child: _buildUserIcon(Session.icon),
          ),
          PositionedDirectional(
            top: 65.dp,
            start: 94.dp,
            child: _buildUserIcon(_selectIndex < 0
                ? ''
                : widget.customData.userList[_selectIndex].icon),
          ),
          CachedNetworkImage(
            imageUrl: widget.customData.bg,
            width: 343.dp,
            height: 138.dp,
          ),
          PositionedDirectional(
            top: 106.5.dp,
            start: 15.dp,
            child: _buildUserName(Session.name),
          ),
          PositionedDirectional(
            top: 106.5.dp,
            start: 79.dp,
            child: _buildUserName(_selectIndex < 0
                ? K.personal_plz_select_custom_target
                : widget.customData.userList[_selectIndex].name),
          ),
        ],
      ),
    );
  }
}
