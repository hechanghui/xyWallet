import 'package:xy_wallet/common/base/view_model/base_load_list_data_vm.dart';
import 'package:xy_wallet/model/response_beans.dart';

class PowerInviteRecordViewModel extends BaseLoadListDataViewModel<PowerInviteRecordBean> {
  @override
  Future<List<PowerInviteRecordBean>> loadData({int pageNum}) {
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
