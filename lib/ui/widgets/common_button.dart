import 'package:flutter/material.dart';

class CommonButton extends MaterialButton {
  CommonButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderColor,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final Color borderColor;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.buttonColor, theme.buttonColor.withBlue(79).withGreen(73)];
    var _height = height ?? theme.buttonTheme.height;

    return DecoratedBox(
      decoration: ShapeDecoration(
        gradient: LinearGradient(
            colors: _colors,
            begin: FractionalOffset(1, 0.5),
            end: FractionalOffset(0, 1)),
        shape: BeveledRectangleBorder(
            side: BorderSide(
              color: borderColor ?? Color(0xFF00F2FF),
            ),
            borderRadius: BorderRadius.all(Radius.circular(_height / 2))),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: _height, width: width),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: _height),
                child: DefaultTextStyle(
                  style: theme.textTheme.button,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
