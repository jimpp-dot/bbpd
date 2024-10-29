/*
 *
 *  Created by yao.qi on 2022/9/7 下午2:32
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/9/7 下午2:32
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../model/gift_wall_api.dart';
import '../widget/gift_wall_item_widget.dart';

class GiftWallListGraphicScreen extends StatefulWidget {
  final int targetUid;

  const GiftWallListGraphicScreen(this.targetUid, {Key? key}) : super(key: key);

  @override
  State<GiftWallListGraphicScreen> createState() =>
      _GiftWallListGraphicScreenState();
}

class _GiftWallListGraphicScreenState extends State<GiftWallListGraphicScreen>
    with AutomaticKeepAliveClientMixin {
  bool _isLoading = true;
  String? _errorMsg;
  List<GiftWallGraphic> _atlasList = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _load() async {
    GiftWallGraphicRes rsp =
        await GiftWallApi.getBBGiftWallListGraphicResp(widget.targetUid);
    if (rsp.success == true) {
      _errorMsg = null;
      _atlasList = rsp.data;
    } else {
      _errorMsg = rsp.msg;
    }
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicatorFactory.of(
      child: _buildBody(),
      onRefresh: () async {
        _load();
      },
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Loading(),
      );
    }

    if (Util.validStr(_errorMsg)) {
      return ErrorData(
        fontColor: Colors.white,
        onTap: () {
          _errorMsg = null;
          _isLoading = true;
          setState(() {});
          _load();
        },
      );
    }

    if (!Util.validList(_atlasList)) {
      return const Center(
        child: EmptyWidget(
          textColor: Colors.white,
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsetsDirectional.only(
          bottom: Util.isIphoneX ? Util.iphoneXBottom : 15),
      itemBuilder: (ctx, index) {
        return GiftWallItemWidget(
          data: _atlasList[index],
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 24,
        );
      },
      itemCount: _atlasList.length,
    );
  }
}
