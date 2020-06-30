import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

class CommonInputLarge extends StatefulWidget {
  final String placeholder;
  final String title;
  final bool autofocus;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final int maxLength;
  final int maxLines;
  final int minLines;

  CommonInputLarge({
    Key key,
    this.placeholder,
    this.title,
    this.autofocus,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.maxLength,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  CommonInputState createState() => CommonInputState();
}

class CommonInputState extends State<CommonInputLarge> {
  @override
  Widget build(BuildContext context) {
    var _commentFocus = FocusNode();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_commentFocus);
      },
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              ImageHelper.wrapAssets('input_large_bg.png'),
            ),
            fit: BoxFit.fill,
          )),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: ThemeColors.accentDartColor,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                padding: const EdgeInsets.only(top: 10, bottom: 8),
                child: Text(
                  widget.title,
                  style: ThemeStyles.getSubtitle2lLight(context),
                ),
              ),
              ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: 110,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: TextField(
                      focusNode: _commentFocus,
                      onChanged: widget.onChanged,
                      controller: widget.controller,
                      keyboardType: widget.keyboardType,
                      maxLength: widget.maxLength,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines ?? 3,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: widget.placeholder,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColors.labelLightColor),
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(0, 0, 0, 0),
                            ),
                          ))),
                ),
              ),
            ],
          )),
      // color: Colors.blue,
    );
  }
}
