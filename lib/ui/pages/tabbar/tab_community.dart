import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'tab_me.dart';
class TabCommunity extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}


class Pages extends BaseWidgetState<TabCommunity> {

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TabMe()));
        })
      ],
    );
  }
}