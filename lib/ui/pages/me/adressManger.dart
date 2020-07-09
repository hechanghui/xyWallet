import 'dart:io';

import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
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
import 'package:xy_wallet/common/base/view_model/base_load_data_vm.dart';

class AdressManger extends BaseWidget {
  @override
  getState() {
    
    return new Pages();
  }
}

class Pages
    extends BaseLoadDataWidgetState<AdressManger, AdressMangerViewModel> {
  @override
  String titleLabel(BuildContext context) => S.of(context).AddressManagerTitle;
  @override
  bool get enmptEnableReload => false;

  @override
  onCreateViewModel() => AdressMangerViewModel();

  @override
  List<Widget> buildAppBarAction(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.add),
          onPressed: () async {
            final result = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddAdress()));
            if (result != null) {
              viewModel.addItem(result);
            }
          }),
    ];
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    // print(datas);
    return Container(
      child: ListView.builder(
          itemCount: viewModel.datas.length,
          //  itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            var addressModel = AddressModel.fromJson(viewModel.datas[index]);
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
                var name = addressModel.name;
                var note = addressModel.note;

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
                      Tuple3(S.of(context).comfirm, () {
                        if (name == null || name.isEmpty) {
                          showToast(S.of(context).AddressTitleInput);
                          return false;
                        }
                        final model = AddressModel(
                            name: name,
                            address: addressModel.address,
                            note: note);
                        viewModel.updateItem(index, model.toJson());
                      }, null),
                    ]);
              },
              onPressedCopy: () {
                Clipboard.setData(ClipboardData(
                    text: viewModel.datas[index]['address'] ?? ""));
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
                        viewModel.removeItem(index);
                      }, null),
                    ]);
              },
            ));
          }),
    );
  }
}

class AdressMangerViewModel extends BaseLoadDataViewModel {
  // PackageInfo packageInfo;
  List<Map> datas = List();
  @override
  loadData() {
    datas.addAll(SpUtils.getObjectList('address'));
    _handlerState();
  }

  removeItem(int index) {
    datas.removeAt(index);
    _handlerState();
  }

  addItem(Map item) {
    datas.add(item);
    _handlerState();
  }

  updateItem(int index, Map item) {
    datas[index] = item;
    notifyListeners();
  }

  _handlerState() {
    if (datas?.isNotEmpty == false) {
      setEmpty();
    } else {
      setIdle();
    }
    // notifyListeners();
  }

  @override
  void dispose() {
    SpUtils.putObjectList('address', datas);
    super.dispose();
  }
}
