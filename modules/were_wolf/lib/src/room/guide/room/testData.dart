import 'package:shared/shared.dart';

///静态数据
Map guideTestDataA = {
  "success": true,
  "data": {
    "title": "专业狼人局，会的进",
    "users": [
      {
        "position": 1,
        "role": "seer",
        "name": "草丛中的花朵",
        "icon": "${System.imageDomain}static/wolf_v2/wolf_guide/img/user_1.png",
        "sex": "1"
      },
      {
        "position": 2,
        "role": "witch",
        "name": "爆浆小草莓",
        "icon": "${System.imageDomain}static/wolf_v2/wolf_guide/img/user_2.png",
        "sex": "2"
      },
      {
        "position": 3,
        "role": "popular",
        "name": "眼角的泪",
        "icon": "${System.imageDomain}static/wolf_v2/wolf_guide/img/user_3.png",
        "sex": "2"
      },
      {
        "position": 5,
        "role": "popular",
        "name": "蜕变ing",
        "icon": "${System.imageDomain}static/wolf_v2/wolf_guide/img/user_5.png",
        "sex": "2"
      },
      {
        "position": 6,
        "role": "wolf",
        "name": "龙城冯少",
        "icon": "${System.imageDomain}static/wolf_v2/wolf_guide/img/user_6.png",
        "sex": "1"
      }
    ],
    "voices": {
      "day_1_night_position_6":
          "${System.imageDomain}static/wolf_v2/wolf_guide/voice/day_1_night_position_6.wav",
      "day_2_day_desc_position_1":
          "${System.imageDomain}static/wolf_v2/wolf_guide/voice/day_2_day_desc_position_1.wav",
      "day_2_day_desc_position_2":
          "${System.imageDomain}static/wolf_v2/wolf_guide/voice/day_2_day_desc_position_2.wav",
      "day_2_day_desc_position_3":
          "${System.imageDomain}static/wolf_v2/wolf_guide/voice/day_2_day_desc_position_3.wav",
      "day_2_day_desc_position_5":
          "${System.imageDomain}static/wolf_v2/wolf_guide/voice/day_2_day_desc_position_5.wav",
      "day_2_day_desc_position_6":
          "${System.imageDomain}static/wolf_v2/wolf_guide/voice/day_2_day_desc_position_6.wav",
      "day_2_day_last_position_1":
          "${System.imageDomain}static/wolf_v2/wolf_guide/voice/day_2_day_last_position_1.wav"
    },
    "roles": [
      {"role": "popular", "roleName": "平民", "roleCount": 1, "rolePrice": 1},
      {"role": "wolf", "roleName": "狼人", "roleCount": 1, "rolePrice": 0},
      {"role": "witch", "roleName": "女巫", "roleCount": 1, "rolePrice": 1},
      {"role": "seer", "roleName": "预言家", "roleCount": 1, "rolePrice": 1}
    ],
    "cRole": "wolf",
    "cWinCondition": "所有平民死亡或者所有平民死亡",
    "cDesc": "【能力】每天晚上可以袭击一名玩家",
    "cBoard": [
      {
        "content": "【6人局】暗牌，屠边",
        "highLightContent": ["【6人局】"]
      },
      {
        "content": "【配置】2狼人+预+女",
        "highLightContent": ["【配置】"]
      },
      {
        "content": "【平票】PK1轮发言",
        "highLightContent": ["【平票】"]
      },
      {
        "content": "【发言】时间90秒",
        "highLightContent": ["【发言】"]
      },
      {
        "content": "【抢身份】允许抢身份",
        "highLightContent": ["【抢身份】"]
      }
    ],
    "game_voices": {
      "wolf_day_time_tips":
          "${System.imageDomain}static/wolf_v2/wolf_guide/game_voice/wolf_day_time_tips.mp3",
      "wolf_day_time_vote_tips":
          "${System.imageDomain}static/wolf_v2/wolf_guide/game_voice/wolf_day_time_vote_tips.mp3",
      "wolf_get_role_tips":
          "${System.imageDomain}static/wolf_v2/wolf_guide/game_voice/wolf_get_role_tips.mp3",
      "wolf_night_bg":
          "${System.imageDomain}static/wolf_v2/wolf_guide/game_voice/wolf_night_bg.wav",
      "wolf_night_tips":
          "${System.imageDomain}static/wolf_v2/wolf_guide/game_voice/wolf_night_tips.mp3",
      "wolf_current_desc_tips":
          "${System.imageDomain}static/wolf_v2/wolf_guide/game_voice/wolf_current_desc_tips.wav",
    }
  }
};
