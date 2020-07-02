import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/adressCell.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/tabMeCell.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';

class ChangePWD extends BaseWidget {
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
            placeholder: S.of(context).newPWd,
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
                      onPressed: () {
                        
                      },
                ),
                ),
        ],
      ),
    );
  }
}
