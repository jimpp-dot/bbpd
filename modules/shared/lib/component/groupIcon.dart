import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';

class GroupIcon extends StatelessWidget {
  final List<String> icons;
  final double width = 50.0;

  const GroupIcon({super.key, required this.icons});

  Widget _image(String icon) {
    return CachedNetworkImage(
      imageUrl: '${System.imageDomain}$icon!head100',
      fit: BoxFit.cover,
    );
  }

  Widget _buildLine(int len, [int skip = 0]) {
    return Row(
      children: icons.skip(skip).take(len).map((String icon) {
        return Expanded(child: _image(icon));
      }).toList(),
    );
  }

  Widget _buildOne() {
    return _image(icons[0]);
  }

  Widget _buildTwo() {
    return _buildLine(2);
  }

  Widget _buildThree() {
    return Column(
      children: <Widget>[
        Expanded(
          child: _image(icons[0]),
        ),
        Expanded(
          child: _buildLine(2, 1),
        )
      ],
    );
  }

  Widget _buildFour() {
    return Column(
      children: <Widget>[
        Expanded(
          child: _buildLine(2, 0),
        ),
        Expanded(
          child: _buildLine(2, 2),
        )
      ],
    );
  }

  Widget _buildFive() {
    double margin = width * 1 / 3 / 2;
    return Container(
      margin: EdgeInsets.only(
        top: margin,
        bottom: margin,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: margin,
                right: margin,
              ),
              child: _buildLine(2, 0),
            ),
          ),
          Expanded(
            child: _buildLine(3, 2),
          )
        ],
      ),
    );
  }

  Widget _buildSix() {
    double margin = width * 1 / 3 / 2;
    return Container(
      margin: EdgeInsets.only(
        top: margin,
        bottom: margin,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: _buildLine(3, 0),
          ),
          Expanded(
            child: _buildLine(3, 3),
          )
        ],
      ),
    );
  }

  Widget _buildSeven() {
    double margin = width / 3;
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: margin,
              right: margin,
            ),
            child: _image(icons[0]),
          ),
        ),
        Expanded(
          child: _buildLine(3, 1),
        ),
        Expanded(
          child: _buildLine(3, 4),
        ),
      ],
    );
  }

  Widget _buildEight() {
    double margin = width / 3 / 2;
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: margin,
              right: margin,
            ),
            child: _buildLine(2, 0),
          ),
        ),
        Expanded(
          child: _buildLine(3, 2),
        ),
        Expanded(
          child: _buildLine(3, 5),
        ),
      ],
    );
  }

  Widget _buildAll() {
    return Column(
      children: <Widget>[
        Expanded(
          child: _buildLine(3, 0),
        ),
        Expanded(
          child: _buildLine(3, 3),
        ),
        Expanded(
          child: _buildLine(3, 6),
        ),
      ],
    );
  }

  _buildBody() {
    switch (icons.length) {
      case 0:
        return Container();

      case 1:
        return _buildOne();

      case 2:
        return _buildTwo();

      case 3:
        return _buildThree();

      case 4:
        return _buildFour();

      case 5:
        return _buildFive();

      case 6:
        return _buildSix();

      case 7:
        return _buildSeven();

      case 8:
        return _buildEight();

      default:
        return _buildAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Container(
        height: width,
        width: width,
        color: R.color.thirdTextColor,
        child: _buildBody(),
      ),
    );
  }
}
