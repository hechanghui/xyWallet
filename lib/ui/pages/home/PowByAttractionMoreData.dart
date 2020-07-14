import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';

import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/item_power_traction_reward.dart';

import 'vm/PowByAttractionTractionViewModel.dart';

class PowByAttractionMoreDataPage extends BaseWidget {
  @override
  getState() => _State();
}

class _State extends BaseLoadListDataWidgetState<PowByAttractionMoreDataPage, PowByAttractionMoreDataViewModel> {
  @override
  String titleLabel(BuildContext context) => S.of(context).PowByAttraction;

  @override
  void initState() {
    super.initState();
  }

  @override
  PowByAttractionMoreDataViewModel onCreateViewModel() => PowByAttractionMoreDataViewModel();

  @override
  Widget buildRefreshWithOutHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          S.current.tractionDate,
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          S.current.tractionReward,
          style: Theme.of(context).textTheme.headline3,
        )
      ],
    ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.contentVerticalMargin)).bg(color: ThemeColors.accentDartColor);
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = viewModel.datas[index];
        return ItemPowerTractionReward(item);
      },
      itemCount: viewModel.datas.length,
    );
  }
}
