import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'join_group_repository.dart';
import 'join_group_presenter.dart';
import 'package:shared/model/fans_group_model.dart';
import '../../k.dart';
import 'package:shared/util/color_constant.dart';

/// 入团底部对话框
class JoinGroupBottomSheet extends StatefulWidget {
  final int _groupId;
  final String _refer;

  const JoinGroupBottomSheet(int groupId, String refer, {Key? key})
      : _groupId = groupId,
        _refer = refer,
        super(key: key);

  @override
  _JoinGroupBottomSheetState createState() => _JoinGroupBottomSheetState();

  static Future<bool?> show<T>(
      BuildContext context, int groupId, String refer) {
    return displayModalBottomSheet<bool>(
        context: context,
        builder: (BuildContext context) {
          return JoinGroupBottomSheet(groupId, refer);
        });
  }
}

class _JoinGroupBottomSheetState extends State<JoinGroupBottomSheet> {
  FansGroupInfo? group;
  JoinGroupPresenter? _joinPresenter;

  @override
  void initState() {
    super.initState();
    _loadFromNetwork();
  }

  void _loadFromNetwork() async {
    FansGroupInfo? group =
        await JoinGroupRepository.loadGroupFromNetwork(widget._groupId);
    if (group != null) {
      _joinPresenter = JoinGroupPresenter(
          context, group.groupId ?? 0, group.uid, group.gift, widget._refer);
      _joinPresenter!.setOnPayedCallback(_onPayed);
    }
    if (!mounted) return;
    setState(() {
      group = group;
    });
  }

  void _onPayed() {
    Navigator.of(context).pop(true);
    eventCenter.emit(
        EventConstant.EventJoinFansGroupChanged, 'join_fans_group');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 360, child: Stack(children: [_background(), _content()]));
  }

  /// 上方带圆角的白色背景
  Widget _background() => Container(
      margin: const EdgeInsetsDirectional.only(top: 30),
      decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16))));

  /// 正式内容区
  Widget _content() => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _groupIcon(group?.iconUrl),
            _groupInfo(group?.joinTitle ?? '', group?.memberNum ?? 0),
            _summary(group?.joinNote ?? ''),
            _gifts(group?.rights),
            _joinGroupButton(group?.gift?.name ?? '')
          ]);

  /// 团icon
  Widget _groupIcon(String? icon) {
    if (icon?.isEmpty ?? true) return const SizedBox(width: 88, height: 88);
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 4.0, color: R.color.mainBgColor),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              fadeInDuration: const Duration(milliseconds: 1),
              imageUrl: icon!,
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
          )),
    );
  }

  /// 如：楚楚动人的粉丝团·500人
  Widget _groupInfo(String title, int memberNum) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              K.group_join_group_title([title, '$memberNum']),
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// 加入即享粉丝专属权益
  Widget _summary(String joinNote) => Container(
        margin: const EdgeInsetsDirectional.only(top: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _summaryLine,
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                joinNote,
                style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            _summaryLine,
          ],
        ),
      );

  Widget get _summaryLine => SizedBox(
      width: 60,
      height: 1,
      child: DecoratedBox(
          decoration:
              BoxDecoration(color: R.color.mainTextColor.withOpacity(0.1))));

  /// 礼物列表
  Widget _gifts(List<FansGroupRight>? rights) {
    if (rights?.isEmpty ?? true)
      return const SizedBox(width: double.infinity, height: 92);
    List<Widget> widgets = [];
    int size = rights?.length ?? 0;
    if (size > 3) size = 3;
    for (var i = 0; i < size; i++) {
      FansGroupRight right = rights![i];
      widgets.add(_giftItem(right.name ?? '', right.image ?? ''));
      if (i < size - 1) {
        widgets.add(const SizedBox(width: 74));
      }
    }
    return Container(
        margin: const EdgeInsetsDirectional.only(top: 24),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets));
  }

  /// 单个礼物
  Widget _giftItem(String name, String image) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: Util.parseIcon(image),
              fit: BoxFit.cover,
              width: 48,
              height: 48,
            ),
          ),
          Text(
            name,
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 13.0,
              color: R.color.secondTextColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          )
        ]);
  }

  /// "加入粉丝团"按钮
  Widget _joinGroupButton(String joinGiftName) => GestureDetector(
      onTap: () async {
        _joinPresenter?.join();
      },
      child: Container(
        height: 56,
        width: Util.width - 40,
        margin: const EdgeInsetsDirectional.only(
            top: 27, bottom: 34, start: 20, end: 20),
        padding: const EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
        alignment: AlignmentDirectional.center,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(colors: ColorConstant.joinGroupButtonColor),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                  TextSpan(text: K.group_join_fans_group, children: [
                    TextSpan(
                        text: K.group_one_join_gift([joinGiftName]),
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))
                  ]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500))
            ]),
      ));
}
