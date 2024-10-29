class PageRefer {
  final String name;
  final PageRefer? parent;

  const PageRefer(this.name, [this.parent]);

  String getPath() {
    if (parent == null) {
      return name;
    } else {
      return '${parent!.getPath()}:$name';
    }
  }

  @override
  String toString() {
    return getPath();
  }
}
