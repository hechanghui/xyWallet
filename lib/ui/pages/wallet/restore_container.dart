import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xy_wallet/ui/base/base_page.dart';
import 'package:xy_wallet/generated/l10n.dart';

class RestoreContainerPage extends BasePage {
  @override
  BasePageState buildState() => RestoreContainerState();
}

class RestoreContainerState extends BasePageState {
  @override
  String titleLabel(BuildContext context) => S.of(context).walletRestore;

  @override
  Widget buildBody(BuildContext context) {
    return Text("ddd");
  }
}
