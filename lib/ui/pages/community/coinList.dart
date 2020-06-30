import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/community/widget/AssetManagerHeadBt.dart';
import 'package:xy_wallet/ui/pages/community/widget/coinListCell.dart';


 enum CoinType {
    Charge,   
    WithDraw, 
  }

class coinList extends BaseWidget {

  coinList({Key key, this.coinType});
  final CoinType coinType;
  

  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<coinList> {
  @override
  String titleLabel(BuildContext context) => S.of(context).ChooseCoin;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Container(
      color: Colors.black12,
      // height: (MediaQuery.of(context).size.height),
      child: ListView(children: <Widget>[
        
        TabComCell(
          title: 'ERC20-USDT',
          onPressed: () {
            
          },
        ),
        TabComCell(
          title: 'ERC20-USDT',
          onPressed: () {},
        ),
        TabComCell(
          title: 'ERC20-USDT',
          onPressed: () {},
        ),
        TabComCell(
          title: 'ERC20-USDT',
          onPressed: () {},
        ),
        TabComCell(
          title: 'ERC20-USDT',
          onPressed: () {},
        ),
        TabComCell(
          title: 'ERC20-USDT',
          onPressed: () {},
        ),
      ]),
    );
  }
}
