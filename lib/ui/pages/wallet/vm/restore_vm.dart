import 'package:flutter/material.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';

class RestoreViewModel extends BaseViewModel {
  final mnemonicController = TextEditingController();
  final mnemonicAccountController = TextEditingController();
  final mnemonicSetPwdController = TextEditingController();
  final mnemonicConfirmPwdController = TextEditingController();

  final keystoreController = TextEditingController();
  final keystoreAccountController = TextEditingController();
  final keystorePwdController = TextEditingController();

  final privateKeyController = TextEditingController();
  final privateKeyAccountController = TextEditingController();
  final privateKeySetPwdController = TextEditingController();
  final privateKeyConfirmPwdController = TextEditingController();

  // void restoreWallet() {}

  // @override
  // void dispose() {
  //   mnemonicController.dispose();
  //   mnemonicAccountController.dispose();
  //   mnemonicSetPwdController.dispose();
  //   mnemonicSetPwdController.dispose();
  //   mnemonicConfirmPwdController.dispose();
  //   super.dispose();
  // }
}
