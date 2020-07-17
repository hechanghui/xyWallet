import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/provider/view_state.dart';
import 'package:xy_wallet/common/provider/view_state_widget.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/pages/home/vm/PowerInviteRecordVM.dart';

class PowerInviteRecordPage extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseLoadDataWidgetState<PowerInviteRecordPage, PowerInviteRecordViewModel> with SingleTickerProviderStateMixin {
  String titleLabel(BuildContext context) => S.of(context).PowByPower;
  TabController _tabController;
  ScrollController _scrollController;
  GlobalKey _tabBarKey;
  Color _tabBarBg;
  List<String> _tabLabels;
  List<Widget> _subPages;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabBarKey = GlobalKey();
    _tabLabels = ["1级好友", "2级好友", "3-10级好友"];
    _subPages = List(_tabLabels.length);
    _tabController = TabController(length: _tabLabels.length, vsync: this)
      ..addListener(() {
        if (_tabIndex != _tabController.index) {
          setState(() {
            _tabIndex = _tabController.index;
            final RenderBox tabBarRenderBox = _tabBarKey.currentContext.findRenderObject();
            final tabBarHeight = tabBarRenderBox.size.height;
            final tabBarOffset = tabBarRenderBox.localToGlobal(Offset.zero);
            if (_scrollController.offset > tabBarOffset.dy+tabBarHeight) {
              _scrollController.animateTo(0, duration: Duration(microseconds: 10), curve: Curves.ease);
            }
          });
        }
      });
    _tabBarBg = Colors.transparent;
    _scrollController = ScrollController()
      ..addListener(() {
        final RenderBox tabBarRenderBox = _tabBarKey.currentContext.findRenderObject();
        final tabBarHeight = tabBarRenderBox.size.height;
        final tabBarOffset = tabBarRenderBox.localToGlobal(Offset.zero);
        print("tabBarHeight:$tabBarHeight   tabBarOffset:$tabBarOffset     ${_scrollController.offset}");
        setState(() {
          _tabBarBg = tabBarOffset.dy > tabBarHeight
              ? _scrollController.offset < tabBarOffset.dy ? Colors.transparent : ThemeColors.primaryColor
              : ThemeColors.primaryColor;
        });
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  PowerInviteListPage _getListPageByTabIndex() {
    return _subPages[_tabIndex] ?? (_subPages[_tabIndex] = PowerInviteListPage(viewModel.getListViewModel(_tabIndex)));
  }

  @override
  PowerInviteRecordViewModel onCreateViewModel() => PowerInviteRecordViewModel();

  @override
  Widget buildBodyWidget(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              backgroundColor: _tabBarBg,
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
              ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin))),
          SliverAppBar(
            backgroundColor: _tabBarBg,
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
            ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin)),
          ),
          SliverAppBar(
            backgroundColor: _tabBarBg,
            automaticallyImplyLeading: false,
            floating: true,
            pinned: false,
            snap: true,
            flexibleSpace: TabBar(
                key: _tabBarKey,
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Theme.of(context).textTheme.subtitle1.color,
                unselectedLabelColor: ThemeStyles.getSubtitle1lLight(context).color,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                tabs: _tabLabels.map((e) => Tab(text: e)).toList()),
          ),
          SliverAppBar(
            backgroundColor: ThemeColors.accentDartColor,
            automaticallyImplyLeading: false,
            floating: false,
            pinned: true,
            flexibleSpace: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: Axis.horizontal,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.current.address,
                    textAlign: TextAlign.left,
                    style: ThemeStyles.getSubtitle1lLight(context),
                  ),
                ).padding(EdgeInsets.only(left: ThemeDimens.pageLRMargin)).expand(flex: 4),
                Text(
                  "KYC",
                  textAlign: TextAlign.center,
                  style: ThemeStyles.getSubtitle1lLight(context),
                ).expand(flex: 1),
                Text(
                  "邀请时间",
                  textAlign: TextAlign.right,
                  style: ThemeStyles.getSubtitle1lLight(context),
                ).padding(EdgeInsets.only(right: ThemeDimens.pageLRMargin)).expand(flex: 4),
              ],
            ),
          ),
        ];
      },
      body: SmartRefresher(
        controller: viewModel.getListViewModel(_tabIndex).refreshController,
        enablePullUp: true,
        onRefresh: () {
          viewModel.loadData();
          viewModel.getListViewModel(_tabIndex).refresh();
        },
        onLoading: viewModel.getListViewModel(_tabIndex).loadMore,
        child: SingleChildScrollView(child: _getListPageByTabIndex()),
      ).padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * 2)),
    ).padding(EdgeInsets.only(
      top: _tabBarBg == Colors.transparent ? ThemeDimens.pageVerticalMargin * 2 : 0,
    ));
  }
}

class PowerInviteListPage extends StatelessWidget {
  final PowerInviteListViewModel viewModel;
  const PowerInviteListPage(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<PowerInviteListViewModel>(
      model: viewModel,
      onModelReady: (model) {
        if (viewModel.viewState == ViewState.busy) {
          viewModel.refresh();
        }
      },
      builder: (context, model, child) {
        return ViewStateLayou(
          viewState: viewModel.viewState,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = viewModel.datas[index];
              return ItemPowerInvite(viewModel.listType);
            },
            itemCount: viewModel.datas.length,
          ),
        );
      },
    );
  }
}

class ItemPowerInvite extends StatelessWidget {
  final int listType;
  const ItemPowerInvite(this.listType);
  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      direction: Axis.horizontal,
      children: <Widget>[
        Text(
          "${S.current.address}--${listType}",
          textAlign: TextAlign.left,
          style: ThemeStyles.getSubtitle2lLight(context),
        ).padding(EdgeInsets.only(left: ThemeDimens.pageLRMargin)).expand(flex: 4),
        Text(
          "KYC",
          textAlign: TextAlign.center,
          style: ThemeStyles.getSubtitle2lLight(context),
        )
            .padding(EdgeInsets.symmetric(vertical: ThemeDimens.pageLRMargin * .8))
            .border(Border.symmetric(horizontal: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid)))
            .expand(flex: 1),
        Text(
          "邀请时间",
          textAlign: TextAlign.right,
          style: ThemeStyles.getSubtitle2lLight(context),
        ).padding(EdgeInsets.only(right: ThemeDimens.pageLRMargin)).expand(flex: 4),
      ],
    ).border(Border(bottom: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid)));
  }
}
