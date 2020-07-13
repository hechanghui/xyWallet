import 'package:xy_wallet/common/base/view_model/base_load_refresh_data_vm.dart';

class PowByAttractionTractionViewModel extends BaseLoadRefreshDataViewModel<PowByAttractionTractionBean> {
  @override
  Future<PowByAttractionTractionBean> loadData() {
    return Future.delayed(Duration(seconds: 1), () {
      var data = PowByAttractionTractionBean();
      data.linearReward = [
        LinearReward(DateTime.now(), 1),
        LinearReward(DateTime.now().subtract(Duration(days: 1)), 0),
        LinearReward(DateTime.now().subtract(Duration(days: 2)), 4),
        LinearReward(DateTime.now().subtract(Duration(days: 3)), 1),
        LinearReward(DateTime.now().subtract(Duration(days: 4)), 8),
        LinearReward(DateTime.now().subtract(Duration(days: 5)), 10),
        LinearReward(DateTime.now().subtract(Duration(days: 6)), 6),
      ];
      data.address = "0x31dwsdkjop8wernfdlikfguyesirngiuyhrt343434345345456456";
      return data;
    });
  }
}

class PowByAttractionTractionBean {
  String _address;
  set address(String address) {
    this._address = address;
  }

  String get address => _address;

  List<LinearReward> _linearReward;
  set linearReward(List<LinearReward> linearReward) {
    this._linearReward = linearReward;
  }

  List<LinearReward> get linearReward => _linearReward;
}

class LinearReward {
  final DateTime date;
  final int reward;

  LinearReward(this.date, this.reward);
}
