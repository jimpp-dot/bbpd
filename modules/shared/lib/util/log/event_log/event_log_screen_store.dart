import 'package:shared/util/log/event_log/event_log_stream.dart';
import 'package:shared/util/log/event_log/model/event_log.dart';
import 'package:shared/util/log/event_log/model/output_event_with_time.dart';
import 'package:mobx/mobx.dart';

part 'event_log_screen_store.g.dart';

bool _isMonitoring = true;

class EventLogScreenStore = _EventLogScreenStoreBase with _$EventLogScreenStore;

abstract class _EventLogScreenStoreBase with Store {
  @observable
  bool isMonitoring = _isMonitoring;

  @observable
  String filterBy = "";

  @observable
  ObservableList<EventLog> allEvents = ObservableList.of([]);

  @observable
  bool hasReachedEndOfList = false;

  @computed
  List<EventLog> get filteredEvents {
    if (filterBy.isEmpty) {
      return allEvents;
    }
    return allEvents
        .where((e) =>
            e.eventName.contains(filterBy) || e.properties.contains(filterBy))
        .toList();
  }

  @action
  void toggleMonitoring() {
    _isMonitoring = !_isMonitoring;
    if (_isMonitoring) {
      EventLogStream.instance?.onEventAdded = _addToList;
    } else {
      EventLogStream.instance?.onEventAdded = null;
    }

    isMonitoring = _isMonitoring;
  }

  @action
  void clearList() {
    filterBy = "";
    allEvents.clear();
    EventLogStream.instance?.currentEvents.clear();
  }

  @action
  void setHasReachedEndOfList(bool value) {
    hasReachedEndOfList = value;
  }

  void initList() {
    if (isMonitoring) {
      EventLogStream.instance?.currentEvents.forEach((e) {
        _addToList(e);
      });
      EventLogStream.instance?.onEventAdded = _addToList;
    }
  }

  void onDispose() {
    EventLogStream.instance?.onEventAdded = null;
  }

  void _addToList(OutputEventWithTime event) {
    if (event.outputEvent.lines.isEmpty) {
      return;
    }

    final line = event.outputEvent.lines[0];
    final eventName = line
        .substring(line.indexOf('track Event:'), line.indexOf(', properties:'))
        .replaceAll('track Event:', '')
        .trim();
    final properties = line
        .substring(line.indexOf('properties:'))
        .replaceAll('properties:', '')
        .trim();

    allEvents.add(EventLog(
      eventName: eventName,
      properties: properties,
      dateTime: event.dateTime,
    ));
  }
}
