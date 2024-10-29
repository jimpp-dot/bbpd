import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:protobuf/protobuf.dart';

final _r3 = RegExp(r'\\');
final _r5 = RegExp(r"[^\x20-\x7E]|'");
final _r7 = RegExp(r"'");
final _r8 = RegExp(r'\n');
final _r9 = RegExp(r'\r');

const _urlencoded = 'application/x-www-form-urlencoded';
const _protobuf = 'application/protobuf';

String _escapeStringPosix(String str) {
  if (_r5.hasMatch(str)) {
    // Use ANSI-C quoting syntax.
    return "\$'${str.replaceAll(_r3, '\\\\').replaceAll(_r7, "\\'").replaceAll(_r8, '\\n').replaceAll(_r9, '\\r').replaceAllMapped(_r5, (Match match) {
      final x = match.group(0)!;
      assert(x.length == 1);
      final code = x.codeUnitAt(0);
      if (code < 256) {
        // Add leading zero when needed to not care about the next character.
        return code < 16
            ? '\\x0${code.toRadixString(16)}'
            : '\\x${code.toRadixString(16)}';
      }
      final c = code.toRadixString(16);
      return '\\u${('0000$c').substring(c.length, c.length + 4)}';
    })}'";
  } else {
    // Use single quote syntax.
    return "'$str'";
  }
}

String _hexEncode(Uint8List bytes) {
  convert(int code) {
    if (code < 256) {
      // Add leading zero when needed to not care about the next character.
      return code < 16
          ? '\\x0${code.toRadixString(16)}'
          : '\\x${code.toRadixString(16)}';
    }
    final c = code.toRadixString(16);
    return '\\u${('0000$c').substring(c.length, c.length + 4)}';
  }

  final result = bytes.map((e) => convert(e)).toList().join();
  return result;
}

String? toCurl(Request? req, GeneratedMessage? reqBody) {
  if (req == null) return null;

  final command = ['curl'];
  final ignoredHeaders = ['host', 'method', 'path', 'scheme', 'version'];
  const escapeString = _escapeStringPosix;
  var requestMethod = 'GET';
  final data = <String>[];
  final requestHeaders = req.headers;

  requestHeaders.addAll({"Accept": "application/json"});

  var contentType = requestHeaders['content-type'];
  ignoredHeaders.add('content-length');
  ignoredHeaders.add('content-type');

  if (contentType != null && contentType.indexOf(_urlencoded) == 0) {
    requestMethod = 'POST';
    data.add('--data');
    data.add(escapeString(req.bodyFields.keys
        .map((key) =>
            '${Uri.encodeComponent(key)}=${Uri.encodeComponent(req.bodyFields[key]!)}')
        .join('&')));
  }
  if (contentType != null && contentType.indexOf(_protobuf) == 0) {
    requestMethod = 'POST';
    if (reqBody != null) {
      data.add('--data');
      final bodyFields = reqBody.toProto3Json();
      data.add(escapeString(jsonEncode(bodyFields)));
      requestHeaders['content-type'];
      contentType = 'application/json';
    } else {
      final result = _hexEncode(req.bodyBytes);
      data.add('--data-binary');
      data.add(escapeString(result));
    }
  } else if (req.body.isNotEmpty ?? false) {
    requestMethod = 'POST';
    data.add('--data-binary');
    data.add(escapeString(req.body));
  }

  if (req.method != requestMethod) {
    command
      ..add('-X')
      ..add(req.method);
  }
  Map<String, String?>.fromIterable(
      requestHeaders.keys.where((k) => !ignoredHeaders.contains(k)),
      value: (k) => requestHeaders[k]).forEach((k, v) {
    command
      ..add('-H')
      ..add(escapeString('$k: $v'));
  });

  if (contentType != null) {
    command
      ..add('-H')
      ..add(escapeString('content-type: $contentType'));
  }

  final url = "'${req.url}'".replaceAll("&format=pb", "");

  // add "--output -" if content-type is protobuf
  return (command
        ..addAll(data)
        ..add('--compressed')
        ..add('--insecure')
        ..add(url))
      .join(' ');
}
