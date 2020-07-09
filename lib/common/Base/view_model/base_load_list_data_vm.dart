import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/base/view_model/base_load_data_vm.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';

abstract class BaseLoadListDataViewModel<T> extends BaseLoadDataViewModel {
  /// 页面数据
  List<T> list = [];

  /// 分页第一页页码
  static const int pageNumFirst = 0;

  /// 分页条目数量
  static const int pageSize = 20;

  /// 分页页码
  int pageNum = 0;

  final _refreshController = RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  onCompleted(List<T> data) {}
   @override
  // 加载数据
  Future<List<T>> loadData({int pageNum});

  /// 下拉刷新
  Future<List<T>> refresh() async {
    try {
      pageNum = pageNumFirst;
      var data = await loadData(pageNum: pageNumFirst);
      list.clear();
      if (data?.isNotEmpty == true) {
        list.addAll(data);
        onCompleted(data);
      }
      refreshController.refreshCompleted();
      // 小于分页的数量,禁止上拉加载更多
      if (data.length < pageSize) {
        refreshController.loadNoData();
      } else {
        //防止上次上拉加载更多失败,需要重置状态
        refreshController.loadComplete();
      }
      list.isEmpty ? setEmpty() : setIdle();

      return data;
    } catch (e, s) {
      refreshController.refreshFailed();
      if (list.isEmpty) {
        setError(e, s);
      }
      return null;
    }
  }

  /// 上拉加载更多
  Future<List<T>> loadMore() async {
    try {
      var data = await loadData(pageNum: ++pageNum);
      if (data.isEmpty) {
        pageNum--;
        refreshController.loadNoData();
      } else {
        onCompleted(data);
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        notifyListeners();
      }
      return data;
    } catch (e, s) {
      pageNum--;
      refreshController.loadFailed();
      printErrorStack(e, s);
      return null;
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
