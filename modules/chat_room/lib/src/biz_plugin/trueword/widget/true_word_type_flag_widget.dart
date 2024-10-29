import 'package:flutter/material.dart';

class TrueWordTypeFlagWidget extends StatelessWidget {
  final String tag;
  final List<Color> colors;

  const TrueWordTypeFlagWidget(
      {super.key, required this.tag, required this.colors});

  Widget buildImageFlag(List<Color> colors, String tag) {
    return Container(
      width: 16,
      height: 16,
      alignment: Alignment.center,
      margin: const EdgeInsetsDirectional.only(top: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        tag,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 11.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildImageFlag(colors, tag);
  }
}
