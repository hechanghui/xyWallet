import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePage extends StatelessWidget {
  const BasePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  @protected
  Widget buildAppBar(BuildContext context){
    return new AppBar(
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.keyboard_arrow_left,
        color: Colors.red,
      ),
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
}

abstract class BasePageStateful extends StatefulWidget {
  BasePageStateful({Key key}) : super(key: key);

  @override
  BasePageStatefulState createState() => buildBasePageStatefulState();

  @protected
  BasePageStatefulState buildBasePageStatefulState();
}

abstract class BasePageStatefulState extends State<BasePageStateful> {
  @override
  Widget build(BuildContext context) {
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

  @protected
  Widget buildAppBar(BuildContext context){
    return new AppBar(
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.keyboard_arrow_left,
        color: Colors.red,
      ),
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
}
