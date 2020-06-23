import 'package:flutter/material.dart';

class config {

  // 主题颜色
  static Color themesColor = Colors.green;

  // 当前用户的钱包地址，就是单纯的地址，0x开头的字符串
  static String currentWallet = '';

  // 全局配置数量的小数位数
  static int numDecimal = 4;

  // 全局配置价格的小数位数
  static int priceDecimal = 6;

  static String BaseUrl = 'https://vv.video.qq.com/';

  static String getBaseUrl() {
    return 'https://vv.video.qq.com/';
  }

  
}