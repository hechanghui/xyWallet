import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';

import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';




class CoinSplitRank extends BaseWidget {
  @override
  BaseWidgetState getState() => Page();
}

class Page extends BaseWidgetState<CoinSplitRank> {

  String titleLabel(BuildContext context) => S.of(context).tabComTitle2+'top10';

  @override
  Widget buildBodyWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            width: width,
            height: 204,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  ImageHelper.wrapAssets('assetBG.png'),
                  fit: BoxFit.fill,
                  width: width,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    '10000.00',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Color(0xFF00FFAA),
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    '奖金池累积（USDT）',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style:
                        new TextStyle(color: Color(0xFF00FFAA), fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          


        ],
      )
     
    );
  }
}

