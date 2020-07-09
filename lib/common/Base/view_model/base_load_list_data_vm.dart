import 'package:xy_wallet/common/base/view_model/base_load_data_vm.dart';

abstract class BaseLoadListDataViewModel extends BaseLoadDataViewModel {
  /// 分页第一页页码
  static const int pageNumFirst = 0;

  /// 分页条目数量
  static const int pageSize = 20;

  /// 分页页码
  int pageNum = 0;

  
  
}
