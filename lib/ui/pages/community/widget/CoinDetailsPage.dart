import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/model/response_beans.dart';
import 'package:xy_wallet/ui/pages/finance/vm/transaction_record_vm.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/item_transaction.dart';

enum CoinDetailsPageType {
  ALL,
  TRANSFER,
  RECEIPT,
}

class CoinDetailsCellTypeViewModel extends BaseViewModel {
  
  final itemsAll = List<TransactionItemBean>();
  final itemsTransfer = List<TransactionItemBean>();
  final itemsReceipt = List<TransactionItemBean>();
}


class CoinDetailsPage extends StatefulWidget {
  // final CoinDetailsPageType type;
  // final TransactionRecordViewModel viewModel;
  // CoinDetailsPage(this.type, this.viewModel);
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<CoinDetailsPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
  
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var data = [];
    return Container(
      
      child: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        onRefresh: () async {
          print("下拉刷新ing");
          Timer.periodic(Duration(seconds: 3), (_) {
            // datas.insert(0, TransactionItemBean());
            _refreshController.refreshCompleted();
          });
        },
        onLoading: () async {
          print("加载更多ing");
          Timer.periodic(Duration(seconds: 3), (_) {
            _refreshController.loadComplete();
          });
        },
        
        child: buildItems(data),
      ).padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * 2)),
    );
  }


  Widget buildItems(List datas) {
    return ListView.builder(
      itemBuilder: (context, index) {
        // var item = datas[index];
        return createCell();
      },
      itemCount: 5,
    );
  }


  Widget createCell(){
    double width = MediaQuery.of(context).size.width;
    return  Container(
          height: 145,

          child: Stack(children: <Widget>[
        Image.asset(
          ImageHelper.wrapAssets('input_large_bg.png'),
          fit: BoxFit.fill,
          width: width - 30,
          height: 135,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),
        Text('来源地址',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 14,
                    color: ThemeColors.labelLightColor))
            .padding(EdgeInsets.only(top: 25, left: 35, right: 30)),

                Text('数量',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 14,
                    color: ThemeColors.labelLightColor))
            .padding(EdgeInsets.only(top: 55, left: 35, right: 35)),

                    Text('状态',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 14,
                    color: ThemeColors.labelLightColor))
            .padding(EdgeInsets.only(top: 85, left: 35, right: 35)),

        Container(
          alignment: Alignment.topRight,

          padding:EdgeInsets.only(top: 25, left: width/2,right: 35),
                  child:            Text('0x1chvdjhwhdugqwbdkajsgdiqbdlqfqd',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 14,
                  ))
            
        ),
       
          Container(
          alignment: Alignment.topRight,
          // width: width/2,
          padding:EdgeInsets.only(top: 55, right: 35),
                  child:            Text('1000',
                  maxLines: 1,
                  
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 14,
                  ))
            
        ),

                Container(
          alignment: Alignment.topRight,
      
          padding:EdgeInsets.only(top: 85, right: 35),
                  child:            Text('成功',
                  maxLines: 1,
                  
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 14,
                  ))
            
        ),

  Container(
          alignment: Alignment.bottomRight,
          // width: width/2,
          padding:EdgeInsets.only(bottom: 10, right: 35),
                  child:            Text(
          '2020.07.19 12:12',
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14, color: ThemeColors.labelLightColor),
        )
            
        ),
     

        ]));


  }
}
