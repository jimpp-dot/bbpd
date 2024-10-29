import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/anchor_zone/welfare_model.dart';
import '../../k.dart';
import 'package:shared/util/color_constant.dart';

/// 福利页面
class WelfarePage extends StatefulWidget {
  final String statement;
  final List<Welfare>? welfares;

  const WelfarePage(this.statement, this.welfares, {super.key});

  @override
  _WelfarePageState createState() => _WelfarePageState();
}

class _WelfarePageState extends State<WelfarePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [_welfareList(widget.welfares), _footer(widget.statement)]);
  }

  Widget _welfareList(List<Welfare>? welfares) {
    int welfareSize = welfares?.length ?? 0;
    return ListView.builder(
        padding: const EdgeInsetsDirectional.only(
            start: 12, top: 12, end: 12, bottom: 0),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: welfareSize > 0 ? (welfareSize + 1) : 0,
        itemBuilder: (BuildContext context, int index) {
          if (index >= welfareSize) return const SizedBox(height: 56);
          return _WelfareItem(welfares![index]);
        });
  }

  Widget _footer(String statement) {
    return Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0XFF6327DD),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 8),
            _footerSummary(),
            const SizedBox(height: 12)
          ]),
        ));
  }

  Widget _footerSummary() => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              K.vip_welfare_footer_statement([Util.appName]),
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 11.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ]);
}

class _WelfareItem extends StatelessWidget {
  final Welfare item;

  const _WelfareItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _ItemHeaderTitle(
          item.iconUrl, item.stage, item.point, item.lotteryCodeCount),
      _Timeline(item),
      _buildWelfareImage(item.imageUrl),
      _buildTitle(item.title),
      _buildSummary(item.desc)
    ]);
  }

  Widget _buildWelfareImage(String url) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 12, top: 28),
      width: 73,
      height: 73,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 0.5, color: Colors.white.withOpacity(0.2)),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Container(
        width: 72,
        height: 72,
        padding: const EdgeInsetsDirectional.fromSTEB(0.5, 0.5, 0.5, 0.5),
        decoration: const BoxDecoration(
            color: Color(0XFF3D178B),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ClipRRect(
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            width: 72,
            height: 72,
          ),
        ),
      ),
    );
  }

  /// 礼物图片右上方的标题，如"礼物特权"
  Widget _buildTitle(String title) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 93, top: 33),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 礼物图片右下方的描述
  Widget _buildSummary(String summary) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 93, top: 59),
      child: Text(
        summary,
        style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            inherit: true,
            fontFamily: Util.fontFamily),
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  final double totalSize = 109;
  final double firstSize = 5;
  final double secondSize = 104;

  final Welfare welfare;

  const _Timeline(this.welfare);

  @override
  Widget build(BuildContext context) {
    double secondLinePercent = secondSize / totalSize;
    double previousPercent = welfare.previousProgressPercent;
    List<Widget> widgets = [];
    if (welfare.first) {
      widgets.add(SizedBox(width: 3, height: firstSize));
    } else {
      double p = previousPercent - secondLinePercent;
      if (p > 0.0) {
        if (previousPercent >= 1) {
          widgets.add(_buildLine(firstSize, true));
        } else {
          widgets.add(_buildLine(totalSize * p, true));
          widgets.add(_buildLine(totalSize * (1 - previousPercent), false));
        }
      } else {
        widgets.add(_buildLine(firstSize, false));
      }
    }
    widgets.add(_buildCircle(welfare.isCompleted));
    if (!welfare.last) {
      double p = welfare.progressPercent;
      if (p >= secondLinePercent) {
        widgets.add(_buildLine(secondSize, true));
      } else if (p <= 0) {
        widgets.add(_buildLine(secondSize, false));
      } else {
        widgets.add(_buildLine(totalSize * p, true));
        widgets.add(_buildLine(totalSize * (secondLinePercent - p), false));
      }
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets);
  }

  /// 构造圆点
  Widget _buildCircle(bool isCompleted) {
    return Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
          color: isCompleted
              ? ColorConstant.welfareContributeTextColor
              : const Color(0XFF9E90F3),
          borderRadius: const BorderRadius.all(Radius.circular(11)),
        ));
  }

  /// 构造线条
  Widget _buildLine(double height, bool isCompleted) {
    return Container(
        width: 3,
        height: height,
        color: isCompleted
            ? ColorConstant.welfareContributeTextColor
            : const Color(0XFF9E90F3));
  }
}

/// 标题
class _ItemHeaderTitle extends StatelessWidget {
  final String icon;
  final String title;
  final String integral;
  final int lotteryCodeCount;

  const _ItemHeaderTitle(
      this.icon, this.title, this.integral, this.lotteryCodeCount);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (icon.isNotEmpty) {
      widgets.add(const SizedBox(width: 12));
      widgets.add(CachedNetworkImage(
          imageUrl: icon, fit: BoxFit.cover, width: 20, height: 20));
      widgets.add(const SizedBox(width: 2));
    } else {
      widgets.add(const SizedBox(width: 13));
    }

    /// 肾上腺素
    widgets.add(Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ));
    widgets.add(const SizedBox(width: 4));

    /// 500W积分
    widgets.add(Text(
      integral,
      style: const TextStyle(
        color: ColorConstant.welfareContributeTextColor,
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ));

    /// 发送礼物码数量
    if (lotteryCodeCount > 0) {
      widgets.add(const SizedBox(width: 2));
      widgets.add(Text(K.vip_lottery_code_count([lotteryCodeCount.toString()]),
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 11.0,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets);
  }
}
