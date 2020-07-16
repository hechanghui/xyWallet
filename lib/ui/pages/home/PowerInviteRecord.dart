import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/pages/home/vm/PowerInviteRecordVM.dart';

class PowerInviteRecordPage extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseLoadListDataWidgetState<PowerInviteRecordPage, PowerInviteRecordViewModel> with SingleTickerProviderStateMixin {
  String titleLabel(BuildContext context) => S.of(context).PowByPower;
  TabController _tabController;
  ScrollController _scrollController;
  GlobalKey _tabBarKey;
  Color _tabBarBg;

  @override
  void initState() {
    super.initState();
    _tabBarKey = GlobalKey();
    _tabController = TabController(length: 4, vsync: this);
    _tabBarBg = Colors.transparent;
    _scrollController = ScrollController()
      ..addListener(() {
        final RenderBox tabBarRenderBox = _tabBarKey.currentContext.findRenderObject();
        final tabBarHeight = tabBarRenderBox.size.height;
        final tabBarOffset = tabBarRenderBox.localToGlobal(Offset.zero);
        setState(() {
          _tabBarBg = tabBarOffset.dy <= tabBarHeight ? Colors.transparent : ThemeColors.primaryColor;
        });
      });
  }

  @override
  PowerInviteRecordViewModel onCreateViewModel() => PowerInviteRecordViewModel();

  @override
  Widget buildRefreshWidget(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              flexibleSpace: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "我的直推人数：",
                      style: ThemeStyles.getHeadline4lLight(context),
                    ),
                    TextSpan(
                      text: "100人",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ])),
                  Text(
                    "我的邀请码:",
                    style: ThemeStyles.getHeadline4lLight(context),
                  ).padding(EdgeInsets.only(top: ThemeDimens.contentVerticalMargin)),
                ],
              )),
          SliverAppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: CommonInputMinor(
              placeholder: "233333333333333333333333333",
              placeholderStyle: Theme.of(context).textTheme.headline4,
              right: Text(
                S.current.Copy,
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: ThemeColors.primaryFgColor),
              ).click(onTap: () {
                // Clipboard.setData(ClipboardData(text: viewModel.data.address ?? ""));
                showToast(S.of(context).CopySuccess);
              }),
            ),
          ),
          SliverAppBar(
            backgroundColor: _tabBarBg,
            automaticallyImplyLeading: false,
            floating: true,
            pinned: false,
            snap: true,
            flexibleSpace: TabBar(key: _tabBarKey, controller: _tabController, tabs: [
              Tab(
                text: "首页",
              ),
              Tab(
                text: "消息",
              ),
              Tab(
                text: "购物",
              ),
              Tab(
                text: "我的",
              )
            ]),
          ),
          SliverAppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            floating: false,
            pinned: true,
            flexibleSpace: Text("ddddddddddddddddd"),
          ),
        ];
      },
      body: SmartRefresher(
        controller: viewModel.refreshController,
        enablePullUp: true,
        onRefresh: viewModel.refresh,
        onLoading: viewModel.loadMore,
        child: buildBodyWidget(context),
      ).padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * 2)),
    ).padding(EdgeInsets.only(
      top: ThemeDimens.pageVerticalMargin * 2,
    ));
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = viewModel.datas[index];
        return Text(
          "23333333333333",
        ).padding(EdgeInsets.only(bottom: ThemeDimens.pageVerticalMargin));
      },
      itemCount: viewModel.datas.length,
    );
  }
}
