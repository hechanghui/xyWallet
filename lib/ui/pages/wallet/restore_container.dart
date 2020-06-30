import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

import 'package:xy_wallet/ui/pages/wallet/restore_by_keystore.dart';
import 'package:xy_wallet/ui/pages/wallet/restore_by_privateKey.dart';
import 'package:xy_wallet/ui/pages/wallet/vm/restore_vm.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';

import 'restore_by_mnemonic.dart';

class RestoreContainerPage extends BaseWidget {
  @override
  BaseWidgetState getState() => RestoreContainerState();
}

class RestoreContainerState extends BaseWidgetState<RestoreContainerPage>
    with SingleTickerProviderStateMixin {
  @override
  String titleLabel(BuildContext context) => S.of(context).walletRestore;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    var tabLabels = List.of([
      S.of(context).mnemonic,
      S.of(context).keystore,
      S.of(context).privateKey
    ]);
    final viewModel = RestoreViewModel();
    var subPages = List.of([
      RestoreByMnemonic(viewModel),
      RestoreByKeyStore(viewModel),
      RestoreByPriveKey(viewModel)
    ]);
    return ProviderWidget<RestoreViewModel>(
      model: viewModel,
      builder: (conntext, model, child) {
        return Form(
          onWillPop: () async {
            return !model.isBusy;
          },
          child: child,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TabBar(
              labelColor: Theme.of(context).textTheme.subtitle1.color,
              unselectedLabelColor:
                  ThemeStyles.getSubtitle1lLight(context).color,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
              controller: _tabController,
              tabs: tabLabels.map((e) => Tab(text: e)).toList()),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: ScrollPhysics(),
              children: subPages,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: ThemeDimens.pageLRMargin,
                  right: ThemeDimens.pageLRMargin,
                  bottom: ThemeDimens.pageBottomMargin),
              child: CommonButton(
                child: Text(S.of(context).walletCreate),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, RouteName.tab),
              ))
        ],
      ),
    );
  }
}
