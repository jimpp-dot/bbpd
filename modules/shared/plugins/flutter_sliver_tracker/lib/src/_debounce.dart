import 'dart:async';

Function debounce(Function fn, [int t = 30]) {
  Timer? debounce;
  return () {
    // 还在时间之内，抛弃上一次
    if (debounce?.isActive ?? false) debounce?.cancel();

    debounce = Timer(Duration(milliseconds: t), () {
      fn();
    });

    return debounce;
  };
}
