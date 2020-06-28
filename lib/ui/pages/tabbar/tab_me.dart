import 'package:xy_wallet/common/Base/base_inner_widget.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/ui/pages/tabbar/tab_wallet.dart';



class TabMe extends BaseWidget {

  @override
  getState() {
    return new Pages();
  }
}


class Pages extends BaseWidgetState<TabMe> {

  // @override
  //  Widget build(BuildContext context) {
  //   return buildBaseWidget(context);
  // }
  // @override

  @override
  Widget getBaseView(BuildContext context) {
    
    return super.getBaseView(context);
  }

  @override
  Widget buildBaseWidget(BuildContext context) {
   
   return Row(
     children: <Widget>[
       RaisedButton(onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TabMe()));
              // showToastDialog
       })
     ],
   );
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
    String classname = getClassName();
    print('${classname}创建');
  }

  @override
  void onPause() {
    // TODO: implement onPause
    String classname = getClassName();
    print('${classname}onPause');
  }

  @override
  void onResume() {
    // TODO: implement onResume
    String classname = getClassName();
    print('${classname}onResume');
  }
}
