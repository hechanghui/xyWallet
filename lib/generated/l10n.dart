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

  /// `转帐`
  String get transfer {
    return Intl.message(
      '转帐',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `收款`
  String get receipt {
    return Intl.message(
      '收款',
      name: 'receipt',
      desc: '',
      args: [],
    );
  }

  /// `交易记录`
  String get transferRecord {
    return Intl.message(
      '交易记录',
      name: 'transferRecord',
      desc: '',
      args: [],
    );
  }

  /// `X-1码`
  String get codeX1 {
    return Intl.message(
      'X-1码',
      name: 'codeX1',
      desc: '',
      args: [],
    );
  }

  /// `X-2码`
  String get codeX2 {
    return Intl.message(
      'X-2码',
      name: 'codeX2',
      desc: '',
      args: [],
    );
  }

  /// `动力挖矿`
  String get PowByPower {
    return Intl.message(
      '动力挖矿',
      name: 'PowByPower',
      desc: '',
      args: [],
    );
  }

  /// `引力挖矿`
  String get PowByAttraction {
    return Intl.message(
      '引力挖矿',
      name: 'PowByAttraction',
      desc: '',
      args: [],
    );
  }

  /// `裂变挖矿`
  String get PowBySplit {
    return Intl.message(
      '裂变挖矿',
      name: 'PowBySplit',
      desc: '',
      args: [],
    );
  }

  /// `跨链资产管理`
  String get tabComTitle1 {
    return Intl.message(
      '跨链资产管理',
      name: 'tabComTitle1',
      desc: '',
      args: [],
    );
  }

  /// `粒子分裂`
  String get tabComTitle2 {
    return Intl.message(
      '粒子分裂',
      name: 'tabComTitle2',
      desc: '',
      args: [],
    );
  }

  /// `KOL社区`
  String get tabComTitle3 {
    return Intl.message(
      'KOL社区',
      name: 'tabComTitle3',
      desc: '',
      args: [],
    );
  }

  /// `去中心化交易所`
  String get tabComTitle4 {
    return Intl.message(
      '去中心化交易所',
      name: 'tabComTitle4',
      desc: '',
      args: [],
    );
  }

  /// `全链商平台`
  String get tabComTitle5 {
    return Intl.message(
      '全链商平台',
      name: 'tabComTitle5',
      desc: '',
      args: [],
    );
  }

  /// `去中心化游戏平台`
  String get tabComTitle6 {
    return Intl.message(
      '去中心化游戏平台',
      name: 'tabComTitle6',
      desc: '',
      args: [],
    );
  }

  /// `去中心化金融银行`
  String get tabComTitle7 {
    return Intl.message(
      '去中心化金融银行',
      name: 'tabComTitle7',
      desc: '',
      args: [],
    );
  }

  /// `人工智能及衍生服务`
  String get tabComTitle8 {
    return Intl.message(
      '人工智能及衍生服务',
      name: 'tabComTitle8',
      desc: '',
      args: [],
    );
  }

  /// `物联网与用户数据价值`
  String get tabComTitle9 {
    return Intl.message(
      '物联网与用户数据价值',
      name: 'tabComTitle9',
      desc: '',
      args: [],
    );
  }

  /// `基于智能合约得跨链资产管理`
  String get tabComSubTitle1 {
    return Intl.message(
      '基于智能合约得跨链资产管理',
      name: 'tabComSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `投票参与社区自治`
  String get tabComSubTitle2 {
    return Intl.message(
      '投票参与社区自治',
      name: 'tabComSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `基于智能合约得币币兑换交易所`
  String get tabComSubTitle3 {
    return Intl.message(
      '基于智能合约得币币兑换交易所',
      name: 'tabComSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `区块链是价值传递的最佳归宿`
  String get tabComSubTitle4 {
    return Intl.message(
      '区块链是价值传递的最佳归宿',
      name: 'tabComSubTitle4',
      desc: '',
      args: [],
    );
  }

  /// `无国界、无限制，最关键的，游戏必须公平`
  String get tabComSubTitle5 {
    return Intl.message(
      '无国界、无限制，最关键的，游戏必须公平',
      name: 'tabComSubTitle5',
      desc: '',
      args: [],
    );
  }

  /// `每个商业个体都有权进入全球金融体系`
  String get tabComSubTitle6 {
    return Intl.message(
      '每个商业个体都有权进入全球金融体系',
      name: 'tabComSubTitle6',
      desc: '',
      args: [],
    );
  }

  /// `以AI之名，探索未来世界的科技魔力`
  String get tabComSubTitle7 {
    return Intl.message(
      '以AI之名，探索未来世界的科技魔力',
      name: 'tabComSubTitle7',
      desc: '',
      args: [],
    );
  }

  /// `万物互联，处处皆价值`
  String get tabComSubTitle8 {
    return Intl.message(
      '万物互联，处处皆价值',
      name: 'tabComSubTitle8',
      desc: '',
      args: [],
    );
  }

  /// `万物互联，处处皆价值`
  String get tabComSubTitle9 {
    return Intl.message(
      '万物互联，处处皆价值',
      name: 'tabComSubTitle9',
      desc: '',
      args: [],
    );
  }

  /// `地址薄`
  String get Address {
    return Intl.message(
      '地址薄',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `账户管理`
  String get AccountManager {
    return Intl.message(
      '账户管理',
      name: 'AccountManager',
      desc: '',
      args: [],
    );
  }

  /// `设置`
  String get Setting {
    return Intl.message(
      '设置',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `分享应用`
  String get ShareApp {
    return Intl.message(
      '分享应用',
      name: 'ShareApp',
      desc: '',
      args: [],
    );
  }

  /// `关于我们`
  String get AboutUs {
    return Intl.message(
      '关于我们',
      name: 'AboutUs',
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