// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

import '../../../shared.dart';

Future<void> showJsonView({required String json, String? title}) async {
  await showModalBottomSheet(
      context: Constant.context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(16),
        topEnd: Radius.circular(16),
      )),
      builder: (BuildContext context) {
        final textColor = (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : const Color(0xff333333);
        final backgroundColor =
            (Theme.of(context).brightness == Brightness.dark)
                ? const Color(0xff313131)
                : const Color(0xffEEEEEE);

        return SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 900,
                  height: 400 * 0.8,
                  child: Container(
                      color: backgroundColor,
                      padding: const EdgeInsetsDirectional.all(20),
                      height: 438,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title ?? '',
                              style: TextStyle(
                                fontSize: 11,
                                height: 1.5,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              )),
                          GuaguaJsonView(rawData: json),
                        ],
                      )),
                )));
      });
}

class GuaguaJsonView extends StatefulWidget {
  final String rawData;

  const GuaguaJsonView({Key? key, required this.rawData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GuaguaJsonViewState();
}

class GuaguaJsonViewState extends State<GuaguaJsonView> {
  bool _shouldShowJsonView = false;
  Map<String, dynamic>? _jsonObject;

  String? jsonHead;
  String? jsonBody;

  @override
  void initState() {
    super.initState();
    try {
      _jsonObject = jsonDecode(widget.rawData, reviver: ((key, value) {
        try {
          if (key == 'data' && value is String) {
            return jsonDecode(value);
          }
          if (key == 'extra' && value is String) {
            return jsonDecode(value);
          }
        } catch (_) {}

        return value;
      }));
    } catch (e) {
      // Log.e(e, stackTrace: s);
    }
    if (_jsonObject != null) {
      setState(() {
        _shouldShowJsonView = true;
      });
    } else {
      int firstIndex = widget.rawData.indexOf('{');

      if (firstIndex > -1) {
        jsonHead = widget.rawData.substring(0, firstIndex);
        jsonBody = widget.rawData.substring(firstIndex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyColor = (Theme.of(context).brightness == Brightness.dark)
        ? Colors.white
        : const Color(0xff333333);
    final textColor = (Theme.of(context).brightness == Brightness.dark)
        ? Colors.white
        : const Color(0xff666666);
    final backgroundColor = (Theme.of(context).brightness == Brightness.dark)
        ? const Color(0xff313131)
        : const Color(0xffEEEEEE);
    const iconColor = Colors.red;

    final JsonViewTheme theme = JsonViewTheme(
        keyStyle: TextStyle(
            fontSize: 12,
            height: 1.5,
            color: keyColor,
            fontWeight: FontWeight.bold),
        stringStyle: TextStyle(fontSize: 12, height: 1.5, color: textColor),
        intStyle: TextStyle(fontSize: 12, height: 1.5, color: textColor),
        doubleStyle: TextStyle(fontSize: 12, height: 1.5, color: textColor),
        boolStyle: TextStyle(fontSize: 12, height: 1.5, color: textColor),
        backgroundColor: backgroundColor,
        closeIcon: const Icon(Icons.arrow_drop_up, size: 18, color: iconColor),
        openIcon:
            const Icon(Icons.arrow_drop_down, size: 18, color: iconColor));

    if (_shouldShowJsonView) {
      return Expanded(
          child: JsonView.map(
        _jsonObject ?? {},
        theme: theme,
      ));
    } else if (jsonBody?.isNotEmpty == true) {
      return Expanded(
        child: ListView(shrinkWrap: true, children: [
          if (jsonHead?.isNotEmpty == true) ...[
            Text(
              jsonHead!,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 5.0)
          ],
          JsonView.string(
            jsonBody!,
            theme: theme,
          )
        ]),
      );
    } else {
      return SingleChildScrollView(
          child: Text(widget.rawData,
              style: TextStyle(
                fontSize: 10,
                height: 1.5,
                color: keyColor,
              )));
    }
  }
}
