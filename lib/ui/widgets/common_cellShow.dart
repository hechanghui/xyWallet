import 'package:flutter/widgets.dart';

Widget cellShowWidget(String title,String context,{double hight}){
    return Container(
      height: hight??35,
      child: Stack(children:<Widget>[
                Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
            child: Text(
              title,
            )),
        Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 15),
            child: Text(
              context,
            ))
      ]),
    );
  }