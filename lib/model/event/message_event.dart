import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class LoadingPopupEvent {
  final bool isShow;
  final bool canCancel;
  final String msg;
  const LoadingPopupEvent({
    this.isShow = true,
    this.canCancel = true,
    this.msg,
  });
}
