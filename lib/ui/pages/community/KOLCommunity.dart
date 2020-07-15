import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';

class KOLCommunity extends BaseWidget {
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<KOLCommunity> {
  @override
  String titleLabel(BuildContext context) => S.of(context).tabComTitle3;

  var controller = TextEditingController();
  @override
  List<Widget> buildAppBarAction(BuildContext context) {
    return <Widget>[
      Container(
        padding: EdgeInsets.only(right: 15),
        alignment: Alignment.center,
        child: Text('TOP10',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
      ).click(onTap: () {}),
    ];
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Stack(children: <Widget>[

      Container(
        alignment: Alignment.topCenter,
        padding:EdgeInsets.only(top: 15,),
        child:Image.asset(
          ImageHelper.wrapAssets('KolIcon.png'),
          fit: BoxFit.fill,
        )
      ),


      Container(
        alignment: Alignment.topCenter,
        padding:EdgeInsets.only(top:130,left: 15,right: 15),
      child: Container(
        
        
        height: 55,
          child:CommonInputMinor(
              controller: controller,
              maxLines: 1,
              textInputAction: TextInputAction.search,
              placeholder: S.current.addrOrTxId,
              onSubmitted: (e) {
                print(e);
                hideInputKeyboard(context);
              },
              right: Image.asset(ImageHelper.wrapAssets('icon_search.png'), width: 22, color: ThemeColors.primaryFgColor
                      // fit: BoxFit.contain,
                      )
                  .click(onTap: () {
                    print(controller.text);
                hideInputKeyboard(context);
                
              }),
            ),
      ),
      ),

      Container(
        padding: EdgeInsets.fromLTRB(0, 210, 0, 80),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return createCell('usdt.png','X大联盟','X大联盟lknfaklnfa',context,(){
              //详情
              Navigator.of(context).pushNamed(RouteName.KOLCommunityInfo);
            },
            (){
              //投票
              Navigator.of(context).pushNamed(RouteName.KOLVote);
            });
          },
        ),
      ),
        Container(
          alignment: Alignment.bottomCenter,
          padding:EdgeInsets.only(bottom:20,right: 15,left: 15),
          child:CommonButton(
              child: Text(S.of(context).applyKOL),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteName.KOLApply);
              },
            ),
        )
    ]);
  }
}


Widget createCell(String icon,String title,String subTitle,BuildContext context,GestureTapCallback infoTap,GestureTapCallback applyTap,){
  return Container(
    height: 70,
    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
    child: Stack(children:<Widget>[
      Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: Image.asset(
            ImageHelper.wrapAssets(icon),
            fit: BoxFit.fill,
            width: 38,
            height: 38,
          ),
        ),

       Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 70, top: 15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
          ),
        ),

         Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 70, top: 35),
          child: Text(
            subTitle,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,color: ThemeColors.labelLightColor),
          ),
        ),

        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          child:Container(
            alignment: Alignment.center,
            width: 70,
            height: 32,
          child: Text(
            S.of(context).vote,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,),
          ),
          ).backImage(image:'voteBg.png').click(onTap:applyTap)
        ),


    ]
    ).backImage().click(onTap:infoTap),
    
  );
}
