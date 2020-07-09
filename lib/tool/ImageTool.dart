import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

Future<ui.Image> loadImageByProvider(
  ImageProvider provider, {
  ImageConfiguration config = ImageConfiguration.empty,
}) async {
  Completer<ui.Image> completer = Completer<ui.Image>(); //完成的回调
  ImageStreamListener listener;
  ImageStream stream = provider.resolve(config); //获取图片流
  listener = ImageStreamListener((ImageInfo frame, bool sync) {
//监听
    final ui.Image image = frame.image;
    completer.complete(image); //完成
    stream.removeListener(listener); //移除监听
  });
  stream.addListener(listener); //添加监听
  return completer.future; //返回
}

Future saveImage(ui.Image image) async {
  final isGranted = await Permission.storage.request().isGranted;
  if (isGranted) {
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
    return result;
    // Either the permission was already granted before or the user just granted it.
  }
  bool isShown = await Permission.storage.shouldShowRequestRationale;
  // openAppSettings();
  return "";
}
