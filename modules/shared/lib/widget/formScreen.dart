import 'package:flutter/material.dart';
import 'package:shared/k.dart';
import 'package:shared/shared.dart';

enum FormTypes { input, textArea }

/// 输入文本过滤器
typedef ValueFilter = bool Function(String value);

class FormConfig {
  final FormTypes type;
  final String? placeholder;
  final String value;
  final bool allowEmpty;
  final int? maxLength;
  final int minLength;
  final String title;
  final String? tip;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueFilter? filter;

  FormConfig(
      {required this.title,
      required this.type,
      this.placeholder,
      required this.value,
      this.tip,
      required this.allowEmpty,
      this.maxLength,
      this.keyboardType,
      this.textInputAction,
      required this.minLength,
      this.filter});
}

int _index = 0;
Map<int, FormConfig> _map = {};

class FormScreen extends StatefulWidget {
  final int index;

  static int config(
      {FormTypes type = FormTypes.input,
      TextInputType keyboardType = TextInputType.text,
      TextInputAction textInputAction = TextInputAction.send,
      String placeholder = '',
      String? value = '',
      String title = '请输入',
      String? tip,
      bool allowEmpty = true,
      int? maxLength,
      int minLength = 0,
      ValueFilter? filter}) {
    _index++;
    _map[_index] = FormConfig(
        type: type,
        placeholder: placeholder,
        value: value ?? '',
        title: title,
        tip: tip,
        allowEmpty: allowEmpty,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        minLength: minLength,
        filter: filter);
    return _index;
  }

  static Future<String?> openFormScreen(BuildContext context, int index) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FormScreen(
          index: index,
        ),
        settings: const RouteSettings(name: '/form'),
      ),
    );
  }

  const FormScreen({super.key, required this.index});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<_InputState> _key = GlobalKey<_InputState>();
  late FormConfig _config;
  bool _disabled = true;

  _onSubmit(String value) {
    Navigator.of(context).pop(value);
  }

  _onChanged(String value) {
    setState(() {
      _disabled = value == _config.value ||
          (!_config.allowEmpty && (value.trim().isEmpty || value.trim().length < _config.minLength)) ||
          (_config.filter != null && _config.filter!(value));
    });
  }

  @override
  initState() {
    super.initState();
    _config = _map[widget.index]!;
  }

  @override
  dispose() {
    super.dispose();
    if (_map.containsKey(widget.index)) {
      _map.remove(widget.index);
    }
  }

  Widget _renderInput() {
    return _LineInput(key: _key, config: _config, onChanged: _onChanged, onSubmit: _onSubmit);
  }

  Widget _renderTextArea() {
    return _LineInput(key: _key, maxLine: 16, config: _config, onChanged: _onChanged, onSubmit: _onSubmit);
  }

  Widget _renderBody() {
    if (_config.type == FormTypes.input) {
      return _renderInput();
    } else if (_config.type == FormTypes.textArea) {
      return _renderTextArea();
    } else {
      return Container();
    }
  }

  _onSave() {
    _onSubmit(_key.currentState?.value ?? '');
  }

  Widget _renderTip() {
    if (_config.tip != null && _config.tip!.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          _config.tip!,
          style: TextStyle(color: R.color.secondTextColor, fontSize: 12),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        statusBrightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        title: Text(_config.title, style: R.textStyle.title),
        actions: _buildAction(),
      ),
      backgroundColor: R.colors.homeSecondBgColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          alignment: AlignmentDirectional.topStart,
          child: Column(
            children: <Widget>[
              Flexible(child: _renderBody()),
              _renderTip(),
            ],
          ),
        ),
      ),
    ).withCommonBg();
  }

  List<Widget> _buildAction() {
    return <Widget>[
      TextButton(
          onPressed: _disabled ? null : _onSave,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: Text(
              K.base_submmit,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 14,
                color: !_disabled ? Colors.white : Colors.white.withOpacity(0.3),
              ),
            ),
          )),
    ];
  }
}

typedef _InputOnSubmit = Function(String value);

class _LineInput extends StatefulWidget {
  final _InputOnSubmit onSubmit;
  final ValueChanged<String>? onChanged;
  final int maxLine;
  final FormConfig config;

  const _LineInput({super.key, this.maxLine = 1, required this.config, this.onChanged, required this.onSubmit});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<_LineInput> {
  late FocusNode _focusNode;
  late TextEditingController _textController;

  String get value {
    return _textController.value.text.trim();
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
    super.dispose();
  }

  _onFocus() {
    Log.d("focus --------------- ${_focusNode.hasFocus}");
  }

  _onSubmitted(String value) async {
    if (value.isEmpty) return;
    _textController.clear();
    widget.onSubmit(value);
  }

  @override
  Widget build(BuildContext context) {
    double lineH = 200;
    double margin = 0;
    int? maxLength = widget.config.maxLength;
    if (maxLength != null && maxLength > 0) {
      lineH = 70;
      margin = 10;
    }

    return Container(
      height: widget.maxLine == 1 ? lineH : MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.config.value.replaceAll(RegExp(r'\s+'), ''),
          border: InputBorder.none,
          hintStyle: TextStyle(color: R.colors.thirdTextColor, fontSize: 16),
          isDense: false,
          hintMaxLines: null,
          contentPadding: const EdgeInsetsDirectional.only(start: 16.0, end: 12.0),
        ),
        onAppPrivateCommand: (String action, Map map) {},
        textAlign: TextAlign.start,
        style: R.textStyle.regular14,
        focusNode: _focusNode,
        controller: _textController,
        autocorrect: false,
        autofocus: false,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        onSubmitted: _onSubmitted,
        onChanged: widget.onChanged,
        keyboardAppearance: Brightness.light,
      ),
    );
  }
}
