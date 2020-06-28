import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xy_wallet/ui/base/base_page.dart';

class RestoreContainerPage extends BasePage {
  @override
  BasePageState buildState() => RestoreContainerState();
}

class RestoreContainerState extends BasePageState {
  @override
  String get titleLabel => "super.titleLabel";

  @override
  Widget buildBody(BuildContext context) {
    return Text("ddd");
  }
}
