import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PushOrderDialog extends StatelessWidget {
  final String? skillName;
  final String? icon;
  final String? name;
  final int sex;
  final int age;

  const PushOrderDialog(
      {super.key,
      this.skillName,
      this.icon,
      this.name,
      required this.sex,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 265,
          constraints: const BoxConstraints(maxHeight: 400),
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${R.string('invite_for_play')}$skillName',
                      style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 12, bottom: 11),
                      child: CommonAvatar(
                        path: icon,
                        size: 56,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          name ?? '',
                          style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 9),
                          child: UserSexAndAgeWidget(sex: sex, age: age),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const NegativeButton(),
                  PushPositiveButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PushPositiveButton extends StatelessWidget {
  final String text = R.string('place_an_order');
  final VoidCallback? onPressed;

  PushPositiveButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onPressed == null) {
            Navigator.of(context).pop(true);
          } else {
            onPressed!();
          }
        },
        borderRadius: BorderRadius.circular(4),
        child: Ink(
          width: 105,
          height: 40,
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
