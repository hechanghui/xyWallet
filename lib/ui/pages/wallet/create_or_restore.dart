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
                alignment: Alignment(0.0, 0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CommonButton(child: Text("233333")),
                    CommonButton(child: Text("233333")),
                  ],
                ),
              )
            ])));
  }
}
