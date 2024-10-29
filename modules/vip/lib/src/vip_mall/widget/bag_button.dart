import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Selector;

import '../../../k.dart';

class BagButton extends StatelessWidget {
  final String from;

  const BagButton({super.key, this.from = 'first'});

  _onBagTaped(BuildContext context) async {
    Tracker.instance.track(
        from == 'second'
            ? TrackEvent.shop_secondpage
            : TrackEvent.shop_firstpage,
        properties: {
          'shop_page_click': 'backpack',
        });

    IVipManager? manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    await manager?.showBagPage(context);
    context.read<ProfilePayload>().loadBagRedPoint();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilePayload>(
      builder: (context, bean, _) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBagTaped(context),
          child: Container(
            width: 50,
            height: 28,
            alignment: AlignmentDirectional.center,
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 28,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFFFD96), Color(0xFFFFBCF6)],
                            begin: AlignmentDirectional.topCenter,
                            end: AlignmentDirectional.bottomCenter),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    K.bag,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (bean.showBagRedPoint)
                  PositionedDirectional(
                    end: 0,
                    top: 0,
                    child: _buildRedPoint(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRedPoint() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: R.colors.thirdBrightColor,
      ),
    );
  }
}
