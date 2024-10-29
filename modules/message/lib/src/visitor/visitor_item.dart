import 'package:shared/shared.dart' hide UserBean;
import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:message/src/model/visitor_bean.dart';

class VisitorItem extends StatefulWidget {
  static const double ITEM_EXTENT = 72;

  final bool self; //是不是"我看过谁"
  final UserBean data;
  final ValueChanged<int>? onDelete;
  final PageRefer? refer;

  const VisitorItem(
      {super.key,
      required this.self,
      required this.data,
      this.onDelete,
      this.refer});

  @override
  _VisitorItemState createState() {
    return _VisitorItemState();
  }
}

class _VisitorItemState extends State<VisitorItem> {
  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 删除某个用户的访客记录
  Future<bool> _deleteRecord(int uid) async {
    String url = '${System.domain}guest/delete?uid=$uid';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        if (widget.onDelete != null) {
          widget.onDelete!(widget.data.uid);
        }
        return true;
      } else {
        Toast.show(context, res['msg']);
      }
    } catch (e) {
      Log.d(e);
    }
    return false;
  }

  _setVisibility() async {
    int visibility = widget.data.visible == 1 ? 0 : 1;
    String url =
        '${System.domain}guest/visible?uid=${widget.data.uid}&valid=$visibility';
    XhrResponse response = await Xhr.getJson(url);
    if (!mounted) return;
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        Toast.show(context, K.msg_set_success);
        setState(() {
          widget.data.visible = visibility;
        });
      } else {
        Toast.show(context, res['msg'] ?? '');
      }
    } else {
      Toast.show(context, response.error.toString());
    }
  }

  onLongTap() async {
    if (widget.self) return; //"我看过谁"，长按删除服务端未实现，删成"谁看过我"了；接口区分不了

    List<SheetItem> res = [];
    res.add(SheetItem(K.msg_delete, "remove"));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (result.value?.key == 'remove') {
      _deleteRecord(widget.data.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _personalDataManager.openImageScreen(context, widget.data.uid,
            refer: widget.refer);
      },
      onLongPress: onLongTap,
      child: Container(
        height: VisitorItem.ITEM_EXTENT,
        padding: const EdgeInsetsDirectional.only(end: 16),
        alignment: Alignment.center,
        color: widget.self == false && widget.data.isnew > 0
            ? R.colors.mainBrandColor.withOpacity(0.05)
            : null,
        child: Row(
          children: <Widget>[
            // 在线小圆点

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[
                  CommonAvatar(
                    path: widget.data.icon,
                    size: 52,
                    shape: BoxShape.circle,
                  ),
                  PositionedDirectional(
                    end: 4,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: widget.data.online > 0
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              color: R.colors.fiveBrightColor,
                              border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid))
                          : null,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: _buildTitle(
                                  widget.data.name ?? '', widget.data.titleNew),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 4, end: 4),
                              child: UserSexAndAgeWidget(
                                sex: widget.data.sex == 'male' ? 1 : 2,
                                age: widget.data.age,
                                width: 31,
                                height: 14,
                              ),
                            ),
                            widget.data.isCanShowAlarmLabel
                                ? Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 8),
                                    child: TextLabelWidget.smallAlarmLabel(
                                        widget.data.alarmLabel),
                                  )
                                : const SizedBox(width: 4)
                          ],
                        ),
                      ),
                      Text(
                        Utility.getDateDiff(widget.data.time),
                        style: TextStyle(
                          color: R.colors.thirdTextColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (!widget.self) _buildVisitTimes(),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 8, start: widget.self ? 0 : 4),
                            child: Text(
                              widget.data.src ?? '',
                              style: TextStyle(
                                fontSize: 13,
                                color: R.colors.thirdTextColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        if (widget.self) _buildVisibleBtn()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String name, int titleNew) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 17,
          fontFamily: Util.fontFamily),
    );
  }

  /// 第几次访问
  Widget _buildVisitTimes() {
    return Container(
      padding: const EdgeInsets.only(
        left: 2,
        top: 0,
        right: 2,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: R.colors.mainBrandColor,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        K.msg_visit_times(
            ['${widget.data.vnum < 100 ? widget.data.vnum : '99+'}']),
        style: TextStyle(
          color: R.colors.mainBrandColor,
          fontSize: 10,
        ),
      ),
    );
  }

  /// 对ta隐身/取消隐身
  Widget _buildVisibleBtn() {
    return GestureDetector(
      onTap: () {
        _setVisibility();
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 6,
          top: 3,
          right: 6,
          bottom: 3,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.data.visible == 0
                ? R.colors.thirdTextColor
                : R.colors.mainBrandColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.data.visible == 0
              ? K.msg_unset_invisible
              : K.msg_set_invisible,
          style: TextStyle(
            color: widget.data.visible == 0
                ? R.colors.thirdTextColor
                : R.colors.mainBrandColor,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
