import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';

class RestoreByKeyStore extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<RestoreByKeyStore> {
  @override
  bool get hasAppBar => false;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return SingleChildScrollView(
      //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
      scrollDirection: Axis.vertical,
      //true 滑动到底部
      reverse: false,
      padding: EdgeInsets.all(0.0),
      ////滑动到底部回弹效果
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: <Widget>[
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
            ),
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
            ),
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
            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
