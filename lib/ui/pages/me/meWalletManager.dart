import 'package:flutter/services.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

import 'package:xy_wallet/ui/pages/me/adressManger.dart';
import 'package:xy_wallet/ui/pages/me/walletList.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/addressInfoCell.dart';
import 'package:xy_wallet/ui/widgets/tabMeCell.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

import 'changePWD.dart';

class WalletManager extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<WalletManager> {
  @override
  String titleLabel(BuildContext context) {
    return S.of(context).Manager;
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    var address = '23123kfkfpeop';
    var title = 'MyWallet';
    return Container(
        child: ListView(
      // shrinkWrap: true,
      children: <Widget>[
        AddressInfoCell(
          title: title,
          iconName: 'icon_change.png',
          onPressed: () {
            //             Clipboard.setData(ClipboardData(text: address ?? ""));
            // showToast(S.of(context).CopySuccsee);
          },
        ).padding(EdgeInsets.only(top: 10)),
        AddressInfoCell(
          title: address,
          iconName: 'icon_copy.png',
          onPressed: () {
            Clipboard.setData(ClipboardData(text: address ?? ""));
            showToast(S.of(context).CopySuccess);
          },
        ),
        TabMeCell(
          title: (S.of(context).CopyPublicKey),
          imageName: 'icon_PublicKey.png',
        ).click(onTap: () {}).padding(EdgeInsets.only(top: 30)),
        TabMeCell(
          title: (S.of(context).ExportKeyStore),
          imageName: 'icon_keyStore.png',
        ).click(onTap: () {}).padding(EdgeInsets.only(top: 15)),
        TabMeCell(
          title: (S.of(context).ExportPrivateKey),
          imageName: 'icon_PrivateKey.png',
        ).click(onTap: () {}),
        TabMeCell(
          title: (S.of(context).ChangePWD),
          imageName: 'icon_changePWD.png',
        ).click(onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePWD()));
        }),
      ],
    ));
  }
}
