import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared/shared.dart';

class PasswordManager {
  static getValue(int rid) {
    String? value = Config.get('Xs.Room.Password.$rid');
    Map? data;
    try {
      data = json.decode(value);
    } catch (e) {}
    if (data != null &&
        data.containsKey('dateline') &&
        data.containsKey('password') &&
        DateTime.now().millisecondsSinceEpoch -
                Util.parseInt(data['dateline']) <
            1000 * 86400) {
      return data['password'].toString();
    }
    return '';
  }

  static setValue(int rid, String value) {
    Config.set(
        'Xs.Room.Password.$rid',
        json.encode({
          'dateline': DateTime.now().millisecondsSinceEpoch,
          'password': value.toString()
        }));
  }

  static remove(int rid) {
    Config.delete('Xs.Room.Password.$rid');
  }
}

class RoomPassword extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RoomPassword({super.key, required this.onChanged});

  @override
  _State createState() => _State();
}

class _State extends State<RoomPassword> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(RoomPassword oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_focusNode.hasFocus == false) {
      FocusScope.of(context).autofocus(_focusNode);
    }
  }

  _submit() {
    Log.d("submit");
    TextEditingValue value = _controller.value;
    if (value.text.isEmpty) {
      return;
    }
    String text = value.text;
    _controller.text = '';
    widget.onChanged(text);
  }

  Widget _renderItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.text,
        focusNode: _focusNode,
        controller: _controller,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        maxLength: 4,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(counterText: ''),
        onSubmitted: (v) => _submit(),
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: _renderItem(),
    );
  }
}
