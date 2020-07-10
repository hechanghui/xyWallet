import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';

import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/tool/Sp_utils.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/adressCell.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/walletListCell.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';

import 'meWalletManager.dart';

class WalletList extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<WalletList> {
  @override
  String titleLabel(BuildContext context) => S.of(context).WalletListTitle;
  var list = SpUtils.getObjectList('walletList');


  @override
  void initState() {
    super.initState();
    eventBus.on<WalletChange>().listen((event) {
      setState(() {
        list = SpUtils.getObjectList('walletList');
      });
    });
  }
  
  
  Widget buildBodyWidget(BuildContext context) {
    print('buildBodyWidget');
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 0, top: 10, left: 15),
              height: 35,
              child: Text(
                S.of(context).SwitchWalletTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 12),
              )),
          Container(
              padding: EdgeInsets.only(right: 0, top: 45, left: 0, bottom: 180),
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                   var map = list[index];
                    return Container(
                        child: WalletListCell(
                      title: map['name']??"",
                      address: map['address']??"",
                      onPressedSet: () {
                        Navigator.pushNamed(context, RouteName.WalletManger,arguments: index);
                      },
                    ));
                  })),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
                left: ThemeDimens.pageLRMargin,
                right: ThemeDimens.pageLRMargin,
                bottom: 35),
            child: CommonButton(
              child: Text(S.of(context).walletCreate),
              onPressed: () {
                Navigator.pushNamed(context, RouteName.WALLET_CREATE);
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
                left: ThemeDimens.pageLRMargin,
                right: ThemeDimens.pageLRMargin,
                bottom: 95),
            child: CommonButton(
              child: Text(S.of(context).walletRestore),
              onPressed: () {
                Navigator.pushNamed(context, RouteName.WALLET_RESTORE);
              },
            ),
          ),
        ],
      ),
    );
  }
}
