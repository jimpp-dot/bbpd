import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:were_wolf/src/room/guide/wolf_guide_screen.dart';
import 'package:provider/provider.dart' hide Selector;

///
///
class WolfGuideTopHeader extends StatefulWidget {
  const WolfGuideTopHeader({super.key});

  @override
  _WolfGuideTopHeaderState createState() => _WolfGuideTopHeaderState();
}

class _WolfGuideTopHeaderState extends State<WolfGuideTopHeader> {
  @override
  Widget build(BuildContext context) {
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
    return _renderHeader(context, wolfModel);
  }

  Widget _renderHeader(BuildContext context, WolfModel wolfModel) {
    List<Widget> res = [];
    res.add(InkWell(
        onTap: () {
          WolfGuideScreen.guideAiBack(context);
        },
        child: SizedBox(
          width: 36.0,
          height: kToolbarHeight,
          child: Center(
            child: R.img("back.svg",
                width: 24.0,
                height: 24.0,
                package: ComponentManager.MANAGER_BASE_ROOM),
          ),
        )));
    res.add(Expanded(
        child: InkWell(
      onTap: () {
        WolfGuideScreen.guideAiBack(context);
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 0.0, end: 12.0),
        child: Text(
          wolfModel.data.title ?? '', //this.widget.room.config.name,
          maxLines: 1,
          textScaleFactor: 1.0,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    )));

    return Container(
      height: 44,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        children: res,
      ),
    );
  }
}
