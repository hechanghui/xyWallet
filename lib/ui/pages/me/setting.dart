
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:country_list_pick/country_list_pick.dart';

class Setting extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseWidgetState<Setting> {

  String titleLabel(BuildContext context) => S.of(context).Setting;

  bool useLock = true;
  bool hidden = true;
  @override
  Widget buildBodyWidget(BuildContext context) {
    
    
    return  Container(
      
      child: ListView(children:<Widget>[
        
        Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5), 
          child:Container(
            height: 50,
            child:Stack(children:<Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left:15),
                height: 50,
                child:Text('对标货币')
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right:50),
                height: 50,
                child:Text('CNY')
              )
            ])
          ).backImage(image: 'tabMeCellBg.png')
        ),
           
        Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 30), 
          child:Container(
            height: 50,
            child:Stack(children:<Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left:15),
                height: 50,
                child:Text('语言设置')
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right:50),
                height: 50,
                child:Text('简体中文')
              )
            ])
          ).backImage(image: 'tabMeCellBg.png')
        ),
              
              Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5), 
          child:Container(
            height: 50,
            child:Stack(children:<Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left:15),
                height: 50,
                child:Text('开启指纹解锁')
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right:15),
                height: 50,
                child:Switch(
              value: useLock,
              onChanged: (value){
                useLock = value;
                setState(() {
                  
                });
              },
            ),
              ),
            
            ])
          ).backImage()
        ),
        

              Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5), 
          child:Container(
            height: 50,
            child:Stack(children:<Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left:15),
                height: 50,
                child:Text('隐藏余额')
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right:15),
                height: 50,
                child:Switch(
              value: hidden,
              onChanged: (value){
                hidden = value;
                setState(() {
                  
                });
              },
            ),
              ),
            ])
          ).backImage()
        ),
        





    //           DropdownButton(style: TextStyle(color: Colors.white),
    //           dropdownColor:Color(0xFF1B445A),
    // iconSize: 0,
    //   // hint: Text('请选择地区'), isExpanded: true, 
    
    // items: [
    //   DropdownMenuItem(
        
    //       child:  Row(children: <Widget>[SizedBox(width: 40),Text('天津'), SizedBox(width: 40), Icon(Icons.content_paste) ]),
    //       value: 1),
    //   DropdownMenuItem(
    //       child: Row(children: <Widget>[SizedBox(width: 40),Text('天津'), SizedBox(width: 40), Icon(Icons.content_paste) ]),
    //       value: 2),
    //   DropdownMenuItem(
    //       child: Row(children: <Widget>[Text('河北', style: TextStyle(color: Colors.purpleAccent, fontSize: 16)), SizedBox(width: 0), Icon(Icons.send, color: Colors.purpleAccent) ]),
    //       value: 3)
    // ],
    // onChanged:(value) {}).backImage()
      ]),

    );

  }
}
