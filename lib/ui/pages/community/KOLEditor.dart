import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';

enum KOLEditorType {
  Change,
  Delet,
}

class KOLEditor extends BaseWidget {
  final KOLEditorType type; //换viewModel
  KOLEditor(this.type);
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<KOLEditor> {
  
  String titleLabel(BuildContext context) {
    var title = widget.type == KOLEditorType.Change ? S.current.editorInfo : S.current.applyDel;
    return title;
  } 

  var controller = TextEditingController();
  
    var delFoot = Container(
          alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top:30,left: 20),
           child: Stack(children: <Widget>[
             Container(
               padding: EdgeInsets.only(left:10,top:4),
               child:  Image.asset(
                ImageHelper.wrapAssets('icon_tip.png'),
                width: 14,
                height: 14,
                fit: BoxFit.fill,
              ),
             ),
            Container(
              padding: EdgeInsets.only(left:30,right: 30),
            child: Text(
            S.current.KOLDelTip,
            style: TextStyle(fontSize: 14, color: ThemeColors.labelLightColor),
              ),
              ),
           ]));
        

  

  @override
  Widget buildBodyWidget(BuildContext context) {
    Widget foot = widget.type == KOLEditorType.Delet ? delFoot : Container();
    var btTitle = widget.type == KOLEditorType.Change ? S.current.submit : S.current.applyDel;
    var titles = widget.type == KOLEditorType.Change ? S.current.KOLInfo : S.current.applyDelReason;
    
    // var btTitle = widget.type == KOLCommunityInfoType.Other ? S.of(context).vote : S.of(context).editor;
    return Container(
      child: ListView(children: <Widget>[

          CommonInputLarge(
                  title: titles,
                  // placeholder: S.current.transferLabelTip,
                  controller:controller
                      // TextEditingController(text: S.current.transferLabelTip),
                ).padding(EdgeInsets.only(top:20,left:15,right:15)),
        foot,

        CommonButton(
              child: Text(btTitle),
              onPressed: () {
              }
        ).padding(EdgeInsets.only(top:80,left:15,right:15))

                
      ]),
    );
  }
}
