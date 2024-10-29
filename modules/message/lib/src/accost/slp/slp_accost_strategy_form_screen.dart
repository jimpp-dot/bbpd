import 'package:message/k.dart';
import 'package:shared/shared.dart' hide FormScreen, FormConfig, FormTypes;
import 'package:flutter/material.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:message/src/model/pb/generated/slp_gs.pb.dart';

enum BbAccostStrategyFormTypes { input, textArea }

/// 输入文本过滤器
typedef ValueFilter = bool Function(String value);

class BbAccostStrategyFormConfig {
  final BbAccostStrategyFormTypes type;
  final String? placeholder;
  final String? value;
  final bool allowEmpty;
  final int? maxLength;
  final int minLength;
  final String? title;
  final String? tip;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueFilter? filter;
  final int categoryId;
  final int strategyId;

  BbAccostStrategyFormConfig(
      {required this.title,
      required this.type,
      required this.placeholder,
      required this.value,
      required this.tip,
      required this.allowEmpty,
      required this.maxLength,
      this.keyboardType,
      this.textInputAction,
      required this.minLength,
      this.filter,
      required this.categoryId,
      required this.strategyId});
}

int _index = 0;
Map<int, BbAccostStrategyFormConfig> _map = {};

class BbAccostStrategyFormScreen extends StatefulWidget {
  final int index;

  static int config(
      {BbAccostStrategyFormTypes type = BbAccostStrategyFormTypes.input,
      TextInputType keyboardType = TextInputType.text,
      TextInputAction textInputAction = TextInputAction.send,
      String placeholder = '',
      String value = '',
      String title = '请输入',
      String? tip,
      bool allowEmpty = true,
      int? maxLength,
      int minLength = 0,
      ValueFilter? filter,
      int categoryId = 0,
      int strategyId = 0}) {
    _index++;
    _map[_index] = BbAccostStrategyFormConfig(
      type: type,
      placeholder: placeholder,
      value: value,
      title: title,
      tip: tip,
      allowEmpty: allowEmpty,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      minLength: minLength,
      filter: filter,
      categoryId: categoryId,
      strategyId: strategyId,
    );
    return _index;
  }

  static Future openFormScreen(BuildContext context, int index) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BbAccostStrategyFormScreen(
          index: index,
        ),
        settings: const RouteSettings(name: '/form'),
      ),
    );
  }

  const BbAccostStrategyFormScreen({super.key, this.index = 0});

  @override
  _BbAccostStrategyFormScreenState createState() =>
      _BbAccostStrategyFormScreenState();
}

class _BbAccostStrategyFormScreenState
    extends State<BbAccostStrategyFormScreen> {
  final GlobalKey<_InputState> _key = GlobalKey<_InputState>();
  late BbAccostStrategyFormConfig _config;
  bool _disabled = true;

  _onSubmit(String? value) {
    Navigator.of(context).pop(value);
  }

  _onChanged(String value) {
    setState(() {
      _disabled = value == _config.value ||
          (!_config.allowEmpty &&
              (value.trim().isEmpty ||
                  value.trim().length < _config.minLength)) ||
          (_config.filter != null && _config.filter!(value));
    });
  }

  @override
  initState() {
    super.initState();
    _config = _map[widget.index]!;

    _onTapExample(); // 获取参考话术
  }

  @override
  dispose() {
    super.dispose();
    if (_map.containsKey(widget.index)) {
      _map.remove(widget.index);
    }
  }

  Widget _renderInput() {
    return _LineInput(
        key: _key, config: _config, onChanged: _onChanged, onSubmit: _onSubmit);
  }

  Widget _renderTextArea() {
    return _LineInput(
        key: _key,
        maxLine: 16,
        config: _config,
        onChanged: _onChanged,
        onSubmit: _onSubmit);
  }

  Widget _renderBody() {
    if (_config.type == BbAccostStrategyFormTypes.input) {
      return _renderInput();
    } else if (_config.type == BbAccostStrategyFormTypes.textArea) {
      return _renderTextArea();
    } else {
      return Container();
    }
  }

  _onSave() {
    String? result = _key.currentState?.value;
    if (examples.contains(result)) {
      Fluttertoast.showCenter(msg: K.slp_accost_strategy_example_copy_tip);
      return;
    }
    _onSubmit(_key.currentState?.value);
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
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
          statusBrightness: darkMode ? Brightness.dark : Brightness.light,
          backColor: R.colors.mainTextColor,
          backgroundColor: R.colors.homeBgColor,
          title: Text(
            _config.title ?? '',
            style: R.textStyle.title,
          ),
          actions: _buildAction()),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        alignment: AlignmentDirectional.topStart,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(child: _renderBody()),
              _renderTip(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    K.msg_strategy_example,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: R.color.mainTextColor),
                  ),
                  InkWell(
                    onTap: _onTapExample,
                    child: Row(
                      children: [
                        R.img(
                          'ic_example_change.webp',
                          package: ComponentManager.MANAGER_MESSAGE,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          K.msg_strategy_example_change,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0x66202020)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(child: _buildExample()),
            ],
          ),
        ),
      ),
    );
  }

  List<String> examples = []; //参考话术

  Widget _buildExample() {
    return ListView.separated(
      itemCount: examples.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (ctx, index) {
        return _buildExampleItem(examples[index]);
      },
      separatorBuilder: (ctx, index) => const SizedBox(height: 12),
    );
  }

  Widget _buildExampleItem(String text) {
    return InkWell(
      onTap: () {
        _key.currentState?.value = text;
      },
      child: Container(
        width: double.infinity,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 12, bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x33202020), width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: R.color.mainTextColor),
        ),
      ),
    );
  }

  void _onTapExample() async {
    ResAccostSampleList resp = await MessageRepo.bbAccostStrategyExample(
      _config.strategyId,
      _config.categoryId,
    );
    if (resp.success) {
      examples = resp.data;
      refresh();
    }
  }

  List<Widget> _buildAction() {
    return <Widget>[
      TextButton(
          onPressed: _disabled ? null : _onSave,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: Text(
              R.string('base_submmit'),
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 14,
                color: !_disabled
                    ? R.color.mainTextColor
                    : R.color.mainTextColor.withOpacity(0.2),
              ),
            ),
          )),
    ];
  }
}

typedef _InputOnSubmit = Function(String value);

class _LineInput extends StatefulWidget {
  final _InputOnSubmit? onSubmit;
  final ValueChanged<String>? onChanged;
  final int maxLine;
  final BbAccostStrategyFormConfig config;

  const _LineInput(
      {super.key,
      this.maxLine = 1,
      required this.config,
      this.onChanged,
      this.onSubmit});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<_LineInput> {
  late FocusNode _focusNode;
  late TextEditingController _textController;

  String get value {
    return _textController.value.text.trim();
  }

  set value(String text) {
    _textController.value = TextEditingValue(
        text: text,
        selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream,
          offset: text.length,
        )));
    widget.onChanged?.call(text);
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.config.value ?? '');
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
    if (widget.onSubmit != null) {
      widget.onSubmit!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    double lineH = 50;
    double margin = 0;
    int? maxLength = widget.config.maxLength;
    if (maxLength != null && maxLength > 0) {
      lineH = 70;
      margin = 10;
    }

    return Container(
      height:
          widget.maxLine == 1 ? lineH : MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(top: 16.0),
      padding: widget.maxLine == 1
          ? EdgeInsetsDirectional.only(
              start: 12, end: 12, bottom: margin, top: margin)
          : const EdgeInsetsDirectional.only(
              top: 0.0,
              start: 12.0,
              end: 12.0,
              bottom: 12.0,
            ),
      child: Align(
        alignment: widget.maxLine == 1
            ? AlignmentDirectional.centerStart
            : AlignmentDirectional.topStart,
        child: TextField(
          keyboardType: widget.config.keyboardType ?? TextInputType.text,
          textInputAction:
              widget.config.textInputAction ?? TextInputAction.send,
          textAlign: TextAlign.start,
          style: R.textStyle.regular14,
          focusNode: _focusNode,
          controller: _textController,
          autocorrect: true,
          autofocus: true,
          maxLength: widget.config.maxLength,
          onSubmitted: _onSubmitted,
          onChanged: widget.onChanged,
          maxLines: widget.maxLine,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.config.placeholder ?? ''),
        ),
      ),
    );
  }
}
