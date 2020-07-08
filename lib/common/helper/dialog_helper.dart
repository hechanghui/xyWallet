import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

typedef HideCallback =  Function();

class DialogHelper {
  static showCommonDialog({
    BuildContext context,
    String title,
    String content,
    TextStyle contentTextStyle,
    Widget contentWidget,
    Alignment alignment = Alignment.topLeft,
    List<Tuple3<String, HideCallback, TextStyle>> actions,
    Widget action,
  }) {
    if (action == null) {
      if (context != null && actions == null) {
        actions = [
          Tuple3(
              S.of(context).actionIKnow,
              null,
              Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: ThemeColors.primaryFgColor))
        ];
      }
      if (actions?.firstWhere((e) => e.item3 == null, orElse: () => null) !=
          null) {
        var actionsTmp = List<Tuple3<String, HideCallback, TextStyle>>();
        actions.forEach((element) {
          var textStyle = element.item3;
          if (textStyle == null) {
            textStyle = (context == null
                    ? TextStyle(
                        fontSize: ThemeDimens.headline4,
                      )
                    : Theme.of(context).textTheme.headline4)
                .copyWith(
                    color: actions.length == 1 ||
                            (actions.length == 2 &&
                                actions.indexOf(element) == 1) ||
                            (actions.length > 2 &&
                                actions.indexOf(element) == 0)
                        ? ThemeColors.primaryFgColor
                        : ThemeColors.labelLightColor);
          }
          actionsTmp.add(Tuple3(element.item1, element.item2, textStyle));
        });
        actions = actionsTmp;
      }
    }

    var actionButtons = actions
        ?.map((e) => FlatButton(
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              child: Text(
                e.item1,
                style: e.item3,
              ),
              onPressed: () async {
                if ((await e.item2?.call())!=false) {
                  if (context != null) {
                    Navigator.of(context).pop(actions.indexOf(e));
                  }
                }
              },
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ))
        .toList();
    var dialog = SimpleDialog(
      backgroundColor: Colors.transparent,
      title: null,
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
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Column(children: [
                      Container(
                        alignment: alignment,
                        child: title?.isNotEmpty == true
                            ? Text(
                                title,
                                style: TextStyle(
                                    fontSize: ThemeDimens.txtLarge,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColors.accentDartFgColor),
                              )
                            : null,
                      ),
                      Container(
                        alignment: alignment,
                        margin: EdgeInsets.only(
                            top: title?.isNotEmpty == true ? 22 : 0,
                            bottom: 22),
                        child: contentWidget ??
                            Text(
                              content ?? "",
                              style: contentTextStyle,
                            ),
                      ),
                      Image(
                        image: AssetImage(
                          ImageHelper.wrapAssets('dialog_divider.png'),
                        ),
                        fit: BoxFit.fill,
                      ),
                      action == null
                          ? actions.length > 2
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: actionButtons,
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: actionButtons,
                                )
                          : action,
                    ])))),
      ],
    );

    if (context != null) {
      showDialog(context: context, child: dialog);
    }
    return dialog;
  }
}
