import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

typedef HideCallback = Function();

class ShareWidgetShow {
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
                    child: showImage(isFirstHidden,(){
                      isFirstHidden = !isFirstHidden;
                      setDialogState(() {
                      
                    });
                    }),
                    flex: 1,
                  ),
                  Expanded(
                    child: showImage(!isFirstHidden,(){
                                            isFirstHidden = !isFirstHidden;
                      setDialogState(() {
                      
                    });
                    }),
                    flex: 1,
                  ),
                ]),
                CommonButton(
                  child: Text(S.of(context).ShareApp),
                  onPressed: () {
                    setDialogState(() {
                      // index = 1;
                    });
                  },
                ).padding(EdgeInsets.only(top: 30, left: 15, right: 15)),
              ]),
            );
          });
        });
  }

  static Widget showImage(bool selected,GestureTapCallback onTap) {
    return Container(
      padding: EdgeInsets.only(top:40,bottom: 5),
      child:Stack(children:<Widget>[


        Container(
          // padding: EdgeInsets.only(top:10,bottom: 5),
          alignment: Alignment.center,

  child: InkWell( 
            onTap: onTap,
            child:Image.asset(
            ImageHelper.wrapAssets('shareImage.png'),
            fit: BoxFit.fill,
          )
  )
        ),

          Offstage(
          offstage:selected,
          child: Container(
          alignment: Alignment.center,
                    
          child: Image.asset(
          ImageHelper.wrapAssets('shareImageBG.png'),
          fit: BoxFit.fill,
        )
                    
        )
        ),
      ])
    );
  }
}
