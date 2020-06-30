import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

class RestoreByMnemonic extends BaseWidget {
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
                  )),
              CommonInput(
                title: S.of(context).accountName,
                placeholder: S.of(context).hintInputAccountName,
              ),
              CommonInput(
                title: S.of(context).setPwd,
                placeholder: S.of(context).hintInputPwd,
              ),
              CommonInput(
                title: S.of(context).confirmPwd,
                placeholder: S.of(context).hintInputPwd,
              ),
              IconButton(
                  icon: Icon(
                    Icons.help,
                    color: Colors.green[300],
                  ),
                  onPressed: null)
            ],
          ),
        ));
  }
}
