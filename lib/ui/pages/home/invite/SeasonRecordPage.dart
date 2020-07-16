import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/community/CoinSplitRank.dart';
import 'package:xy_wallet/ui/pages/home/invite/vm/SeasonRecorVM.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

enum SeasonRecordType {
  TOP,
  LUCKY,
}

// 赛季记录页面-top10、lucky30
class SeasonRecordPage extends BaseWidget {
  final SeasonRecordType type;
  SeasonRecordPage(this.type);

  @override
  getState() => _State();
}

class _State extends BaseLoadRefreshDataWidgetState<SeasonRecordPage, SeasonRecorViewModel> {
  @override
  String titleLabel(BuildContext context) => widget.type == SeasonRecordType.TOP ? S.current.seasonRecordTop : S.current.seasonRecordLucky;

  @override
  onCreateViewModel() => SeasonRecorViewModel(widget.type);

  @override
  Widget buildBodyWidget(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              '${S.current.seasonBonusTotal}(USDT)',
              style: ThemeStyles.getSubtitle1lLight(context),
            ),
            Text(
              '100000.00',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: new TextStyle(color: Color(0xFF00FFAA), fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: S.current.season,
                style: ThemeStyles.getSubtitle1lLight(context),
              ),
              TextSpan(
                text: "[No.9]",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ])),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin * 3.4, vertical: 60)).backImage(image: 'assetBG.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _generateSeasonState().padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * .4, bottom: ThemeDimens.pageVerticalMargin * 3)),
            Text(
              widget.type == SeasonRecordType.TOP ? S.current.seasonTop10 : S.current.seasonLucky30,
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
                        flex: 2,
                        child: Text(
                          widget.type == SeasonRecordType.TOP ? S.current.rank : S.current.ordinal,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          widget.type == SeasonRecordType.TOP ? "USDT${S.current.bonus}" : S.current.address,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          widget.type == SeasonRecordType.TOP ? S.current.newInvitedPower : S.current.seasonBonus,
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
              // .bg(
              //   // border: Border.fromBorderSide(BorderSide(color: ThemeColors.accentColor, width: 1, style: BorderStyle.solid)),
              //   // boxShadow: [
              //   //   const BoxShadow(
              //   //     color: ThemeColors.labelLightColor,
              //   //     blurRadius: 0.0,
              //   //     spreadRadius: 0,
              //   //   ),
              //   //   const BoxShadow(
              //   //     color: ThemeColors.buttonColor,
              //   //     offset: const Offset(0.0, 0.0),
              //   //     spreadRadius: -5.0,
              //   //     blurRadius: 12.0,
              //   //   ),
              //   // ],
              //   image: DecorationImage(
              //     centerSlice: Rect.fromLTRB(15.0, 15.0, 20.0, 20.0),
              //     image: AssetImage(ImageHelper.wrapAssets('container_bg.png')),
              //   ),
              // ),
            ),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin)),
      ],
    ));
  }

//根据当前状态构建不同widget
  Widget _generateSeasonState() {
    // return Text(
    //   S.current.seasonEnded,
    //   style: ThemeStyles.getSubtitle1lLight(context),
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.current.seasonUntilEnd, //S.current.seasonUntilStart,
          style: ThemeStyles.getSubtitle1lLight(context),
        ),
        //倒计时
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "120",
            style: Theme.of(context).textTheme.headline3.copyWith(color: ThemeColors.primaryFgColor, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: S.current.hours,
            style: ThemeStyles.getSubtitle1lLight(context),
          ),
          TextSpan(
            text: "29",
            style: Theme.of(context).textTheme.headline3.copyWith(color: ThemeColors.primaryFgColor, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: S.current.mins,
            style: ThemeStyles.getSubtitle1lLight(context),
          ),
          TextSpan(
            text: "10",
            style: Theme.of(context).textTheme.headline3.copyWith(color: ThemeColors.primaryFgColor, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: S.current.seconds,
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
              return widget.type == SeasonRecordType.TOP ? ItemCoinSplitRank() : ItemSeasonRecordLuckyRank();
            },
            itemCount: viewModel.data.datas.length,
          )
        : buildEmptyWidget(context, false);
  }
}

class ItemSeasonRecordLuckyRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
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
    ).padding(EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin * 1.25, vertical: ThemeDimens.pageVerticalMargin * 1.4));
  }
}
