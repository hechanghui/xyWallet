import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:web3dart/credentials.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/model/walletModel.dart';
import 'package:xy_wallet/tool/Sp_utils.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/adressCell.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';


enum ExportType {
  KeyStore,
  PrivateKey,
  
}

class ExportWalletInfo extends BaseWidget {
  final List wallet;
  ExportWalletInfo(this.wallet);

  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<ExportWalletInfo> {
  @override
  String titleLabel(BuildContext context) => S.of(context).Manager;
  String headTitle = '';
  String content = '';
  @override
  List<Widget> buildAppBarAction(BuildContext context) {
    ExportType type = widget.wallet.first;
    WalletModel model = widget.wallet.last;
    switch (type) {
      case ExportType.KeyStore:
      headTitle = 'Keystore';
      content = model.keystore;
        return <Widget>[
          IconButton(
              icon: Image.asset(ImageHelper.wrapAssets('icon_share.png')),
              onPressed: () async {
                try {
                  await WcFlutterShare.share(
                    sharePopupTitle: 'Keystore',
                    mimeType: 'text/plain',
                    text: model.keystore,
                  );
                } catch (e) {
                  print('error: $e');
                }
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdressManger()));
              }),
        ];
        break;
        case ExportType.PrivateKey:
              headTitle = S.current.privateKey;
              content = model.privateKey;
        break;

      default:
    }
  }

  

  Widget buildBodyWidget(BuildContext context) {
    WalletModel model = widget.wallet.last;
    ExportType type = widget.wallet.first;
    return Container(
      padding: EdgeInsets.only(top: 25, left: 15, right: 15),
      child: Stack(
        children: <Widget>[
          ListView(children: <Widget>[
            Column(children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: 40,
                margin: EdgeInsets.only(top: 3, left: 4, right: 4),
                color: Color(0xFF082E41),
                child: Text(headTitle).padding(EdgeInsets.only(left: 14)),
              ),
              Text(content).padding(
                  EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15)),
            ]).backImage(),
            CommonButton(
              child: Text(S.of(context).Copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(
                    text: type == ExportType.KeyStore
                        ? model.keystore
                        : model.privateKey));
                showToast(S.of(context).CopySuccess);
              },
            ).padding(EdgeInsets.only(top: 50)),
          ])
        ],
      ),
    );
  }
}
