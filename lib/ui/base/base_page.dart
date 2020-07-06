import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePageMixin {
  @protected
  final bool hasAppBar = true;
  @protected
  final bool hasBackground = true;
  @protected
  Widget title(BuildContext context) => null;
  @protected
  String titleLabel(BuildContext context) => "";
  @protected
  void initWithContext(BuildContext context) => "";

  @protected
  Widget buildAppBar(BuildContext context) {
    return hasAppBar
        ? new AppBar(
            backgroundColor: Colors.transparent,
            title: buildAppBarTitle(context),
            elevation: 0.0,
            centerTitle: centerTitle(context),
            actions: buildAppBarAction(context),
            leading: buildAppBarLeading(context),
          )
        : null;
  }

  bool centerTitle(BuildContext context) {
    return true;
  }

  Widget buildAppBarTitle(BuildContext context) {
    return title(context) ??
        Text(
          titleLabel(context),
          style: new TextStyle(color: Colors.white),
        );
  }

  List<Widget> buildAppBarAction(BuildContext context) {
    return null;
  }

  Widget buildAppBarLeading(BuildContext context) {
    return null;
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return null;
  }

  hideInputKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @protected
  Widget buildBody(BuildContext context);

  @OverlayVisibilityMode.never
  Widget buildPageContainer(BuildContext context) {
    initWithContext(context);
    var scaffold = Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(context),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          hideInputKeyboard(context);
        },
        child: buildBody(context),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
    return hasBackground
        ? Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF122C50), Color(0xFF1B445A), Color(0xFF071834)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // tileMode: TileMode.clamp
            )),
            child: scaffold)
        : scaffold;
  }
}

abstract class BasePageStateless extends StatelessWidget with BasePageMixin {
  BasePageStateless({Key key}) : super(key: key);

  @override
  @OverlayVisibilityMode.never
  Widget build(BuildContext context) {
    return buildPageContainer(context);
  }
}

abstract class BasePage<T extends BasePageState> extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => buildState();

  @protected
  BasePageState buildState();
}

abstract class BasePageState extends State<BasePage> with BasePageMixin {
  @override
  @OverlayVisibilityMode.never
  Widget build(BuildContext context) {
    return buildPageContainer(context);
  }
}
