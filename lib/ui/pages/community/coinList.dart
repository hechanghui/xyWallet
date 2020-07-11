import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/ui/pages/community/charge.dart';
import 'package:xy_wallet/ui/pages/community/widget/coinListCell.dart';


enum CoinType {
  Charge,
  WithDraw,
  ChooseCoin,
}

class CoinList extends BaseWidget {
  CoinList({Key key, this.coinType});
  final CoinType coinType;

  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<CoinList> {
  @override
  String titleLabel(BuildContext context) => S.of(context).ChooseCoin;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: CoinListCell(
          title: 'ERC20-USDT',
          imageName: 'usdt.png',
          onPressed: () {

            switch (widget.coinType) {
              case CoinType.Charge : 
                            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Charge(
                      chargeType: ChargeType.Community,
                    )));

                    
                break;
                            
              case CoinType.ChooseCoin : 
                            Navigator.of(context).pop();
                    eventBus.fire(CoinChangeEvent('ETH'));
                    
                break;
              
              case CoinType.WithDraw :
                Navigator.pushNamed(context, RouteName.WithDraw);   
                    
                break;
                
              default:
            }


          },
        ));
      },
    ));
  }
}

