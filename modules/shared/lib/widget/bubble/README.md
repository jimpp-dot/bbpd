
  ///浮层气泡消失
  Future<bool> _hideTips() async {
    //如果有气泡提示,则消失掉
    bool flag = await BubbleTips.hide();
    return flag;
  }

  ///浮层气泡显示
  _showTips() async {
    if (!TipsHelp.showTip("2")) {  // "2" 需要改为自己的key
      return;
    }

    await Future.delayed(Duration(milliseconds: 150));

    RenderBox box = _key1.currentContext.findRenderObject();
    Offset off = box.localToGlobal(Offset.zero);

    double width = 174.0;
    double height = 44.0;
    double arrStartPosition = 148.0;
    double bottom = MediaQuery.of(context).size.height - off.dy - box.size.height - 8.0;
    double right = 13.0;
    double left = MediaQuery.of(context).size.width - width - right;

    BubbleTips.showTips(
      Constant.context,
      K.killer_tips_content_2,
      width,
      height,
      BubbleDirection.top,
      arrStartPosition,
      bottom,
      left,
      right,
      duration: Duration(seconds: TipsHelp.tipShowSeconds),
      borderColor: R.color.dividerColor,
    );
    TipsHelp.setTip("2");
  }

  ///widget显示
  ///获取气泡视图，并预置显示动画
  Widget _getTipsWidget() {
    if (this.widget.index == 0) {
      if (!TipsHelp.showTip("1")) {
        return Container();
      }
      if (_controllerShowAnim == null) {
        _controllerShowAnim = new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 300),
        );
      }
      var opacityAnim1;
      if (opacityAnim1 == null) {
        opacityAnim1 = new Tween(begin: 0.0, end: 1.0).animate(_controllerShowAnim);
      }

      TipWidgetConfig tipWidgetConfig = BubbleTips.getTipsWidget(context, K.killer_tips_content_1, 159.0, 44.0, BubbleDirection.bottom, -1.0, borderColor: R.color.dividerColor,); //获取气泡视图

      Widget widget =  AnimatedBuilder(
        animation: opacityAnim1,
        child: ScaleTransition (
          //设置动画的缩放中心
          alignment: tipWidgetConfig.alignment,//Alignment(0.88, -1.0),
          //动画控制器
          scale: _controllerShowAnim,
          child: tipWidgetConfig.child,
        ),
        builder: (BuildContext context, Widget child) {
          return Opacity(
              opacity: opacityAnim1.value,
              child: child
          );
        },
      );

      this._tipsTimer = Timer(Duration(milliseconds: 150), () {
        if (_controllerShowAnim != null) {
          _controllerShowAnim.forward();
        }
        TipsHelp.setTip("1");
      });

      return widget;
    } else {
      return Container();
    }
  }

