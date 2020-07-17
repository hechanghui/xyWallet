import 'package:xy_wallet/model/event/message_event.dart';

extension StringEx on String {
  showLoading({bool canCancel: true}) {
    print('showLoading');
    eventBusLoad
        .fire(LoadingPopupEvent(isShow: true, canCancel: canCancel, msg: this));
  }

  hideLoading() {
    eventBusLoad.fire(LoadingPopupEvent(isShow: false));
  }
}
