import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xy_wallet/ui/widgets/popups.dart';

typedef HideCallback = Future Function();

Future showSuccessPopup(
    {@required BuildContext context,
    Widget message,
    stopEvent = false,
    bool backButtonClose,
    Alignment alignment,
    Duration closeDuration}) {
  var config = PopupConfig.of(context);
  message = message ?? Text(config.successText);
  closeDuration = closeDuration ?? config.successDuration;
  backButtonClose = backButtonClose ?? config.successBackButtonClose;
  var hide = showPopup(
      context: context,
      alignment: alignment,
      message: message,
      stopEvent: stopEvent,
      backButtonClose: backButtonClose,
      icon: Icon(Icons.done));

  return Future.delayed(closeDuration, () {
    hide();
  });
}

HideCallback showLoadingPopup(
    {@required BuildContext context,
    Widget message,
    String messageTxt,
    stopEvent = true,
    bool backButtonClose,
    Alignment alignment}) {
  var config = PopupConfig.of(context);
  message = message ?? Text(messageTxt??config.loadingText);
  backButtonClose = backButtonClose ?? config.loadingBackButtonClose;

  return showPopup(
      context: context,
      alignment: alignment,
      message: message,
      stopEvent: stopEvent,
      icon: LoadingPopup(),
      backButtonClose: backButtonClose);
}

int backButtonIndex = 2;

HideCallback showPopup(
    {@required BuildContext context,
    @required Widget message,
    @required Widget icon,
    bool stopEvent = false,
    Alignment alignment,
    bool backButtonClose}) {
  var config = PopupConfig.of(context);
  alignment = alignment ?? config.toastAlignment;

  Completer<VoidCallback> result = Completer<VoidCallback>();
  var backButtonName = 'CoolUI_WeuiToast$backButtonIndex';
  BackButtonInterceptor.add((stopDefaultButtonEvent) {
    debugPrint("$backButtonClose");
    if (backButtonClose) {
      result.future.then((hide) {
        hide();
      });
    }
    return true;
  }, zIndex: backButtonIndex, name: backButtonName);
  backButtonIndex++;

  var overlay = OverlayEntry(
      maintainState: true,
      builder: (_) => WillPopScope(
            onWillPop: () async {
              var hide = await result.future;
              hide();
              return false;
            },
            child: PopupWidget(
              alignment: alignment,
              icon: icon,
              message: message,
              stopEvent: stopEvent,
            ),
          ));
  result.complete(() {
    if (overlay == null) {
      return;
    }
    overlay.remove();
    overlay = null;
    BackButtonInterceptor.removeByName(backButtonName);
  });
  Overlay.of(context).insert(overlay);

  return () async {
    var hide = await result.future;
    hide();
  };
}
