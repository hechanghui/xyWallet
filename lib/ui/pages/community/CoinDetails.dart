import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/community/widget/CoinDetailsPage.dart';
import 'package:xy_wallet/ui/pages/finance/transaction_list.dart';
import 'package:xy_wallet/ui/pages/finance/vm/transaction_record_vm.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class CoinDetails extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<CoinDetails> {
  @override
  String titleLabel(BuildContext context) => S.current.transferRecord;
    @override
  bool get wantKeepAlive => true;

  TransactionRecordViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = TransactionRecordViewModel();
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    var tabLabels = List.of(
        [S.of(context).ChargeRecord, S.of(context).WithDrawRecord, S.of(context).transferRecord]);
    var subPages = List.of([
      CoinDetailsPage(),
      CoinDetailsPage(),
      CoinDetailsPage(),

    ]);
    return DefaultTabController(
      length: tabLabels.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          createHeadView(),
          TabBar(
              labelColor: Theme.of(context).textTheme.subtitle1.color,
              unselectedLabelColor:
                  ThemeStyles.getSubtitle1lLight(context).color,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
              tabs: tabLabels.map((e) => Tab(text: e)).toList()),
          Expanded(
            child: TabBarView(
              physics: ScrollPhysics(),
              children: subPages,
            ),
          ),
        ],
      ),
    );
  }




  Widget createHeadView(){
    double width = MediaQuery.of(context).size.width;
    return  Container(
          height: 175,

          child: Stack(children: <Widget>[
        Image.asset(
          ImageHelper.wrapAssets('input_large_bg.png'),
          fit: BoxFit.fill,
          width: width - 30,
          height: 135,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),
        Text('20',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 40,
                    color: Color(0xff00ffaa),
                    fontWeight: FontWeight.bold))
            .padding(EdgeInsets.only(top: 30, left: 40, right: 30)),
        Text(
          '可用资产: 10.00000',
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 85, left: 40, right: 30)),
       
        Text(
          '冻结中: 10.00000',
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 110, left: 40, right: 30)),

        ]));


  }
}
