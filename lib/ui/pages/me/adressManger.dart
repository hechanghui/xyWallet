import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/model/addressModel.dart';
import 'package:xy_wallet/tool/Sp_utils.dart';
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
      IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddAdress()));
          }),
    ];
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    var datas = SpUtils.getObjectList('address');
    // print(datas);
    return Container(
      child: ListView.builder(
          itemCount: datas == null ? 0 : datas.length,
          //  itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            var addressModel = AddressModel.fromJson(datas[index]);
            print(addressModel);
            return Container(
                child: AddressCell(
              title: addressModel.name,
              address: addressModel.address,
              note: addressModel.note ?? '',
              onPressedQRCode: () {
                var qrcode = Container(
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
                                data: addressModel.address,
                                version: QrVersions.auto,
                                size: 110.0,
                                backgroundColor: Colors.white,
                              ),
                            )
                          ])),
                    ]));

                DialogHelper.showCommonDialog(
                  context: context,
                  contentWidget: qrcode,
                );
              },
              onPressedChange: () {
                var name =  addressModel.name;
                var note =  addressModel.note;

                var wight = Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          S.of(context).AddressTitle,
                        )),
  
                    CommonInputMinor(
                      placeholder: S.of(context).AddressTitleInput,
                      controller:
                          TextEditingController(text: addressModel.name),
                      onChanged: (text) {
                        name = text;
                      },
                    ),

                    Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          S.of(context).AddressNoteInput,
                        )),
                    CommonInputMinor(
                      placeholder: S.of(context).AddressNoteInput,
                      controller:
                          TextEditingController(text: addressModel.note),
                      onChanged: (text) {
                        note = text;
                      },
                    ),
                  ],
                );

                DialogHelper.showCommonDialog(
                    context: context,
                    contentWidget: wight,
                    actions: [
                      Tuple3(S.of(context).comfirm,(){

                        if (name == null || name.isEmpty) {
                          showToast(S.of(context).AddressTitleInput);
                          return false;
                        }

                        var model = AddressModel(
                            name: name,
                            address: addressModel.address,
                            note: note);
                        datas.removeAt(index);
                        datas.insert(index, model.toJson());
                        SpUtils.putObjectList('address', datas);
                        setState(() {});
                      }, null),
                    ]);
              },
              onPressedCopy: () {
                Clipboard.setData(
                    ClipboardData(text: datas[index]['address'] ?? ""));
                showToast(S.of(context).CopySuccess);
              },
              onPressedDel: () {
                DialogHelper.showCommonDialog(
                    context: context,
                    content: '确认删除该地址',
                    contentTextStyle: Theme.of(context).textTheme.headline4,
                    alignment: Alignment.center,
                    actions: [
                      Tuple3(S.of(context).cannel, null, null),
                      Tuple3(S.of(context).comfirm, () {
                        setState(() {
                          datas.removeAt(index);
                          print(datas);
                          SpUtils.putObjectList('address', datas);
                        });
                      
                      }, null),
                    ]);
              },
            ));
          }),
    );
  }
}
