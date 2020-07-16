import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/base/widgets/ssperct_raio_image.dart';

/// widget扩展方法
extension WidgetEx on Widget {
  Padding padding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  InkWell click({
    Alignment alignment = Alignment.center,
    GestureTapCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: alignment,
        widthFactor: 1.2,
        heightFactor: 1.2,
        child: this,
      ),
    );
  }

  Center center() {
    return Center(child: this);
  }

  DecoratedBox border(
    BoxBorder border,
    /**  {
    Color color,
    DecorationImage image,
    BorderRadiusGeometry borderRadius,
    Gradient gradient,
    BlendMode backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
  } */
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: border,
      ),
      child: this,
    );
  }

  DecoratedBox bg({
    Color color,
    DecorationImage image,
    BoxBorder border,
    BorderRadiusGeometry borderRadius,
    List<BoxShadow> boxShadow,
    Gradient gradient,
    BlendMode backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        backgroundBlendMode: backgroundBlendMode,
        shape: shape,
      ),
      child: this,
    );
  }

  Widget backImage({String image, EdgeInsetsGeometry padding}) {
    // return AsperctRaioImage.asset(
    //   ImageHelper.wrapAssets(image ?? 'container_bg.png'),
    //   builder: (context, snapshot, url) {
    //     print('width=${snapshot.data.width}');
    //     print('heiht=${snapshot.data.height}');
    //     return Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text(
    //           '本地资源加载',
    //           style: TextStyle(fontSize: 25.0, color: Colors.black),
    //         ),
    //         Text(
    //           '大小--${snapshot.data.width.toDouble()}x${snapshot.data.height.toDouble()}',
    //           style: TextStyle(fontSize: 17.0),
    //         ),
    //         Container(
    //           width: snapshot.data.width.toDouble() / 5,
    //           height: snapshot.data.height.toDouble() / 5,
    //           decoration: BoxDecoration(
    //             image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
    //           ),
    //         )
    //       ],
    //     );
    //   },
    // );

    return Container(
      padding: padding,
      decoration: BoxDecoration(
          image: DecorationImage(
        centerSlice: image == null ? Rect.fromLTRB(15.0, 15.0, 20.0, 20.0) : null,
        image: AssetImage(
          ImageHelper.wrapAssets(image ?? 'container_bg.png'),
        ),
        fit: BoxFit.fill,
      )),
      child: this,
    );
  }
}
