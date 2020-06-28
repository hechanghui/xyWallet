import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:xy_wallet/common/helper/resource_helper.dart';
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
              Image.asset(
                  ImageHelper.wrapAssets('wallet_crate_or_restore_bg.png'),
                  fit: BoxFit.fill),
              Align(
                alignment: Alignment(0.0, 0.92),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonButton(
                          child: Text(S.of(context).walletRestore),
                          onPressed: () {
                            Navigator.pushNamed(context, RouteName.tab);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            "OR",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Color(0xFF3F7591)),
                          ),
                        ),
                        CommonButton(
                          child: Text(S.of(context).walletCreate),
                          onPressed: ()=>Navigator.pushReplacementNamed(context, RouteName.tab),
                        ),
                      ],
                    )),
              )
            ])));
  }
}
