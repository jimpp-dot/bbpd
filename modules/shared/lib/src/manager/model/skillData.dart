import 'dart:convert' show json;

import 'package:shared/shared.dart';

class SkillInfo {
  int? block_un_auther_message;
  int? cid;
  int? credit_god_level;
  int? credit_user_level;
  int? deleted;
  int? friend_state;
  int? god_num;
  int? has_video;
  int? id;
  int? job;
  int? online_dateline;
  int? online_status;
  int? pay_receive_today;
  int? pid;
  int? role;
  int? roomId;
  int? service_busy;
  int? service_pause;
  int? sex;
  int? star;
  int? tag;
  int? title;
  int? uid;
  int? videonums;
  String? birthday;
  String? city;
  String? city_code;
  String? cover;
  String? god_category;
  String? icon;
  String? name;
  String? online_dateline_diff;
  String? position;
  String? roomIcon;
  String? sign;
  String? tmp_icon;
  String? video;
  List<Photo>? photos;
  List<Skill>? skills;
  SkillItem? skill;
  Category? skill_category;
  int? age;
  List<String>? godTags;

  SkillInfo.fromParams({
    this.block_un_auther_message,
    this.cid,
    this.credit_god_level,
    this.credit_user_level,
    this.deleted,
    this.friend_state,
    this.god_num,
    this.has_video,
    this.id,
    this.job,
    this.online_dateline,
    this.online_status,
    this.pay_receive_today,
    this.pid,
    this.role,
    this.roomId,
    this.service_busy,
    this.service_pause,
    this.sex,
    this.star,
    this.tag,
    this.title,
    this.uid,
    this.videonums,
    this.birthday,
    this.city,
    this.city_code,
    this.cover,
    this.god_category,
    this.icon,
    this.name,
    this.online_dateline_diff,
    this.position,
    this.roomIcon,
    this.sign,
    this.tmp_icon,
    this.video,
    this.photos,
    this.skills,
    this.skill,
    this.skill_category,
    this.godTags,
  });

  factory SkillInfo(jsonStr) => jsonStr is String
      ? SkillInfo.fromJson(json.decode(jsonStr))
      : SkillInfo.fromJson(jsonStr);

  SkillInfo.fromJson(jsonRes) {
    block_un_auther_message = Util.parseInt(jsonRes['block_un_auther_message']);
    cid = Util.parseInt(jsonRes['cid']);
    credit_god_level = Util.parseInt(jsonRes['credit_god_level']);
    credit_user_level = Util.parseInt(jsonRes['credit_user_level']);
    deleted = Util.parseInt(jsonRes['deleted']);
    friend_state = Util.parseInt(jsonRes['friend_state']);
    god_num = Util.parseInt(jsonRes['god_num']);
    has_video = Util.parseInt(jsonRes['has_video']);
    id = Util.parseInt(jsonRes['id']);
    job = Util.parseInt(jsonRes['job']);
    online_dateline = Util.parseInt(jsonRes['online_dateline']);
    online_status = Util.parseInt(jsonRes['online_status']);
    pay_receive_today = Util.parseInt(jsonRes['pay_receive_today']);
    pid = Util.parseInt(jsonRes['pid']);
    role = jsonRes['role'];
    roomId = Util.parseInt(jsonRes['roomId']);
    service_busy = Util.parseInt(jsonRes['service_busy']);
    service_pause = Util.parseInt(jsonRes['service_pause']);
    sex = Util.parseInt(jsonRes['sex']);
    star = Util.parseInt(jsonRes['star']);
    tag = Util.parseInt(jsonRes['tag']);
    title = jsonRes['title'];
    uid = Util.parseInt(jsonRes['uid']);
    videonums = Util.parseInt(jsonRes['videonums']);
    birthday = jsonRes['birthday'];
    city = jsonRes['city'];
    city_code = jsonRes['city_code'];
    cover = jsonRes['cover'];
    god_category = jsonRes['god_category'];
    icon = jsonRes['icon'];
    name = jsonRes['name'];
    online_dateline_diff = jsonRes['online_dateline_diff'];
    position = jsonRes['position'];
    roomIcon = jsonRes['roomIcon'];
    sign = jsonRes['sign'];
    tmp_icon = jsonRes['tmp_icon'];
    video = jsonRes['video'];
    photos = [];

    for (var photosItem in jsonRes['photos']) {
      photos!.add(Photo.fromJson(photosItem));
    }

    skills = [];

    for (var skillsItem in jsonRes['skills']) {
      skills!.add(Skill.fromJson(skillsItem));
    }

    skill = SkillItem.fromJson(jsonRes['skill']);
    skill_category = Category.fromJson(jsonRes['skill_category']);
    age = jsonRes['age'];

    if (jsonRes['user_god_tag_list'] != null &&
        jsonRes['user_god_tag_list'] is List) {
      godTags =
          (jsonRes['user_god_tag_list'] as List).map((_) => '$_').toList();
    }
  }

  @override
  String toString() {
    return '{"block_un_auther_message": $block_un_auther_message,"cid": $cid,"credit_god_level": $credit_god_level,"credit_user_level": $credit_user_level,"deleted": $deleted,"friend_state": $friend_state,"god_num": $god_num,"has_video": $has_video,"id": $id,"job": $job,"online_dateline": $online_dateline,"online_status": $online_status,"pay_receive_today": $pay_receive_today,"pid": $pid,"role": $role,"roomId": $roomId,"service_busy": $service_busy,"service_pause": $service_pause,"sex": $sex,"star": $star,"tag": $tag,"title": $title,"uid": $uid,"videonums": ${video != null ? json.encode(video) : 'null'}nums,"birthday": ${birthday != null ? json.encode(birthday) : 'null'},"city": ${city != null ? json.encode(city) : 'null'},"city_code": ${city_code != null ? json.encode(city_code) : 'null'},"cover": ${cover != null ? json.encode(cover) : 'null'},"god_category": ${god_category != null ? json.encode(god_category) : 'null'},"icon": ${icon != null ? json.encode(icon) : 'null'},"name": ${name != null ? json.encode(name) : 'null'},"online_dateline_diff": ${online_dateline_diff != null ? json.encode(online_dateline_diff) : 'null'},"position": ${position != null ? json.encode(position) : 'null'},"roomIcon": ${roomIcon != null ? json.encode(roomIcon) : 'null'},"sign": ${sign != null ? json.encode(sign) : 'null'},"tmp_icon": ${tmp_icon != null ? json.encode(tmp_icon) : 'null'},"video": ${video != null ? json.encode(video) : 'null'},"photos": $photos,"skills": $skills,"skill": $skill,"skill_category": $skill_category}';
  }
}

class Category {
  int? cid;
  String? icon;
  String? name;
  String? title;

  Category.fromParams({this.cid, this.icon, this.name, this.title});

  Category.fromJson(jsonRes) {
    cid = Util.parseInt(jsonRes['cid']);
    icon = jsonRes['icon'];
    name = jsonRes['name'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"cid": $cid,"icon": ${icon != null ? json.encode(icon) : 'null'},"name": ${name != null ? json.encode(name) : 'null'},"title": ${title != null ? json.encode(title) : 'title'}}';
  }
}

class SkillItem {
  int? avgscore;
  int? num;
  double? score;
  String? audio;
  String? cover;
  String? description;
  String? height;
  String? level;
  String? name;
  String? sign;
  String? width;
  List<Category>? tags;

  SkillItem.fromParams({
    this.avgscore,
    this.num,
    this.score,
    this.audio,
    this.cover,
    this.description,
    this.height,
    this.level,
    this.name,
    this.sign,
    this.width,
    this.tags,
  });

  SkillItem.fromJson(jsonRes) {
    avgscore = Util.parseInt(jsonRes['avgscore']);
    num = Util.parseInt(jsonRes['num']);
    score = Util.parseDouble(jsonRes['score']);
    audio = jsonRes['audio'];
    cover = jsonRes['cover'];
    description = jsonRes['description'];
    height = jsonRes['height'];
    level = jsonRes['level'];
    name = jsonRes['name'];
    sign = jsonRes['sign'];
    width = jsonRes['width'];
    tags = [];

    for (var tagsItem in jsonRes['tags']) {
      tags!.add(Category.fromJson(tagsItem));
    }
  }

  @override
  String toString() {
    return '{"avgscore": $avgscore,"num": $num,"score": $score,"audio": ${audio != null ? json.encode(audio) : 'null'},"cover": ${cover != null ? json.encode(cover) : 'null'},"description": ${description != null ? json.encode(description) : 'null'},"height": ${height != null ? json.encode(height) : 'null'},"level": ${level != null ? json.encode(level) : 'null'},"name": ${name != null ? json.encode(name) : 'null'},"sign": ${sign != null ? json.encode(sign) : 'null'},"width": ${width != null ? json.encode(width) : 'null'},"tags": $tags}';
  }
}

class Skill {
  int? priceOrg;
  int? cheap;
  int? score;
  String? description;
  int? cid;
  String? discount;
  String? height;
  int? id;
  String? num;
  String? price;
  String? sign;
  String? tags;
  String? type;
  int? uid;
  String? uint;
  String? width;

  Skill.fromParams({
    this.priceOrg,
    this.cheap,
    this.score,
    this.description,
    this.cid,
    this.discount,
    this.height,
    this.id,
    this.num,
    this.price,
    this.sign,
    this.tags,
    this.type,
    this.uid,
    this.uint,
    this.width,
  });

  Skill.fromJson(jsonRes) {
    priceOrg = Util.parseInt(jsonRes['_price']);
    cheap = Util.parseInt(jsonRes['cheap']);
    score = Util.parseInt(jsonRes['score']);
    description = jsonRes['_description'];
    cid = Util.parseInt(jsonRes['cid']);
    discount = jsonRes['discount'];
    height = jsonRes['height'];
    id = Util.parseInt(jsonRes['id']);
    num = jsonRes['num'];
    price = jsonRes['price'];
    sign = jsonRes['sign'];
    tags = jsonRes['tags'];
    type = jsonRes['type'];
    uid = Util.parseInt(jsonRes['uid']);
    uint = jsonRes['uint'];
    width = jsonRes['width'];
  }

  @override
  String toString() {
    return '{"_price": $priceOrg,"cheap": $cheap,"score": $score,"_description": ${description != null ? json.encode(description) : 'null'},"cid": ${cid != null ? json.encode(cid) : 'null'},"discount": ${discount != null ? json.encode(discount) : 'null'},"height": ${height != null ? json.encode(height) : 'null'},"id": ${id != null ? json.encode(id) : 'null'},"num": ${num != null ? json.encode(num) : 'null'},"price": ${price != null ? json.encode(price) : 'null'},"sign": ${sign != null ? json.encode(sign) : 'null'},"tags": ${tags != null ? json.encode(tags) : 'null'},"type": ${type != null ? json.encode(type) : 'null'},"uid": ${uid != null ? json.encode(uid) : 'null'},"uint": ${uint != null ? json.encode(uint) : 'null'},"width": ${width != null ? json.encode(width) : 'null'}}';
  }
}

class VoteInfo {
  int? tagNum;
  List<TagData>? tagData;
  List<TagHead>? tagHead;

  VoteInfo.fromParams({this.tagNum, this.tagData, this.tagHead});

  factory VoteInfo(jsonStr) => jsonStr is String
      ? VoteInfo.fromJson(json.decode(jsonStr))
      : VoteInfo.fromJson(jsonStr);

  VoteInfo.fromJson(jsonRes) {
    tagNum = jsonRes['tagNum'];
    tagData = [];

    for (var tagDataItem in jsonRes['tagData']) {
      tagData!.add(TagData.fromJson(tagDataItem));
    }

    tagHead = [];

    for (var tagHeadItem in jsonRes['tagHead']) {
      tagHead!.add(TagHead.fromJson(tagHeadItem));
    }
  }

  @override
  String toString() {
    return '{"tagNum": $tagNum,"tagData": $tagData,"tagHead": $tagHead}';
  }
}

class TagHead {
  int? num;
  String? tag;

  TagHead.fromParams({this.num, this.tag});

  TagHead.fromJson(jsonRes) {
    num = jsonRes['num'];
    tag = jsonRes['tag'];
  }

  @override
  String toString() {
    return '{"num": $num,"tag": ${tag != null ? json.encode(tag) : 'null'}}';
  }
}

class TagData {
  int? credit_user_level;
  int? money;
  String? dateline;
  String? desc;
  String? icon;
  String? id;
  String? name;
  String? nstardesc;
  String? ordernum;
  String? orderprice;
  String? orderuint;
  String? star;
  String? uid;
  List<dynamic>? tags;

  TagData.fromParams({
    this.credit_user_level,
    this.money,
    this.dateline,
    this.desc,
    this.icon,
    this.id,
    this.name,
    this.nstardesc,
    this.ordernum,
    this.orderprice,
    this.orderuint,
    this.star,
    this.uid,
    this.tags,
  });

  TagData.fromJson(jsonRes) {
    credit_user_level = Util.parseInt(jsonRes['credit_user_level']);
    money = Util.parseInt(jsonRes['money']);
    dateline = jsonRes['dateline'];
    desc = jsonRes['desc'];
    icon = jsonRes['icon'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    nstardesc = jsonRes['nstardesc'];
    ordernum = jsonRes['ordernum'];
    orderprice = jsonRes['orderprice'];
    orderuint = jsonRes['orderuint'];
    star = jsonRes['star'];
    uid = jsonRes['uid'];
    tags = jsonRes['tags'];
  }

  @override
  String toString() {
    return '{"credit_user_level": $credit_user_level,"money": $money,"dateline": ${dateline != null ? json.encode(dateline) : 'null'},"desc": ${desc != null ? json.encode(desc) : 'null'},"icon": ${icon != null ? json.encode(icon) : 'null'},"id": ${id != null ? json.encode(id) : 'null'},"name": ${name != null ? json.encode(name) : 'null'},"nstardesc": ${nstardesc != null ? json.encode(nstardesc) : 'null'},"ordernum": ${ordernum != null ? json.encode(ordernum) : 'null'},"orderprice": ${orderprice != null ? json.encode(orderprice) : 'null'},"orderuint": ${orderuint != null ? json.encode(orderuint) : 'null'},"star": ${star != null ? json.encode(star) : 'null'},"uid": ${uid != null ? json.encode(uid) : 'null'},"tags": $tags}';
  }
}
