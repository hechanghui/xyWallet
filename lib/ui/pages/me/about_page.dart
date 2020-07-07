import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/popup_helper.dart';
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
  onCreateViewModel() => AboutViewModel();

  @override
  Widget buildBodyWidget(BuildContext context) {
    var model = Provider.of<AboutViewModel>(context);
    return Column(
      children: <Widget>[
        Text(model.packageInfo.appName),
        InkWell(
          onTap: () async {
            "".showLoading();
            print("---------------1");
           var d = await test();
            print("---------------2 $d");
            "".hideLoading();
          },
          child: Text(model.packageInfo.version),
        )
      ],
    );
  }

  Future<String> test() {
    print("1111111");
    var ddd = Future(() async {
      print("22222222");
      return await Future.delayed(Duration(seconds: 3), () {
        print("33333333");
        return "hehehehe";
      });
    });
    print("4444444");
    return ddd;
  }
}
