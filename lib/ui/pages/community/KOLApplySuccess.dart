
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';


class KOLApplySuccess extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseWidgetState<KOLApplySuccess> {

  String titleLabel(BuildContext context) => S.of(context).applyKOL;
  var qr = QrImage(padding: EdgeInsets.all(3),data: 'sdasdsdqw',version: QrVersions.auto,size: 110.0,backgroundColor: Colors.white);
  var qr1 = QrImage(padding: EdgeInsets.all(3),data: 'sdasdsdqw',version: QrVersions.auto,size: 110.0,backgroundColor: Colors.white);
    @override
    Widget buildBodyWidget(BuildContext context) {
      
      return  Container(
        
        child: ListView(children:<Widget>[
          Container(
            width: 120,
            height: 120,
            child:Image.asset(
             
            ImageHelper.wrapAssets('success.png'),
          ).padding(EdgeInsets.only(top:25,bottom:15))
          ),
  
  Container(
    alignment: Alignment.topCenter,
  
  child: Text(
    '你的申请已提交，请等待系统审核。\n审核大约需要2~3工作日',
    textAlign: TextAlign.center,
  )
  ),
  
  
    Container(
    alignment: Alignment.topCenter,
    padding: EdgeInsets.only(top:70,bottom:15),
  child: Text(
    '如需加快审核进程，请加如下微信客服：',
    textAlign: TextAlign.center,
  )
  ),

    Container(
      child: Row(
                        mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[

        Container(
                      alignment: Alignment.center,
                      width: 130,
                      height: 130,
                      child: Stack(children: <Widget>[
                        
                        Image.asset(
                          ImageHelper.wrapAssets('qrcodeBG.png'),
                          fit: BoxFit.fill,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 130,
                          height: 130,
                          child: qr
                        )
                      ])),Container(
                      alignment: Alignment.center,
                      width: 130,
                      height: 130,
                      child: Stack(children: <Widget>[
                        
                        Image.asset(
                          ImageHelper.wrapAssets('qrcodeBG.png'),
                          fit: BoxFit.fill,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 130,
                          height: 130,
                          child: qr
                        )
                      ]))

      ]),
    ),
  
        ]),
  
      );
  
    }
  }
  

