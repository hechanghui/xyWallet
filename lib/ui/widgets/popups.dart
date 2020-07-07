import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class PopupWidget extends StatelessWidget {
  const PopupWidget({
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
                  child:
                      IconTheme(data: IconThemeData(size: 55.0), child: icon),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.headline4,
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

class LoadingPopup extends StatefulWidget {
  final double size;

  LoadingPopup({this.size = 50.0});

  @override
  State<StatefulWidget> createState() => LoadingPopupState();
}

class LoadingPopupState extends State<LoadingPopup>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      size: 42,
      color: Theme.of(context).accentColor,
      duration: const Duration(milliseconds: 1000),
    );
  }
}

@immutable
class PopupConfigData {
  final String successText;
  final Duration successDuration;
  final bool successBackButtonClose;
  final String loadingText;
  final bool loadingBackButtonClose;
  final Alignment toastAlignment;

  const PopupConfigData(
      {this.successText = '',
      this.successDuration = const Duration(seconds: 3),
      this.successBackButtonClose = true,
      this.loadingText = '',
      this.loadingBackButtonClose = true,
      this.toastAlignment = const Alignment(0.0, -0.2)});

  copyWith(
      {String successText,
      Duration successDuration,
      String loadingText,
      Alignment toastAlignment}) {
    return PopupConfigData(
        successText: successText ?? this.successText,
        successDuration: successDuration ?? this.successDuration,
        loadingText: loadingText ?? this.loadingText,
        toastAlignment: toastAlignment ?? this.toastAlignment);
  }
}

class PopupConfig extends InheritedWidget {
  final PopupConfigData data;
  PopupConfig({Widget child, this.data}) : super(child: child);

  @override
  bool updateShouldNotify(PopupConfig oldWidget) {
    return data != oldWidget.data;
  }

  static PopupConfigData of(BuildContext context) {
    var widget = context.dependOnInheritedWidgetOfExactType<PopupConfig>();
    if (widget is PopupConfig) {
      return widget.data;
    }
    return PopupConfigData();
  }
}
