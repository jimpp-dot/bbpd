import 'package:equatable/equatable.dart';

class EventLog extends Equatable {
  final String eventName;
  final String properties;
  final DateTime dateTime;

  const EventLog({
    required this.eventName,
    required this.properties,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [eventName, properties, dateTime];
}
