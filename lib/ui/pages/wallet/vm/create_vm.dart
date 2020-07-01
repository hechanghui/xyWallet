import 'package:flutter/material.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';

class CreateViewModel extends ViewStateModel {
  final mnemonicController = TextEditingController();
  final mnemonicAccountController = TextEditingController();
  final mnemonicSetPwdController = TextEditingController();
  final mnemonicConfirmPwdController = TextEditingController();
}
