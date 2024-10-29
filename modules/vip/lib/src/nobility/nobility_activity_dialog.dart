import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/custom_count_down_widget.dart';
import 'package:vip/assets.dart';
import 'package:vip/src/nobility/model/pb/generated/slp_nobility_activity.pb.dart';
import 'package:vip/src/nobility/model/pb/slp_title_repo.dart';
import 'package:vip/src/nobility/nobility_buy_dialog.dart';

class NobilityActivityDialog extends StatefulWidget {
  const NobilityActivityDialog({super.key});

  //避免重复弹窗
  static bool _showing = false;

  static show(BuildContext context) async {
    if (_showing) return;
    _showing = true;
    await showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        builder: (BuildContext context) {
          return const NobilityActivityDialog();
        });
    _showing = false;
    eventCenter.emit(EventConstant.EventActivityDataUpdate);
  }

  @override
  State<NobilityActivityDialog> createState() => _NobilityActivityDialogState();
}

class _NobilityActivityDialogState extends State<NobilityActivityDialog> with TickerProviderStateMixin {
  //是否可以购买，默认可以
  final _buttonDisable = false.obs;

  RespGiftBagDetail? _respActivityData;

  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _animationController!, curve: Curves.linear));

    _loadData();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: Loading());
    }
    return _buildBody();
  }

  bool _isLoading = false;

  Future<void> _loadData() async {
    _isLoading = true;
    _respActivityData = await SlpTitleRepo.getNobleActivityData(1);
    _isLoading = false;
    if (_respActivityData?.success ?? false) {
      if (mounted) {
        setState(() {});
        _animationController?.forward();
      }
    } else {
      if (mounted) {
        Navigator.maybePop(context);
        Fluttertoast.showToast(msg: _respActivityData?.msg ?? '');
      }
    }
  }

  Widget _buildBody() {
    return Center(
      child: ScaleTransition(
        scale: _animation!,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            R.img(
              Assets.vip$noble_nobility_activity_bg_webp,
              width: 280.dp,
              fit: BoxFit.fitHeight,
            ),
            PositionedDirectional(
              top: 9.dp,
              end: -26.dp,
              child: R.img(Assets.vip$noble_nobility_activity_icon_bg_webp, width: 170.dp, fit: BoxFit.fitWidth),
            ),
            PositionedDirectional(
              top: 25.dp,
              end: -15.dp,
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(_respActivityData!.titleData.titleIcon),
                width: 126.dp,
                fit: BoxFit.fitWidth,
              ),
            ),
            PositionedDirectional(
              top: 65.dp,
              start: 19.dp,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                R.img(Assets.vip$noble_nobility_activity_title_webp, width: 144.dp, fit: BoxFit.fitWidth),
                SizedBox(height: 8.dp),
                Row(
                  children: [
                    SizedBox(width: 4.dp),
                    _buildCountDownWidget(_respActivityData!.titleData.left),
                    SizedBox(width: 4.dp),
                    Text(
                      '限时福利',
                      style: TextStyle(
                        fontSize: 12.dp,
                        color: const Color(0xffFFE5D4).withOpacity(0.9),
                      ),
                    )
                  ],
                )
              ]),
            ),
            PositionedDirectional(top: 126.dp, child: _buildContentWidget()),
            PositionedDirectional(
              bottom: -20.dp,
              child: GestureDetector(
                onTap: () {
                  Navigator.maybePop(context);
                },
                behavior: HitTestBehavior.opaque,
                child: R.img(Assets.vip$noble_nobility_activity_close_webp, width: 48.dp, height: 48.dp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountDownWidget(int time) {
    return CustomCountDownWidget(
      counter: time,
      customChild: (int hour, int min, int second) {
        if (hour <= 0 && min <= 0 && second <= 0) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            _buttonDisable.value = true;
          });
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            R.img(Assets.vip$noble_nobility_activity_time_bg_webp, width: 68, height: 16),
            PositionedDirectional(
                start: 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: NumText(
                    hour < 10 ? '0$hour' : hour.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            PositionedDirectional(
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: NumText(
                    min < 10 ? '0$min' : min.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            PositionedDirectional(
                end: 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: NumText(
                    second < 10 ? '0$second' : second.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }

  Widget _buildContentWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        R.img(
          Assets.vip$noble_nobility_activity_litter_bg_webp,
          width: 272.dp,
          fit: BoxFit.fitHeight,
        ),
        Positioned.fill(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.dp, end: 15.dp, top: 15.dp),
                child: Text(
                  '您在${_respActivityData!.titleData.period}期间共消耗${_respActivityData!.titleData.cost}钻石，由于未开通贵族，无法享受专属权益',
                  style: TextStyle(
                    fontSize: 11.dp,
                    color: const Color(0xff8E482E).withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 20.dp),
              GradientText(
                '开通贵族尊享权益',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.dp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff8E482E),
                ),
                gradient: const LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [Color(0xFF8E482E), Color(0xFFCA6340), Color(0xFF8E482E)],
                ),
              ),
              SizedBox(
                height: 15.dp,
              ),
              SizedBox(
                height: 40.dp,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(
                        start: 15.dp,
                        end: 15.dp,
                      ),
                      child: ListView.builder(
                        itemCount: _respActivityData!.titleData.benefits.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildRightsItem(_respActivityData!.titleData.benefits[index]);
                        },
                      ),
                    ),
                    if (_respActivityData!.titleData.benefits.length > 3)
                      PositionedDirectional(
                          end: 15.dp,
                          bottom: 0,
                          child: R.img(Assets.vip$noble_nobility_activity_arrow_webp, width: 15.dp, fit: BoxFit.fitWidth)),
                  ],
                ),
              ),
              SizedBox(
                height: 15.dp,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4, bottom: 7),
                    child: R.img(
                      Assets.vip$noble_nobility_activity_extra_left_webp,
                      width: 23,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const GradientText(
                    '开通额外送',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8E482E),
                    ),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [Color(0xFF8E482E), Color(0xFFCA6340)],
                    ),
                  ),
                  GradientText(
                    _respActivityData!.titleData.rewardValue.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      height: 1,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffFF5B59),
                      fontFamily: Util.numFontFamily,
                      package: ComponentManager.MANAGER_BASE_CORE,
                    ),
                    gradient: const LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [Color(0xFFFF3F3C), Color(0xFFFE923C)],
                    ),
                  ),
                  const GradientText(
                    '元礼包',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8E482E),
                    ),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [Color(0xFFCA6340), Color(0xFF8E482E)],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 4.dp, bottom: 7.dp),
                    child: R.img(
                      Assets.vip$noble_nobility_activity_extra_right_webp,
                      width: 23.dp,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.dp,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.dp, end: 15.dp),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: (_respActivityData!.titleData.rewards.map((e) {
                      return _buildGiftItem(e.icon, e.name);
                    })).toList()),
              ),
              const Spacer(),
              Stack(
                children: [
                  Obx(() {
                    return InkWell(
                      onTap: () async {
                        if (_buttonDisable.value) return;
                        bool paySuccess = false;
                        await NobilityBuyDialog.show(context, onPayed: () {
                          paySuccess = true;
                        });
                        if (mounted && paySuccess) {
                          Navigator.maybePop(context);
                        }
                      },
                      child: R.img(
                        _buttonDisable.value
                            ? Assets.vip$noble_nobility_activity_buy_disable_webp
                            : Assets.vip$noble_nobility_activity_buy_webp,
                        width: 212.dp,
                        height: 45.dp,
                      ),
                    );
                  }),
                  PositionedDirectional(
                      start: 2,
                      top: 0,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              Assets.vip$noble_nobility_activity_des_webp,
                              centerSlice: const Rect.fromLTWH(60, 18, 2, 2),
                              scale: 2,
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              minHeight: 18,
                              minWidth: 62,
                            ),
                            padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
                            child: Text(
                              _respActivityData!.titleData.desc,
                              style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 24.dp,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightsItem(GiftBagBenefitData itemData) {
    return Container(
      width: 80.dp,
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: 24.dp,
            height: 24.dp,
            padding: EdgeInsetsDirectional.all(4.dp),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.dp), color: const Color(0xff3D1D15)),
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(itemData.icon),
              width: 16.dp,
              height: 16.dp,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            itemData.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.normal,
              color: const Color(0xff8E482E).withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftItem(String giftUrl, String name) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 60.dp,
      height: 60.dp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffFEC59F).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff8E482E).withOpacity(0.12), width: 0.5),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 60.dp,
            height: 60.dp,
          ),
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(giftUrl),
            width: 50.dp,
            fit: BoxFit.fill,
          ),
          PositionedDirectional(
            bottom: 0,
            child: Container(
              height: 14.dp,
              width: 60.dp,
              color: const Color(0xffFEC59F).withOpacity(0.88),
              alignment: Alignment.center,
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.dp,
                  color: const Color(0xff8E482E).withOpacity(0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
