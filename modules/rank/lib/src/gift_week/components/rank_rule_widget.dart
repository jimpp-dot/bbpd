import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/cupertino.dart';

class RankRuleWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const RankRuleWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: SizedBox(
        width: 30,
        height: 100,
        child: Stack(
          children: [
            PositionedDirectional(
              top: 0,
              start: 0,
              bottom: 0,
              end: -4,
              child: Container(
                margin: const EdgeInsets.all(1),
                child: GradientBorderBox(
                  gradientColors: const [
                    Color(0xFFFFAD2B),
                    Color(0xFFFFD62B),
                    Color(0xFF912200),
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  borderWidth: 1.0,
                  borderRadius: 5.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFCA99),
                          Color(0xFFFFECDB),
                          Color(0xFFFFCEA2),
                        ],
                      ),
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(4)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 12, top: 8, bottom: 8),
                      child: Text(
                        K.rule_description,
                        style: R.textStyle.medium14
                            .copyWith(color: const Color(0xFF85000B)),
                        maxLines: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
