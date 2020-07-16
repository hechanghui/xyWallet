
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';


class Setting extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseWidgetState<Setting> {

  String titleLabel(BuildContext context) => S.of(context).Setting;
 

  @override
  Widget buildBodyWidget(BuildContext context) {
    
    return  Container(
      child: ListView(children:<Widget>[
        
  


      ]),

    );

  }
}
