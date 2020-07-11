import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/popup_helper.dart';
import 'package:xy_wallet/common/worker/worker.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/me/vm/about_vm.dart';

import 'package:xy_wallet/common/extension/string.ex.dart';

class AboutPage extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseLoadDataWidgetState<AboutPage, AboutViewModel> {
  @override
  String titleLabel(BuildContext context) => S.current.AboutUs;

  @override
  bool get emptyEnableReload => false;

  @override
  onCreateViewModel() => AboutViewModel();

  @override
  Widget buildBodyWidget(BuildContext context) {
    // var model = Provider.of<AboutViewModel>(context);
    return Column(
      children: <Widget>[
        Text(viewModel.packageInfo.appName),
        InkWell(
          onTap: () async {
            "".showLoading();
            print("---------------1");
            // var d = await test(handler , ["hehehe", "wocao"]);
            print("---------------2 ");
            "".hideLoading();
          },
          child: Text(viewModel.packageInfo.version),
        )
      ],
    );
  }
}
