import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/ui/pages/tabbar/tab_community.dart';

class TabMe extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<TabMe> {

  @override
  Widget getBaseView(BuildContext context) {
    return super.getBaseView(context);
  }

  @override
  Widget buildBaseWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TabCommunity()));
        })
      ],
    );
  }
}
