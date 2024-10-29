import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PrettyIdWidget extends StatelessWidget {
  final String prettyId;
  final double height;
  final double fontSize;

  const PrettyIdWidget(
      {super.key,
      required this.prettyId,
      this.height = 16.0,
      this.fontSize = 9.0});

  @override
  Widget build(BuildContext context) {
    double borderWidth = 1.0;
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: height,
          alignment: AlignmentDirectional.center,
          margin: EdgeInsetsDirectional.all(borderWidth),
          padding: EdgeInsetsDirectional.only(start: height, end: 3),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF4F8502),
                const Color(0xFF34A400).withOpacity(0.0)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius:
                BorderRadius.all(Radius.circular(height / 2 + borderWidth)),
          ),
          child: ColorfulNickName(
            isPrettyId: true,
            textBuild: (bool show, {Key? key, Paint? paint}) {
              return Text(
                prettyId,
                key: key,
                softWrap: true,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    foreground: paint),
              );
            },
          ),
        ),

        // GradientBorder(
        //   borderGradient: const LinearGradient(
        //     colors: [Color(0xFF4F8502), Color(0xFF34A400)],
        //     begin: AlignmentDirectional.topCenter,
        //     end: AlignmentDirectional.bottomCenter,
        //   ),
        //
        //
        //   borderWidth: 0,
        //   borderRadius: height / 2 + borderWidth,
        //   child: ,
        // ),
        R.img(BaseAssets.shared$ic_pretty_tag_webp,
            height: height, width: height),
      ],
    );
  }
}
