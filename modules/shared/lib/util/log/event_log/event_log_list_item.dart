import 'package:shared/util/log/event_log/model/event_log.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class EventLogListItem extends StatelessWidget {
  final EventLog eventLog;
  final VoidCallback? onCopyButtonTapped;

  const EventLogListItem({
    super.key,
    required this.eventLog,
    this.onCopyButtonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  text: _formatDateTime(eventLog),
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.0,
                    color: Color(0xFF333333),
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () => onCopyButtonTapped?.call(),
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(start: 8),
                      decoration: BoxDecoration(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? const Color(0xFF666666)
                            : const Color(0xFFEFF1F3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: const Text(
                        'copy log',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const TextSpan(
                  text: '\nEvent Name: ',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: eventLog.eventName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.5,
                  ),
                ),
                const TextSpan(
                  text: '\nParameters:\n',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                TextSpan(
                  text: eventLog.properties,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  String _formatDateTime(EventLog log) {
    final dateTimeString = formatDate(
        eventLog.dateTime, [yyyy, '.', mm, '.', dd, ' ', HH, ':', nn, ':', ss]);
    return '[$dateTimeString]';
  }
}
