import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 统一弹吐司类
class ToastUtils {
  ///弹吐司
  static void showToast(String content,
      {Toast length = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.CENTER,
      Color backColor = Colors.black54,
      Color textColor = Colors.white}) {
    if (content != null) {
      if (content != null && content.isNotEmpty) {
        Fluttertoast.showToast(
            msg: content,
            toastLength: length,
            gravity: gravity,
            backgroundColor: backColor,
            textColor: textColor,
            fontSize: 15.0);
      }
    }
  }

  void showToastCenter(String content) {
    showToast(
      content,
      gravity: ToastGravity.CENTER,
    );
  }
}
