import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

typedef HideCallback = Function();

class ShareWidgetShow {
  static GlobalKey widgetKey =  new GlobalKey(); 
  static GlobalKey widgetKey1 =  new GlobalKey(); 
  static show(
    BuildContext context,
    String shareUrl,
  ) {
    // double width = MediaQuery.of(context).size.width;
    bool isFirstHidden = false;
    
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return StatefulBuilder(builder: (context, setDialogState) {
            // print('12312');
            return Container(
              color: Color(0xff122C50),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                    child: showImage(isFirstHidden,'shareImageBig.png',widgetKey, shareUrl,() {
                      isFirstHidden = !isFirstHidden;
                      setDialogState(() {});
                    }),
                    flex: 1,
                  ),
                  Expanded(
                    child: showImage(!isFirstHidden, 'shareImageBig1.png',widgetKey1,shareUrl,() {
                      isFirstHidden = !isFirstHidden;
                      setDialogState(() {});
                    }),
                    flex: 1,
                  ),
                ]),
                CommonButton(
                  child: Text(S.of(context).ShareApp),
                  onPressed: () async {
                    setDialogState(() async {

                      
                      try {
                        GlobalKey key = isFirstHidden == false ? widgetKey : widgetKey1;
                        RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
                        ui.Image image = await boundary.toImage(pixelRatio:3);
                        final ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                        
                        await WcFlutterShare.share(
                            sharePopupTitle: '分享',
                            fileName: 'share.png',
                            mimeType: 'image/png',
                            bytesOfFile: byteData.buffer.asUint8List());
                      } catch (e) {
                        print('error: $e');
                      }
                      Navigator.of(context).pop();
                    });
                  },
                ).padding(EdgeInsets.only(top: 30, left: 15, right: 15)),
              ]),
            );
          });
        });
  }

  static Widget showImage(bool selected, String image,GlobalKey key,String shareUrl,GestureTapCallback onTap) {
    return Container(
        padding: EdgeInsets.only(top: 30, bottom: 5),
        child: Stack(children: <Widget>[
          Container(
              // padding: EdgeInsets.only(top:10,bottom: 5),
              alignment: Alignment.center,
                  child:RepaintBoundary(
                      key: key,
              child: InkWell(
                  onTap: onTap,
           

                    child: Stack(children:<Widget>[
                    Image.asset(
                     
                    ImageHelper.wrapAssets(image),
                    // fit: BoxFit.fill,
                    width: 169,
                    height: 300,
                    
                    
                  ),

                      Container(
                        padding: EdgeInsets.only(top:243,left: 110),
                          // alignment: Alignment.center,
                          // width: 130,
                          // height: 130,
                          child: QrImage(padding: EdgeInsets.all(4),data: shareUrl,version: QrVersions.auto,size: 53.0,backgroundColor: Colors.white)
                        )
                  ])
          )
          
          )
          ),
          Offstage(
              offstage: selected,
              child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageHelper.wrapAssets('shareImageBG.png'),
                    fit: BoxFit.fill,
                  ))),
        ]));
  }


}
