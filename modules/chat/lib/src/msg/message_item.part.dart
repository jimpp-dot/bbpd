part of 'messageItem.dart';

Map<String, MessageWidgetBuilder> builders = {
  'user.pk.invite': PkInviteMessage(),
};

/// 消息发送时间
class _SendTimeWidget extends StatelessWidget {
  final String? time;

  const _SendTimeWidget(this.time);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Container(
            margin: const EdgeInsetsDirectional.only(
                top: 4.0, bottom: 4.0, start: 16, end: 16),
            padding: const EdgeInsetsDirectional.only(
                top: 2.0, bottom: 2.0, start: 12.0, end: 12.0),
            child: Text(
              time ?? '',
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.0, color: R.colors.thirdTextColor),
            ),
          ),
        ),
      ],
    );
  }
}
