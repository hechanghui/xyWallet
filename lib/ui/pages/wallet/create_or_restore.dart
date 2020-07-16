import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/router/router_manager.dart';

import 'package:xy_wallet/ui/widgets/common_button.dart';

class CreateOrRestorePage extends StatelessWidget {
  const CreateOrRestorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => Future.value(false),
            child: Stack(fit: StackFit.expand, children: <Widget>[
              Image.asset(ImageHelper.wrapAssets('wallet_crate_or_restore_bg.webp'), fit: BoxFit.fill),
              Align(
                alignment: Alignment(0.0, 0.92),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonButton(
                          child: Text(S.of(context).walletRestore),
                          onPressed: () {
                            Navigator.pushNamed(context, RouteName.WALLET_RESTORE);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            "OR",
                            style: Theme.of(context).textTheme.button.copyWith(color: ThemeColors.labelLightColor),
                          ),
                        ),
                        CommonButton(
                          child: Text(S.of(context).walletCreate),
                          onPressed: () => Navigator.pushNamed(context, RouteName.WALLET_CREATE),
                        ),
                      ],
                    )),
              )
            ])));
  }
}
