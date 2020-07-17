import 'package:xy_wallet/common/base/view_model/base_load_data_vm.dart';
import 'package:xy_wallet/common/base/view_model/base_load_list_data_vm.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';
import 'package:xy_wallet/model/response_beans.dart';

class PowerInviteRecordViewModel extends BaseLoadDataViewModel {
  Map<int, PowerInviteListViewModel> _listViewModel;
  PowerInviteRecordViewModel() {
    _listViewModel = Map();
  }
  @override
  Future loadData() {
    return Future.delayed(Duration(seconds: 1), () => viewState = ViewState.idle);
  }

  PowerInviteListViewModel getListViewModel(int tabIndex) {
    return _listViewModel[tabIndex] ?? (_listViewModel[tabIndex] = PowerInviteListViewModel(tabIndex));
  }
}

class PowerInviteListViewModel extends BaseLoadListDataViewModel {
  final int listType; //列表类型、0->1级好友；1->2级好友；2->3-10级好友
  PowerInviteListViewModel(this.listType);
  @override
  Future<List> loadData({int pageNum}) {
    print("PowerInviteListViewModel->${listType} :: loadData($pageNum)");
    return Future.delayed(
        Duration(seconds: 1),
        () => [
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
              PowerInviteRecordBean(),
            ]);
  }
}
