import 'package:gift/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 随机礼盒顶部提示
class SlpRandomBoxTopTips extends StatefulWidget {
  final OutstandingBoxInfo_BoxInfoItem boxInfo;
  final List<String> icons;
  final VoidCallback onButtonTap;
  final String? rankUrl;

  const SlpRandomBoxTopTips({
    Key? key,
    required this.boxInfo,
    required this.icons,
    required this.onButtonTap,
    this.rankUrl,
  }) : super(key: key);

  @override
  SlpRandomBoxTopTipsState createState() {
    return SlpRandomBoxTopTipsState();
  }
}

class SlpRandomBoxTopTipsState extends State<SlpRandomBoxTopTips> {
  final SwiperController _controller = SwiperController();

  int? _timerKey;

  int _index = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => _startAnimate());
  }

  @override
  void didUpdateWidget(covariant SlpRandomBoxTopTips oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.icons.length) != (widget.icons.length)) {
      if (mounted) {
        if (_timerKey != null) {
          JsTimer.clearTimeout(_timerKey!);
        }
        _index = 0;
        _startAnimate();
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6D83FF), Color(0xFFE2A1FF)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIcons(),
          const SizedBox(width: 8),
          _buildDesc(),
          const SizedBox(width: 10),
          if (widget.rankUrl?.isNotEmpty == true)
            _buildActionBtn(K.gift_lucky_rank, _onRankBtnClick),
          const SizedBox(width: 6),
          _buildActionBtn(K.gift_view_box, widget.onButtonTap),
        ],
      ),
    );
  }

  void _onRankBtnClick() =>
      BaseWebviewScreen.show(context, url: widget.rankUrl ?? '');

  Widget _buildActionBtn(String text, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 26,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [Color(0xFFFFDCF3), Color(0xFFFFF7E5), Color(0xFFD4D6FF)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(13)),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Color(0xFF6A1FD3),
              fontSize: 9,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  final _descStyle = const TextStyle(
      fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400);
  final _highLightStyle = const TextStyle(
      fontSize: 13, color: Color(0xFFFFF01F), fontWeight: FontWeight.w500);

  Widget _buildDesc() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: K.gift_send_out,
              style: _descStyle,
              children: [
                TextSpan(
                    text: widget.boxInfo.giftTxt,
                    style: _highLightStyle.copyWith(fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 20,
            child: MarqueeWidget(
              speed: 0.4,
              child: RichText(
                text: TextSpan(
                  text: K.gift_noble_growth_value,
                  style: _descStyle,
                  children: [
                    TextSpan(
                        text: '+${_formatDouble(widget.boxInfo.growthTimes)}',
                        style: _highLightStyle),
                    TextSpan(text: K.gift_value_times, style: _descStyle),
                    TextSpan(text: K.gift_vip_wealth_value, style: _descStyle),
                    TextSpan(
                        text: 'x${_formatDouble(widget.boxInfo.wealthTimes)}',
                        style: _highLightStyle),
                    TextSpan(text: K.gift_value_times, style: _descStyle),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDouble(double num) => num.toStringAsFixed(num % 1 == 0 ? 0 : 1);

  Widget _buildIcons() {
    List<String> icons = widget.icons;
    if (Util.isCollectionEmpty(icons)) {
      return const SizedBox.shrink();
    }

    if (icons.length == 1) {
      return _buildGiftItem(icons[0]);
    }

    return SizedBox(
      width: 40,
      height: 40,
      child: Swiper(
        itemCount: icons.length,
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return _buildGiftItem(icons[index]);
        },
      ),
    );
  }

  Widget _buildGiftItem(String icon) {
    if (Util.isStringEmpty(icon)) {
      return const SizedBox.shrink();
    }

    return CachedNetworkImage(imageUrl: icon, width: 40, height: 40);
  }

  _startAnimate() {
    if (!Util.isCollectionEmpty(widget.icons) && widget.icons.length > 1) {
      int length = widget.icons.length;
      const Duration duration = Duration(seconds: 3);
      _timerKey = JsTimer.setTimeout(() {
        if (!mounted) return;

        _index += 1;
        if (_index >= length) {
          _index = _index % length;
        }
        _controller.next(animation: true);
        _startAnimate();
      }, duration.inMilliseconds);
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    if (_timerKey != null) {
      JsTimer.clearTimeout(_timerKey!);
    }
    super.dispose();
  }
}
