import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/ui/widgets/common_slider.dart';

class KOLVoteRecord extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<KOLVoteRecord> {
  
  @override
  String titleLabel(BuildContext context) => S.current.vote;
  var headWidget = Container(
    // margin: EdgeInsets.only(left:12),
    color:Color(0xFF082E41),
    height: 44,
    child:Container(
      margin: EdgeInsets.only(left:12),
      child: Row(children:<Widget>[
        Expanded(
                      child: Text(S.current.voteAddress),
                        flex: 10,
                      ),
                      Expanded(
                        child: Text(S.current.voteDate),
                        flex: 10,
                      ),
                      Expanded(
                        child: Text(S.current.voteNum),
                        flex: 3,
                      ),
    ])),
  );
  @override
  Widget buildBodyWidget(BuildContext context) {
    return Container(
      child: Stack(children:<Widget>[
        headWidget,

        Container(
        padding: EdgeInsets.only(top:44),
        child: ListView.builder(      
          itemCount: 13,
          itemBuilder: (BuildContext context, int index) {

            return cell('0x1123asdwqdqdsadqwdsadwq','2020.07.16','1');

          }))
      ])
    );
  }


  Widget cell(String address,String date,String nums){
    
    return Container(
    // margin: EdgeInsets.only(left:12),
    // color: Color(0xFF3F7591),
    height: 44,
    child:Container(
      // margin: EdgeInsets.only(left:12),
      // color: Colors.blue,
    child: Row(children:<Widget>[
      Expanded(
                        child: Container(
                          height: 44,
                          alignment: Alignment.centerLeft,
                          child:Text(address,maxLines: 1,overflow: TextOverflow.ellipsis,).padding(EdgeInsets.only(left:13)),
                        ),
                        flex: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 44,
                          alignment: Alignment.centerLeft,
                          child:Text(date).padding(EdgeInsets.only(left:13)),
                        ).border(Border(left: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid))),
                        
                        
                        flex: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 44,
                          alignment: Alignment.center,
                          child:Text(nums),
                        ).border(Border(left: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid))),
                        flex: 3,
                      ),
    ]).border(Border(bottom: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid)))));
  }
}