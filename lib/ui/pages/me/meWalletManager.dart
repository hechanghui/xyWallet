import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/model/walletModel.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/tool/Sp_utils.dart';

import 'package:xy_wallet/ui/pages/me/adressManger.dart';
import 'package:xy_wallet/ui/pages/me/walletList.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/addressInfoCell.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/ui/widgets/tabMeCell.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/manager/walletManager/walletManager.dart';


class WalletManager extends BaseWidget {
  final int index;
  WalletManager(this.index);
  List list = SpUtils.getObjectList('walletList');

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
    var walletMap = widget.list[widget.index];
    return Container(
      child: ListView(
      // shrinkWrap: true,
      children: <Widget>[
        AddressInfoCell(
          title: walletMap['name'],
          iconName: 'icon_change.png',
          onPressed: () {
            showDialog(TextEditingController(text: walletMap['name']),widget);
          },
        ).padding(EdgeInsets.only(top: 10)),
        AddressInfoCell(
          title: walletMap['address'],
          iconName: 'icon_copy.png',
          onPressed: () {
            Clipboard.setData(ClipboardData(text: walletMap['address'] ?? ""));
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
        ).click(onTap: () {
          showPwdDialog();
        }),
        TabMeCell(
          title: (S.of(context).ChangePWD),
          imageName: 'icon_changePWD.png',
        ).click(onTap: () {
          Navigator.pushNamed(context, RouteName.ChangePWD,arguments: widget.index);
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePWD()));
        }),
        Padding(
            padding: EdgeInsets.only(
              top: 40,
              left: ThemeDimens.pageLRMargin,
              right: ThemeDimens.pageLRMargin,
            ),
            child: CommonButton(
              child: Text(S.of(context).delAccount),
              onPressed: () {
                showDelDialog();
              },
            )
        )
      ],
    ));
  }


  showDialog(TextEditingController controller,WalletManager widget){
        var wight = Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          S.of(context).AddressTitle,
                        )),
                    CommonInputMinor(
                      placeholder: S.of(context).AddressTitleInput,
                      controller:controller
                    ),
                   
                    
                  ],
                );

                DialogHelper.showCommonDialog(
                    context: context,
                    contentWidget: wight,
                    
                    actions: [
                      Tuple3(S.of(context).comfirm, () {
                        if (controller.text == null || controller.text.isEmpty) {
                          showToast(S.of(context).AddressTitleInput);
                          return false;
                        }
                        var walletMap = widget.list[widget.index];
                        walletMap['name'] = controller.text;
                        SpUtils.putObjectList('walletList', widget.list);
                        eventBus.fire(WalletChange());
                        setState(() {
                          
                        });
                      }, null),
                    ]);
  }

  showDelDialog(){
                    DialogHelper.showCommonDialog(
                    context: context,
                    title: S.of(context).tip,
                    content:S.of(context).IsdelAccount,
                    alignment:Alignment.center,
                    contentTextStyle:Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold, fontSize: 17),
                    actions: [
                      Tuple3(S.of(context).cannel, () {
                        print(SpUtils.getKeys());
                      }, null),
                     Tuple3(S.of(context).comfirm, () {
                        
                        var walletMap = widget.list[widget.index];
                        SpUtils.remove(walletMap['address']);
                        widget.list.removeAt(widget.index);
                        SpUtils.putObjectList('walletList', widget.list);
                        eventBus.fire(WalletChange());
                        Navigator.of(context).pop();
                      }, null),
                    ]);
  }

    showPwdDialog() {
     var controller = TextEditingController();
    DialogHelper.showCommonDialog(
        context: context,
        alignment: Alignment.center,
        title: S.current.inputPwd,
        contentWidget: CommonInputMinor(
          placeholder: S.current.hintPleaseInput,
          controller: controller,
        ),
        actions: [
          Tuple3(S.current.cannel, null, null),
          Tuple3(S.current.comfirm, () {
                                Map wallet = widget.list[widget.index];
                    Map wallets = SpUtils.getObject(wallet['address']);
                    WalletModel model = WalletModel.fromJson(wallets);
                      var result = checkPWDForKetstore(model.keystore, controller.text);
                        if(result == false){
                          showToast(S.of(context).PWDWrong);
                          return false;
                        }
          }, null)
        ]);
  }

   
}
