import 'dart:async';

import 'package:package_info/package_info.dart';
import 'package:xy_wallet/common/base/view_model/base_load_data_vm.dart';

class AboutViewModel extends BaseLoadDataViewModel {
  PackageInfo packageInfo;

  @override
  loadData() async {
    // setBusy();
    packageInfo = await PackageInfo.fromPlatform();
    setIdle();
    // Timer(Duration(seconds: 3), () async {
    //   packageInfo = await PackageInfo.fromPlatform();
    //   // setIdle();
    //   setEmpty();
    // });
  }
}