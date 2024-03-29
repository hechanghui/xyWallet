import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xy_wallet/service/httpService/http_server.dart';
import 'package:xy_wallet/service/httpService/result_data.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:xy_wallet/manager/progressManager/toast.dart';



import 'package:xy_wallet/ui/widgets/common_button.dart';

class TabWallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new Page();
}

class Page extends State<TabWallet> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override // override是重写父类中的函数
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  /// 通过Consumer的方式引用共享的token列表
  /// 当token列表中有余额变动后，首页自动更新
  Widget layout(BuildContext context) {

    return new Scaffold(
      appBar: buildAppBar(context),
      body: Center(
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
                  toast.showToastCenter('212123');
          }),
          CommonButton(child: Text("233333"))
        ],
      )),
    );
  }

  // 构建AppBar
  // 如何自定义icon来打开draw
  Widget buildAppBar(BuildContext context) {
    return new AppBar(
      title: Text(
        'home',
        style: new TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.lightBlue,
      elevation: 0.0,
    );
  }
}

//事例实现
class httpTest{
  void Request() async{
    var params = Map<String, dynamic>();
    params["otype"] = "json";

    ResultData res = await HttpManager.getInstance().get('checktime', params);
    print(res.data);
  }
}