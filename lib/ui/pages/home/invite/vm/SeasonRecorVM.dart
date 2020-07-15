import 'package:xy_wallet/common/base/view_model/base_load_refresh_data_vm.dart';
import 'package:xy_wallet/model/response_beans.dart';
import 'package:xy_wallet/ui/pages/home/invite/SeasonRecordPage.dart';

class SeasonRecorViewModel extends BaseLoadRefreshDataViewModel<SeasonRecorBean> {
  final SeasonRecordType type;
  SeasonRecorViewModel(this.type);

  @override
  Future<SeasonRecorBean> loadData() {
    return Future.delayed(Duration(seconds: 1), () => SeasonRecorBean()..datas = List(type == SeasonRecordType.TOP ? 10 : 30));
  }
}
