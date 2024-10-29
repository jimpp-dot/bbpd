import 'dart:math';

import 'package:shared/shared.dart';
import 'package:shared/widget/time_count_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:gift/assets.dart';
import 'package:gift/src/constellation_clap/constellation_clap_manager.dart';
import 'package:gift/src/constellation_clap/constellation_clap_repo.dart';
import 'package:gift/src/constellation_clap/pb/generated/zodiac.pb.dart';
import 'package:gift/src/constellation_clap/resource_manager.dart';

/// 星座拍拍结果弹窗
class ConstellationClapResultDialog extends StatefulWidget {
  final ZodiacPaiResultData data;

  const ConstellationClapResultDialog(this.data, {super.key});

  static Future show(BuildContext context, {ZodiacPaiResultData? data}) async {
    await ResourceManager.precache();
    if (data == null) {
      final res = await ConstellationClapRepo.resultDialog();
      if (res.success) {
        data = res.data;
      } else {
        Fluttertoast.showCenter(msg: res.message);
        return;
      }
    }

    await DialogTransition.scaleShow(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConstellationClapResultDialog(data!),
    );
    ConstellationClapManager.notifyHomeFloatUpdate(data);
  }

  @override
  _ConstellationClapResultDialogState createState() =>
      _ConstellationClapResultDialogState();
}

class _ConstellationClapResultDialogState
    extends State<ConstellationClapResultDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(ResourceManager.bgResultDialog),
            width: 280.dp,
            height: 499.dp,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 280.dp,
            height: 499.dp,
            child: Column(
              children: [
                SizedBox(height: 44.dp),
                R.img(Assets.gift$constellation_clap_text_clap_done_webp,
                    width: 130.dp, height: 28.5.dp),
                SizedBox(height: 16.dp),
                _buildUserRow(),
                SizedBox(height: 6.dp),
                _buildTopGiftRow(),
                SizedBox(height: 11.dp),
                SizedBox(
                  width: 233.dp,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) => _buildCountingGiftRow(
                        index, widget.data.missions[index]),
                    itemCount: min(widget.data.missions.length, 3),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 25.dp,
            end: 13.dp,
            child: _buildCloseBtn(),
          ),
          PositionedDirectional(
            top: 232.dp,
            child: R.img(
                Assets.gift$constellation_clap_result_counter_top_shadow_webp,
                width: 273.5.dp,
                height: 19.dp),
          ),
          PositionedDirectional(
            top: 241.5.dp,
            start: 63.dp,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                R.img(Assets.gift$constellation_clap_bg_time_counter_webp,
                    width: 168.dp, height: 11.5.dp),
                Row(
                  children: [
                    TimerCountDownWidget(
                      duration: widget.data.endTime -
                          DateTime.now().millisecondsSinceEpoch ~/ 1000,
                      autoStart: true,
                      onEnd: () {
                        Navigator.pop(context);
                      },
                      builder: (context, remainTime) {
                        return NumText(
                          Utility.formatTimeDHMS(remainTime),
                          style: TextStyle(fontSize: 8.dp, color: Colors.white),
                        );
                      },
                    ),
                    SizedBox(width: 5.dp),
                    Text('(拍拍倒计时)',
                        style: TextStyle(fontSize: 8.dp, color: Colors.white)),
                    SizedBox(width: 5.dp),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildUser(true, widget.data.me.icon, widget.data.me.zodiacIcon),
        Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                R.img(Assets.gift$constellation_clap_ic_result_heart_webp,
                    width: 38.dp, height: 28.dp),
                NumText(
                  '${widget.data.score}',
                  style: TextStyle(
                      fontSize: 12.dp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Text('配对指数',
                style: TextStyle(fontSize: 10.dp, color: Colors.white)),
          ],
        ),
        _buildUser(
            false, widget.data.spokesman.icon, widget.data.spokesman.zodiacIcon,
            uid: widget.data.spokesman.uid),
      ],
    );
  }

  Widget _buildUser(bool left, String userIcon, String constellationIcon,
      {int uid = 0}) {
    return SizedBox(
      width: 60.dp,
      height: 59.dp,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 2.dp,
            start: left ? 3.dp : null,
            end: left ? null : 3.dp,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(left ? 0 : pi),
              child: R.img(Assets.gift$constellation_clap_bg_result_head_webp,
                  width: 57.dp, height: 54.5.dp),
            ),
          ),
          PositionedDirectional(
            top: 3.dp,
            start: left ? 5.dp : null,
            end: left ? null : 5.dp,
            child: CommonAvatar(
              path: userIcon,
              shape: BoxShape.circle,
              size: 50.dp,
              onTap: left
                  ? null
                  : () {
                      IPersonalDataManager manager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_PERSONALDATA);
                      manager.openImageScreen(context, uid);
                    },
            ),
          ),
          PositionedDirectional(
            end: left ? null : 0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                R.img(Assets.gift$constellation_clap_bg_head_constellation_webp,
                    width: 20.dp, height: 19.dp),
                CachedNetworkImage(
                  imageUrl: constellationIcon,
                  width: 8.dp,
                  height: 8.dp,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseBtn() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: R.img(Assets.gift$constellation_clap_ic_close_webp,
          width: 30.dp, height: 30.dp),
    );
  }

  Widget _buildTopGiftRow() {
    return Container(
      width: 233.dp,
      height: 77.dp,
      padding: EdgeInsetsDirectional.only(top: 16.dp, start: 8.dp, end: 8.dp),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  Assets.gift$constellation_clap_bg_result_top_item_webp),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 7.dp),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 45.dp,
                    height: 45.dp,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.data.gift.icon,
                      width: 45.dp,
                      height: 45.dp,
                      fit: BoxFit.contain,
                    ),
                  ),
                  PositionedDirectional(
                    top: -2.5.dp,
                    end: -2.5.dp,
                    child: Container(
                      width: 28.dp,
                      height: 16.5.dp,
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets
                                  .gift$constellation_clap_bg_user_label_webp),
                              fit: BoxFit.fill)),
                      child: Text('使用权',
                          style:
                              TextStyle(fontSize: 5.dp, color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 6.dp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('拍拍专属礼物',
                        style: TextStyle(fontSize: 13.dp, color: Colors.white)),
                    SizedBox(height: 3.dp),
                    Text(widget.data.gift.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 8.dp, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.dp),
          Row(
            children: [
              Text(widget.data.gift.name,
                  style: TextStyle(fontSize: 8.dp, color: Colors.white)),
              Text('（${widget.data.gift.price}${MoneyConfig.moneyName4}）',
                  style: TextStyle(fontSize: 8.dp, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCountingGiftRow(int index, ZodiacPaiMission mission) {
    return Container(
      width: 233.dp,
      height: index == 0 ? 85.dp : 70.dp,
      padding: EdgeInsetsDirectional.only(
          top: index == 0 ? 15.dp : 0, start: 3.dp, end: 8.dp),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(index == 0
                  ? Assets.gift$constellation_clap_bg_result_first_item_webp
                  : Assets.gift$constellation_clap_bg_result_item_webp),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          SizedBox(height: 7.dp),
          Row(
            children: [
              SizedBox(width: 12.dp),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 45.dp,
                    height: 45.dp,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: mission.rewardIcon,
                      width: 45.dp,
                      height: 45.dp,
                      fit: BoxFit.contain,
                    ),
                  ),
                  PositionedDirectional(
                    top: -2.5.dp,
                    end: -2.5.dp,
                    child: Container(
                      width: 28.dp,
                      height: 16.5.dp,
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets
                                  .gift$constellation_clap_bg_user_label_webp),
                              fit: BoxFit.fill)),
                      child: Text(mission.rewardPeriod,
                          style:
                              TextStyle(fontSize: 5.dp, color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10.dp),
              SizedBox(
                width: 90.dp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 90.dp,
                      child: Text(
                        mission.description,
                        style: TextStyle(fontSize: 8.dp, color: Colors.white),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 2.dp),
                    _buildProgress(mission.total > 0
                        ? mission.progress * 1.0 / mission.total
                        : (mission.progress > 0 ? 1 : 0)),
                    SizedBox(height: 2.dp),
                    Text(
                      mission.type != 1
                          ? '${mission.progress}/${mission.total}'
                          : '',
                      style: TextStyle(fontSize: 9.dp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _buildOpBtn(mission),
            ],
          ),
          SizedBox(height: 2.dp),
          Row(
            children: [
              SizedBox(
                width: 69.dp,
                child: Text(
                  mission.rewardName,
                  style: TextStyle(fontSize: 8.dp, color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgress(double rate) {
    if (rate > 1) {
      rate = 1;
    } else if (rate < 0) {
      rate = 0;
    }
    return Stack(
      children: [
        Container(
          width: 90.dp,
          height: 4.dp,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Color(0xFF8D5FE2),
          ),
        ),
        Container(
          width: 90.dp * rate,
          height: 4.dp,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            gradient:
                LinearGradient(colors: [Color(0xFFC85BFF), Color(0xFFF3B7FF)]),
          ),
        ),
      ],
    );
  }

  Widget _buildOpBtn(ZodiacPaiMission mission) {
    String btnText;
    bool disable;
    if (mission.type == 1) {
      btnText = '撩一下';
      disable = false;
    } else {
      if (mission.state == _stateDoing0 || mission.state == _stateDoing1) {
        btnText = '去领取';
        disable = false;
      } else if (mission.state == _stateCanGet) {
        btnText = '领取';
        disable = false;
      } else if (mission.state == _stateGot) {
        btnText = '已领取';
        disable = true;
      } else {
        btnText = '去领取';
        disable = true;
      }
    }
    return GestureDetector(
      onTap: () async {
        if (mission.type == 1) {
          if (Util.validStr(mission.jump)) {
            Navigator.pop(context);
            SchemeUrlHelper.instance()
                .checkSchemeUrlAndGo(System.context, mission.jump);

            Uri uri = Uri.parse(mission.jump);
            Map<String, String> qps = uri.queryParameters;
            int rid = Util.parseInt(qps['rid']);
            Tracker.instance.track(TrackEvent.flip_botton_click,
                properties: {'uid': Session.uid, if (rid > 0) 'rid': rid});

            if (mission.progress == 0) {
              ConstellationClapRepo.setClickJump();
            }
          }
        } else {
          if (mission.state == _stateDoing0 || mission.state == _stateDoing1) {
            Navigator.pop(context);
            SchemeUrlHelper.instance()
                .checkSchemeUrlAndGo(System.context, mission.jump);
          } else if (mission.state == _stateCanGet) {
            final res = await ConstellationClapRepo.getAward(mission.id);
            if (res.success) {
              Fluttertoast.showCenter(msg: '领取成功');
              mission.state = _stateGot;
              refresh();
            } else {
              Fluttertoast.showCenter(msg: res.msg);
            }
          } else if (mission.state == _stateGot) {
            Fluttertoast.showCenter(msg: '奖励已领取');
          } else {
            Fluttertoast.showCenter(msg: '超时任务失败');
          }
        }
      },
      child: Container(
        width: 55.5.dp,
        height: 24.5.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(disable
                ? Assets.gift$constellation_clap_bg_op_btn_disable_webp
                : Assets.gift$constellation_clap_bg_op_btn_webp),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(btnText,
            style: TextStyle(fontSize: 9.dp, color: Colors.white)),
      ),
    );
  }
}

/// 0/1 进行中 2 完成待领取 3 已领取 4 超时未领取
const int _stateDoing0 = 0;
const int _stateDoing1 = 1;
const int _stateCanGet = 2;
const int _stateGot = 3;
