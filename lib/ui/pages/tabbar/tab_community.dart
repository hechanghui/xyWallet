import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/community/AssetManger.dart';
import 'package:xy_wallet/ui/widgets/tabComCell.dart';


class TabCommunity extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<TabCommunity> {
    @override
  bool get hasBackground => false;
  @override
  Widget buildBodyWidget(BuildContext context) {
    return Container(
      // height: (MediaQuery.of(context).size.height),
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AssetManger()));

            },
            child: TabComCell(
              title: (S.of(context).tabComTitle1),
              subTitle: (S.of(context).tabComSubTitle1),
            ),
          ),
          InkWell(
            onTap: () {
              print(S.of(context).tabComTitle2);
            },
            child: TabComCell(
              title: (S.of(context).tabComTitle2),
              subTitle: (S.of(context).tabComSubTitle2),
            ),
          ),
          InkWell(
            onTap: () {
              print(S.of(context).tabComTitle3);
            },
            child: TabComCell(
              title: (S.of(context).tabComTitle3),
              subTitle: (S.of(context).tabComSubTitle3),
            ),
          ),
          InkWell(
            onTap: () {
              print(S.of(context).tabComTitle4);
            },
            child: TabComCell(
              title: (S.of(context).tabComTitle4),
              subTitle: (S.of(context).tabComSubTitle4),
            ),
          ),
          InkWell(
            onTap: () {
              print(S.of(context).tabComTitle5);
            },
            child: TabComCell(
              title: (S.of(context).tabComTitle5),
              subTitle: (S.of(context).tabComSubTitle5),
            ),
          ),
          InkWell(
            onTap: () {
              print(S.of(context).tabComTitle6);
            },
            child: TabComCell(
              title: (S.of(context).tabComTitle6),
              subTitle: (S.of(context).tabComSubTitle6),
            ),
          ),
          InkWell(
            onTap: () {
              print(S.of(context).tabComTitle7);
            },
            child: TabComCell(
              title: (S.of(context).tabComTitle7),
              subTitle: (S.of(context).tabComSubTitle7),
            ),
          ),
          InkWell(
            onTap: () {
              print(S.of(context).tabComTitle8);
            },
            child: TabComCell(
              title: (S.of(context).tabComTitle8),
              subTitle: (S.of(context).tabComSubTitle8),
            ),
          ),
          InkWell(
            onTap: () {
              print(S.of(context).tabComTitle9);
            },
            child: TabComCell(
              title: (S.of(context).tabComTitle9),
              subTitle: (S.of(context).tabComSubTitle9),
            ),
          ),
        ],
      ),
    );
  }
}
