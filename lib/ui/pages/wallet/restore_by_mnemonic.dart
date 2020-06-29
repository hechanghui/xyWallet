import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/themes.dart';
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
                    title: '请输入账户助记词（12个英文单词），按空格分离',
                  )),
              CommonInput(
                title: '账户名称',
                placeholder: '请输入账户名称',
              ),
              CommonInput(
                title: '设置密码',
                placeholder: '请输入密码',
              ),
              CommonInput(
                title: '确认密码',
                placeholder: '请输入密码',
              ),
            ],
          ),
        ));
  }
}
