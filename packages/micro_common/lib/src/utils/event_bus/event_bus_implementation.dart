import 'dart:async';

import 'i_event.dart';

typedef EventBusListener = StreamSubscription<IEvent> Function(
  void Function(IEvent event)? onData, {
  bool? cancelOnError,
  void Function()? onDone,
  Function? onError,
});

class EventBus {
  EventBus._internal();

  static final EventBus _instance = EventBus._internal();

  factory EventBus() => _instance;

  final StreamController<IEvent> _streamController =
      StreamController<IEvent>.broadcast();

  static void emit(IEvent event) {
    _instance._streamController.sink.add(event);
  }

  static EventBusListener get listen =>
      _instance._streamController.stream.listen;

  static void dispose() {
    _instance._streamController.close();
  }
}
