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

class RestoreContainerState extends BaseWidgetState<RestoreContainerPage> with SingleTickerProviderStateMixin {
  @override
  String titleLabel(BuildContext context) => S.of(context).walletRestore;

  TabController _tabController;
  List<String> _tabLabels;
  List<Widget> _subPages;
  RestoreViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _viewModel = RestoreViewModel();
    _tabLabels = [S.current.mnemonic, S.current.keystore, S.current.privateKey];
    _subPages = [RestoreByMnemonic(_viewModel), RestoreByKeyStore(_viewModel), RestoreByPriveKey(_viewModel)];
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    return ProviderWidget<RestoreViewModel>(
      model: _viewModel,
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
              unselectedLabelColor: ThemeStyles.getSubtitle1lLight(context).color,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
              controller: _tabController,
              tabs: _tabLabels.map((e) => Tab(text: e)).toList()),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: ScrollPhysics(),
              children: _subPages,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: ThemeDimens.pageLRMargin, right: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageBottomMargin),
              child: CommonButton(
                  child: Text(S.of(context).walletCreate),
                  onPressed: () async {
                    WalletModel wallet;
                    switch (_tabController.index) {
                      case 0:
                        if (_viewModel.mnemonicController.text?.isNotEmpty == false) {
                          showToast(S.of(context).mnemonicInputTip);
                          return;
                        } else if (_viewModel.mnemonicAccountController.text?.isNotEmpty == false) {
                          showToast(S.of(context).NoNameInputTip);
                          return;
                        } else if (_viewModel.mnemonicSetPwdController.text?.isNotEmpty == false) {
                          showToast(S.of(context).NoPWDInputTip);
                          return;
                        } else if (_viewModel.mnemonicConfirmPwdController.text?.isNotEmpty == false) {
                          showToast(S.of(context).NoComfirmPWDInputTip);
                          return;
                        } else if (_viewModel.mnemonicConfirmPwdController.text != _viewModel.mnemonicSetPwdController.text) {
                          showToast(S.of(context).PWDDiffentInputTip);
                          return;
                        }

                        if (!validateMnemonic(_viewModel.mnemonicController.text)) {
                          showToast(S.of(context).mnemonicWrong);
                          return;
                        }
                        showLoading();
                        wallet = await createWalletMnemonic(_viewModel.mnemonicController.text, _viewModel.mnemonicAccountController.text, _viewModel.mnemonicSetPwdController.text);
                        hideLoading();

                        Navigator.pushReplacementNamed(context, RouteName.tab);
                        break;

                      case 1:
                        if (_viewModel.keystoreController.text?.isNotEmpty == false) {
                          showToast(S.of(context).mnemonicInputTip);
                          return;
                        } else if (_viewModel.keystoreAccountController.text?.isNotEmpty == false) {
                          showToast(S.of(context).NoNameInputTip);
                          return;
                        } else if (_viewModel.keystorePwdController.text?.isNotEmpty == false) {
                          showToast(S.of(context).NoPWDInputTip);
                          return;
                        }
                        showLoading();
                        wallet = await createWalletKeyStore(_viewModel.keystoreController.text, _viewModel.keystoreAccountController.text, _viewModel.keystorePwdController.text);
                        hideLoading();
                        break;
                      case 2:
                        if (_viewModel.privateKeyController.text?.isNotEmpty == false) {
                          showToast(S.of(context).PrivateKeyInput);
                          return;
                        } else if (_viewModel.privateKeyAccountController.text?.isNotEmpty == false) {
                          showToast(S.of(context).NoNameInputTip);
                          return;
                        } else if (_viewModel.privateKeySetPwdController.text?.isNotEmpty == false) {
                          showToast(S.of(context).NoPWDInputTip);
                          return;
                        } else if (_viewModel.privateKeyConfirmPwdController.text?.isNotEmpty == false) {
                          showToast(S.of(context).NoComfirmPWDInputTip);
                          return;
                        } else if (_viewModel.privateKeySetPwdController.text != _viewModel.privateKeyConfirmPwdController.text) {
                          showToast(S.of(context).PWDDiffentInputTip);
                          return;
                        }
                        showLoading();
                        wallet = await createWalletPrivateKey(_viewModel.privateKeyController.text, _viewModel.privateKeyAccountController.text, _viewModel.privateKeySetPwdController.text);
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
                  }))
        ],
      ),
    );
  }
}
