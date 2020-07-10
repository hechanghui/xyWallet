import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/provider/view_state.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/model/walletModel.dart';

import 'package:xy_wallet/ui/pages/wallet/restore_by_keystore.dart';
import 'package:xy_wallet/ui/pages/wallet/restore_by_privateKey.dart';
import 'package:xy_wallet/ui/pages/wallet/vm/restore_vm.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/manager/walletManager/walletManager.dart';
import 'restore_by_mnemonic.dart';

class RestoreContainerPage extends BaseWidget {
  @override
  BaseWidgetState getState() => RestoreContainerState();
}

class RestoreContainerState extends BaseWidgetState<RestoreContainerPage>
    with SingleTickerProviderStateMixin {
  @override
  String titleLabel(BuildContext context) => S.of(context).walletRestore;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    var tabLabels = List.of([
      S.of(context).mnemonic,
      S.of(context).keystore,
      S.of(context).privateKey
    ]);
    hideLoading();
    final viewModel = RestoreViewModel();
    var subPages = List.of([
      RestoreByMnemonic(viewModel),
      RestoreByKeyStore(viewModel),
      RestoreByPriveKey(viewModel)
    ]);
    return ProviderWidget<RestoreViewModel>(
      model: viewModel,
      builder: (conntext, model, child) {
        return Form(
          onWillPop: () async {
            return model.viewState != ViewState.busy;
          },
          child: child,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TabBar(
              labelColor: Theme.of(context).textTheme.subtitle1.color,
              unselectedLabelColor:
                  ThemeStyles.getSubtitle1lLight(context).color,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
              controller: _tabController,
              tabs: tabLabels.map((e) => Tab(text: e)).toList()),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: ScrollPhysics(),
              children: subPages,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: ThemeDimens.pageLRMargin,
                  right: ThemeDimens.pageLRMargin,
                  bottom: ThemeDimens.pageBottomMargin),
              child: CommonButton(
                child: Text(S.of(context).walletCreate),
                onPressed: () async {
                  WalletModel wallet;
                  switch (_tabController.index) {
                    case 0:
                  if (viewModel.mnemonicController.text?.isNotEmpty==false) {
                    showToast(S.of(context).mnemonicInputTip);
                    return;
                  } else if (viewModel.mnemonicAccountController.text?.isNotEmpty==false) {
                    showToast(S.of(context).NoNameInputTip);
                    return;
                  } else if (viewModel.mnemonicSetPwdController.text?.isNotEmpty==false) {
                    showToast(S.of(context).NoPWDInputTip);
                    return;
                  } else if (viewModel.mnemonicConfirmPwdController.text?.isNotEmpty==false) {
                    showToast(S.of(context).NoComfirmPWDInputTip);
                    return;
                  } else if (viewModel.mnemonicConfirmPwdController.text != viewModel.mnemonicSetPwdController.text) {
                    showToast(S.of(context).PWDDiffentInputTip);
                    return;
                  }

                  if(!validateMnemonic(viewModel.mnemonicController.text)){
                    showToast(S.of(context).mnemonicWrong);
                    return;
                  }
                        showLoading();
                        wallet =  await createWalletMnemonic(
                          viewModel.mnemonicController.text,
                          viewModel.mnemonicAccountController.text,
                          viewModel.mnemonicSetPwdController.text);
                        hideLoading();

                          Navigator.pushReplacementNamed(context, RouteName.tab);
                      break;

                   case 1:
                     if (viewModel.keystoreController.text?.isNotEmpty==false) {
                    showToast(S.of(context).mnemonicInputTip);
                    return;
                  } else if (viewModel.keystoreAccountController.text?.isNotEmpty==false) {
                    showToast(S.of(context).NoNameInputTip);
                    return;
                  } else if (viewModel.keystorePwdController.text?.isNotEmpty==false) {
                    showToast(S.of(context).NoPWDInputTip);
                    return;
                  } 
                        showLoading();
                        wallet = await createWalletKeyStore(
                          viewModel.keystoreController.text,
                          viewModel.keystoreAccountController.text,
                          viewModel.keystorePwdController.text);
                        hideLoading();
                    break;
                        case 2:
                    if (viewModel.privateKeyController.text?.isNotEmpty==false) {
                    showToast(S.of(context).PrivateKeyInput);
                    return;
                  } else if (viewModel.privateKeyAccountController.text?.isNotEmpty==false) {
                    showToast(S.of(context).NoNameInputTip);
                    return;
                  } else if (viewModel.privateKeySetPwdController.text?.isNotEmpty==false) {
                    showToast(S.of(context).NoPWDInputTip);
                    return;
                  } else if (viewModel.privateKeyConfirmPwdController.text?.isNotEmpty==false) {
                    showToast(S.of(context).NoComfirmPWDInputTip);
                    return;
                  } else if (viewModel.privateKeySetPwdController.text != viewModel.privateKeyConfirmPwdController.text) {
                    showToast(S.of(context).PWDDiffentInputTip);
                    return;
                  }
                      showLoading();
                      wallet = await createWalletPrivateKey(
                          viewModel.privateKeyController.text,
                          viewModel.privateKeyAccountController.text,
                          viewModel.privateKeySetPwdController.text);
                      hideLoading();
                    break;

                    default:
 
                  }


                  switch (wallet.errer) {
                    case ErrerType.KeyStoreErrer:
                      showToast(S.of(context).KeystoreWrong);
                      return;
                      break;
                  case ErrerType.PrivateKeyErrer:
                      showToast(S.of(context).PrivateKeyWrong);
                      return;
                      break;
                    default:
                  }



                  Navigator.pushReplacementNamed(context, RouteName.tab);
                }
                    
              ))
        ],
      ),
    );
  }
}
