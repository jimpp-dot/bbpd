import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shared/shared.dart';

class MarkDownContentWidget extends StatelessWidget {
  final String? content;
  final ScrollController controller;
  final ThemeData? themeData;
  final EdgeInsetsGeometry? contentPadding;

  const MarkDownContentWidget({
    Key? key,
    this.content,
    required this.controller,
    this.themeData,
    this.contentPadding = const EdgeInsetsDirectional.only(start: 20, end: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = themeData != null
        ? themeData!
        : ThemeData(
            platform: TargetPlatform.iOS,
            textTheme: TextTheme(
              titleLarge: R.textStyle.title.copyWith(
                  color: R.color.mainTextColor,
                  fontSize: 19.0,
                  height: 1.8,
                  fontWeight: FontWeight.w600),
              bodyMedium: R.textStyle.body1.copyWith(
                  color: R.color.secondTextColor,
                  fontSize: 14.0,
                  height: 1.6,
                  fontWeight: FontWeight.w400),
              bodyLarge: R.textStyle.body2.copyWith(
                  color: R.color.mainTextColor.withOpacity(0.7),
                  fontSize: 15.0,
                  height: 1.6,
                  fontWeight: FontWeight.w400),
//            subtitle: R.textStyle.subtitle.copyWith(color: KillerRoomColor.instance().color.mainTextColor,),
              // 设置 textBaseline 是为了修复在v1.9.1中TextField的hint没有垂直居中的bug
              // 如果后期版本的引擎修复了此bug，可删除此项设置
              // 参考 TextField#build -> InputDecorator -> _InputDecoratorState#build -> #_getInlineStyle
              titleMedium: R.textStyle.subhead.copyWith(
                  textBaseline: TextBaseline.alphabetic,
                  color: R.color.mainTextColor,
                  fontSize: 19.0,
                  height: 1.6,
                  fontWeight: FontWeight.w400),
              headlineSmall: R.textStyle.title.copyWith(
                  color: R.color.mainTextColor,
                  fontSize: 14.0,
                  height: 1.6,
                  fontWeight: FontWeight.w600), //H
              labelSmall: TextStyle(
                  color: R.color.mainBrandColor,
                  fontWeight: FontWeight.w600), //a标签使用
            ),
          );
    return MyMarkdown(
      data: content ?? '',
      padding:
          contentPadding ?? const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      styleSheet: MarkdownStyleSheet(
        a: theme.textTheme
            .labelSmall, //TextStyle(color: theme.hintColor, fontWeight: FontWeight.w600),
        p: theme.textTheme.bodyMedium,
        h1: theme.textTheme.headlineSmall,
        h2: theme.textTheme.titleLarge,
        h3: theme.textTheme.titleMedium,
        h4: theme.textTheme.bodyLarge,
        h5: theme.textTheme.bodyLarge,
        h6: theme.textTheme.bodyLarge,
        em: const TextStyle(fontStyle: FontStyle.italic),
        strong: TextStyle(
            fontWeight: FontWeight.w600,
            color: theme.textTheme.titleLarge!.color), //B
        blockquote: theme.textTheme.bodyMedium,
        img: theme.textTheme.bodyMedium,
        blockSpacing: 8.0,
        listIndent: 32.0,
        blockquoteDecoration: BoxDecoration(
            color: theme.textTheme.titleLarge!.color!.withOpacity(0.7),
            borderRadius: BorderRadius.circular(2.0)),
        code: TextStyle(
            color: theme.textTheme.titleLarge!.color!.withOpacity(0.7),
            fontFamily: "monospace",
            fontSize: theme.textTheme.bodyMedium!.fontSize! * 0.85),
        codeblockDecoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(2.0)),
        horizontalRuleDecoration: BoxDecoration(
          border:
              Border(top: BorderSide(width: 5.0, color: R.color.dividerColor)),
        ),
        brHeight: 2.0,
      ),
      controller: controller,
    );
  }
}

class MyMarkdown extends MarkdownWidget {
  /// Creates a scrolling widget that parses and displays Markdown.
  const MyMarkdown({
    Key? key,
    String? data,
    MarkdownStyleSheet? styleSheet,
    SyntaxHighlighter? syntaxHighlighter,
    MarkdownTapLinkCallback? onTapLink,
    this.padding = const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
    required this.controller,
  }) : super(
          key: key,
          data: data ?? '',
          styleSheet: styleSheet,
          syntaxHighlighter: syntaxHighlighter,
          onTapLink: onTapLink,
        );

  /// The amount of space by which to inset the children.
  final EdgeInsetsGeometry padding;

  final ScrollController controller;

  @override
  Widget build(BuildContext context, List<Widget> children) {
    return Scrollbar(
      child: ListView(
        padding: padding,
        controller: controller,
        children: children,
      ),
    );
  }
}
