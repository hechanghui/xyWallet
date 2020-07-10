import 'package:flutter/material.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class TransactionDetailsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.only(left: ThemeDimens.pageLRMargin, right: ThemeDimens.pageLRMargin, top: ThemeDimens.pageVerticalMargin * 1.5, bottom: ThemeDimens.pageBottomMargin),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 66,
                  width: 66,
                  decoration: buidDecoration(true),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: ThemeDimens.pageVerticalMargin * 3),
                  height: 22,
                  width: 60,
                  decoration: buidDecoration(),
                ),

                Container(
                  height: 22,
                  width: 90,
                  decoration: buidDecoration(),
                ),

                Column(
                  children: buildLabelAndContent(),
                ).padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * 4, bottom: ThemeDimens.pageVerticalMargin)),

              ],
            ),
            SizedBox(
                height: height,
                child: Align(
                  alignment: Alignment(0,0.65),
                  child: Container(
                    height: 46,
                    decoration: buidDecoration(),
                  ),
                ))
          ],
        ));
  }

  Decoration buidDecoration([bool isCircle = false]) {
    return BoxDecoration(
      color: Colors.grey[350],
      shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
    );
  }

  buildLabelAndContent() {
    var labelsLength = 7;

    var widgets = List<Widget>();
    for (var i = 0; i < labelsLength; i++) {
      widgets.add(Flex(direction: Axis.horizontal, mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              height: 22,
              decoration: buidDecoration(),
            )),
        Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 30),
              height: 22,
              decoration: buidDecoration(),
            )),
      ]).padding(EdgeInsets.only(bottom: ThemeDimens.pageVerticalMargin * 1.2, top: ThemeDimens.pageVerticalMargin * 3.6)).border(Border(bottom: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid))));
    }

    return widgets;
  }
}
