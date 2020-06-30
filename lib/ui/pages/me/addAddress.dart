import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/adressCell.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/tabMeCell.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';

class AddAdress extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<AddAdress> {
  @override
  String titleLabel(BuildContext context) => S.of(context).AddressManagerTitle;

  var name;
  var address;
  var note;

  Widget buildBodyWidget(BuildContext context) {
    return Container(
      child: ListView(
        // shrinkWrap: true,
        
        children: <Widget>[
          CommonInput(
            title: S.of(context).AddressTitle,
            placeholder: S.of(context).AddressTitleInput,
            onChanged: (text) {name = text;},
          ),
          CommonInput(
            title: S.of(context).AddAddress,
            placeholder: S.of(context).AddAddressInput,
            onChanged: (text) {address = text;},
          ),
          CommonInput(
            title: S.of(context).AddressNote,
            placeholder: S.of(context).AddressNoteInput,
            onChanged: (text) {note = text;}
          ),

          
          Padding(
            padding: EdgeInsets.only(
              top:40,
                left: ThemeDimens.pageLRMargin,
                right: ThemeDimens.pageLRMargin,
                ),
          
                      child: CommonButton(
                      child: Text(S.of(context).walletRestore),
                      onPressed: () {
                        
                      },
                ),
                ),
        ],
      ),
    );
  }
}