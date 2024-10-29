import 'dart:ui' as Ui;

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class BioBlock extends StatefulWidget {
  final VoidCallback? onSuccess;

  const BioBlock({super.key, this.onSuccess});

  @override
  _State createState() => _State();

  static OverlayEntry? _overlayEntry;

  static bool isEmpty() {
    return _overlayEntry == null;
  }

  static show([VoidCallback? onSuccess]) {
    hide();
    var overlayState = Overlay.of(System.context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return BioBlock(onSuccess: onSuccess);
    });
    overlayState.insert(overlayEntry);
    _overlayEntry = overlayEntry;
  }

  static hide() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class _State extends State<BioBlock> {
  late ISettingManager _settingManager;

  @override
  void initState() {
    super.initState();
    _settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    _verifyBio();
  }

  _verifyBio() async {
    if (await _settingManager.canUseBioLogin()) {
      bool ok = await _settingManager.authBio();
      if (ok) {
        //remove block
        if (widget.onSuccess != null) widget.onSuccess!();
        BioBlock.hide();
        Log.d("remove hide");
      } else {
        //提示要登录
        ILoginManager loginManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_LOGIN);
        loginManager.show(context, isBarrierDismissible: false);

        BioBlock.hide();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: Ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
