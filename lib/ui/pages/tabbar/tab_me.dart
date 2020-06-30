import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/tabbar/tab_community.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/tabMeCell.dart';
import 'package:xy_wallet/ui/widgets/tabWallet_cell.dart';

class TabMe extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<TabMe> {
  @override
  Widget buildBodyWidget(BuildContext context) {
    return Container(
        child: ListView(
      // shrinkWrap: true,
      children: <Widget>[
        Container(
          height: 100,
          alignment: Alignment.topLeft,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 30,top: 20),
                child: Image.asset(
                  ImageHelper.wrapAssets('headIcon.png'),
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 105,top: 25),
                child: Text('X_钱包',style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold,fontSize: 17),),
              ),

                            Container(
                padding: EdgeInsets.only(left: 105,top: 50),
                child: Text('0xiuqwiuqwiugwqiug',style: Theme.of(context).textTheme.headline4.copyWith(color: ThemeColors.labelLightColor,fontSize: 12),),
              ),


            ],
          ),
        ),
        Container(
          height: 35,
        ),
        InkWell(
          onTap: () {
            print(S.of(context).Address);
          },
          child: TabMeCell(
            title: (S.of(context).Address),
            imageName: 'me_address.png',
          ),
        ),
        InkWell(
          onTap: () {
            print(S.of(context).AccountManager);
          },
          child: TabMeCell(
            title: (S.of(context).AccountManager),
            imageName: 'me_account.png',
          ),
        ),

                Container(
          height: 23,
        ),
        InkWell(
          onTap: () {
            print(S.of(context).Setting);
          },
          child: TabMeCell(
            title: (S.of(context).Setting),
            imageName: 'me_setting.png',
          ),
        ),

        InkWell(
          onTap: () {
            print(S.of(context).ShareApp);
          },
          child: TabMeCell(
            title: (S.of(context).ShareApp),
            imageName: 'me_shareApp.png',
          ),
        ),
        InkWell(
          onTap: () {
            print(S.of(context).AboutUs);
          },
          child: TabMeCell(
            title: (S.of(context).AboutUs),
            imageName: 'me_aboutUs.png',
          ),
        ),
      ],
    ));
  }
}
