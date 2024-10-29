import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import 'has_order_list.dart';
import 'order_drama_list_widget.dart';
import 'order_drama_list_with_gs.dart';
import 'order_drama_pay_sheet.dart';

class OrderDramaPage extends StatefulWidget {
  final ChatRoomData room;

  const OrderDramaPage({Key? key, required this.room}) : super(key: key);

  @override
  OrderDramaPageState createState() {
    return OrderDramaPageState();
  }

  static Future<void> show(
    BuildContext context, {
    required ChatRoomData room,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      settings: const RouteSettings(name: '/order_drama_page'),
      builder: (BuildContext context) {
        return OrderDramaPage(
          room: room,
        );
      },
    );
  }
}

class OrderDramaPageState extends State<OrderDramaPage>
    with TickerProviderStateMixin {
  late ExtendedTabController _tabController;

  @override
  void initState() {
    super.initState();
    safeRun(
      () => _tabController =
          ExtendedTabController(initialIndex: 0, length: 3, vsync: this),
    );

    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'click_oderdramaicon'});
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
              OrderDramaListWithGs(
                room: widget.room,
                onItemOrder: onItemOrder,
              ),
              OrderDramaListWidget(
                rid: widget.room.realRid,
                uid: 0,
                type: 2,
                onItemOrder: onItemOrder,
              ),
              HasOrderList(rid: widget.room.realRid),
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
              child: Text(K.room_single_person),
            ),
            Tab(
              child: Text(K.room_drama_type_multi),
            ),
            Tab(
              child: Text(K.room_has_order_drama),
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
          labelPadding: const EdgeInsetsDirectional.only(start: 5, end: 5),
        ),
        backColor: Colors.white.withOpacity(0.6),
      ),
    );
  }

  void onItemOrder(PiaJuBen juben) async {
    /// 房间开启了接待位，接待
    RoomPosition? reception =
        (widget.room.config!.reception && widget.room.positions[0].uid > 0)
            ? widget.room.positions[0]
            : null;

    if (reception?.uid == Session.uid) {
      /// 接待不能点本，因为自己不能给自己打赏（接待费）
      Fluttertoast.showCenter(
          msg: '${K.room_reception}${K.room_cant_order_drama}');
      return;
    }

    /// 房间开启了房主位：房主
    RoomPosition? creator =
        (!widget.room.config!.nine && widget.room.createor!.uid > 0)
            ? RoomPosition.fromCreator(widget.room.createor!)
            : null;
    if (creator?.uid == Session.uid) {
      /// 房主不能点本，因为自己不能给自己打赏（房主费）
      Fluttertoast.showCenter(msg: '${K.room_owner}${K.room_cant_order_drama}');
      return;
    }

    List<RoomPosition> gsList = [];

    if (juben.type == PiaJuBenType.PiaJuBenTypeMulti) {
      /// 多人本
      gsList = getGsList();
      if (!Util.validList(gsList)) {
        Fluttertoast.showCenter(msg: K.room_debate_pk_select_user_empty);
        return;
      }
    } else {
      /// 单人本
      RoomPosition? pos = widget.room.positions
          .firstWhereOrNull((element) => element.uid == juben.creator.uid);

      if (pos == null &&
          !widget.room.config!.nine &&
          juben.creator.uid == widget.room.createor?.uid) {
        /// 开启了房主位的房主单人本
        pos = RoomPosition.fromCreator(widget.room.createor!);
      }

      if (pos == null) {
        Fluttertoast.showCenter(msg: K.room_gs_isnt_in_mic);
        return;
      }

      gsList.add(pos);
    }

    bool? suc = await OrderDramaPaySheet.show(context,
        juben: juben,
        room: widget.room,
        reception: reception,
        creator: creator,
        gsList: gsList);

    if (suc == true && mounted) {
      /// 点本成功，切换到第三个已点Tab
      _tabController.animateTo(2);
    }
  }

  /// 麦上用户：去掉老板位，去掉自己
  List<RoomPosition> getGsList() {
    List<RoomPosition> users;
    users = widget.room.positions.where((RoomPosition pos) {
      return pos.uid > 0 &&
          !ChatRoomUtil.isBossChair(pos) &&
          pos.uid != Session.uid;
    }).toList();
    if ((widget.room.isEightPosition || widget.room.isFivePosition)) {
      /// pia戏玩法，开启房主位的房主，大概率是不在房间，把icon放在最后
      users.add(RoomPosition.fromCreator(widget.room.createor!));
    }

    return users;
  }
}
