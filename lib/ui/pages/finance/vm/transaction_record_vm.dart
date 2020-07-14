import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/view_model/base_load_list_data_vm.dart';
import 'package:xy_wallet/common/base/view_model/base_load_refresh_data_vm.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';
import 'package:xy_wallet/model/response_beans.dart';

import '../transaction_list.dart';

class TransactionRecordViewModel extends BaseViewModel {
  Map<TransactionType, TransactionRecordListViewModel> _listViewModels = Map();

  TransactionRecordListViewModel getListViewModel(TransactionType type) {
    return _listViewModels[type] ?? (_listViewModels[type] = TransactionRecordListViewModel(type));
  }
}

class TransactionRecordListViewModel extends BaseLoadListDataViewModel {
  final keywordController = TextEditingController();

  TransactionType type;
  TransactionRecordListViewModel(this.type);

  String _searchKeyword = "";

  void search() {
    if (this._searchKeyword != keywordController.text) {
      this._searchKeyword = keywordController.text;
      debugPrint("搜索.....${_searchKeyword}");
      refresh();
    }
  }

  @override
  Future<List> loadData({int pageNum}) {
    return Future.delayed(Duration(seconds: 2), () {
      final list = [];
      final sourceNum = pageNum == BaseLoadListDataViewModel.pageNumFirst ? pageSize : 4;
      for (var i = 0; i < sourceNum; i++) {
        switch (type) {
          case TransactionType.RECEIPT:
            list.add(TransactionItemBean());
            break;
          case TransactionType.TRANSFER:
            list.add(TransactionItemBean()..out = true);
            break;
          default:
            list.add(TransactionItemBean()..out = i % 3 == 0);
            break;
        }
      }
      return list;
    });
  }

  @override
  void dispose() {
    keywordController.dispose();
    super.dispose();
  }
}

class TransactionRecordDetailsViewModel extends BaseLoadRefreshDataViewModel<TransactionDetailsItemBean> {
  @override
  Future<TransactionDetailsItemBean> loadData() {
    return Future.delayed(Duration(seconds: 2), () => TransactionDetailsItemBean());
  }
}
