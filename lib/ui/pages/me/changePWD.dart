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
import 'package:xy_wallet/ui/widgets/tabMeCell.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/manager/walletManager/walletManager.dart';
class ChangePWD extends BaseWidget {

  final int index;
  ChangePWD(this.index);
  List list = SpUtils.getObjectList('walletList');

  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<ChangePWD> {
  @override
  String titleLabel(BuildContext context) => S.of(context).ChangePWD;

  var oldPWD;
  var newPWD;
  var confirmPWD;
  WalletModel model;


  Widget buildBodyWidget(BuildContext context) {
    
    return Container(
      child: ListView(
        // shrinkWrap: true,
        
        children: <Widget>[
          CommonInput(
            title: S.of(context).oldPWd,
            placeholder: S.of(context).oldPWdInput,
            onChanged: (text) {oldPWD = text;},
          ),
          CommonInput(
            title: S.of(context).newPWd,
            placeholder: S.of(context).newPWdInput,
            onChanged: (text) {newPWD = text;},
          ),
          CommonInput(
            title: S.of(context).comfirmPWd,
            placeholder: S.of(context).comfirmPWdInput,
            onChanged: (text) {confirmPWD = text;}
          ),

          
          Padding(
            padding: EdgeInsets.only(
              top:40,
                left: ThemeDimens.pageLRMargin,
                right: ThemeDimens.pageLRMargin,
                ),
          
                      child: CommonButton(
                      child: Text(S.of(context).ChangePWD),
                      onPressed: () async{

                  if (oldPWD?.isNotEmpty==false) {
                    showToast(S.of(context).oldPWdInput);
                    return;
                  } else if (newPWD?.isNotEmpty==false) {
                    showToast(S.of(context).newPWdInput);
                    return;
                  } else if (confirmPWD?.isNotEmpty==false) {
                    showToast(S.of(context).comfirmPWdInput);
                    return;
                  } else if (confirmPWD != newPWD) {
                    showToast(S.of(context).PWDDiffentInputTip);
                    return;
                  }

                    Map wallet = widget.list[widget.index];
                    Map wallets = SpUtils.getObject(wallet['address']);
                    WalletModel model = WalletModel.fromJson(wallets);
                    WalletModel ethWallet; 
                      var result = checkPWDWithKetstore();
                        if(result == false){
                          showToast(S.of(context).PWDWrong);
                          return;
                        }

    
                      showLoading();
                          ethWallet = await createWalletPrivateKey(
                          model.privateKey,
                          model.name,
                          newPWD,
                          change: true);
                      hideLoading();
                      model.password = newPWD;
                      model.keystore = ethWallet.keystore;
                      SpUtils.putObject(wallet['address'], model.toJson());
                      showToast(S.of(context).Succsee);
                      Navigator.of(context).pop();
                      },
                ),
                ),
        ],
      ),
    );
  }

  checkPWDWithKetstore(){
    
    Map wallet = widget.list[widget.index];
    Map wallets = SpUtils.getObject(wallet['address']);
    WalletModel model = WalletModel.fromJson(wallets);
    print(wallets);
    model.password = '1231';

    
    return checkPWDForKetstore(model.keystore, oldPWD);
  }



}
