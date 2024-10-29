import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/roomRepository.dart';
import 'package:chat_room/src/base/model/room_simple_user_profile.dart';

///
class RoomUnableRecommendUserDialog extends StatefulWidget {
  final String? content;
  final int? uid;

  const RoomUnableRecommendUserDialog({super.key, this.content, this.uid});

  @override
  _RoomUnableRecommendUserDialogState createState() {
    return _RoomUnableRecommendUserDialogState();
  }
}

class _RoomUnableRecommendUserDialogState
    extends State<RoomUnableRecommendUserDialog> {
  bool _showLoading = true;
  RoomSimpleUserProfile? _roomSimpleUserProfile;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///获取数据
  void init() async {
    _roomSimpleUserProfile =
        await RoomRepository.getProfileInfo(widget.uid ?? 0);
    _showLoading = false;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];

    if (_showLoading) {
      res.add(
        const Loading(),
      );
    } else {
      if (_roomSimpleUserProfile != null &&
          _roomSimpleUserProfile!.data != null) {
        res.add(
          Container(
            height: 6.0,
          ),
        );
        res.add(
          ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  "${System.imageDomain}${_roomSimpleUserProfile!.data!.icon}!head100",
              width: 40.0,
              height: 40.0,
              fit: BoxFit.fill,
            ),
          ),
        );
        res.add(
          Container(
            height: 6.0,
          ),
        );
        res.add(
          Container(
            width: 220,
            alignment: AlignmentDirectional.center,
            child: Text(
              _roomSimpleUserProfile!.data!.name,
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }
      res.add(
        Container(
          width: 220,
          height: 74.0,
          alignment: AlignmentDirectional.center,
          child: Text(
            '${widget.content}',
            style: TextStyle(
              fontSize: 13.0,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
      if (_roomSimpleUserProfile != null &&
          _roomSimpleUserProfile!.data != null) {
        res.add(
          GestureDetector(
            child: Container(
              width: 220.0,
              height: 44.0,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: R.color.mainBrandColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(22.0),
                ),
              ),
              child: Text(
                _roomSimpleUserProfile!.data!.sex == 1
                    ? K.room_recommend_user_find_he
                    : K.room_recommend_user_find_she,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pop(true);
              if (widget.uid != null && widget.uid! > 0) {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(
                    Constant.context, widget.uid!,
                    refer:
                        const PageRefer('room_unable_recommend_user_dialog'));
              }
            },
          ),
        );
      }
    }

    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: 280.0,
            height: 222.0,
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  width: 280.0,
                  height: 222.0,
                  alignment: AlignmentDirectional.center,
                  // color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: res,
                  ),
                ),
                PositionedDirectional(
                  end: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      alignment: Alignment.center,
                      child: R.img('rank_dialog_close.svg',
                          package: ComponentManager.MANAGER_RANK,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                          color: R.color.mainTextColor),
                    ),
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
