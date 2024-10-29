/// Pair类型的容器
class Pair<F, S> {
  final F first;
  final S second;

  Pair(this.first, this.second);

  static Pair<F, S> create<F, S>(F first, S second) {
    return Pair<F, S>(first, second);
  }
}
