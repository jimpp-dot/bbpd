import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

enum RoomUserRole {
  Owner, // 房主
  Boss, // 老板
  Reception, // 接待
  Anchor, // 主播
  Naming, // 冠名
  Guest, // 嘉宾
}

class RoomRoleWidget extends StatelessWidget {
  final RoomUserRole role;
  final String? label;

  const RoomRoleWidget({super.key, required this.role, this.label});

  @override
  Widget build(BuildContext context) {
    return _buildUserRole(role);
  }

  Widget _buildUserRole(RoomUserRole role) {
    Color gradientBegin = const Color(0xFFFC5897);
    Color gradientEnd = const Color(0xFFFF6AFD);
    String name = label ?? getRoleName(role);

    if (role == RoomUserRole.Owner) {
      /// do nothing
    } else if (role == RoomUserRole.Anchor) {
      /// do nothing
    } else if (role == RoomUserRole.Boss || role == RoomUserRole.Guest) {
      gradientBegin = const Color(0xFFFE962A);
      gradientEnd = const Color(0xFFF9CD46);
    } else if (role == RoomUserRole.Naming) {
      gradientBegin = const Color(0xFFDD7DFE);
      gradientEnd = const Color(0xFF8E30FF);
    }

    if (label != null) {
      gradientBegin = const Color(0xFFFC5897);
      gradientEnd = const Color(0xFFFF6AFD);
    }

    return Container(
      height: 12,
      margin: const EdgeInsetsDirectional.only(end: 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        gradient: LinearGradient(colors: [gradientBegin, gradientEnd]),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 4),
          Text(
            name,
            style: const TextStyle(
                fontSize: 9,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: 1.3),
            maxLines: 1,
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  static getRoleName(RoomUserRole role) {
    String name = K.room_reception;
    if (role == RoomUserRole.Owner) {
      name = K.room_owner;
    } else if (role == RoomUserRole.Anchor) {
      name = K.room_live_prefix;
    } else if (role == RoomUserRole.Boss) {
      name = K.room_boss;
    } else if (role == RoomUserRole.Naming) {
      name = K.room_naming;
    } else if (role == RoomUserRole.Guest) {
      name = K.room_guest_title;
    }
    return name;
  }
}

/// 麦位标签，带序号
///
class MicRoleLabel extends StatelessWidget {
  final String label;
  final int index;
  final bool showIndex;

  const MicRoleLabel(this.label,
      {super.key, this.showIndex = false, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      margin: const EdgeInsetsDirectional.only(end: 2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        gradient:
            LinearGradient(colors: [Color(0xFFFC5897), Color(0xFFFF6AFD)]),
      ),
      child: _buildOrderLabel(),
    );
  }

  Widget _buildOrderLabel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 2),
        if (showIndex)
          Container(
            height: 9,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4.5)),
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: NumText(
              '${index + 1}',
              style: const TextStyle(
                  fontSize: 8,
                  color: Color(0xFFFC5897),
                  fontWeight: FontWeight.w700,
                  height: 1.1),
            ),
          ),
        const SizedBox(width: 2),
        Text(
          label,
          style: const TextStyle(
              fontSize: 9,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              height: 1.3),
          maxLines: 1,
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
