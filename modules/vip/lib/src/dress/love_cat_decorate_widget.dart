import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/pb/generated/vip_rpc_pretend.pb.dart';

///恩爱猫咪装扮用户名、头像显示工具类
class LoveCatDecorateWidget {
  static List<Widget> iconList(List<Mp4Source_ImageText> imageText) {
    if (imageText.length < 2) {
      return [];
    }

    double imgW = 510, imgH = 1104;
    double containerW = 280, containerH = 606.2;
    double imgDestW = containerW;
    double imgDestH = imgH * imgDestW / imgW;
    double hRatio = imgW / imgDestW;
    double vRatio = imgDestH / containerH;
    return [
      PositionedDirectional(
        top: 341 / hRatio / vRatio,
        start: 46 / hRatio,
        child: _buildUserIcon(imageText[0].image, 57 / hRatio),
      ),
      PositionedDirectional(
        top: 341 / hRatio / vRatio,
        start: 144 / hRatio,
        child: _buildUserIcon(imageText[1].image, 57 / hRatio),
      ),
    ];
  }

  static List<Widget> nameList(List<Mp4Source_ImageText> imageText) {
    if (imageText.length < 2) {
      return [];
    }

    double imgW = 510, imgH = 1104;
    double containerW = 280, containerH = 606.2;
    double imgDestW = containerW;
    double imgDestH = imgH * imgDestW / imgW;
    double hRatio = imgW / imgDestW;
    double vRatio = imgDestH / containerH;
    return [
      PositionedDirectional(
        top: 406 / hRatio / vRatio,
        start: 37 / hRatio,
        child: _buildUserName(
            imageText[0].text, 82 / hRatio, 15.5 / hRatio / vRatio),
      ),
      PositionedDirectional(
        top: 406 / hRatio / vRatio,
        start: 128 / hRatio,
        child: _buildUserName(
            imageText[1].text, 82 / hRatio, 15.5 / hRatio / vRatio),
      ),
    ];
  }

  static Widget _buildUserIcon(String icon, double size) {
    return CommonAvatar(
      path: icon,
      shape: BoxShape.circle,
      size: size,
    );
  }

  static Widget _buildUserName(String name, double width, double height) {
    return Container(
      width: width,
      height: height,
      alignment: AlignmentDirectional.center,
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 7.dp,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
