import 'package:shared/shared.dart';
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:shared/util/log/log_output.dart';
import 'package:shared/util/log/web_console/connect_status_listener.dart';
import 'package:shared/util/log/web_console/web_console_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class WebConsoleWidget extends StatefulWidget {
  const WebConsoleWidget({
    Key? key,
  }) : super(key: key);
  @override
  _WebConsoleWidget createState() => _WebConsoleWidget();
}

class _WebConsoleWidget extends State<WebConsoleWidget>
    with ConnectStatusListener {
  final TextEditingController _textController = TextEditingController();
  bool _enable = false;
  bool _connected = false;

  @override
  void initState() {
    super.initState();
    WebConsoleManager.instance.addConnectStatusListner(this);
    _enable = WebConsoleManager.instance.enableWebConsole;
    _textController.text = WebConsoleManager.instance.connectUrl;
  }

  @override
  void dispose() {
    WebConsoleManager.instance.removeConnectStatusListner(this);
    super.dispose();
  }

  @override
  onStarted() {
    setState(() {
      _textController.text = WebConsoleManager.instance.connectUrl;
    });
  }

  @override
  onConnected() {
    setState(() {
      _connected = true;
      _textController.text = WebConsoleManager.instance.connectUrl;
    });
    // set filter level to verbose default
    LogOutputHelper.filterLevel = Level.verbose;
  }

  @override
  onDisconnected() {
    setState(() {
      _connected = false;
    });
  }

  @override
  onError() {
    setState(() {
      _connected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olachat Web Console'),
      ),
      body: SafeArea(child: _renderBody()),
    );
  }

  Widget _renderBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ListTile(
          title: Text(
            'Address:',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: R.color.mainTextColor),
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: SizedBox(
            height: 60,
            width: 180,
            child: Center(
              child: TextField(
                cursorColor: R.color.mainBrandColor,
                decoration: InputDecoration(
                  hintText: "",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: Util.fontFamily),
                  isDense: true,
                  counterText: '',
                ),
                keyboardType: TextInputType.multiline,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    color: R.color.mainTextColor,
                    fontFamily: Util.fontFamily),
                controller: _textController,
                autocorrect: false,
                autofocus: false,
                maxLength: 100,
                maxLines: 1,
                minLines: 1,
                textInputAction: TextInputAction.newline,
                onSubmitted: (value) {},
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                keyboardAppearance: Brightness.light,
                onChanged: (value) {},
                readOnly: true,
              ),
            ),
          ),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            'Enable',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: R.color.mainTextColor),
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Switch(
            // This bool value toggles the switch.
            value: _enable,
            overlayColor: overlayColor,
            trackColor: trackColor,
            thumbColor: const WidgetStatePropertyAll<Color>(Colors.white),
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              WebConsoleManager.instance.triggerConsoleLog(value);
              setState(() {
                _enable = value;
              });
            },
          ),
        ),
        const Divider(height: 0),
        ListTile(
            title: Text(
              'Connected Status',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: R.color.mainTextColor),
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              _connected ? 'Connected' : 'Disconnected',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: _connected ? Colors.green : Colors.red,
              ),
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            )),
        const Divider(height: 0),
        ListTile(
          title: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Reset',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }

  void reset() {
    _connected = false;
    WebConsoleManager.instance.reset();
    Fluttertoast.showToast(
        msg: 'Please reconnect in web console again',
        gravity: ToastGravity.CENTER);
  }

  final WidgetStateProperty<Color?> trackColor =
      WidgetStateProperty.resolveWith<Color?>(
    (Set<WidgetState> states) {
      // Track color when the switch is selected.
      if (states.contains(WidgetState.selected)) {
        return R.color.mainBrandColor;
      }
      // Otherwise return null to set default track color
      // for remaining states such as when the switch is
      // hovered, focused, or disabled.
      return null;
    },
  );
  final WidgetStateProperty<Color?> overlayColor =
      WidgetStateProperty.resolveWith<Color?>(
    (Set<WidgetState> states) {
      // Material color when switch is selected.
      if (states.contains(WidgetState.selected)) {
        return R.color.mainBrandColor.withOpacity(0.54);
      }
      // Material color when switch is disabled.
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey.shade400;
      }
      // Otherwise return null to set default material color
      // for remaining states such as when the switch is
      // hovered, or focused.
      return null;
    },
  );
}
