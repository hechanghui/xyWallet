import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';

class KOLCommunityInfo extends BaseWidget {
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<KOLCommunityInfo> {
  String titleLabel(BuildContext context) => S.of(context).tabComTitle3;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        Text(
          'X大联盟',
          style: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff00FF99)),
        ).padding(EdgeInsets.only(top: 20, left: 30, right: 30)),
        Text(
          '社区长：AAAAA',
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 14,
              ),
        ).padding(EdgeInsets.only(top: 10, left: 30, right: 30)),
        Text(
          '地址：0x123124312412312',
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 14,
              ),
        ).padding(EdgeInsets.only(top: 5, left: 30, right: 30)),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 40),
            child: Container(
              alignment: Alignment.center,
              width: 70,
              height: 32,
              child: Text(
                S.of(context).vote,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 14, color: Color(0xff00FF99)),
              ),
            ).backImage(image: 'voteBg.png').click(onTap: () {})),
        Container(
            padding: EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Text('排名:100'),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text('已获票数:231'),
                        flex: 1,
                      ),
                    ]).padding(EdgeInsets.only(left: 15, right: 50)))
                .backImage(image: 'tabMeCellBg.png')
                .click(onTap: () {

                })),

        Text(
          '社区介绍：',
          style: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff3FA0B3)),
        ).padding(EdgeInsets.only(top: 20, left: 30, right: 40)),
        

        Text(
          '我来参选，很牛逼X健康的还是卡很久的接口，请支持我，加入社区一起吃肉\n联系方式：1111111\n微信：哈哈哈哈哈',
          style: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 14,
              
              color: Color(0xff3FA0B3)),
        ).padding(EdgeInsets.only(top: 15, left: 30, right: 40)),
      ]),
    );
  }
}
