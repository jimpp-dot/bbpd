import 'event.dart';

class TrackEventJuben extends TrackEvent {
  const TrackEventJuben(String name) : super(name);

  /// 剧本首页入口点击
  static const juben_home_enter_click =
      TrackEventJuben('juben_home_enter_click');

  /// 剧本那小谁入口点击
  static const juben_official_notice_folder_click =
      TrackEventJuben('juben_official_notice_folder_click');

  /// 剧本那小谁消息曝光
  static const juben_official_notice_show =
      TrackEventJuben('juben_official_notice_show');

  /// 剧本那小谁消息点击
  static const juben_official_notice_click =
      TrackEventJuben('juben_official_notice_click');

  /// 剧本首页活动弹窗曝光
  static const juben_official_home_page_pop_show =
      TrackEventJuben('juben_official_home_page_pop_show');

  /// 剧本首页活动点击曝光
  static const juben_official_home_page_pop_click =
      TrackEventJuben('juben_official_home_page_pop_click');

  /// 剧本渠道承接跳转埋点
  static const juben_schema_tag = TrackEventJuben('juben_schema_tag');

  /// 好声音主页面曝光
  static const good_voice_homepage_show =
      TrackEventJuben('good_voice_homepage_show');

  /// 好声音主页面banner点击
  static const good_voice_homepage_banner_click =
      TrackEventJuben('good_voice_homepage_banner_click');

  /// 好声音主页面魅力榜点击
  static const good_voice_homepage_charmlist_click =
      TrackEventJuben('good_voice_homepage_charmlist_click');

  /// 好声音主页面点赞榜点击
  static const good_voice_homepage_praiselist_click =
      TrackEventJuben('good_voice_homepage_praiselist_click');

  /// 好声音实时广场页曝光
  static const good_voice_square_show =
      TrackEventJuben('good_voice_square_show');

  /// 好声音活动详情页曝光
  static const good_voice_acdetailspage_show =
      TrackEventJuben('good_voice_acdetailspage_show');

  /// 好声音活动详情页魅力榜点击
  static const good_voice_acdetailspage_charmlist_click =
      TrackEventJuben('good_voice_acdetailspage_charmlist_click');

  /// 好声音活动详情页点赞榜点击
  static const good_voice_acdetailspage_praiselist_click =
      TrackEventJuben('good_voice_acdetailspage_praiselist_click');

  /// 好声音往期回顾页曝光
  static const good_voice_reviewpage_show =
      TrackEventJuben('good_voice_reviewpage_show');

  /// 好声音往期回顾页入口点击
  static const good_voice_reviewpage_banner_click =
      TrackEventJuben('good_voice_reviewpage_banner_click');

  /// 好声音音频详情页曝光
  static const good_voice_vodetailspage_show =
      TrackEventJuben('good_voice_vodetailspage_show');

  /// 好声音音频详情页按钮点击
  static const good_voice_vodetailspage_button_click =
      TrackEventJuben('good_voice_vodetailspage_button_click');

  /// 好声音音频详情页用户头像点击
  static const good_voice_vodetailspage_faces_click =
      TrackEventJuben('good_voice_vodetailspage_faces_click');

  /// 好声音音频详情页分享
  static const good_voice_vodetailspage_share =
      TrackEventJuben('good_voice_vodetailspage_share');

  /// 好声音上传音频页曝光
  static const good_voice_upload_show =
      TrackEventJuben('good_voice_upload_show');

  /// 好声音上传音频页按钮点击
  static const good_voice_upload_button_click =
      TrackEventJuben('good_voice_upload_button_click');

  /// 好声音专辑页曝光
  static const good_voice_albumpage_show =
      TrackEventJuben('good_voice_albumpage_show');

  /// 音频播放（触发播放器）
  static const play_voice = TrackEventJuben('play_voice');

  /// 音频暂停（暂停播放器）
  static const pause_voice = TrackEventJuben('pause_voice');

  /// 音频点赞
  static const like_voice = TrackEventJuben('like_voice');

  /// 音频取消点赞
  static const dislike_voice = TrackEventJuben('dislike_voice');

  /// 音频送礼
  static const send_voice_gift = TrackEventJuben('send_voice_gift');

  /// 个人主页专辑入口曝光
  static const personal_page_album_show =
      TrackEventJuben('personal_page_album_show');

  /// 个人主页专辑入口“更多”按钮点击
  static const personal_page_album_more_click =
      TrackEventJuben('personal_page_album_more_click');

  /// 纸条页曝光
  static const note_page_show = TrackEventJuben('note_page_show');

  /// 发布纸条
  static const throw_note = TrackEventJuben('throw_note');

  /// 纸条下发
  static const issue_note = TrackEventJuben('issue_note');

  /// 回复纸条
  static const answer_note = TrackEventJuben('answer_note');

  /// 纸条敏感信息toast
  static const sensitive_toast_show = TrackEventJuben('sensitive_toast_show');

  /// 纸箱页曝光
  static const carton_page_show = TrackEventJuben('carton_page_show');

  /// 纸条自动接收开关状态变更
  static const note_auto_switch_change =
      TrackEventJuben('note_auto_switch_change');

  /// 纸箱清空按钮点击
  static const delete_note_click = TrackEventJuben('delete_note_click');

  /// 纸箱清空成功
  static const delete_note_success = TrackEventJuben('delete_note_success');
}

class TrackEventJubenProperties {
  static Map<String, dynamic> jubenHomeEnterClickProperties(
      String jubenEnterName) {
    Map<String, dynamic> properties = <String, dynamic>{
      'juben_enter_name': jubenEnterName,
    };
    return properties;
  }

  static Map<String, dynamic> jubenOfficialNormalProperties(int officialId) {
    Map<String, dynamic> properties = <String, dynamic>{
      'official_id': officialId,
    };
    return properties;
  }

  static Map<String, dynamic> jubenHelpNormalProperties(int videoId) {
    Map<String, dynamic> properties = <String, dynamic>{
      'video_id': videoId,
    };
    return properties;
  }

  static Map<String, dynamic> jubenSchemaTagProperties(String schemaTag,
      String schemaAidName, String schemaUrl, int schemaSuccess) {
    Map<String, dynamic> properties = <String, dynamic>{
      'juben_schema_tag': schemaTag,
      'juben_schema_aidname': schemaAidName,
      'juben_schema_url': schemaUrl,
      'juben_schema_success': schemaSuccess,
    };
    return properties;
  }
}
