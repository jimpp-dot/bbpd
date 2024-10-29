import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';

import '../../moment.dart';

class MomentAlbumHeader extends StatefulWidget {
  final AlbumUserInfo albumUserInfo;
  final GestureTapCallback onFollowTaped;

  const MomentAlbumHeader({super.key, required this.albumUserInfo, required this.onFollowTaped});

  @override
  _MomentAlbumHeaderState createState() => _MomentAlbumHeaderState();
}

class _MomentAlbumHeaderState extends State<MomentAlbumHeader> {
  _onImageTaped() {
    IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, widget.albumUserInfo.uid, refer: const PageRefer(PhotoViewGalleryScreen.routeName));

    Tracker.instance.track(TrackEvent.moment_picture_click, properties: {
      'click': 'profile',
      'follow_uid': widget.albumUserInfo.uid,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close,
              size: 24,
              color: Colors.white,
            ),
            padding: const EdgeInsetsDirectional.only(start: 20, end: 12, top: 10, bottom: 10),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          RoundNetIcon(
            url: widget.albumUserInfo.icon,
            size: 40,
            showBorder: false,
            onTap: _onImageTaped,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.albumUserInfo.name ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                if (widget.albumUserInfo.isUserOnline)
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      children: <Widget>[
                        OnlineDot(
                          size: 6,
                          padding: 0,
                          color: widget.albumUserInfo.isUserOnline ? R.color.fiveBrightColor : Colors.grey,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          widget.albumUserInfo.isUserOnline ? K.moment_user_online : K.moment_user_offline,
                          style: const TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          if (widget.albumUserInfo.isfollow == 0 && Session.uid != widget.albumUserInfo.uid)
            GestureDetector(
              onTap: widget.onFollowTaped,
              child: Container(
                width: 60,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(width: 1, color: const Color(0xFF9EFF4E)),
                ),
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    R.img(
                      'ic_follow_add.svg',
                      width: 10,
                      height: 10,
                      color: Colors.white,
                      package: ComponentManager.MANAGER_MOMENT,
                    ),
                    Text(
                      K.moment_attention,
                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
