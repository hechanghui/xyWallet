import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';

import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';

class CreateXcode extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<CreateXcode> {
  @override
  String titleLabel(BuildContext context) => S.of(context).CreateXcode;

  var xcode;

  Widget buildBodyWidget(BuildContext context) {
    return Container(
      child: ListView(
        // shrinkWrap: true,
        
        children: <Widget>[
          CommonInput(
            title: S.of(context).CreateXcodeInput,
            placeholder: S.of(context).CreateXcodeInput,
            onChanged: (text) {xcode = text;},
          ).padding(EdgeInsets.only(top:20)),

          Text('需要支付：5 XCode').padding(EdgeInsets.only(left:30,top:20)),

          Padding(
            padding: EdgeInsets.only(
              top:40,
                left: ThemeDimens.pageLRMargin,
                right: ThemeDimens.pageLRMargin,
                ),
                      child: CommonButton(
                      child: Text(S.of(context).Create),
                      onPressed: () {
                      },
                ),
                ),
        ],
      ),
    );
  }
}
