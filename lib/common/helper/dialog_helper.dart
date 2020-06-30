import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

class DialogHelper {
  static showLoginDialog(context) async {
    return await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(S.of(context).appName),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    S.of(context).actionCancel,
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(S.of(context).actionConfirm),
                ),
              ],
            ));
  }

  static showCommonDialog({
    BuildContext context,
    String title,
    String content,
    Widget contentWidget,
    List<String> actions,
    Widget action,
  }) {
    var dialog = SimpleDialog(
      backgroundColor: Colors.transparent,
      title: title == null ? null : Text(title),
      children: <Widget>[
        BackdropFilter(
            //背景滤镜器
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    ImageHelper.wrapAssets('dialog_bg.png'),
                  ),
                  fit: BoxFit.fill,
                )),
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 29, top: 43, right: 29, bottom: 30),
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "这样子的吗",
                      style: TextStyle(
                          fontSize: ThemeDimens.txtLarge,
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.accentDartFgColor),
                    ),
                  ),
                  Text("我是内容内容内容"),
                  Divider(
                    height: 1,
                  ),
                  FlatButton(
                    child: Text('取消'),
                    onPressed: () {
                      // Navigator.of(context).pop('cancel');
                    },
                  ),
                  FlatButton(
                    child: Text('确认'),
                    onPressed: () {
                      // Navigator.of(context).pop('ok');
                    },
                  ),
                ]))),
      ],
    );

    if (context != null) {
      showDialog(context: context, child: dialog);
    }
    return dialog;
  }
}
