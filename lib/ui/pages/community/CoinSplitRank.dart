import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:xy_wallet/common/themes.dart';

import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/ui/pages/community/vm/CoinSplitRankVM.dart';

class CoinSplitRank extends BaseWidget {
  @override
  BaseWidgetState getState() => Page();
}

class Page extends BaseLoadRefreshDataWidgetState<CoinSplitRank, CoinSplitRankViewModel> {
  String titleLabel(BuildContext context) => S.of(context).tabComTitle2 + 'top10';
  @override
  onCreateViewModel() => CoinSplitRankViewModel();

  @override
  Widget buildBodyWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        child: ListView(
      children: <Widget>[
        Text(
          '已经分裂阶段12',
          textAlign: TextAlign.end,
          maxLines: 1,
        ).padding(EdgeInsets.only(right: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageVerticalMargin)),
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
                  style: new TextStyle(color: Color(0xFF00FFAA), fontWeight: FontWeight.bold, fontSize: 40),
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
                  style: new TextStyle(color: Color(0xFF00FFAA), fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Text(
          '分裂TOP10',
          maxLines: 1,
        ).padding(EdgeInsets.only(left: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageVerticalMargin * 1.2)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin),
          child: Column(
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      "排名",
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "USDT奖金",
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "新增邀请算力",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              )
                  .padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.pageVerticalMargin))
                  .bg(color: ThemeColors.accentDartColor.withAlpha(100))
                  .padding(EdgeInsets.all(5)),
              Column(
                children: _generateRankList(),
              ),
            ],
          ).backImage(),
        ),
        Text(
          '数据每小时更新一次',
          maxLines: 1,
          textAlign: TextAlign.center,
          style: ThemeStyles.getSubtitle1lLight(context),
        ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.pageVerticalMargin * 1.2)),
      ],
    ));
  }

  List<Widget> _generateRankList() {
    List<Widget> widgets = [];
    final dataWidgets = viewModel.data.datas?.map((e) => ItemCoinSplitRank())?.toList();
    if (dataWidgets?.isNotEmpty == true) {
      widgets.addAll(dataWidgets);
    } else {
      widgets.add(buildEmptyWidget(context));
    }
    return widgets;
  }
}

class ItemCoinSplitRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: SizedBox.shrink(),
      subtitle: null,
      backgroundColor: ThemeColors.accentDartColor.withOpacity(0.4),
      title: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              "1",
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "10000",
              style: Theme.of(context).textTheme.bodyText2.copyWith(color: ThemeColors.primaryFgColor),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "10000",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyText2.copyWith(color: ThemeColors.primaryFgColor),
            ),
          ),
        ],
      ),
      children: [
        Row(children: [
          Text(
            "地址: ",
          ),
          Text(
            "地址个锤子🔨",
            style: Theme.of(context).textTheme.bodyText2.copyWith(color: ThemeColors.primaryFgColor),
          ),
        ]).padding(EdgeInsets.only(left: ThemeDimens.pageLRMargin, right: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageVerticalMargin)),
      ],
    );
  }
}
