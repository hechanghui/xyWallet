import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bmprogresshud/bmprogresshud.dart';


class Progresshud extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hud demo"),
        ),
        body: ProgressHud(
          // maximumDismissDuration: Duration(seconds: 2),
          child: Center(
            child: Builder(builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      showLoadingHud(context);
                    },
                    child: Text("show loading"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      showSuccessHud(context);
                    },
                    child: Text("show success"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      showErrorHud(context);
                    },
                    child: Text("show error"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      showProgressHud(context);
                    },
                    child: Text("show progress"),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
  
  showLoadingHud(BuildContext context) async {
    ProgressHud.of(context).show(ProgressHudType.loading, "loading...");
    await Future.delayed(const Duration(seconds: 1));
    ProgressHud.of(context).dismiss();
  }

  showSuccessHud(BuildContext context) {
    ProgressHud.of(context).showAndDismiss(ProgressHudType.success, "load success");
  }

  showErrorHud(BuildContext context) {
    ProgressHud.of(context).showAndDismiss(ProgressHudType.error, "load fail");
  } 

  showProgressHud(BuildContext context) {
    var hud = ProgressHud.of(context);
    hud.show(ProgressHudType.progress, "loading");

    double current = 0;
    Timer.periodic(Duration(milliseconds: 1000.0 ~/ 60), (timer) {
      current += 1;
      var progress = current / 100;
      hud.updateProgress(progress, "loading $current%");
      if (progress == 1) {
        hud.showAndDismiss(ProgressHudType.success, "load success");
        timer.cancel();
      }
    });
  }
}