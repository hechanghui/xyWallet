import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/wallet/vm/restore_vm.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

class RestoreByMnemonic extends BaseWidget {
  final RestoreViewModel viewModel;

  RestoreByMnemonic(this.viewModel);

  @override
  _RestoreByMnemonicState getState() => _RestoreByMnemonicState();
}

class _RestoreByMnemonicState extends BaseWidgetState<RestoreByMnemonic> {
  @override
  bool get hasAppBar => false;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: ThemeDimens.pageVerticalMargin * 2,
        ),
        child: SingleChildScrollView(
          //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
          scrollDirection: Axis.vertical,
          //true 滑动到底部
          reverse: false,
          padding: EdgeInsets.all(0.0),
          ////滑动到底部回弹效果
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeDimens.pageLRMargin,
                  ),
                  child: CommonInputLarge(
                    title: S.of(context).hintInputMnemonic,
                    controller: widget.viewModel.mnemonicController,
                  )),
              CommonInput(
                title: S.of(context).accountName,
                placeholder: S.of(context).hintInputAccountName,
                controller: widget.viewModel.mnemonicAccountController,
              ),
              CommonInput(
                title: S.of(context).setPwd,
                placeholder: S.of(context).hintInputPwd,
                controller: widget.viewModel.mnemonicSetPwdController,
              ),
              CommonInput(
                title: S.of(context).confirmPwd,
                placeholder: S.of(context).hintInputPwd,
                controller: widget.viewModel.mnemonicConfirmPwdController,
              ),
              Container(
                  alignment: Alignment.topRight,
                  margin:
                      EdgeInsets.only(right: ThemeDimens.pageLRMargin * 1.6),
                  child: InkWell(
                    child: Wrap(
                      verticalDirection: VerticalDirection.up,
                      spacing: 7,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          S.of(context).whatIsMnemonic,
                          style: ThemeStyles.getSubtitle2lLight(context),
                        ),
                        Icon(
                          Icons.help,
                          color: Colors.green[300],
                          size: 16,
                        )
                      ],
                    ),
                    onTap: () async {
                      DialogHelper.showCommonDialog(
                          context: context,
                          title: S.of(context).whatIsMnemonic,
                          content: S.of(context).mnemonicInfo);
                    },
                  )),
            ],
          ),
        ));
  }
}