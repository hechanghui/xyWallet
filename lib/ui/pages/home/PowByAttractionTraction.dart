import 'package:flutter/services.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';

import 'vm/PowByAttractionTractionViewModel.dart';

import 'package:intl/intl.dart';

class PowByAttractionTractionPage extends BaseWidget {
  @override
  getState() => _State();
}

class _State extends BaseLoadRefreshDataWidgetState<PowByAttractionTractionPage, PowByAttractionTractionViewModel> {
  @override
  String titleLabel(BuildContext context) => S.of(context).PowByAttraction;

  @override
  void initState() {
    super.initState();
  }

  @override
  onCreateViewModel() => PowByAttractionTractionViewModel();

  @override
  Widget buildBodyWidget(BuildContext context) {
    List<charts.TickSpec<DateTime>> tickSpecsHorizontal = [];
    int rewardMax = 0;
    final accentColor = ThemeColors.accentColor;
    for (var item in viewModel.data.linearReward) {
      tickSpecsHorizontal.add(charts.TickSpec<DateTime>(item.date,
          label: DateFormat.Md().format(item.date),
          style: new charts.TextStyleSpec(color: new charts.Color(r: accentColor.red, g: accentColor.green, b: accentColor.blue))));
      if (rewardMax < item.reward) {
        rewardMax = item.reward;
        // tickSpecsVertical.add(charts.TickSpec<int>(item.reward,
        //     label: "${item.reward}", style: new charts.TextStyleSpec(color: new charts.Color(r: accentColor.red, g: accentColor.green, b: accentColor.blue))));
      }
    }
    //不显示纵坐标线
    List<charts.TickSpec<int>> tickSpecsVertical = [
      // charts.TickSpec<int>(rewardMax,
      //     label: "${rewardMax}", style: new charts.TextStyleSpec(color: new charts.Color(r: accentColor.red, g: accentColor.green, b: accentColor.blue)))
    ];

    final primaryFgColor = ThemeColors.primaryFgColor;
    final rewards = [
      charts.Series<LinearReward, DateTime>(
        id: 'Tablet',
        colorFn: (_, __) => charts.Color(r: primaryFgColor.red, g: primaryFgColor.green, b: primaryFgColor.blue, a: 150),
        domainFn: (LinearReward sales, _) => sales.date,
        measureFn: (LinearReward sales, _) => sales.reward,
        data: viewModel.data.linearReward,
      )
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: false,
      padding: EdgeInsets.only(
        top: ThemeDimens.pageVerticalMargin * 2,
        left: ThemeDimens.pageLRMargin,
        right: ThemeDimens.pageLRMargin,
      ),
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "12333.0",
            style: ThemeStyles.getLarge(context),
          ),
          Text(
            S.current.lockUpPlatformToken,
            style: Theme.of(context).textTheme.headline4.copyWith(color: ThemeColors.labelLightColor),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.watch_later,
                color: ThemeColors.primaryFgColor,
              ),
              Text(
                S.current.stateWaitActivate,
                style: Theme.of(context).textTheme.headline4.copyWith(color: ThemeColors.labelLightColor),
              ).padding(EdgeInsets.only(left: ThemeDimens.pageVerticalMargin)),
            ],
          ).padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * 5, bottom: ThemeDimens.pageVerticalMargin * 3)),
          CommonInputMinor(
            enabled: false,
            placeholder: viewModel.data.address,
            placeholderStyle: Theme.of(context).textTheme.headline4,
            right: Text(
              S.current.Copy,
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: ThemeColors.primaryFgColor),
            ).click(onTap: () {
              Clipboard.setData(ClipboardData(text: viewModel.data.address ?? ""));
              showToast(S.of(context).CopySuccess);
            }),
          ),
          Text(
            "请使用你的牵引地址向此地址转入0.01对应平台币以激活",
            style: ThemeStyles.getSubtitle1lLight(context),
          ).center(),
          Divider(height: ThemeDimens.pageVerticalMargin * 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    S.current.todayTractionReward,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    S.current.seeMoreData,
                    style: ThemeStyles.getSubtitle2lLight(context),
                  ).click(onTap: () {
                    Navigator.of(context).pushNamed(RouteName.POWBYATTRACTION_MOREDATA);
                  }),
                ],
              ).padding(EdgeInsets.only(
                  top: ThemeDimens.pageVerticalMargin * 1.4, left: ThemeDimens.pageVerticalMargin * 1.8, right: ThemeDimens.pageVerticalMargin * 1.8)),
              Text(
                "0",
                style: Theme.of(context).textTheme.subtitle2,
              ).padding(EdgeInsets.only(
                  top: ThemeDimens.pageVerticalMargin * 0.6, left: ThemeDimens.pageVerticalMargin * 1.8, right: ThemeDimens.pageVerticalMargin * 1.8)),
              SizedBox(
                  height: 120,
                  child: charts.TimeSeriesChart(
                    rewards,
                    animate: true,
                    defaultInteractions: false,
                    primaryMeasureAxis: charts.NumericAxisSpec(
                      showAxisLine: false,
                      tickProviderSpec: charts.StaticNumericTickProviderSpec(tickSpecsVertical),
                    ),
                    domainAxis: charts.DateTimeAxisSpec(
                      showAxisLine: false,
                      tickProviderSpec: charts.StaticDateTimeTickProviderSpec(tickSpecsHorizontal),
                    ),
                    defaultRenderer: new charts.LineRendererConfig(
                      includePoints: true,
                      radiusPx: 4,
                    ),
                  )).padding(EdgeInsets.only(left: ThemeDimens.pageVerticalMargin, right: ThemeDimens.pageVerticalMargin)),
            ],
          ).backImage(),
          Divider(height: ThemeDimens.pageLRMargin * 3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "牵引总价值 XXXX USDT",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "0.5%",
                        style: ThemeStyles.getLarge(context),
                      ),
                      Text(
                        S.current.myTractionRatio,
                        style: Theme.of(context).textTheme.subtitle2,
                      ).padding(EdgeInsets.symmetric(vertical: ThemeDimens.pageVerticalMargin)),
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: charts.PieChart(
                      _createSampleData(),
                      animate: true,
                      // Add the series legend behavior to the chart to turn on series legends.
                      // By default the legend will display above the chart.
                    ),
                  ),
                ],
              ),
            ],
          ).backImage(padding: EdgeInsets.all(ThemeDimens.pageVerticalMargin * 1.6)),
        ],
      ),
    );
  }

  /// Create series list with one series
  static List<charts.Series<LinearSales, String>> _createSampleData() {
    final data = [
      new LinearSales("总价值", 100),
      new LinearSales("我的", 0.5),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => "${sales.year}hehe",
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String year;
  final double sales;

  LinearSales(this.year, this.sales);
}
