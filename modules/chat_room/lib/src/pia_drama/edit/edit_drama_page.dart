import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../k.dart';
import 'edit_current_drama_list.dart';
import 'edit_drama_widget.dart';

/// 编辑剧本：双TAB：新增+修改
class EditDramaPage extends StatefulWidget {
  final int rid;

  /// 接待或者房主,
  /// 普通GS只能新增和编辑自己的单人本
  /// 接待可以新增和编辑自己的单人本及房间的多人本
  final bool isReception;

  const EditDramaPage({Key? key, required this.rid, required this.isReception})
      : super(key: key);

  @override
  EditDramaPageState createState() {
    return EditDramaPageState();
  }

  static Future<void> show(
    BuildContext context, {
    required int rid,
    required bool isReception,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      settings: const RouteSettings(name: '/edit_drama_page'),
      builder: (BuildContext context) {
        return EditDramaPage(
          rid: rid,
          isReception: isReception,
        );
      },
    );
  }
}

class EditDramaPageState extends State<EditDramaPage>
    with TickerProviderStateMixin {
  late ExtendedTabController _tabController;

  @override
  void initState() {
    super.initState();
    safeRun(
      () => _tabController =
          ExtendedTabController(initialIndex: 0, length: 2, vsync: this),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            height: 550,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xB26968FF), Color(0xB29274FF)],
              ),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
              ),
            ),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopBar(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              EditDramaWidget(
                rid: widget.rid,
                type: widget.isReception
                    ? PiaEditType.AddSingleAndMul
                    : PiaEditType.AddSingle,
              ),
              EditCurrentDramaList(
                rid: widget.rid,
                uid: Session.uid,
                type: widget.isReception ? 3 : 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      width: Util.width,
      height: 44,
      margin: const EdgeInsetsDirectional.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.5, color: Colors.white.withOpacity(0.1))),
      ),
      child: BaseAppBar.custom(
        backgroundColor: Colors.transparent,
        title: CommonTabBar(
          tabs: [
            Tab(
              child: Text(K.room_edit_drama),
            ),
            Tab(
              child: Text(K.room_current_drama),
            ),
          ],
          isScrollable: false,
          labelColor: Colors.white,
          controller: _tabController,
          unselectedLabelColor: Colors.white.withOpacity(0.5),
          labelStyle: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 15,
              fontWeight: FontWeight.w500),
          indicator: CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
            insets: const EdgeInsetsDirectional.only(bottom: 2),
            wantWidth: 16,
            draggingWidth: 12.0,
          ),
          indicatorWeight: 0,
          labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        ),
        backColor: Colors.white.withOpacity(0.6),
        actions: [
          IconButton(
            onPressed: () {
              /// 编辑剧本说明页h5
              BaseWebviewScreen.show(context, url: Util.parseHelpUrl(157));
            },
            icon: Icon(
              Icons.help_outline,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
