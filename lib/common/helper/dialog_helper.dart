import 'dart:async';
import 'dart:ui';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

class DialogHelper {
  static showCommonDialog({
    BuildContext context,
    String title,
    String content,
    TextStyle contentTextStyle,
    Widget contentWidget,
    Alignment alignment = Alignment.topLeft,
    List<Tuple3<String, GestureTapCallback, TextStyle>> actions,
    bool autoDisimiss = true,
    Widget action,
    GestureTapCallback onPressed,
  }) {
    if (action == null) {
      if (context != null && actions == null) {
        actions = [
          Tuple3(
              S.of(context).actionIKnow,
              null,
              Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: ThemeColors.primaryFgColor))
        ];
      }
      if (actions?.firstWhere((e) => e.item3 == null, orElse: () => null) !=
          null) {
        var actionsTmp = List<Tuple3<String, GestureTapCallback, TextStyle>>();
        actions.forEach((element) {
          var textStyle = element.item3;
          if (textStyle == null) {
            textStyle = (context == null
                    ? TextStyle(
                        fontSize: ThemeDimens.headline4,
                      )
                    : Theme.of(context).textTheme.headline4)
                .copyWith(
                    color: actions.length == 1 ||
                            (actions.length == 2 &&
                                actions.indexOf(element) == 1) ||
                            (actions.length > 2 &&
                                actions.indexOf(element) == 0)
                        ? ThemeColors.primaryFgColor
                        : ThemeColors.labelLightColor);
          }
          actionsTmp.add(Tuple3(element.item1, element.item2, textStyle));
        });
        actions = actionsTmp;
      }
    }

    var actionButtons = actions
        ?.map((e) => FlatButton(
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              child: Text(
                e.item1,
                style: e.item3,
              ),
              onPressed: () {
                if (context != null) {
                  Navigator.of(context).pop(actions.indexOf(e));
                }
                e.item2?.call();
              },
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ))
        .toList();
    var dialog = SimpleDialog(
      backgroundColor: Colors.transparent,
      title: null,
      children: <Widget>[
        BackdropFilter(
            //背景滤镜器
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    ImageHelper.wrapAssets('dialog_bg.png'),
                  ),
                  fit: BoxFit.fill,
                )),
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 29, top: 43, right: 29, bottom: 30),
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Column(children: [
                      Container(
                        alignment: alignment,
                        child: title?.isNotEmpty == true
                            ? Text(
                                title,
                                style: TextStyle(
                                    fontSize: ThemeDimens.txtLarge,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColors.accentDartFgColor),
                              )
                            : null,
                      ),
                      Container(
                        alignment: alignment,
                        margin: EdgeInsets.only(
                            top: title?.isNotEmpty == true ? 22 : 0,
                            bottom: 22),
                        child: contentWidget ??
                            Text(
                              content ?? "",
                              style: contentTextStyle,
                            ),
                      ),
                      Image(
                        image: AssetImage(
                          ImageHelper.wrapAssets('dialog_divider.png'),
                        ),
                        fit: BoxFit.fill,
                      ),
                      action == null
                          ? actions.length > 2
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: actionButtons,
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: actionButtons,
                                )
                          : action,
                    ])))),
      ],
    );

    if (context != null) {
      showDialog(context: context, child: dialog);
    }
    return dialog;
  }
}

typedef HideCallback = Future Function();

class WeuiToastWidget extends StatelessWidget {
  const WeuiToastWidget({
    Key key,
    @required this.stopEvent,
    @required this.alignment,
    @required this.icon,
    @required this.message,
  }) : super(key: key);

  final bool stopEvent;
  final Alignment alignment;
  final Widget icon;
  final Widget message;

  @override
  Widget build(BuildContext context) {
    var widget = Material(
      color: Colors.transparent,
      child: Align(
        alignment: this.alignment,
        child: IntrinsicHeight(
          child: Container(
            width: 122.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(17, 17, 17, 0.7),
                borderRadius: BorderRadius.circular(5.0)),
            constraints: BoxConstraints(
              minHeight: 122.0,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 22.0),
                  constraints: BoxConstraints(minHeight: 55.0),
                  child: IconTheme(
                      data: IconThemeData(color: Colors.white, size: 55.0),
                      child: icon),
                ),
                DefaultTextStyle(
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  child: message,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return IgnorePointer(
      ignoring: !stopEvent,
      child: widget,
    );
  }
}

class WeuiLoadingIcon extends StatefulWidget {
  final double size;

  WeuiLoadingIcon({this.size = 50.0});

  @override
  State<StatefulWidget> createState() => WeuiLoadingIconState();
}

class WeuiLoadingIconState extends State<WeuiLoadingIcon>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      size: 42,
      color: ThemeColors.accentColor,
      duration: const Duration(milliseconds: 1000),
    );
  }
}

@immutable
class WeuiToastConfigData {
  final String successText;
  final Duration successDuration;
  final bool successBackButtonClose;
  final String loadingText;
  final bool loadingBackButtonClose;
  final Alignment toastAlignment;

  const WeuiToastConfigData(
      {this.successText = '成功',
      this.successDuration = const Duration(seconds: 3),
      this.successBackButtonClose = true,
      this.loadingText = '加载中',
      this.loadingBackButtonClose = false,
      this.toastAlignment = const Alignment(0.0, -0.2)});

  copyWith(
      {String successText,
      Duration successDuration,
      String loadingText,
      Alignment toastAlignment}) {
    return WeuiToastConfigData(
        successText: successText ?? this.successText,
        successDuration: successDuration ?? this.successDuration,
        loadingText: loadingText ?? this.loadingText,
        toastAlignment: toastAlignment ?? this.toastAlignment);
  }
}

class WeuiToastConfig extends InheritedWidget {
  final WeuiToastConfigData data;
  WeuiToastConfig({Widget child, this.data}) : super(child: child);

  @override
  bool updateShouldNotify(WeuiToastConfig oldWidget) {
    return data != oldWidget.data;
  }

  static WeuiToastConfigData of(BuildContext context) {
    var widget = context.dependOnInheritedWidgetOfExactType<WeuiToastConfig>();
    if (widget is WeuiToastConfig) {
      return widget.data;
    }
    return WeuiToastConfigData();
  }
}

Future showWeuiSuccessToast(
    {@required BuildContext context,
    Widget message,
    stopEvent = false,
    bool backButtonClose,
    Alignment alignment,
    Duration closeDuration}) {
  var config = WeuiToastConfig.of(context);
  message = message ?? Text(config.successText);
  closeDuration = closeDuration ?? config.successDuration;
  backButtonClose = backButtonClose ?? config.successBackButtonClose;
  var hide = showWeuiToast(
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

HideCallback showWeuiLoadingToast(
    {@required BuildContext context,
    Widget message,
    stopEvent = true,
    bool backButtonClose,
    Alignment alignment}) {
  var config = WeuiToastConfig.of(context);
  message = message ?? Text(config.loadingText);
  backButtonClose = backButtonClose ?? config.loadingBackButtonClose;

  return showWeuiToast(
      context: context,
      alignment: alignment,
      message: message,
      stopEvent: stopEvent,
      icon: WeuiLoadingIcon(),
      backButtonClose: backButtonClose);
}

int backButtonIndex = 2;

HideCallback showWeuiToast(
    {@required BuildContext context,
    @required Widget message,
    @required Widget icon,
    bool stopEvent = false,
    Alignment alignment,
    bool backButtonClose}) {
  var config = WeuiToastConfig.of(context);
  alignment = alignment ?? config.toastAlignment;

  Completer<VoidCallback> result = Completer<VoidCallback>();
  var backButtonName = 'CoolUI_WeuiToast$backButtonIndex';
  BackButtonInterceptor.add((stopDefaultButtonEvent) {
    print(backButtonClose);
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
            child: WeuiToastWidget(
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
