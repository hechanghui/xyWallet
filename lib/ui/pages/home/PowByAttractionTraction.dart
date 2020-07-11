import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:xy_wallet/common/themes.dart';

class PowByAttractionTractionPage extends BaseWidget {
  @override
  getState() => _State();
}

class _State extends BaseWidgetState<PowByAttractionTractionPage> {
  List<charts.Series> _seriesList;

  @override
  void initState() {
    super.initState();
    _seriesList = _createSampleData();
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    //  final ticks=charts.StaticOrdinalTickProviderSpec([
    //     charts.TickSpec(
    //         '2018',
    //         label: '2018年',
    //         style: new charts.TextStyleSpec(//可对x轴设置颜色等
    //             color: new charts.Color(r: 0x4C, g: 0xAF, b: 0x50)))
    //     ),
    //     charts.TickSpec(
    //         '2019',
    //         label: '2019年',
    //         style: new charts.TextStyleSpec(//可对x轴设置颜色等
    //             color: new charts.Color(r: 0x4C, g: 0xAF, b: 0x50)))
    //     ),
    // ]);
    return charts.LineChart(
      _createSampleData(),
      animate: true,
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      // domainAxis: new charts.OrdinalAxisSpec(
      //   tickProviderSpec: ticks,
      // ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.Color(
          r: ThemeColors.accentColor.red,
          g: ThemeColors.accentColor.green,
          b: ThemeColors.accentColor.blue,
        ),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
