import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:xy_wallet/common/helper/resourse_helper.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/router/router_manager.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _logoController;
  Animation<double> _animation;
  AnimationController _countdownController;

  @override
  void initState() {
    _logoController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Interval(0.0, 0.5, curve: Curves.ease),
        parent: _logoController));

    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _logoController.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _logoController.forward();
    //   }
    // });
    print("animation11111: ${_animation.value}");
    // _logoController.reverse();
    _logoController.forward();

    _countdownController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: _logoController.duration.inMilliseconds + 500));
    _countdownController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Image.asset(ImageHelper.wrapAssets('splash_bg.png'),
              colorBlendMode: BlendMode
                  .srcOver, //colorBlendMode方式在android等机器上有些延迟,导致有些闪屏,故采用两套图片的方式
              color: Colors.black.withOpacity(
                  Theme.of(context).brightness == Brightness.light ? 0 : 0.65),
              fit: BoxFit.fill),
          Align(
            alignment: Alignment(0.0, 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedTextLogo(
                  animation: _animation,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  nextPage(context);
                },
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  // margin: EdgeInsets.only(right: 20, bottom: 20),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(40),
                  //   color: Colors.black.withAlpha(100),
                  // ),
                  child: AnimatedCountdown(
                    context: context,
                    animation: StepTween(begin: 4, end: 0)
                        .animate(_countdownController),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;

  AnimatedCountdown({key, this.animation, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextPage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Opacity(
        opacity: 0,
        child: Text(
          (value == 0 ? '' : '$value | ') + S.of(context).splashSkip,
          style: TextStyle(color: Colors.white),
        ));
  }
}

class AnimatedTextLogo extends AnimatedWidget {
  AnimatedTextLogo({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    print("animation ${animation.value}");
    return Opacity(
      opacity: animation.value,
      child: Text(
        "Plan x\r\nPosters",
        style:
            Theme.of(context).accentTextTheme.headline6.copyWith(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

void nextPage(context) {
  Navigator.of(context).pushReplacementNamed(RouteName.tab);
}
