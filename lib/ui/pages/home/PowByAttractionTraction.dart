import 'dart:collection';

import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:xy_wallet/common/themes.dart';

class PowByAttractionTractionPage extends BaseWidget {
  @override
  getState() => _State();
}

class _State extends BaseWidgetState<PowByAttractionTractionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    final ticks = new charts.StaticNumericTickProviderSpec([
      new charts.TickSpec(233,
          label: '2018年',
          style: new charts.TextStyleSpec(
              //可对x轴设置颜色等
              color: new charts.Color(r: 0x4C, g: 0xAF, b: 0x50))),
      new charts.TickSpec(22,
          label: '2019年',
          style: new charts.TextStyleSpec(
              //可对x轴设置颜色等
              color: new charts.Color(r: 0x4C, g: 0xAF, b: 0x50))),
    ]);

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF082E41),
      ),
      child: charts.LineChart(
        _createSampleData(),
        animate: true,
        defaultInteractions: true,
        secondaryMeasureAxis: charts.NumericAxisSpec(
          showAxisLine: false,
          tickProviderSpec: ticks,
        ),
        defaultRenderer: new charts.LineRendererConfig(
          includePoints: true,
          radiusPx: 4,
        ),
      ),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final tableSalesData = [
      // new LinearSales(0, 50),
      // new LinearSales(1, 100),
      // new LinearSales(2, 200),
      // new LinearSales(3, 150),
      new LinearSales(0, 5),
      new LinearSales(1, 25),
    ];
    final color = ThemeColors.primaryFgColor;
    return [
      charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.Color(r: color.red, g: color.green, b: color.blue, a: 150),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
