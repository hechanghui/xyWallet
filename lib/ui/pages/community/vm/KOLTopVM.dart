import 'package:xy_wallet/common/base/view_model/base_load_refresh_data_vm.dart';

class KOLTopViewModel extends BaseLoadRefreshDataViewModel<CoinSplitRankData> {
  @override
  Future<CoinSplitRankData> loadData() {
    return Future.delayed(Duration(seconds: 1), () {
      return CoinSplitRankData()..datas = List(10);
    });
  }
}

class CoinSplitRankData {
  List<String> _datas;
  List<String> get datas => _datas;
  set datas(List<String> datas) {
    _datas = datas;
  }
}
