import 'package:shared/shared.dart';
import '../../assets.dart';
import '../../k.dart';
import 'config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayPlayGame extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;

  const DisplayPlayGame(
      {super.key, required this.message, required this.extra, this.direction});

  @override
  State<StatefulWidget> createState() {
    return _DisplayPlayGameState();
  }
}

class _DisplayPlayGameState extends State<DisplayPlayGame> {
  MessageContent get message => widget.message;

  Map get extra => widget.extra;

  MessageDisplayDirection? get direction => widget.direction;
  String? errorMsg;
  int btnState = -1;

  @override
  void initState() {
    super.initState();
    requestBtn();
  }

  @override
  Widget build(BuildContext context) {
    Widget? btnRow = _renderBtnRow(btnState);
    var view = Container(
      width: 188,
      margin: const EdgeInsetsDirectional.only(top: 3, bottom: 3),
      child: Column(
        children: [
          _renderGameRow(),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  message.content,
                  style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          btnRow ?? loadingView(),
        ],
      ),
    );

    return view;
  }

  Widget loadingView() {
    return errorMsg != null
        ? GestureDetector(
            onTap: () {
              requestBtn();
            },
            child: const Padding(
              padding: EdgeInsetsDirectional.only(top: 3),
              child: Icon(Icons.refresh),
            ),
          )
        : const Padding(
            padding: EdgeInsetsDirectional.only(
              top: 5,
            ),
            child: CupertinoActivityIndicator(),
          );
  }

  Widget _renderGameRow() {
    String level = extra['level'] ?? '';
    return Row(
      children: <Widget>[
        CommonAvatar(
          path: extra['icon'] ?? '',
          size: 56,
          loadingWidget: const CupertinoActivityIndicator(),
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          suffix: null,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: level.isEmpty
              ? renderGameName()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    renderGameName(),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        R.img(
                            Util.parseInt(extra['certified']) == 1
                                ? Assets.chat$ic_game_verify_svg
                                : Assets.chat$ic_game_verify_false_svg,
                            width: 14,
                            height: 14,
                            package: ComponentManager.MANAGER_CHAT),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          level,
                          style: TextStyle(
                              color: R.colors.mainTextColor, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget renderGameName() {
    return Text(
      extra['game'] ?? '',
      style: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w500),
    );
  }

  Widget? _renderBtnRow(int btnState) {
    Widget? btnRow;

    if (btnState == 1 || btnState == 2 || btnState == 3) {
      String btnStr;
      if (btnState == 1) {
        btnStr = K.chat_has_accept;
      } else if (btnState == 2) {
        btnStr = K.chat_has_reject;
      } else {
        btnStr = K.chat_has_timeout;
      }
      btnRow = Container(
        width: 164,
        height: 31,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        margin: const EdgeInsetsDirectional.only(top: 12),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: R.colors.mainTextColor.withOpacity(0.1)),
            borderRadius: const BorderRadius.all(Radius.circular(16.5))),
        child: Text(
          btnStr,
          style: TextStyle(
            fontSize: 13,
            color: R.colors.thirdTextColor,
          ),
        ),
      );
    } else if (btnState == 0) {
      if ('${Session.uid}' == widget.message.senderId) {
        btnRow = Container(
          width: 164,
          height: 31,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
          margin: const EdgeInsetsDirectional.only(top: 12),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: R.colors.mainBrandGradientColors,
              ),
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(16.5))),
          child: Text(
            K.chat_game_waiting,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        );
      } else {
        btnRow = Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                clickBtn(false);
              },
              child: Container(
                width: 88,
                height: 31,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                margin: const EdgeInsetsDirectional.only(top: 12),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: R.colors.mainTextColor.withOpacity(0.1)),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.5))),
                child: Text(
                  K.chat_reject,
                  style: TextStyle(
                    fontSize: 13,
                    color: R.colors.mainTextColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                clickBtn(true);
              },
              child: Container(
                width: 88,
                height: 31,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                margin: const EdgeInsetsDirectional.only(top: 12),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: R.colors.mainBrandGradientColors,
                    ),
                    borderRadius: const BorderRadiusDirectional.all(
                        Radius.circular(15.5))),
                child: Text(
                  K.chat_accept,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      }
    }
    return btnRow;
  }

  void clickBtn(bool accept) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: DialogLoading(),
          );
        },
        barrierDismissible: false);
    bool result = await acceptRefuseRequest(accept);
    Navigator.of(context).pop();
    if (result) {
      setState(() {
        btnState = accept ? 1 : 2;
      });
    }
  }

  bool requesting = false;

  void requestBtn() async {
    if (requesting) {
      return;
    } else {
      requesting = true;
    }

    String msgId = '${extra['msgId']}';
    String url = '${System.domain}gamecard/reservePlayStatus?msgId=$msgId';
    try {
      XhrResponse response = await Xhr.getJson(url);
      requesting = false;
      if (response.error != null) {
        errorMsg = response.error.toString();
        if (mounted) {
          setState(() {});
        }
        return;
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        errorMsg = res['msg'] ?? R.array('xhr_error_type_array')[6];
        if (mounted) {
          setState(() {});
        }
      } else {
        try {
          btnState = Util.parseInt(res['data']['status'], -1);
          errorMsg = null;
          if (mounted) {
            setState(() {});
          }
        } catch (e) {
          errorMsg = R.array('xhr_error_type_array')[6];
          if (mounted) {
            setState(() {});
          }
        }
      }
    } catch (e) {
      errorMsg = e.toString();
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<bool> acceptRefuseRequest(bool accept) async {
    String url = '${System.domain}gamecard/answerReservePlay';
    try {
      String msgId = '${extra['msgId']}';
      Map<String, String> params = {
        'msgId': msgId,
        'type': accept ? 'accept' : 'reject',
      };
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Fluttertoast.showToast(
            msg: response.error.toString(), gravity: ToastGravity.CENTER);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        Fluttertoast.showToast(
            msg: res['msg'] ?? R.array('xhr_error_type_array')[6],
            gravity: ToastGravity.CENTER);
      } else {
        return true;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }

    return false;
  }
}
