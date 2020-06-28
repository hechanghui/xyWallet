import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xy_wallet/ui/base/base_page.dart';
import 'package:xy_wallet/generated/l10n.dart';

import 'package:xy_wallet/ui/pages/wallet/create_or_restore.dart';

class RestoreContainerPage extends BasePage {
  @override
  BasePageState buildState() => RestoreContainerState();
}

class RestoreContainerState extends BasePageState
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
  Widget buildBody(BuildContext context) {
    var tabLabels = List.of([
      S.of(context).mnemonic,
      S.of(context).keystore,
      S.of(context).privateKey
    ]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
            controller: _tabController,
            tabs: tabLabels.map((e) => Tab(text: e)).toList()),
        Expanded(
          // color: Color.fromRGBO(26, 172, 255, 1),
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
        Text("233333"),
      ],
    );
  }
}
