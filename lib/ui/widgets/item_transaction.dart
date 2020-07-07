import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/model/response_beans.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';

class TransactionItem extends StatelessWidget {
  final TransactionItemBean data;
  final int index;
  final GestureTapCallback onTap;

  TransactionItem(
    this.data, {
    this.index,
    this.onTap,
  }) : super(key: ValueKey(data.id));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: onTap ??
              () {
                Navigator.of(context)
                    .pushNamed(RouteName.TRANSACTION_DETAILS, arguments: data);
              },
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 16, 20, 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                ImageHelper.wrapAssets('addressCellBg.png'),
              ),
              fit: BoxFit.fill,
            )),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("232323232",
                            style:
                                Theme.of(context).textTheme.headline4.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                        Text("sdsds",
                                style: ThemeStyles.getSubtitle1lLight(context))
                            .padding(EdgeInsets.only(top: 5)),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: FractionalOffset.centerRight,
                      child: Text("${data.out ? "-" : "+"}84.9",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontWeight: FontWeight.bold,
                                color: data.out
                                    ? ThemeColors.red
                                    : ThemeColors.green,
                              )),
                    )),
              ],
            ),
          )),
    );
  }
}
