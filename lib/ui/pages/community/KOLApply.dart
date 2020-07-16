import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

class KOLApply extends BaseWidget {

  var controllerTitle = TextEditingController();
  var controllerMaster = TextEditingController();
  var controllerWechat = TextEditingController();
  var controllerContent = TextEditingController();
  @override
  _RestoreByMnemonicState getState() => _RestoreByMnemonicState();
}

class _RestoreByMnemonicState extends BaseWidgetState<KOLApply> {
  @override
  String titleLabel(BuildContext context) => S.of(context).applyKOL;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: ThemeDimens.pageVerticalMargin * 1,
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
              
              CommonInput(
                title: S.of(context).KOLName,
                placeholder: S.of(context).KOLNameInput,
                controller: widget.controllerTitle,
              ),
              CommonInput(
                title: S.of(context).KOLMaster,
                placeholder: S.of(context).KOLMasterInput,
                controller: widget.controllerMaster,
              ),
              CommonInput(
                title: S.of(context).KOLWechat,
                placeholder: S.of(context).KOLWechatInput,
                controller: widget.controllerWechat,
              ).padding(EdgeInsets.only(bottom:10)),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeDimens.pageLRMargin,
                  ),
                  child: CommonInputLarge(
                    title: S.of(context).KOLInfo,
                    controller: widget.controllerContent,
                  )),


              CommonButton(
              child: Text(S.of(context).applyKOL),
              onPressed: () {
                if (widget.controllerTitle.text == null || widget.controllerTitle.text.isEmpty) {
                  showToast(S.of(context).KOLNameInput);
                  return;
                } else if (widget.controllerMaster.text == null || widget.controllerMaster.text.isEmpty) {
                  showToast(S.of(context).KOLMasterInput);
                  return;
                } else if (widget.controllerWechat.text == null || widget.controllerWechat.text.isEmpty) {
                  showToast(S.of(context).KOLWechatInput);
                  return;
                } else if (widget.controllerContent.text == null || widget.controllerContent.text.isEmpty) {
                  showToast(S.of(context).KOLInfoInput);
                  return;
                }
                Navigator.of(context).pushNamed(RouteName.KOLApplySuccess);
          
              }).padding(EdgeInsets.only(top:60,left:15,right:15)),
            ],
          ),
        ));
  }
}
