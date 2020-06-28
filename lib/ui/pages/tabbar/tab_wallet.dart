import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:xy_wallet/service/httpService/http_server.dart';
import 'package:xy_wallet/service/httpService/result_data.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:xy_wallet/manager/progressManager/toast.dart';



class TabWallet extends BaseWidget {



  BaseWidgetState<BaseWidget> getState() => new Page();
  @override
  // State<StatefulWidget> createState() => new Page();
}

class Page extends BaseWidgetState<TabWallet> {


  @override // override是重写父类中的函数
  void initState()  {
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
      body: ProgressHud(
        child:Center(
          child: Builder(builder: (context){
            return new RaisedButton(

                onPressed: (){
                print('11111');
                //网络请求例子
              // httpTest test= new httpTest();
              // test.Request();

                // example ex = new example();
                // ex.showSuccessHud(context);
                  ToastUtils toast = ToastUtils();
                  toast.showToastCenter('212123');
                }
            );
          
          }),
        ) 
      ),
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
