import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_repos.dart';
import 'package:chat_room/src/biz_plugin/heartpass/widget/heart_pass_level_widget.dart';
import 'package:chat_room/src/biz_plugin/heartpass/widget/heart_pass_rule_dialog.dart';

import 'controller/heart_pass_move_controller.dart';
import 'model/heart_pass_view_model.dart';
import 'package:provider/provider.dart' hide Selector;

/// 心动闯关主界面
class HeartPassMainWidget extends StatefulWidget {
  final ChatRoomData room;

  const HeartPassMainWidget({super.key, required this.room});

  @override
  _HeartPassMainWidgetState createState() => _HeartPassMainWidgetState();
}

class _HeartPassMainWidgetState extends State<HeartPassMainWidget> {
  late HeartPassViewModel _viewModel;
  late GlobalKey _levelKey;

  @override
  void initState() {
    _viewModel = HeartPassViewModel(widget.room);
    _levelKey = GlobalKey();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HeartPassMainWidget oldWidget) {
    _viewModel.tryLoadData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      builder: (context, child) {
        HeartPassViewModel viewModel = context.watch<HeartPassViewModel>();
        List<String>? tips = viewModel.model?.banner;
        return !viewModel.show
            ? const SizedBox.shrink()
            : Container(
                width: 351.dp,
                height: viewModel.edit ? 165.dp : 128.dp,
                margin: EdgeInsetsDirectional.only(top: 10.dp, bottom: 10.dp),
                decoration: BoxDecoration(
                  color: const Color(0xFF412068),
                  borderRadius: BorderRadius.circular(12.dp),
                  border:
                      Border.all(color: const Color(0xFF8A6BAD), width: 2.dp),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 34.dp,
                      alignment: AlignmentDirectional.center,
                      padding:
                          EdgeInsetsDirectional.only(start: 12.dp, end: 3.dp),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(K.room_heart_pass,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.dp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(width: 12.dp),
                          tips == null || tips.isEmpty
                              ? const Spacer()
                              : Expanded(
                                  child: Swiper(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        child: Text(
                                          tips[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.dp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      );
                                    },
                                    autoplay: true,
                                    loop: true,
                                    itemCount: tips.length,
                                    scrollDirection: Axis.vertical,
                                    autoplayDelay: 3000,
                                    duration: 500,
                                    // pagination: new SwiperPagination(),
                                    // control: new SwiperControl(),
                                  ),
                                ),
                          SizedBox(width: 24.dp),
                          // 最小化
                          // GestureDetector(
                          //   onTap: () {
                          //     // _viewModel.minimize();
                          //   },
                          //   child: Container(
                          //     width: 24.dp,
                          //     height: double.infinity,
                          //     alignment: AlignmentDirectional.center,
                          //     child: R.img(RoomAssets.chat_room$heartpass_ic_setting_mini_webp, width: 18.dp, height: 18.dp),
                          //   ),
                          // ),
                          // 规则说明入口
                          GestureDetector(
                            onTap: () {
                              HeartPassRuleDialog.show(context, widget.room);
                            },
                            child: Container(
                              width: 24.dp,
                              height: double.infinity,
                              alignment: AlignmentDirectional.center,
                              child: R.img(
                                  RoomAssets
                                      .chat_room$heartpass_ic_setting_rule_webp,
                                  width: 18.dp,
                                  height: 18.dp),
                            ),
                          ),
                          // 关闭心动闯关插件
                          if (_viewModel.hasPermission)
                            GestureDetector(
                              onTap: () async {
                                bool result = await HeartPassRepos.close(
                                    _viewModel.room.rid);
                                if (mounted && result == true)
                                  _viewModel.close();
                              },
                              child: Container(
                                width: 24.dp,
                                height: double.infinity,
                                alignment: AlignmentDirectional.center,
                                child: R.img(
                                    RoomAssets
                                        .chat_room$heartpass_ic_setting_close_webp,
                                    width: 18.dp,
                                    height: 18.dp),
                              ),
                            ),
                          SizedBox(width: 6.dp),
                        ],
                      ),
                    ),
                    Container(
                      width: 323.dp,
                      height: 1.dp,
                      margin:
                          EdgeInsetsDirectional.only(start: 12.dp, end: 12.dp),
                      color: Colors.white.withOpacity(0.07),
                    ),
                    SizedBox(height: 9.dp),
                    HeartPassLevelWidget(key: _levelKey, viewModel: _viewModel),
                    if (viewModel.edit)
                      GestureDetector(
                        onTap: () {
                          HeartPassMoveController? moveController = _levelKey
                              .currentState as HeartPassMoveController?;
                          moveController?.postRecord();
                        },
                        child: Container(
                          width: 78.dp,
                          height: 28.dp,
                          alignment: AlignmentDirectional.center,
                          margin: EdgeInsetsDirectional.only(top: 2.dp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.dp),
                              gradient: LinearGradient(
                                  colors: R.color.mainBrandGradientColors)),
                          child: Text(
                            K.room_save,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.dp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                  ],
                ),
              );
      },
    );
  }
}
