import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

class CommonInputMinor extends StatefulWidget {
  final String placeholder;
  final TextStyle placeholderStyle;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final Widget right;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onEditingComplete;

  CommonInputMinor({
    Key key,
    this.placeholder,
    this.placeholderStyle,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.enabled,
    this.right,
  }) : super(key: key);

  @override
  CommonInputState createState() => CommonInputState();
}

class CommonInputState extends State<CommonInputMinor> {
  @override
  Widget build(BuildContext context) {
    var _commentFocus = FocusNode();

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 19.5, vertical: 6),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          ImageHelper.wrapAssets('input_minor_bg.png'),
        ),
        fit: BoxFit.fill,
      )),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
                enabled: widget.enabled,
                focusNode: _commentFocus,
                onChanged: widget.onChanged,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                maxLength: widget.maxLength,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                textInputAction: widget.textInputAction,
                onSubmitted: widget.onSubmitted,
                onEditingComplete: widget.onEditingComplete,
                style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: widget.placeholderStyle ??
                        Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold, color: ThemeColors.labelLightColor),
                    border: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(0, 0, 0, 0),
                      ),
                    ))),
          ),
          widget.right ?? Container(),
        ],
      ),
      // color: Colors.blue,
    );
  }
}
