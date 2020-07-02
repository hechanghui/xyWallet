import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/me/addAddress.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/adressCell.dart';
import 'package:xy_wallet/ui/pages/wallet/restore_by_mnemonic.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class AdressManger extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<AdressManger> {

@override
  String titleLabel(BuildContext context) => S.of(context).AddressManagerTitle;
@override
  List<Widget> buildAppBarAction(BuildContext context) {
    return <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAdress()));
          }),
        ];
  }
  @override
  final List datas = [
    {'name': 'hello', 'address': '0xdasdasd', 'note': 'dasdasdqdsa'},
    {'name': 'hello1', 'address': '0xdasd321asd', 'note': 'dasdsa'},
    {'name': 'hello2', 'address': '0xdasddasdasd', 'note': 'dsa'},
  ];

  Widget buildBodyWidget(BuildContext context) {


    return Container(
      child: ListView.builder(
          itemCount: 3,
          //  itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            //  var dic = datas[index],
            return Container(
                child: AddressCell(
              title: datas[index]['name'],
              address: datas[index]['address'],
              note: datas[index]['note'],

              onPressedQRCode: () {
                
                var qrcode =  Container(
                alignment: Alignment.center,
                height: 180,
                child: Stack(children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      width: 130,
                      height: 130,
                      child: Stack(children: <Widget>[
                        Image.asset(
                          ImageHelper.wrapAssets('qrcodeBG.png'),
                          fit: BoxFit.fill,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 130,
                          height: 130,
                          child: QrImage(
                            padding: EdgeInsets.all(3),
                            data: datas[index]['address'],
                            version: QrVersions.auto,
                            size: 110.0,
                            backgroundColor: Colors.white,
                          ),
                        )
                      ])),
                ]));

                DialogHelper.showCommonDialog(
                          context: context,
                          contentWidget:qrcode,
                          );
                
              },
              
              onPressedChange: () {
                
                var name;
                var note;

                var wight = Column(
                  
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top:15,left:15),
                      alignment: Alignment.topLeft,
                      child: Text(S.of(context).AddressTitle,)
                    ),
                    // Text('名称').padding(padding),
                    CommonInputMinor(placeholder:S.of(context).AddressTitleInput,onChanged: (text){name = text;},),

                                        Container(
                      padding: EdgeInsets.only(top:15,left:15),
                      alignment: Alignment.topLeft,
                      child: Text(S.of(context).AddressNoteInput,)
                    ),
                    CommonInputMinor(placeholder:S.of(context).AddressNoteInput,onChanged: (text){note = text;},),
                  ],
                );
                

              
                DialogHelper.showCommonDialog(
                  context: context,
                  contentWidget: wight,
                  actions: [Tuple3(S.of(context).comfirm,(){
                    
                  }, null), ]
                );

              },



              onPressedCopy: () {
                Clipboard.setData(ClipboardData(text: datas[index]['address'] ?? ""));
                showToast(S.of(context).CopySuccess);
              },
              onPressedDel: () {

                  

                   DialogHelper.showCommonDialog(
                          context: context,
                          content: '确认删除该地址',
                          contentTextStyle: Theme.of(context).textTheme.headline4,
                          alignment: Alignment.center,
                          actions: [
                            Tuple3(S.of(context).cannel,null, null),
                             Tuple3(S.of(context).comfirm,(){}, null),
                          ]
                        );
                    
              },
            ));
          }),
    );
  }
}
