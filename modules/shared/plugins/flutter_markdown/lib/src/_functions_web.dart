// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html'; // ignore: avoid_web_libraries_in_flutter

import 'package:flutter/cupertino.dart' show CupertinoTheme;
import 'package:flutter/material.dart' show Theme;
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;

import 'style_sheet.dart';
import 'widget.dart';

typedef ImageBuilder = Widget Function(
    Uri uri, String imageDirectory, double width, double height);

final ImageBuilder kDefaultImageBuilder = (
  Uri uri,
  String? imageDirectory,
  double width,
  double height,
) {
  if (uri.scheme == 'http' || uri.scheme == 'https') {
    return Image.network(uri.toString(), width: width, height: height);
  } else if (uri.scheme == 'data') {
    return _handleDataSchemeUri(uri, width, height);
  } else if (uri.scheme == "resource") {
    return Image.asset(uri.path, width: width, height: height);
  } else {
    Uri fileUri = Uri.parse(p.join(imageDirectory ?? '', uri.toString()));
    if (fileUri.scheme == 'http' || fileUri.scheme == 'https') {
      return Image.network(fileUri.toString(), width: width, height: height);
    } else {
      String src = p.join(p.current, fileUri.toString());
      return Image.network(src, width: width, height: height);
    }
  }
};

final MarkdownStyleSheet Function(BuildContext, MarkdownStyleSheetBaseTheme)
    kFallbackStyle = (
  BuildContext context,
  MarkdownStyleSheetBaseTheme baseTheme,
) {
  switch (baseTheme) {
    case MarkdownStyleSheetBaseTheme.platform:
      final String userAgent = window.navigator.userAgent;
      return userAgent.contains('Mac OS X')
          ? MarkdownStyleSheet.fromCupertinoTheme(CupertinoTheme.of(context))
          : MarkdownStyleSheet.fromTheme(Theme.of(context));
    case MarkdownStyleSheetBaseTheme.cupertino:
      return MarkdownStyleSheet.fromCupertinoTheme(CupertinoTheme.of(context));
    case MarkdownStyleSheetBaseTheme.material:
    default:
      return MarkdownStyleSheet.fromTheme(Theme.of(context));
  }
};

Widget _handleDataSchemeUri(Uri uri, final double width, final double height) {
  final String? mimeType = uri.data?.mimeType;
  if (mimeType?.startsWith('image/') ?? false) {
    return Image.memory(
      uri.data!.contentAsBytes(),
      width: width,
      height: height,
    );
  } else if (mimeType?.startsWith('text/') ?? false) {
    return Text(uri.data!.contentAsString());
  }
  return const SizedBox();
}
