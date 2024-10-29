import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

/// 礼物皮肤解锁弹窗
class GiftSkinUnlockDialog extends StatefulWidget {
  final VoidCallback? onComplete;
  final String? icon;
  final String? name;

  const GiftSkinUnlockDialog({Key? key, this.icon, this.name, this.onComplete})
      : super(key: key);

  static bool showing() {
    return _overlayEntry != null;
  }

  static hide() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static OverlayEntry? _overlayEntry;

  static _onComplete() {
    Log.d('_onComplete-----------------------');
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static show(BuildContext context, String icon, String name) {
    if (Util.appState != AppLifecycleState.resumed) return;
    hide();
    var overlayState = Overlay.of(System.context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return GiftSkinUnlockDialog(
          icon: icon, name: name, onComplete: _onComplete);
    });
    overlayState.insert(overlayEntry);
    _overlayEntry = overlayEntry;

    // _overlayEntry = OverlayEntry(builder: (context) {
    //   return GiftSkinUnlockDialog(
    //       icon: icon, name: name
    //   );
    // });
    // overlayState.insert(_overlayEntry);

    // return showGeneralDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    //     barrierColor: Colors.black.withOpacity(0.4),
    //     transitionDuration: const Duration(milliseconds: 300),
    //     transitionBuilder: (context, animation, secondaryAnimation, child) {
    //       return ScaleTransition(
    //         scale: CurvedAnimation(
    //           parent: animation,
    //           curve: Curves.easeOut,
    //         ),
    //         child: child,
    //       );
    //     },
    //     pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
    //       return ElasticScaleAnim(
    //         child: GiftSkinUnlockDialog(icon: icon, name: name),
    //       );
    //     });
  }

  @override
  _GiftSkinUnlockDialogState createState() => _GiftSkinUnlockDialogState();
}

class _GiftSkinUnlockDialogState extends State<GiftSkinUnlockDialog>
    with SingleTickerProviderStateMixin {
  // AnimationController? _alphaController;

  @override
  void initState() {
    super.initState();

    // final alphaDuration = Duration(milliseconds: 300);
    // _alphaController = AnimationController(
    //   duration: alphaDuration,
    //   vsync: this,
    // );
    // _alphaController.forward(from: 0.0);
  }

  _onCloseTaped(BuildContext context) {
    if (widget.onComplete != null) {
      widget.onComplete!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      alignment: AlignmentDirectional.center,
      child: ElasticScaleAnim(
        child: Container(
          height: 305,
          width: 311,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 16.0, bottom: 20, start: 20, end: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      K.gift_congratulations,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      K.gift_unlock_skin,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    if (widget.icon != null && widget.icon?.isNotEmpty == true)
                      CachedNetworkImage(
                        imageUrl: widget.icon,
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    Text(
                      widget.name ?? '',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 13),
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _onCloseTaped(context),
                      child: Container(
                        width: 190,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          gradient: LinearGradient(
                              colors: R.color.mainBrandGradientColors),
                        ),
                        child: Text(
                          K.gift_unlock_dialog_confirm,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _onCloseTaped(context),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: R.img(BaseAssets.ic_dialog_close_png,
                        package: ComponentManager.MANAGER_BASE_CORE,
                        width: 24,
                        height: 24),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
