import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import '../widget/gobalRoomMessage.dart';

///年度盛典飘屏
class AnnualEventMessage extends StatelessWidget {
  final GlobalMessage? data;
  const AnnualEventMessage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Util.validStr(data?.word)) return const SizedBox.shrink();
    List<String> stringList = data!.word.split('&');

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        RepaintBoundary(
          child: MultiframeImage.network(
            Util.getRemoteImgUrl(data?.bgImg ?? ''),
            'annual_event',
            width: Util.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        (data?.isAnnualNormal ?? false)
            ? PositionedDirectional(
                start: 34.dp,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 48.dp,
                      height: 48.dp,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.dp),
                      ),
                      child: CommonAvatar(
                        path: data?.uIcon ?? '',
                        size: 45.dp,
                        shape: BoxShape.circle,
                      ),
                    ),
                    PositionedDirectional(
                        top: -4.dp,
                        start: -4.dp,
                        child: R.img(
                            RoomAssets.chat_room$room_annual_event_avatar_webp,
                            width: 56.dp,
                            height: 56.dp)),
                  ],
                ),
              )
            : PositionedDirectional(
                start: 10.dp,
                child: R.img(RoomAssets.chat_room$room_annual_box_icon_webp,
                    height: 65.dp, fit: BoxFit.fitHeight)),
        PositionedDirectional(
          top: 22.dp,
          start: 90.dp,
          end: 25.dp,
          child: Row(
            children: [
              Flexible(
                child: GradientText(
                  stringList.isNotEmpty ? stringList[0] : '',
                  maxLines: 1,
                  gradient: const LinearGradient(
                    colors: [Colors.white, Color(0xffffa7d2)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.ellipsis,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              GradientText(
                stringList.length > 1 ? stringList[1] : '',
                maxLines: 1,
                gradient: const LinearGradient(
                  colors: [Colors.white, Color(0xffffa7d2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.ellipsis,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          bottom: 23.dp,
          start: 90.dp,
          end: 120.dp,
          child: Row(
            children: [
              Expanded(
                child: GradientText(
                  stringList.length > 2 ? stringList[2] : '',
                  maxLines: 1,
                  gradient: const LinearGradient(
                    colors: [Colors.white, Color(0xff95e2ff)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.ellipsis,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
