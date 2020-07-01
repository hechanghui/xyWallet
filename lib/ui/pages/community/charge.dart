import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/comBtType2.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';


enum ChargeType {
  Local, //冷钱包
  Community, //跨链钱包
  
}

class Charge extends BaseWidget {
  Charge({Key key, this.chargeType,this.addres});
  final ChargeType chargeType;
  final String addres;


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
    // var dad = widget.chargeType.index;
    // switch (widget.chargeType) {
    //   case ChargeType:
        
    //     break;
    //   default:
    // }

  // var sdqw=widget.addres;

  //  Widget 




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
          child: Stack(children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
        
              padding: EdgeInsets.only(left: 38, right: 38),
              child: Image.asset(
                ImageHelper.wrapAssets('dialog_bg.png'),
                fit: BoxFit.fill,
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 30),
              child: Text(
                S.of(context).ChargeAddress,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),

//地址
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 78, left: 80, right: 80),
              child: Text(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),

//保存按钮
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 130),
              child: ComBtType2(
                // padding: EdgeInsets.only(right:100,left: 100,bottom: 24),
                title: S.of(context).Save,
                onPressed: () {},
              ),
            ),

//复制按钮
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 25),
              child: ComBtType2(
                // padding: EdgeInsets.only(right:100,left: 100,bottom: 24),
                title: S.of(context).Copy,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: address ?? ""));
                  showToast(S.of(context).CopySuccsee);
                },
              ),
            ),

            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 60),
                child: Stack(children: <Widget>[
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
                          child: QrImage(
                            padding: EdgeInsets.all(3),
                            data: address,
                            version: QrVersions.auto,
                            size: 110.0,
                            backgroundColor: Colors.white,
                          ),
                        )
                      ])),
                ])),

            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                S.of(context).ChargeAddress,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          
        ),

        Container(
          padding: EdgeInsets.only(top:20),
           child: Stack(children: <Widget>[
             Container(
               padding: EdgeInsets.only(left:15),
               child:  Image.asset(
                ImageHelper.wrapAssets('icon_tip.png'),
                width: 14,
                height: 14,
                fit: BoxFit.fill,
              ),
             ),
            Container(
              padding: EdgeInsets.only(left:34,right: 34),
                         child: Text(
            S.of(context).ChargeTip,
            style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 12, color:ThemeColors.labelLightColor),
              ),
              )
            ]
           )
        ),


        

      ]),
    );
  }
}
