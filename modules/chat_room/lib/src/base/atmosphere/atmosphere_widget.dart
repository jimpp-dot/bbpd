import 'package:shared/shared.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../room_music_control.dart';
import 'atmosphere_model.dart';
import 'atmosphere_music_widget.dart';
import 'atmosphere_repo.dart';

/// 房间氛围面板
class AtmospherePanel extends StatefulWidget {
  final int rid;

  const AtmospherePanel(this.rid, {super.key});

  @override
  State<StatefulWidget> createState() => AtmospherePanelState();
}

class AtmospherePanelState extends State<AtmospherePanel>
    with BaseScreenStateMixin, RtcMixPlayerCallProtect {
  int _selectedPos = -1;
  bool _useBg = true;
  bool _useAudio = false;
  bool _apiRequesting = false;

  AtmosphereData? _respData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    rtcMixCallDestroy();
    super.dispose();
  }

  _loadData() async {
    AtmosphereResp resp = await AtmosphereRepo.atmosphereList(widget.rid);
    if (resp.success == true) {
      _respData = resp.data;

      // sync selected state.
      if (_respData?.atmosphereInfo != null) {
        _useBg = _respData!.atmosphereInfo!.isUseBg == 1;
        _useAudio = _respData!.atmosphereInfo!.isUseMusic == 1;
        if ((_useBg == true || _useAudio == true) &&
            _respData!.atmosphereInfo!.atmId >= 0) {
          _selectedPos = _respData!.atmosphereList!
              .indexWhere((e) => e.id == _respData!.atmosphereInfo!.atmId);
        }
      }

      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          )),
      child: Center(
        child: buildStatusContent(),
      ),
    );
  }

  @override
  Widget buildContent() {
    const double paddingStart = 16;
    const double paddingEnd = 16;
    const int gridCount = 3;
    const double gridSpace = 10;
    double gridItemWidth =
        (Util.width - gridSpace * (gridCount - 1)) / gridCount;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        fit: StackFit.expand,
        children: <Widget>[
          _buildAtmosphereContent(
              paddingStart, paddingEnd, gridCount, gridSpace, gridItemWidth),
          _buildMusicControlWidget(),
          _buildLoading(),
        ],
      ),
    );
  }

  /// 中间加载指示器
  Widget _buildLoading() => _apiRequesting ? const Loading() : const SizedBox();

  /// 底部音乐播放控件
  Widget _buildMusicControlWidget() {
    return _useAudio
        ? PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: _buildMusicControl(),
          )
        : const SizedBox();
  }

  /// 房间氛围整体布局
  Widget _buildAtmosphereContent(double paddingStart, double paddingEnd,
      int gridCount, double gridSpace, double gridItemWidth) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: paddingStart,
          end: paddingEnd,
          bottom: _useAudio ? 80 + Util.iphoneXBottom : 0),
      child: Column(
        children: <Widget>[
          _buildTitle(),
          Divider(
            color: R.color.dividerColor,
            thickness: 1,
          ),
          _buildDesSwitch(),
          _buildGridView(gridCount, gridSpace, gridItemWidth),
        ],
      ),
    );
  }

  /// 氛围网格列表
  Widget _buildGridView(int gridCount, double gridSpace, double gridItemWidth) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              childAspectRatio: 108 / 150,
              crossAxisSpacing: gridSpace),
          itemCount: _respData!.atmosphereList!.length,
          itemBuilder: (context, index) {
            var item = _respData!.atmosphereList![index];
            return _GridItem(
              imgUrl: item.cover,
              checked: _selectedPos == index,
              title: item.name,
              imgWidth: gridItemWidth,
              onTap: () => rtcMixCall(() {
                var canPlay =
                    RoomMusicControl.canMusicPlay(MusicScene.atmosphere);
                if (false == canPlay) {
                  return;
                }

                // 重复点击
                if (_selectedPos == index && true == _useAudio) {
                  return;
                }
                _updateAtmosphereOption(_useBg, true, index);
              }),
            );
          }),
    );
  }

  /// 中间描述与开关
  Widget _buildDesSwitch() {
    return Container(
      width: double.infinity,
      height: 72,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Expanded(
            child: Text(
              K.room_use_atmosphere_bg,
              style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
            ),
          ),
          CupertinoSwitch(
            value: _useBg,
            activeColor: R.color.mainBrandColor,
            onChanged: (bool value) async {
              _updateAtmosphereOption(value, _useAudio, _selectedPos);
            },
          ),
        ],
      ),
    );
  }

  /// 顶部标题
  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 18, bottom: 17),
      child: Text(
        K.room_atmosphere,
        style: TextStyle(
            fontSize: 16,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  _buildMusicControl() {
    var item = _getSelectedListItem();
    if (item == null) {
      // safely code,should not reach
      Log.e(tag: 'atmosphere', 'music control item is null');
      return Container();
    }
    return AtmosphereMusicWidget(
      iconUrl: item.cover,
      musicUrl: item.music,
      title: item.name,
      onCloseListener: _onCloseMusic,
    );
  }

  AtmosphereListItem? _getSelectedListItem() {
    if (_selectedPos < 0 || _selectedPos >= _respData!.atmosphereList!.length) {
      return null;
    }
    return _respData!.atmosphereList![_selectedPos];
  }

  AtmosphereListItem? _getTargetItem(int pos) {
    if (pos < 0 || pos >= _respData!.atmosphereList!.length) {
      return null;
    }
    return _respData!.atmosphereList![pos];
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  _onCloseMusic() {
    _updateAtmosphereOption(false, false, _selectedPos);
  }

  _updateAtmosphereOption(bool useBg, bool useMusic, int targetPos) async {
    // 没有选中一个项目的情况下，可以切换背景开关的状态
    var item = _getTargetItem(targetPos);
    if (item == null) {
      _useBg = useBg;
      refresh();
      return;
    }

    _apiRequesting = true;
    refresh();
    var success = await _updateAtmosphereApi(useBg, useMusic, targetPos);
    _apiRequesting = false;
    if (success) {
      _useBg = useBg;
      _useAudio = useMusic;
      if (_useBg == false && _useAudio == false) {
        _selectedPos = -1;
      } else {
        _selectedPos = targetPos;
      }
    }
    refresh();
  }

  Future<bool> _updateAtmosphereApi(
      bool useBg, bool useMusic, int targetPos) async {
    var item = _getTargetItem(targetPos);
    if (item == null) {
      return false;
    }
    BaseResponse response = await AtmosphereRepo.setAtmosphere(
        widget.rid, item.id, useBg ? 1 : 0, useMusic ? 1 : 0);
    if (!(response.success == true)) {
      Fluttertoast.showToast(
          msg: response.msg ?? R.array('xhr_error_type_array')[6]);
      return false;
    }
    Tracker.instance.track(TrackEvent.room_atmosphere_used, properties: {
      'rid': widget.rid,
      'res_id': item.id,
    });
    return true;
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }
}

typedef _GridItemOnTap = void Function();

class _GridItem extends StatelessWidget {
  final String imgUrl;
  final bool checked;
  final String title;
  final double imgWidth;
  final _GridItemOnTap onTap;

  const _GridItem({
    Key? key,
    required this.imgUrl,
    required this.checked,
    required this.title,
    required this.imgWidth,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            onTap.call();
          },
          child: SizedBox(
            width: imgWidth,
            height: imgWidth,
            child: Stack(
              children: <Widget>[
                _buildImage(),
                _buildCheckedLayer(),
              ],
            ),
          ),
        ),
        _buildTitle()
      ],
    );
  }

  /// 底部标题
  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 6),
      child: Text(
        title,
        style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
      ),
    );
  }

  /// 图片
  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        placeholder: const CupertinoActivityIndicator(),
        imageUrl: imgUrl,
        width: imgWidth,
        height: imgWidth,
        fit: BoxFit.cover,
      ),
    );
  }

  /// 边框选中态
  Widget _buildCheckedLayer() {
    return checked
        ? Container(
            width: imgWidth,
            height: imgWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: R.color.mainBrandColor, width: 2),
            ),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CheckBoxChecked(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: R.color.mainBrandColor,
                    borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(2),
                        bottomEnd: Radius.circular(12))),
              ),
            ))
        : const SizedBox.shrink();
  }
}
