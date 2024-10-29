import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class MessageCountBadge extends StatefulWidget {
  final bool showBorder;

  const MessageCountBadge({Key? key, this.showBorder = false})
      : super(key: key);

  @override
  _MessageCountBadgeState createState() => _MessageCountBadgeState();
}

class _MessageCountBadgeState extends State<MessageCountBadge> {
  int _num = 0;

  @override
  Widget build(BuildContext context) {
    return (_num > 0)
        ? Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: widget.showBorder
                  ? Border.all(
                      color: R.color.mainBgColor,
                      width: 2,
                    )
                  : null,
            ),
            child: Container(
              height: 16.0,
              constraints: const BoxConstraints(minWidth: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: R.color.thirdBrightColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: _num >= 10 ? 4 : 0),
              alignment: Alignment.center,
              child: NumText(
                _num > 99 ? "99+" : _num.toString(),
                softWrap: false,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  @override
  void initState() {
    super.initState();
    eventCenter.addListeners(
      [Im.EventUnreadChanged, Im.EventConnChanged, Im.EventConnSuccess],
      _onChanged,
    );
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    _load();
  }

  @override
  void dispose() {
    eventCenter.removeListeners(
      [Im.EventUnreadChanged, Im.EventConnChanged, Im.EventConnSuccess],
      _onChanged,
    );
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    super.dispose();
  }

  void _load() async {
    try {
      int count = Util.parseInt(await Im.getTotalUnreadCount());
      if (mounted) {
        setState(() {
          _num = count;
        });
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  void _onLogout(String type, dynamic data) {
    _num = 0;
    if (mounted) setState(() {});
  }

  void _onChanged(String type, dynamic data) {
    if (type == Im.EventUnreadChanged) {
      Map res = data;
      int left = Util.parseInt(res['left']);
      if (left == 0) _load();
    } else if (type == Im.EventConnChanged || type == Im.EventConnSuccess) {
      _load();
    }
  }
}
