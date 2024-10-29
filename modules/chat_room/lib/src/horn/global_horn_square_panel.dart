import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import '../protobuf/generated/horn.pb.dart';
import 'api/api.dart';

/// 全服喇叭广场面板
class GlobalHornSquarePanel extends StatefulWidget {
  const GlobalHornSquarePanel({super.key});

  @override
  State<GlobalHornSquarePanel> createState() => _GlobalHornSquarePanelState();

  static Future show(BuildContext context) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.75,
      defineBarrierColor: Colors.black45,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return const GlobalHornSquarePanel();
      },
    );
  }
}

class _GlobalHornSquarePanelState extends State<GlobalHornSquarePanel> {
  bool _loading = true;
  String _err = '';
  List<Horn> _hornList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final res = await Api.squareList();
    _loading = false;
    if (res.success) {
      _hornList = res.data;
    } else {
      _err = res.msg;
    }
    refresh();
  }

  void _reload() {
    _loading = true;
    _err = '';
    refresh();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: 551,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 10,
            child: Container(
              width: Util.width,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xFF2D3764),
                  Color(0xFF8B98C7),
                  Color(0xFF2D3764)
                ]),
                borderRadius: BorderRadiusDirectional.circular(16),
              ),
            ),
          ),
          PositionedDirectional(
            top: 11,
            child: Container(
              width: Util.width,
              height: 538,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1F2139), Color(0xFF121320)],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                ),
                borderRadius: BorderRadiusDirectional.horizontal(
                    start: Radius.circular(16), end: Radius.circular(16)),
              ),
            ),
          ),
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: R.img(RoomAssets.chat_room$ic_global_horn_high_light_webp,
                width: 195, height: 20),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 24),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(width: Util.width),
                  const PositionedDirectional(
                      start: 0,
                      child: BaseAppBarBackButton(color: Colors.white)),
                  Text(K.room_square,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                K.room_horn_square_list_tip,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Expanded(child: _buildBody()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    } else if (_err.isNotEmpty) {
      return ErrorData(error: _err, onTap: _reload);
    } else if (_hornList.isEmpty) {
      return const EmptyWidget();
    } else {
      double paddingBottom = Util.isIphoneX ? 40 : 20;
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            ListView.separated(
              itemCount: _hornList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              padding: EdgeInsetsDirectional.only(bottom: 68 + paddingBottom),
              itemBuilder: (context, index) => _buildItem(_hornList[index]),
            ),
            PositionedDirectional(
              bottom: 0,
              child: SizedBox(
                height: 68 + paddingBottom,
                child: Column(
                  children: [
                    Container(
                      width: Util.width,
                      height: 20,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x00141625), Color(0xFF141625)],
                          begin: AlignmentDirectional.topCenter,
                          end: AlignmentDirectional.bottomCenter,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsetsDirectional.only(bottom: paddingBottom),
                      color: const Color(0xFF141625),
                      width: Util.width,
                      alignment: AlignmentDirectional.center,
                      child: _buildBtn(),
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

  Widget _buildItem(Horn item) {
    double width = Util.width - 40;
    double height = 72;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(item.background),
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              CommonAvatar(
                path: item.icon,
                size: 52,
                shape: BoxShape.circle,
                onTap: () {
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openImageScreen(
                      context, item.uid.toInt());
                },
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  item.name,
                                  style: R.textStyle.medium12.copyWith(
                                      color: Colors.white.withOpacity(0.5)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                K.room_shout,
                                style: R.textStyle.medium12.copyWith(
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          Utility.formatDateToDay(item.updatedAt.toInt()),
                          style: R.textStyle.medium12
                              .copyWith(color: Colors.white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(item.content,
                        style:
                            R.textStyle.medium14.copyWith(color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBtn() {
    return GestureDetector(
      onTap: () => Navigator.pop(context, true),
      child: Container(
        width: Util.width - 40,
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF99FFBC),
            Color(0xFF26C4FF),
            Color(0xFF926AFF)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Text(K.room_i_want_shout,
            style: const TextStyle(
                color: Color(0xFF080A31),
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
