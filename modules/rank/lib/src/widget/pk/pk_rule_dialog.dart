import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PkRuleDialog extends StatelessWidget {
  const PkRuleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static _singleTextWidget(int index, String text) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsetsDirectional.only(top: 3),
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                gradient: LinearGradient(
                    colors: [Color(0xFF65A1FF), Color(0xFFFE6790)],
                    begin: FractionalOffset(1, 0),
                    end: FractionalOffset(0, 1))),
            child: Text(
              '$index',
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 3,
              style: TextStyle(
                fontSize: 16,
                color: R.color.mainTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  static showRuleDialog(BuildContext context) {
    showDialog(
        context: context,
        // barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            padding:
                const EdgeInsetsDirectional.only(top: 96, start: 12, end: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  // padding: EdgeInsetsDirectional.only(start: 16, end: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    color: R.color.mainBgColor,
                  ),
                  child: Column(
                    children: [
                      // SizedBox(height: 34,),
                      GestureDetector(
                        child: Container(
                          height: 34,
                          margin: const EdgeInsetsDirectional.only(
                              start: 0, end: 0, top: 0),
                          padding: const EdgeInsetsDirectional.only(
                              end: 16, top: 16),
                          alignment: AlignmentDirectional.centerEnd,
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: R.color.mainTextColor,
                          ),
                        ),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      Text(
                        K.pk_score_rule,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: R.color.mainTextColor),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: 1,
                        width: Util.width,
                        color: R.color.dividerColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _singleTextWidget(1, K.pk_score_rule1),
                      const SizedBox(
                        height: 14,
                      ),
                      _singleTextWidget(2, K.pk_score_rule2),
                      const SizedBox(
                        height: 14,
                      ),
                      _singleTextWidget(3, K.pk_score_rule3),
                      const SizedBox(
                        height: 14,
                      ),
                      _singleTextWidget(4, K.pk_score_rule4),
                      const SizedBox(
                        height: 14,
                      ),
                      _singleTextWidget(5, K.pk_score_rule5),
                      const SizedBox(
                        height: 14,
                      ),
                      _singleTextWidget(6, K.pk_score_rule6),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
