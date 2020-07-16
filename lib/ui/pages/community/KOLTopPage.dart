import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'vm/KOLTopVM.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class KOLTopPage extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseLoadRefreshDataWidgetState<KOLTopPage, KOLTopViewModel> {
  @override
  String titleLabel(BuildContext context) => S.current.titleKOLTop;
  @override
  onCreateViewModel() => KOLTopViewModel();
  @override
  Widget buildBodyWidget(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              '100000.00',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: new TextStyle(color: Color(0xFF00FFAA), fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Text(
              '${S.current.seasonBonusTotal}(USDT)',
              style: ThemeStyles.getSubtitle1lLight(context),
            ),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin * 3.4, vertical: 60)).backImage(image: 'assetBG.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _generateSeasonState().padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * .4, bottom: ThemeDimens.pageVerticalMargin * 3)),
            Text(
              S.current.seasonTop10,
              maxLines: 1,
            ),
            // AsperctRaioImage.asset(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: ThemeDimens.pageVerticalMargin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          S.current.rank,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          S.current.labelCommunity,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          S.current.votes,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '${S.current.reward}(USDT)',
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  )
                      .padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.pageVerticalMargin))
                      .bg(color: ThemeColors.accentDartColor.withAlpha(100))
                      .padding(EdgeInsets.all(5)),
                  _generateRankList(),
                ],
              ).backImage(),
            ),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin)),
        Text(
          S.current.refreshDataPerHour,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: ThemeStyles.getSubtitle1lLight(context),
        ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin, vertical: ThemeDimens.pageVerticalMargin * 1.2)),
      ],
    ));
  }

//根据当前状态构建不同widget
  Widget _generateSeasonState() {
    // return Text(
    //   '本赛季已结束',
    //   style: ThemeStyles.getSubtitle1lLight(context),
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '距离本赛季结束剩',
          style: ThemeStyles.getSubtitle1lLight(context),
        ),
        //倒计时
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "120",
            style: Theme.of(context).textTheme.headline3.copyWith(color: ThemeColors.primaryFgColor, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "小时",
            style: ThemeStyles.getSubtitle1lLight(context),
          ),
          TextSpan(
            text: "29",
            style: Theme.of(context).textTheme.headline3.copyWith(color: ThemeColors.primaryFgColor, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "分",
            style: ThemeStyles.getSubtitle1lLight(context),
          ),
          TextSpan(
            text: "10",
            style: Theme.of(context).textTheme.headline3.copyWith(color: ThemeColors.primaryFgColor, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "秒",
            style: ThemeStyles.getSubtitle1lLight(context),
          ),
        ]))
      ],
    );
  }

  Widget _generateRankList() {
    return (viewModel.data.datas?.length ?? 0) > 0
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = viewModel.data.datas[index];
              return ItemKOLTopRank();
            },
            itemCount: viewModel.data.datas.length,
          )
        : buildEmptyWidget(context, false);
  }
}

class ItemKOLTopRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            "1",
            style: Theme.of(context).textTheme.bodyText2.copyWith(color: ThemeColors.primaryFgColor),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: <Widget>[
              SizedBox(
                  width: 28,
                  height: 28,
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        "${ImageHelper.randomUrl()}?date=${DateTime.now().toIso8601String()}",
                      ),
                    ),
                    backgroundImage: AssetImage(ImageHelper.wrapAssets("KolIcon.png")),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "跟着a辉有肉吃",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(height: 1),
                  ),
                  Text(
                    "你在想屁吃",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeStyles.getSubtitle2lLight(context),
                  ),
                ],
              ).padding(EdgeInsets.only(left: ThemeDimens.pageVerticalMargin)).expand(),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            "10000",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyText2.copyWith(color: ThemeColors.primaryFgColor),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "10000",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    )
        .padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin * 1.25, vertical: ThemeDimens.pageVerticalMargin * 1.4))
        .border(Border(bottom: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid)));
  }
}
