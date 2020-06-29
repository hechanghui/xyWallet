import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/ui/base/base_page.dart';
import 'package:xy_wallet/generated/l10n.dart';

import 'package:xy_wallet/ui/pages/wallet/create_or_restore.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
            controller: _tabController,
            tabs: tabLabels.map((e) => Tab(text: e)).toList()),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: ScrollPhysics(),
            // drawerDragStartBehavior: DragStartBehavior.start, //?
            children: [
              Text("233333"),
              Text("233333"),
              Text("233333"),
              // CreateOrRestorePage(),
              // CreateOrRestorePage(),
              // CreateOrRestorePage(),
            ],
          ),
        ),
      ],
    );
  }
}
