import 'package:flutter/material.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';
import 'package:xy_wallet/model/response_beans.dart';

class TransactionRecordViewModel extends ViewStateModel{
  final keywordController = TextEditingController();

  final itemsAll = List<TransactionItemBean>();
  final itemsTransfer = List<TransactionItemBean>();
  final itemsReceipt = List<TransactionItemBean>();
}