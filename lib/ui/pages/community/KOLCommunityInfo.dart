import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';

import 'KOLEditor.dart';

enum KOLCommunityInfoType {
  Other,
  Own,
}

class KOLCommunityInfo extends BaseWidget {
  final KOLCommunityInfoType type; //换viewModel
  KOLCommunityInfo(this.type);
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<KOLCommunityInfo> {
  String titleLabel(BuildContext context) => S.of(context).tabComTitle3;
  


  List<Widget> buildAppBarAction(BuildContext context) {
    if(widget.type == KOLCommunityInfoType.Other){
      return null;
    }
    return <Widget>[
      Container(
        padding: EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        child: Text(S.current.applyDel,
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 15,
                  
                )),
      ).click(onTap: () {
        Navigator.of(context).pushNamed(RouteName.KOLEditor,arguments:KOLEditorType.Delet);
      }),
    ];
  }


  var otherHead = Column(children:<Widget>[
        Container(
        alignment: Alignment.centerLeft,
        padding:EdgeInsets.only(top: 20, left: 30, right: 30),
         child: Text(
          'X大联盟',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff00FF99)),
        )),
        Container(
          alignment: Alignment.centerLeft,
          padding:EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Text(
          '社区长：AAAAAAA',
          textAlign: TextAlign.left,
          style: TextStyle(
                fontSize: 14,
              ),
        ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding:EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Text(
          '地址：0x123124312',
          textAlign: TextAlign.left,
          style: TextStyle(
                fontSize: 14,
              ),
        ),
        )

        ]);

        var owmHead = Column( children:<Widget>[       
           Container(
        alignment: Alignment.centerLeft,
        padding:EdgeInsets.only(top: 20, left: 30, right: 30),
         child: Text(
          'X大联盟',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff00FF99)),
        )),
        Container(
          alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top:10,left: 20),
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
            '待激活',
            style: TextStyle(fontSize: 14, ),
              ),
              ),
           ])),


          CommonInputMinor(
                  placeholder: S.current.AddAddressInput,
                  controller: TextEditingController(text:'0xdac17f958d2ee523a2206206994597c1'),
                  right: Text(S.current.Copy,style: TextStyle(color:Color(0xff00FF99)),)
                      .click(onTap: () {
                    
                  }),
                ).padding(EdgeInsets.only(top:10,left:15,right:15)),
        ]);

  

  @override
  Widget buildBodyWidget(BuildContext context) {
    Widget head = widget.type == KOLCommunityInfoType.Other ? otherHead : owmHead;
    var btTitle = widget.type == KOLCommunityInfoType.Other ? S.of(context).vote : S.of(context).editor;
    return Container(
      child: ListView(children: <Widget>[
        Container(alignment:Alignment.topLeft,
        // color: Colors.red,
          child: head,
        ),
        
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30),
            child: Container(
              alignment: Alignment.center,
              width: 70,
              height: 32,
              child: Text(
                btTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 14, color: Color(0xff00FF99)),
              ),
            ).backImage(image: 'voteBg.png').click(onTap: () {
              switch (widget.type) {
                case KOLCommunityInfoType.Other:
                  Navigator.of(context).pushNamed(RouteName.KOLVote);

                  break;
                case KOLCommunityInfoType.Own:
                  Navigator.of(context).pushNamed(RouteName.KOLEditor,arguments:KOLEditorType.Change);
                  break;
                default:
              }

            })),
        Container(
            padding: EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Text('排名:100'),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text('已获票数:231'),
                        flex: 1,
                      ),
                    ]).padding(EdgeInsets.only(left: 15, right: 50)))
                .backImage(image: 'tabMeCellBg.png')
                .click(onTap: () {

                })),

        Text(
          '社区介绍：',
          style: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff3FA0B3)),
        ).padding(EdgeInsets.only(top: 20, left: 30, right: 40)),
        

        Text(
          '我来参选，很牛逼X健康的还是卡很久的接口，请支持我，加入社区一起吃肉\n联系方式：1111111\n微信：哈哈哈哈哈',
          style: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 14,
              
              color: Color(0xff3FA0B3)),
        ).padding(EdgeInsets.only(top: 15, left: 30, right: 40)),
      ]),
    );
  }
}
