import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePageMixin {
  @protected
  Widget buildAppBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.transparent,
      // leading: ModalRoute.of(context)?.canPop ?? false
      //     ? IconButton(
      //         icon: Icon(Icons.keyboard_arrow_left),
      //         color: Colors.red,
      //         onPressed: () => Navigator.of(context).pop())
      //     : null,
      // iconTheme: ThemeData(context).appBarTheme.iconTheme,
      title: Text(
        'home',
        style: new TextStyle(color: Colors.white),
      ),
      // backgroundColor: Colors.lightBlue,
      elevation: 0.0,
    );
  }

  @protected
  Widget buildBody(BuildContext context);

  @OverlayVisibilityMode.never
  Widget buildPageContainer(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFF122C50), Color(0xFF1B445A), Color(0xFF071834)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.green,
          appBar: buildAppBar(context),
          body: buildBody(context),
        ));
  }
}

abstract class BasePage extends StatelessWidget with BasePageMixin {
  const BasePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildPageContainer(context);
  }
}

abstract class BasePageStateful extends StatefulWidget {
  BasePageStateful({Key key}) : super(key: key);

  @override
  BasePageStatefulState createState() => buildBasePageStatefulState();

  @protected
  BasePageStatefulState buildBasePageStatefulState();
}

abstract class BasePageStatefulState extends State<BasePageStateful>
    with BasePageMixin {
  @override
  @OverlayVisibilityMode.never
  Widget build(BuildContext context) {
    return buildPageContainer(context);
  }
}
