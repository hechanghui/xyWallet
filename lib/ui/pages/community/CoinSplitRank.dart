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
  String titleLabel(BuildContext context) => S.of(context).tabComTitle2 + 'TOP10';
  @override
  onCreateViewModel() => CoinSplitRankViewModel();

  @override
  Widget buildBodyWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          '${S.current.splitStep}12',
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
                  '${S.current.bonusPoolTotal}（USDT）',
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
          S.current.splitTop10,
          maxLines: 1,
        ).padding(EdgeInsets.only(left: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageVerticalMargin * 1.2)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      S.current.rank,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "USDT${S.current.bonus}",
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      S.current.newInvitedPower,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              )
                  .padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.pageVerticalMargin))
                  .bg(color: ThemeColors.accentDartColor.withAlpha(100))
                  .padding(EdgeInsets.all(5)),
              // Column(
              //   children: _generateRankList(),
              // ),
              _generateRankList(),
            ],
          ).backImage(),
        ),
        Text(
          S.current.refreshDataPerHour,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: ThemeStyles.getSubtitle1lLight(context),
        ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.pageVerticalMargin * 1.2)),
      ],
    ));
  }

  Widget _generateRankList() {
    // List<Widget> widgets = [];
    // final dataWidgets = viewModel.data.datas?.map((e) => ItemCoinSplitRank())?.toList();
    // if (dataWidgets?.isNotEmpty == true) {
    //   widgets.addAll(dataWidgets);
    // } else {
    //   widgets.add(buildEmptyWidget(context));
    // }
    // return widgets;
    return (viewModel.data.datas?.length ?? 0) > 0
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = viewModel.data.datas[index];
              return ItemCoinSplitRank();
            },
            itemCount: viewModel.data.datas.length,
          )
        : buildEmptyWidget(context, false);
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
            "${S.current.address}: ",
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