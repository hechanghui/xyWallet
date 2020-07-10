import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/base/view_model/base_load_data_vm.dart';

abstract class BaseLoadRefreshDataViewModel<T> extends BaseLoadDataViewModel {
  /// 页面数据
  T data;

  final _refreshController = RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  @override
  // 加载数据
  Future<T> loadData();

  /// 下拉刷新
  Future<T> refresh() async {
    try {
      var data = await loadData();
      if (data != null) {
        this.data = data;
      }
      refreshController.refreshCompleted();
      this.data == null ? setEmpty() : setIdle();

      return data;
    } catch (e, s) {
      refreshController.refreshFailed();
      if (this.data == null) {
        setError(e, s);
      }
      return null;
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
