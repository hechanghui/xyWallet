import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePageMixin {
  @protected
  final bool hasAppBar = true;
  @protected
  final Widget title = null;
  @protected
  final String titleLabel = "";

  @protected
  Widget buildAppBar(BuildContext context) {
    return hasAppBar
        ? new AppBar(
            backgroundColor: Colors.transparent,
            // leading: ModalRoute.of(context)?.canPop ?? false
            //     ? IconButton(
            //         icon: Icon(Icons.keyboard_arrow_left),
            //         color: Colors.red,
            //         onPressed: () => Navigator.of(context).pop())
            //     : null,
            // iconTheme: ThemeData(context).appBarTheme.iconTheme,
            title: title ??
                Text(
                  titleLabel,
                  style: new TextStyle(color: Colors.white),
                ),
            // backgroundColor: Colors.lightBlue,
            elevation: 0.0,
            centerTitle: true,
          )
        : null;
  }

  @protected
  Widget buildBody(BuildContext context);

  @OverlayVisibilityMode.never
  Widget buildPageContainer(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color(0xFF122C50),
              Color(0xFF1B445A),
              Color(0xFF071834)
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.mirror
                // stops: [0.3, 0.5, 0.7, 0.9],
                )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.green,
          appBar: buildAppBar(context),
          body: buildBody(context),
        ));
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
