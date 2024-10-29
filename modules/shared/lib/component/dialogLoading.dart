import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class DialogLoadingController {
  GlobalKey<_DialogLoadingState>? _key;
  BuildContext? context;

  DialogLoadingController();

  GlobalKey<_DialogLoadingState>? get key {
    return _key;
  }

  void setLabel(String label) {
    if (!exists()) return;
    _key?.currentState?.setLabel(label);
  }

  close() {
    Log.d(
        'Start to close loading dialog with key: $key, isShowing: ${key?.currentState?.isShowing}, context: $context');
    if ((key?.currentState?.isShowing ?? false) == true &&
        context != null &&
        Navigator.canPop(context!)) {
      _key = null;
      Navigator.of(context!).pop();
    }
  }

  bool exists() {
    return _key != null && _key!.currentState != null;
  }

  Widget _buildMaterialDialogTransitions(
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

  Future<T?> show<T>({
    required BuildContext context,
    String? message,
    bool canPop = true,
    bool barrierDismissible = false,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));

    if (key != null) {
      Log.d(
          'Loading dialog alread exist, close the dialog, with key: $key, isShowing: ${key?.currentState?.isShowing}');
      close();
    }

    _key = GlobalKey<_DialogLoadingState>();
    this.context = context;
    Log.d(
        'Start to show the loading dialog, with key: $key, isShowing: ${key?.currentState?.isShowing}');

    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final ThemeData theme = Theme.of(context);
        final Widget pageChild = DialogLoading(key: key, label: message);
        //child ?? Builder(builder: builder);

        return WillPopScope(child: SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        ), onWillPop: () async {
          if (canPop) close();
          return false;
        });
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black12,
      transitionDuration: const Duration(milliseconds: 0),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }
}

class DialogLoading extends StatefulWidget {
  final String? label;

  const DialogLoading({super.key, this.label});

  @override
  _DialogLoadingState createState() => _DialogLoadingState();
}

class _DialogLoadingState extends State<DialogLoading> {
  String? _label;
  bool isShowing = false;

  @override
  void initState() {
    super.initState();
    _label = widget.label;
    isShowing = true;
  }

  @override
  void dispose() {
    isShowing = false;
    super.dispose();
  }

  setLabel(String label) {
    if (!mounted) return;

    setState(() {
      _label = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 0.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 0.0),
                color: R.color.mainBgColor),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: R.color.mainBgColor,
        ),
        width: 120.0,
        height: 120.0,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(25.0),
              child: const Loading(),
            ),
            _label != null
                ? Text(
                    _label!,
                    textScaleFactor: 1.0,
                    maxLines: 2,
                    style: TextStyle(
                      color: R.color.secondTextColor,
                      fontSize: 12.0,
                      decoration: TextDecoration.none,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
