import 'package:xy_wallet/model/event/message_event.dart';

extension StringEx on String {
  showLoading({bool canCancel: true}) {
    eventBus
        .fire(LoadingPopupEvent(isShow: true, canCancel: canCancel, msg: this));
  }

  hideLoading() {
    eventBus.fire(LoadingPopupEvent(isShow: false));
  }
}
