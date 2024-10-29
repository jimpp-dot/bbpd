import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/widget/cplink_relationship_card_download.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

class RelationshipCardItem extends StatelessWidget {
  final MessageContent message;

  const RelationshipCardItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return _renderCard(context);
  }

  Widget _renderCard(BuildContext context) {
    Map extra = message.extra ?? {};
    //卡片url
    String cardUrl = Util.notNullStr(extra['card_url']);
    return GestureDetector(
      onTap: () {
        CpLinkRelationShipCardDownload.show(context, message);
      },
      child: Container(
        height: 48,
        padding: const EdgeInsetsDirectional.only(
            start: 8, bottom: 6, end: 8, top: 6),
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              K.room_relationship_card,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xffFCE78D),
              ),
            ),
            CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(cardUrl),
                width: 36,
                height: 36,
                fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
