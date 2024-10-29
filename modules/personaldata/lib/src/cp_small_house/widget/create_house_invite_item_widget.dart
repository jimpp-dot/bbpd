import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

typedef InviteCallback = Function(int id);

class CreateHouseInviteItemWidget extends StatelessWidget {
  final int id;
  final String icon;
  final String name;
  final int level;
  final String btnText;
  final int titleNew;
  final bool disabled;
  final InviteCallback inviteCallback;

  const CreateHouseInviteItemWidget(
    this.id,
    this.icon,
    this.name,
    this.level,
    this.btnText,
    this.titleNew, {
    Key? key,
    required this.inviteCallback,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 6,
                      color: const Color(0xFF000000).withOpacity(0.05),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CommonAvatar(
                      path: icon,
                      size: 48,
                      shape: BoxShape.circle,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: R.color.unionRankText1,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UserVipWidget(vip: level),
                              const SizedBox(width: 2),
                              if (titleNew > 0)
                                UserNobilityWidget(
                                  titleNew: titleNew,
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        if (disabled) return;
                        inviteCallback(id);
                      },
                      child: Container(
                        width: 68,
                        height: 32,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                              color: const Color(0xFFFF6C8B)
                                  .withOpacity(disabled ? 0.5 : 1),
                              width: 1),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 1,
                              spreadRadius: 0,
                              color: const Color(0xFFFF6C82)
                                  .withOpacity(disabled ? 0.5 : 1),
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.topCenter,
                            end: AlignmentDirectional.bottomCenter,
                            colors: [
                              const Color(0xFFFFC1D7),
                              const Color(0xFFFF2F4B)
                            ]
                                .map((e) => e.withOpacity(disabled ? 0.5 : 1))
                                .toList(),
                          ),
                        ),
                        child: Text(
                          btnText,
                          style: TextStyle(
                              color:
                                  Colors.white.withOpacity(disabled ? 0.5 : 1),
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}
