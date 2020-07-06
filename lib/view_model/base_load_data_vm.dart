import 'package:xy_wallet/common/provider/view_state_model.dart';

abstract class BaseLoadDataViewModel extends ViewStateModel {
  BaseLoadDataViewModel() : super(viewState: ViewState.busy);

  loadData();
}
