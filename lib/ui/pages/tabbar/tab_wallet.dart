import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/service/httpService/http_server.dart';
import 'package:xy_wallet/service/httpService/result_data.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/ui/widgets/tabWallet_button.dart';
import 'package:xy_wallet/manager/progressManager/toast.dart';

import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/base/base_page.dart';
import 'package:xy_wallet/ui/widgets/tabWallet_cell.dart';

class TabWallet extends BaseWidget {
  @override
  BaseWidgetState getState() => Page();
}

class Page extends BaseWidgetState<TabWallet> {

  @override
  List<Widget> buildAppBarAction(BuildContext context) {
    return <Widget>[
          IconButton(icon: Image.asset(ImageHelper.wrapAssets('icon_QR.png')),
           onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdressManger()));
          }),
                    IconButton(icon: Image.asset(ImageHelper.wrapAssets('icon_tip.png')),
           onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdressManger()));
          }),
        ];
  }
  
  @override
  Widget buildBodyWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      child:ListView(
        children: <Widget>[
            Container(
              // color: Colors.blue,
              width: width,
              height: 204,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    ImageHelper.wrapAssets('assetBG.png'),
                    fit: BoxFit.fill,
                    width: width,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      '10000',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Color(0xFF00FFAA),
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      '可用余额',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          new TextStyle(color: Color(0xFF00FFAA), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                // color: Colors.green,
                margin: EdgeInsets.only(top: 5),
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        print('12131231231');
                      },
                      child: TabWalletBt(
                        title: (S.of(context).transfer),
                        imageName: 'tabWalletBt1.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('12131231231');
                      },
                      child: TabWalletBt(
                        title: (S.of(context).receipt),
                        imageName: 'tabWalletBt2.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('12131231231');
                      },
                      child: TabWalletBt(
                        title: (S.of(context).transferRecord),
                        imageName: 'tabWalletBt3.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('12131231231');
                      },
                      child: TabWalletBt(
                        title: (S.of(context).codeX1),
                        imageName: 'tabWalletBt4.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('12131231231');
                      },
                      child: TabWalletBt(
                        title: (S.of(context).codeX2),
                        imageName: 'tabWalletBt5.png',
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(15),
              height: 100,
              child: InkWell(
                onTap: () {
                  print('banner');
                },
                child: Image.asset(
                  ImageHelper.wrapAssets('banner.png'),
                  fit: BoxFit.fill,
                  width: width,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 280,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      print('引力');
                    },
                    child: TabWalletCell(
                      title: (S.of(context).PowByAttraction),
                      imageName: 'tabWalletCell1.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('动力');
                    },
                    child: TabWalletCell(
                      title: (S.of(context).PowByAttraction),
                      imageName: 'tabWalletCell2.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('动力');
                    },
                    child: TabWalletCell(
                      title: (S.of(context).PowBySplit),
                      imageName: 'tabWalletCell3.png',
                    ),
                  ),
                ],
              ),
            )
          ],
      ),
      //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向

      
    );
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
