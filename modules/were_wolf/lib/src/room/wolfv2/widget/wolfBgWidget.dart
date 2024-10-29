import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///狼人杀弹框 //背景
class WolfBgWidget extends StatelessWidget {
  const WolfBgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xFF7068D3),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wolfv2/role_bg.png',
                package: ComponentManager.MANAGER_WERE_WOLF),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
