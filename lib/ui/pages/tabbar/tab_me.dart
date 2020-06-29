import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/ui/pages/tabbar/tab_community.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';

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
    return Column(
      children: <Widget>[
        // RaisedButton(onPressed: () {
        //   Navigator.of(context)
        //       .push(MaterialPageRoute(builder: (context) => TabCommunity()));
        // }),
        CommonInput(
          placeholder: '1231231231',
          title: '测试测试',
        ),
        CommonInput(
          placeholder: '1231231231',
          title: '测试测试',
        ),
        CommonInput(
          placeholder: '1231231231',
          title: '测试测试',
          controller: TextEditingController(text: "初始化的"),
          onChanged: (text) {
            print("++++" + text);
          }
        ),

        // Text('12131231'),
        // Text('12131231'),
        // Text('12131231'),
      ],
    );
  }
}
