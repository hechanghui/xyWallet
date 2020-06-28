import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:xy_wallet/service/httpService/http_server.dart';
import 'package:xy_wallet/service/httpService/result_data.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:xy_wallet/manager/progressManager/toast.dart';

import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/base/base_page.dart';

class TabWallet extends BasePageStateful {
  @override
  BasePageStatefulState buildBasePageStatefulState() => Page();
}

class Page extends BasePageStatefulState {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    print("2333333");
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new RaisedButton(onPressed: () {
          print('11111');
          //网络请求例子
          // httpTest test= new httpTest();
          // test.Request();

          // example ex = new example();
          // ex.showSuccessHud(context);
          ToastUtils toast = ToastUtils();
          toast.showToastCenter('2121223');
        }),
        CommonButton(child: Text("233"))
      ],
    ));
  }
}

// class Page extends State<TabWallet> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   @override // override是重写父类中的函数
//   void initState() {
//     super.initState();
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return layout(context);
//   // }

//   // /// 通过Consumer的方式引用共享的token列表
//   // /// 当token列表中有余额变动后，首页自动更新
//   // Widget layout(BuildContext context) {
//   //   return Container(
//   //     decoration: BoxDecoration(
//   //         gradient: LinearGradient(
//   //       colors: [Color(0xFF122C50), Color(0xFF1B445A), Color(0xFF071834)],
//   //       begin: Alignment.topCenter,
//   //       end: Alignment.bottomCenter,
//   //     )),
//   //     child: Scaffold(
//   //         backgroundColor: Colors.transparent,
//   //         // backgroundColor: Colors.green,
//   //         appBar: buildAppBar(context),
//   //         body: Center(
//   //             child: Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: <Widget>[
//   //             new RaisedButton(onPressed: () {
//   //               print('11111');
//   //               //网络请求例子
//   //               // httpTest test= new httpTest();
//   //               // test.Request();

//   //               // example ex = new example();
//   //               // ex.showSuccessHud(context);
//   //               ToastUtils toast = ToastUtils();
//   //               toast.showToastCenter('212123');
//   //             }),
//   //             CommonButton(child: Text("233333"))
//   //           ],
//   //         ))),
//   //   );
//   // }

//   // // 构建AppBar
//   // // 如何自定义icon来打开draw
//   // Widget buildAppBar(BuildContext context) {
//   //   return new AppBar(
//   //     backgroundColor: Colors.transparent,
//   //     leading: Icon(
//   //       Icons.keyboard_arrow_left,
//   //       color: Colors.red,
//   //     ),
//   //     title: Text(
//   //       'home',
//   //       style: new TextStyle(color: Colors.white),
//   //     ),
//   //     // backgroundColor: Colors.lightBlue,
//   //     elevation: 0.0,
//   //   );
//   // }
// }

//事例实现
class httpTest {
  void Request() async {
    var params = Map<String, dynamic>();
    params["otype"] = "json";

    ResultData res = await HttpManager.getInstance().get('checktime', params);
    print(res.data);
  }
}
