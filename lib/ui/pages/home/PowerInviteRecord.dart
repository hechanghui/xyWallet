//动力挖矿 、个人动力、推荐人数相关
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/home/vm/PowerInviteRecordVM.dart';

class PowerInviteRecordPage extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseLoadListDataWidgetState<PowerInviteRecordPage, PowerInviteRecordViewModel> {
  String titleLabel(BuildContext context) => S.of(context).PowByPower;

  @override
  PowerInviteRecordViewModel onCreateViewModel() => PowerInviteRecordViewModel();

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Text("hehehehe");
  }
}
