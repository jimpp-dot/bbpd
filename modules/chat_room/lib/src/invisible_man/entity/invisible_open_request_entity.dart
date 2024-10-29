class InvisibleOpenRequestEntity {
  int? invisibleId;
  int? isOpen;

  InvisibleOpenRequestEntity({this.invisibleId = 0, this.isOpen = 0});

  Map<String, String> toJson() =>
      {'invisible_id': '$invisibleId', 'is_open': '$isOpen'};
}
