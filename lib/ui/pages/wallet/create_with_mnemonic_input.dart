import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/wallet/vm/create_vm.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';
import 'package:xy_wallet/manager/walletManager/walletManager.dart';

import 'package:xy_wallet/common/extension/string.ex.dart';

class CreateWithMnemonicInputPage extends BaseWidget {
  final CreateViewModel viewModel;

  CreateWithMnemonicInputPage(this.viewModel);
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<CreateWithMnemonicInputPage> {
  @override
  String titleLabel(BuildContext context) => S.of(context).walletCreate;
  String _mnemonicInput;
  List<String> _mnemonic;
  @override
  void initState() {
    super.initState();

    _mnemonic = widget.viewModel.mnemonicController.text.split(' ');
    _mnemonic.shuffle();
  }

  @override
  List<Widget> buildAppBarAction(BuildContext context) {
    // "".hideLoading();
    return [
      IconButton(
          icon: Icon(Icons.undo),
          onPressed: () {
            setState(() {
              _mnemonicInput = '';
              _mnemonic = widget.viewModel.mnemonicController.text.split(' ');
              _mnemonic.shuffle();
            });
          })
    ];
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    "".hideLoading();
    return ProviderWidget<CreateViewModel>(
      model: widget.viewModel,
      builder: (conntext, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
              scrollDirection: Axis.vertical,
              //true 滑动到底部
              reverse: false,
              padding: EdgeInsets.only(
                top: ThemeDimens.pageVerticalMargin * 2,
                left: ThemeDimens.pageLRMargin,
                right: ThemeDimens.pageLRMargin,
              ),
              ////滑动到底部回弹效果
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).walletConfirmMnemonic,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(height: ThemeDimens.pageVerticalMargin * 1.5),
                  Text(
                    S.of(context).walletMnemonicInputTip,
                    style: ThemeStyles.getSubtitle1lLight(context),
                  ),
                  Divider(height: ThemeDimens.pageLRMargin),
                  CommonInputLarge(
                    minHeight: 148,
                    enabled: false,
                    controller: TextEditingController(text: _mnemonicInput),
                  ),
                  Divider(height: ThemeDimens.pageLRMargin * 1.5),
                  _getMnemonicWrapWidget(),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: ThemeDimens.pageLRMargin,
                    right: ThemeDimens.pageLRMargin,
                    bottom: ThemeDimens.pageBottomMargin),
                child: CommonButton(
                    child: Text(S.of(context).createWallet),
                    onPressed: () async{
                      if (_mnemonic.length != 0) {
                        return;
                      }
                      if (_mnemonicInput !=
                          widget.viewModel.mnemonicController.text) {
                        showToast(S.of(context).mnemonicWrong);
                        print(_mnemonicInput);
                        print(widget.viewModel.mnemonicController.text);
                        setState(() {
                          _mnemonicInput = '';
                          _mnemonic = widget.viewModel.mnemonicController.text
                              .split(' ');
                          _mnemonic.shuffle();
                          
                        });
                        return;
                      }


                      "".showLoading();
                    
                     print("0000----------000000");
                       var wallet111 = await createWalletMnemonic(_mnemonicInput, widget.viewModel.mnemonicAccountController.text, widget.viewModel.mnemonicSetPwdController.text);
                      //  "".hideLoading();
                   print("1111111----------1111111");
                    //  "".hideLoading();
                    
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, RouteName.tab, (Route route) => false);
                    }))
          ],
        );
      },
    );
  }

  _getMnemonicWrapWidget() {
    return Wrap(
        spacing: 22,
        runSpacing: 16,
        children: List.generate(
            _mnemonic.length,
            (index) => InkWell(
                  onTap: () {
                    setState(() {
                      if (_mnemonicInput == null || _mnemonicInput.isEmpty) {
                        _mnemonicInput = _mnemonic[index];
                      } else {
                        _mnemonicInput =
                            _mnemonicInput + ' ' + _mnemonic[index];
                      }

                      _mnemonic.removeAt(index);
                    });
                  },
                  child: Text(
                    _mnemonic[index],
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )));
  }
}
