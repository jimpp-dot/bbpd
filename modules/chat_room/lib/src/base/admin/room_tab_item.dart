class RoomTabItem {
  static const all = 'all'; // 贡献总榜
  static const week = 'week'; // 贡献榜
  static const love = 'love'; // 真爱榜
  static const red_packet = 'red_packet'; // 红包
  static const fans = 'fans'; // 粉丝榜
  static const charm_week = 'charm_week'; // 魅力榜
  static const online = 'online'; // 在线
  static const package = 'package'; // 打赏日志
  static const log = 'log'; // 操作日志
  static const admin = 'admin'; // 管理员列表
  static const defend = 'defend'; // 电台守护
  static const sweet = 'sweet'; // 守护榜
  static const vip = 'vip'; // 贵族榜
  static const forbidden = 'forbidden'; // 封禁日志
  static const data = 'data'; // 数据
  static const transfer = 'transfer'; // 新转
  static const pub_home_consume = 'pub_home_consume'; // 夜店消费榜
  static const pub_home_charm = 'pub_home_charm'; // 夜店魅力榜
  static const pub_home_gift = 'pub_home_gift'; // 夜店礼物榜
  static const nest = 'nest'; // 私密房
  static const cubicle = 'cubicle'; // 私密房
  static const reward = 'reward'; // 打赏房

  final String type;
  final String label;

  RoomTabItem(this.type, this.label);
}
