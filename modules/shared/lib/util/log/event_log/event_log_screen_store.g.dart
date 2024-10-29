// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_log_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventLogScreenStore on _EventLogScreenStoreBase, Store {
  Computed<List<EventLog>>? _$filteredEventsComputed;

  @override
  List<EventLog> get filteredEvents => (_$filteredEventsComputed ??=
          Computed<List<EventLog>>(() => super.filteredEvents,
              name: '_EventLogScreenStoreBase.filteredEvents'))
      .value;

  late final _$isMonitoringAtom =
      Atom(name: '_EventLogScreenStoreBase.isMonitoring', context: context);

  @override
  bool get isMonitoring {
    _$isMonitoringAtom.reportRead();
    return super.isMonitoring;
  }

  @override
  set isMonitoring(bool value) {
    _$isMonitoringAtom.reportWrite(value, super.isMonitoring, () {
      super.isMonitoring = value;
    });
  }

  late final _$filterByAtom =
      Atom(name: '_EventLogScreenStoreBase.filterBy', context: context);

  @override
  String get filterBy {
    _$filterByAtom.reportRead();
    return super.filterBy;
  }

  @override
  set filterBy(String value) {
    _$filterByAtom.reportWrite(value, super.filterBy, () {
      super.filterBy = value;
    });
  }

  late final _$allEventsAtom =
      Atom(name: '_EventLogScreenStoreBase.allEvents', context: context);

  @override
  ObservableList<EventLog> get allEvents {
    _$allEventsAtom.reportRead();
    return super.allEvents;
  }

  @override
  set allEvents(ObservableList<EventLog> value) {
    _$allEventsAtom.reportWrite(value, super.allEvents, () {
      super.allEvents = value;
    });
  }

  late final _$hasReachedEndOfListAtom = Atom(
      name: '_EventLogScreenStoreBase.hasReachedEndOfList', context: context);

  @override
  bool get hasReachedEndOfList {
    _$hasReachedEndOfListAtom.reportRead();
    return super.hasReachedEndOfList;
  }

  @override
  set hasReachedEndOfList(bool value) {
    _$hasReachedEndOfListAtom.reportWrite(value, super.hasReachedEndOfList, () {
      super.hasReachedEndOfList = value;
    });
  }

  late final _$_EventLogScreenStoreBaseActionController =
      ActionController(name: '_EventLogScreenStoreBase', context: context);

  @override
  void toggleMonitoring() {
    final _$actionInfo = _$_EventLogScreenStoreBaseActionController.startAction(
        name: '_EventLogScreenStoreBase.toggleMonitoring');
    try {
      return super.toggleMonitoring();
    } finally {
      _$_EventLogScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearList() {
    final _$actionInfo = _$_EventLogScreenStoreBaseActionController.startAction(
        name: '_EventLogScreenStoreBase.clearList');
    try {
      return super.clearList();
    } finally {
      _$_EventLogScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasReachedEndOfList(bool value) {
    final _$actionInfo = _$_EventLogScreenStoreBaseActionController.startAction(
        name: '_EventLogScreenStoreBase.setHasReachedEndOfList');
    try {
      return super.setHasReachedEndOfList(value);
    } finally {
      _$_EventLogScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isMonitoring: ${isMonitoring},
filterBy: ${filterBy},
allEvents: ${allEvents},
hasReachedEndOfList: ${hasReachedEndOfList},
filteredEvents: ${filteredEvents}
    ''';
  }
}
