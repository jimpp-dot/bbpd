import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';

class AuctionUtil {
  static List<Color> getRelationTextGradientColors(int level) {
    if (level == 0) {
      return [const Color(0xFFFEFEFE), const Color(0xFFFEFEFE)];
    } else if (level == 1) {
      return [const Color(0xFFD4D4B1), const Color(0xFFC1C161)];
    } else if (level == 2) {
      return [const Color(0xFF95BDFF), const Color(0xFFF883F8)];
    } else if (level == 3) {
      return [const Color(0xFFFF9AAB), const Color(0xFFBBFFAE)];
    } else if (level == 4) {
      return [const Color(0xFFFF057C), const Color(0xFF4CC3FF)];
    } else if (level == 5) {
      return [const Color(0xFFFF057C), const Color(0xFF4CC3FF)];
    } else {
      return [const Color(0xFFFEFEFE), const Color(0xFFFEFEFE)];
    }
  }

  static String getRelationHeader(int level) {
    if (level == 0) {
      return RoomAssets.chat_room$auction_header_normal_webp;
    } else if (level == 1) {
      return RoomAssets.chat_room$auction_header_gold_webp;
    } else if (level == 2) {
      return RoomAssets.chat_room$auction_header_diamond_webp;
    } else if (level == 3) {
      return RoomAssets.chat_room$auction_header_glory_webp;
    } else {
      return RoomAssets.chat_room$auction_header_normal_webp;
    }
  }

  static String getRelationIcon(int level) {
    if (level == 0) {
      return RoomAssets.chat_room$auction_ic_relation_normal_svg;
    } else if (level == 1) {
      return RoomAssets.chat_room$auction_ic_relation_gold_svg;
    } else if (level == 2) {
      return RoomAssets.chat_room$auction_ic_relation_diamond_svg;
    } else if (level == 3) {
      return RoomAssets.chat_room$auction_ic_relation_glory_svg;
    } else {
      return RoomAssets.chat_room$auction_ic_relation_normal_svg;
    }
  }
}
