import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';

import 'package:xy_wallet/generated/l10n.dart';
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

  final List datas = [
    {'name': 'hello', 'address': '0xdasdasd', 'note': 'dasdasdqdsa'},
    {'name': 'hello1', 'address': '0xdasd321asd', 'note': 'dasdsa'},
    {'name': 'hello2', 'address': '0xdasddasdasd', 'note': 'dsa'},
    {'name': 'hello4', 'address': '0xdasddasdasd', 'note': 'dsa'},
    {'name': 'hello5', 'address': '0xdasddasdasd', 'note': 'dsa'},
    {'name': 'hello6', 'address': '0xdasddasdasd', 'note': 'dsa'},
    {'name': 'hello7', 'address': '0xdasddasdasd', 'note': 'dsa'},
  ];

  Widget buildBodyWidget(BuildContext context) {
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
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    //  var dic = datas[index],
                    return Container(
                        child: WalletListCell(
                      title: datas[index]['name'],
                      address: datas[index]['address'],
                      note: datas[index]['note'],
                      onPressedSet: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WalletManager()));
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
