// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `X钱包`
  String get appName {
    return Intl.message(
      'X钱包',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get actionCancel {
    return Intl.message(
      '取消',
      name: 'actionCancel',
      desc: '',
      args: [],
    );
  }

  /// `确认`
  String get actionConfirm {
    return Intl.message(
      '确认',
      name: 'actionConfirm',
      desc: '',
      args: [],
    );
  }

  /// `跟随系统`
  String get autoBySystem {
    return Intl.message(
      '跟随系统',
      name: 'autoBySystem',
      desc: '',
      args: [],
    );
  }

  /// `加载失败`
  String get viewStateMessageError {
    return Intl.message(
      '加载失败',
      name: 'viewStateMessageError',
      desc: '',
      args: [],
    );
  }

  /// `网络连接异常,请检查网络或稍后重试`
  String get viewStateMessageNetworkError {
    return Intl.message(
      '网络连接异常,请检查网络或稍后重试',
      name: 'viewStateMessageNetworkError',
      desc: '',
      args: [],
    );
  }

  /// `空空如也`
  String get viewStateMessageEmpty {
    return Intl.message(
      '空空如也',
      name: 'viewStateMessageEmpty',
      desc: '',
      args: [],
    );
  }

  /// `未登录`
  String get viewStateMessageUnAuth {
    return Intl.message(
      '未登录',
      name: 'viewStateMessageUnAuth',
      desc: '',
      args: [],
    );
  }

  /// `刷新一下`
  String get viewStateButtonRefresh {
    return Intl.message(
      '刷新一下',
      name: 'viewStateButtonRefresh',
      desc: '',
      args: [],
    );
  }

  /// `重试`
  String get viewStateButtonRetry {
    return Intl.message(
      '重试',
      name: 'viewStateButtonRetry',
      desc: '',
      args: [],
    );
  }

  /// `欢迎光临,我的空中楼阁`
  String get refreshTwoLevel {
    return Intl.message(
      '欢迎光临,我的空中楼阁',
      name: 'refreshTwoLevel',
      desc: '',
      args: [],
    );
  }

  /// `重试`
  String get retry {
    return Intl.message(
      '重试',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `跳过`
  String get splashSkip {
    return Intl.message(
      '跳过',
      name: 'splashSkip',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get viewStateButtonLogin {
    return Intl.message(
      'Sign In',
      name: 'viewStateButtonLogin',
      desc: '',
      args: [],
    );
  }

  /// `导入账户`
  String get walletRestore {
    return Intl.message(
      '导入账户',
      name: 'walletRestore',
      desc: '',
      args: [],
    );
  }

  /// `创建新账户`
  String get walletCreate {
    return Intl.message(
      '创建新账户',
      name: 'walletCreate',
      desc: '',
      args: [],
    );
  }

  /// `助记词`
  String get mnemonic {
    return Intl.message(
      '助记词',
      name: 'mnemonic',
      desc: '',
      args: [],
    );
  }

  /// `Keystore`
  String get keystore {
    return Intl.message(
      'Keystore',
      name: 'keystore',
      desc: '',
      args: [],
    );
  }

  /// `私钥`
  String get privateKey {
    return Intl.message(
      '私钥',
      name: 'privateKey',
      desc: '',
      args: [],
    );
  }

  /// `请输入账户助记词（12个英文单词），按空格分离`
  String get hintInputMnemonic {
    return Intl.message(
      '请输入账户助记词（12个英文单词），按空格分离',
      name: 'hintInputMnemonic',
      desc: '',
      args: [],
    );
  }

  /// `复制粘贴官方钱包的Keystore文件内容至输入框`
  String get hintInputKeystore {
    return Intl.message(
      '复制粘贴官方钱包的Keystore文件内容至输入框',
      name: 'hintInputKeystore',
      desc: '',
      args: [],
    );
  }

  /// `粘贴私钥(Private Key)内容至输入框`
  String get hintInputPrivateKey {
    return Intl.message(
      '粘贴私钥(Private Key)内容至输入框',
      name: 'hintInputPrivateKey',
      desc: '',
      args: [],
    );
  }

  /// `账户名称`
  String get accountName {
    return Intl.message(
      '账户名称',
      name: 'accountName',
      desc: '',
      args: [],
    );
  }

  /// `请输入账户名称`
  String get hintInputAccountName {
    return Intl.message(
      '请输入账户名称',
      name: 'hintInputAccountName',
      desc: '',
      args: [],
    );
  }

  /// `设置密码`
  String get setPwd {
    return Intl.message(
      '设置密码',
      name: 'setPwd',
      desc: '',
      args: [],
    );
  }

  /// `Keystore密码`
  String get keystorePwd {
    return Intl.message(
      'Keystore密码',
      name: 'keystorePwd',
      desc: '',
      args: [],
    );
  }

  /// `请输入密码`
  String get hintInputPwd {
    return Intl.message(
      '请输入密码',
      name: 'hintInputPwd',
      desc: '',
      args: [],
    );
  }

  /// `确认密码`
  String get confirmPwd {
    return Intl.message(
      '确认密码',
      name: 'confirmPwd',
      desc: '',
      args: [],
    );
  }

  /// `什么是助记词`
  String get whatIsMnemonic {
    return Intl.message(
      '什么是助记词',
      name: 'whatIsMnemonic',
      desc: '',
      args: [],
    );
  }

  /// `什么是Keystore`
  String get whatIsKeystore {
    return Intl.message(
      '什么是Keystore',
      name: 'whatIsKeystore',
      desc: '',
      args: [],
    );
  }

  /// `什么是私钥`
  String get whatIsPrivateKey {
    return Intl.message(
      '什么是私钥',
      name: 'whatIsPrivateKey',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}