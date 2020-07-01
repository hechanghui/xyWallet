import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/comBtType2.dart';
import 'package:flutter/services.dart'; 

class Charge extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<Charge> {
  @override
  String titleLabel(BuildContext context) => S.of(context).Charge;

  @override
  Widget buildBodyWidget(BuildContext context) {
    var address = 'asdwqdhisuahdgiuqwgocbgq9dsadwqdw';
    return Container(
      child: ListView(children: <Widget>[
        Container(
            padding: EdgeInsetsDirectional.only(top: 2),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 64,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsetsDirectional.only(start: 38),
                  child: Image.asset(
                    ImageHelper.wrapAssets('usdt.png'),
                    fit: BoxFit.fill,
                    width: 28,
                    height: 28,
                  ),
                ),
                Container(
                  height: 64,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsetsDirectional.only(start: 75),
                  child: Text(
                    'USDT-ERC20',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      
        Container(
          alignment: Alignment.topCenter,
          height: 380,
          child: Stack(children:<Widget>[
            
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left:38,right:38),
              child: Image.asset(
                    ImageHelper.wrapAssets('dialog_bg.png'),
                    fit: BoxFit.fill,
                  ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top:30),
              child:Text(
                    S.of(context).ChargeAddress,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ), 
            ),


                        Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom:78),
              child:Text(
                    address,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ), 
            ),

              Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 25),
              child:ComBtType2(
                // padding: EdgeInsets.only(right:100,left: 100,bottom: 24),
                title:S.of(context).Copy,
                onPressed: (){
                  Clipboard.setData(ClipboardData(text: address ??""));
                  showToast(S.of(context).CopySuccsee); 
                },
              ),
            ),

            
                        Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top:30,left: 80,right: 80),
            
              child:Text(
                    S.of(context).ChargeAddress,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ), 
            ),
            
          ]),
          // 
        )
      
      ]),

        

    );
  }
}
