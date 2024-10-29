import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/checkin.pb.dart';
import 'package:shared/src/sign/sign_api.dart';
import 'package:shared/src/sign/sign_page.dart';
import 'package:flutter/material.dart';

import '../../K.dart';
import '../../assets.dart';

enum PAGESTYLE {
  ROOKIE, // 新手签到
  FORWARD, // 进阶签到
  FORWARD_ONLY //仅进阶签到
}

extension on PAGESTYLE {
  String getBg() {
    switch (this) {
      case PAGESTYLE.ROOKIE:
        return BaseAssets.shared$sign_header_bg_new_webp;
      case PAGESTYLE.FORWARD:
        return BaseAssets.shared$sign_header_bg_forward_1_webp;
      case PAGESTYLE.FORWARD_ONLY:
        return BaseAssets.shared$sign_header_bg_forward_2_webp;
    }
  }

  int getPageType() {
    switch (this) {
      case PAGESTYLE.ROOKIE:
        return 0;
      case PAGESTYLE.FORWARD:
        return 1;
      case PAGESTYLE.FORWARD_ONLY:
        return 1;
    }
  }
}

class SignDialog extends StatefulWidget {
  final CheckInHomeRsp_Data? defRookieData;
  final PAGESTYLE pageStyle;

  const SignDialog({Key? key, required this.pageStyle, this.defRookieData})
      : super(key: key);

  static Future<void> show(BuildContext context,
      {required PAGESTYLE pageStyle,
      CheckInHomeRsp_Data? defRookieData}) async {
    displayModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        maxHeightRatio: 0.75,
        defineBarrierColor: Colors.black.withOpacity(0.7),
        builder: (context) {
          return SignDialog(pageStyle: pageStyle, defRookieData: defRookieData);
        });
  }

  @override
  State<StatefulWidget> createState() => SignDialogState();
}

class SignDialogState extends State<SignDialog> {
  CheckInHomeRsp_Data? rookieData; //新手签到
  CheckInHomeRsp_Data? forwardData; //进阶签到
  bool loading = true;
  bool error = false;
  late PAGESTYLE _currStyle;

  @override
  void initState() {
    super.initState();
    _currStyle = widget.pageStyle;
    _load();
  }

  void _load({bool forceRefresh = false}) async {
    loading = true;
    error = false;
    if (_currStyle == PAGESTYLE.ROOKIE) {
      if (widget.defRookieData != null &&
          widget.pageStyle == PAGESTYLE.ROOKIE &&
          !forceRefresh) {
        rookieData = widget.defRookieData!;
      } else if (rookieData == null || forceRefresh) {
        CheckInHomeRsp rsp = await SignApi.getSignHome(0);
        if (rsp.success) {
          rookieData = rsp.data;
        } else {
          error = true;
        }
      }
    } else if (_currStyle == PAGESTYLE.FORWARD ||
        _currStyle == PAGESTYLE.FORWARD_ONLY) {
      if (forwardData == null || forceRefresh) {
        CheckInHomeRsp rsp = await SignApi.getSignHome(1);
        if (rsp.success) {
          forwardData = rsp.data;
        } else {
          error = true;
        }
      }
    }
    loading = false;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Loading();
    }
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
            margin: EdgeInsetsDirectional.only(top: 100.dp),
            color: const Color(0xFFEDE6F8),
            width: Util.width),
        _buildHeader(),
        // PositionedDirectional(
        //     top: 65.dp, child: Container(alignment: Alignment.topLeft,
        //     padding: EdgeInsetsDirectional.only(start: 6.dp, end: 2.dp, top: 2.dp, bottom: 6.dp),
        //     decoration: commonBoxDecorationWithParamsBeginAndEnd([const Color(0xFFFF67A3),const Color(0xFFFFBBD7)], 6, Alignment.centerLeft, Alignment.centerRight),
        //     margin: EdgeInsetsDirectional.only(start: 20.dp),
        //     child: _buildTips())),
        error
            ? ErrorData(onTap: () {
                _load(forceRefresh: true);
              })
            : Container(
                margin: EdgeInsets.only(top: 30),
                child: SignPage(
                    pageStyle: _currStyle,
                    bean: _currStyle.getPageType() == 0
                        ? rookieData!
                        : forwardData!))
      ],
    );
  }

  Widget _buildTips() {
    if (_currStyle == PAGESTYLE.ROOKIE) {
      return Text(K.sign_tips_rookie,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.normal));
    } else if (_currStyle == PAGESTYLE.FORWARD) {
      return Text(K.sign_tips_forward,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.normal));
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildHeader() {
    return GestureDetector(
      onTapUp: (details) {
        Offset position = details.localPosition;
        // if (_currStyle == PAGESTYLE.FORWARD_ONLY) {
        //   return;
        // } else
        //
        //   if (_currStyle == PAGESTYLE.ROOKIE && position.dx >= Util.width / 2) {
        //   _currStyle = PAGESTYLE.FORWARD;
        //   refresh();
        //   _load();
        // }
        // else
        if (_currStyle == PAGESTYLE.FORWARD && position.dx < Util.width / 2) {
          _currStyle = PAGESTYLE.ROOKIE;
          refresh();
          _load();
        }
      },
      child: R.img(_currStyle.getBg(), width: Util.width),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
