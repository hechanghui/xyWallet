import 'package:flutter/material.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/ui/pages/home/vm/PowByAttractionTractionViewModel.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:intl/intl.dart' as intl;

class ItemPowerTractionReward extends StatelessWidget {
  final LinearReward data;
  const ItemPowerTractionReward(this.data);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Text(
              intl.DateFormat("yyyy.MM.dd").format(data.date),
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: ThemeColors.accentDartFgColor),
            ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.contentVerticalMargin))),
        Expanded(
            flex: 1,
            child: Text(
              "8233335",
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: ThemeColors.primaryFgColor),
              textDirection: TextDirection.rtl,
            )
                .padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.contentVerticalMargin))
                .border(Border(left: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid)))),
      ],
    ).border(Border(bottom: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid)));
  }
}
