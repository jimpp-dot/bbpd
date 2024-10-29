import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

/// 未成年人保护计划
class JuvenilesPlan extends StatelessWidget {
  const JuvenilesPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.juveniles_protect_plan),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 25,
          top: 26,
          right: 25,
          bottom: 26,
        ),
        children: <Widget>[
          Text(
            K.setting_juveniles_plan,
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              height: 1.375,
            ),
          ),
        ],
      ),
    );
  }
}
