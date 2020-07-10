import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/view_model/base_load_refresh_data_vm.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';
import 'package:xy_wallet/model/response_beans.dart';

class TransactionRecordViewModel extends BaseViewModel {
  final keywordController = TextEditingController();

  final itemsAll = List<TransactionItemBean>();
  final itemsTransfer = List<TransactionItemBean>();
  final itemsReceipt = List<TransactionItemBean>();
}

class TransactionRecordDetailsViewModel extends BaseLoadRefreshDataViewModel<TransactionDetailsItemBean> {
  @override
  Future<TransactionDetailsItemBean> loadData() {
    return Future.delayed(Duration(seconds: 2), () => TransactionDetailsItemBean());
  }
}
