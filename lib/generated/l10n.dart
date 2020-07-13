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

  /// `我知道了`
  String get actionIKnow {
    return Intl.message(
      '我知道了',
      name: 'actionIKnow',
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

  /// `下一步`
  String get nextStep {
    return Intl.message(
      '下一步',
      name: 'nextStep',
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

  /// `钱包`
  String get wallet {
    return Intl.message(
      '钱包',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `生态`
  String get community {
    return Intl.message(
      '生态',
      name: 'community',
      desc: '',
      args: [],
    );
  }

  /// `我的`
  String get mine {
    return Intl.message(
      '我的',
      name: 'mine',
      desc: '',
      args: [],
    );
  }

  /// `确认时间`
  String get confirmDate {
    return Intl.message(
      '确认时间',
      name: 'confirmDate',
      desc: '',
      args: [],
    );
  }

  /// `交易号`
  String get txId {
    return Intl.message(
      '交易号',
      name: 'txId',
      desc: '',
      args: [],
    );
  }

  /// `交易区块`
  String get includedInBlock {
    return Intl.message(
      '交易区块',
      name: 'includedInBlock',
      desc: '',
      args: [],
    );
  }

  /// `确认数`
  String get confirmations {
    return Intl.message(
      '确认数',
      name: 'confirmations',
      desc: '',
      args: [],
    );
  }

  /// `手续费`
  String get fees {
    return Intl.message(
      '手续费',
      name: 'fees',
      desc: '',
      args: [],
    );
  }

  /// `我的地址`
  String get addrFrom {
    return Intl.message(
      '我的地址',
      name: 'addrFrom',
      desc: '',
      args: [],
    );
  }

  /// `对方地址`
  String get addrTo {
    return Intl.message(
      '对方地址',
      name: 'addrTo',
      desc: '',
      args: [],
    );
  }

  /// `去区块浏览器查看详情`
  String get goBlockExplorer {
    return Intl.message(
      '去区块浏览器查看详情',
      name: 'goBlockExplorer',
      desc: '',
      args: [],
    );
  }

  /// `交易详情`
  String get transactionDetails {
    return Intl.message(
      '交易详情',
      name: 'transactionDetails',
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

  /// `输入密码`
  String get inputPwd {
    return Intl.message(
      '输入密码',
      name: 'inputPwd',
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

  /// `创建账户后会出现12个英文单词，这12个英文单词就是助记词。助记词由一个字符串通过算法在2048个单词中提出的12个单词。助记词算法可以派生出私钥，所以助记词是私钥的另一种表现习惯是。用助记词是为了帮助用户记忆复杂的私钥。任何人拿到了你的助记词，就可以拿走您的数字资产，因此必须保管好您的助记词。`
  String get mnemonicInfo {
    return Intl.message(
      '创建账户后会出现12个英文单词，这12个英文单词就是助记词。助记词由一个字符串通过算法在2048个单词中提出的12个单词。助记词算法可以派生出私钥，所以助记词是私钥的另一种表现习惯是。用助记词是为了帮助用户记忆复杂的私钥。任何人拿到了你的助记词，就可以拿走您的数字资产，因此必须保管好您的助记词。',
      name: 'mnemonicInfo',
      desc: '',
      args: [],
    );
  }

  /// `keystore文件是钱包存储私钥的一种文件格式（JSON）。它使用用户自定义密码加密，以起刀一定程度上的保护作用，而保护的程度取决于用户加密该钱包的密码强度。`
  String get keystoreInfo {
    return Intl.message(
      'keystore文件是钱包存储私钥的一种文件格式（JSON）。它使用用户自定义密码加密，以起刀一定程度上的保护作用，而保护的程度取决于用户加密该钱包的密码强度。',
      name: 'keystoreInfo',
      desc: '',
      args: [],
    );
  }

  /// `私钥是在区块链交易中用于生成交易签名，以证明账户身份。所以私钥必须安全保管，一旦私钥倍被任何人拿到，就可以拿走您的数字资产。`
  String get privateKeyInfo {
    return Intl.message(
      '私钥是在区块链交易中用于生成交易签名，以证明账户身份。所以私钥必须安全保管，一旦私钥倍被任何人拿到，就可以拿走您的数字资产。',
      name: 'privateKeyInfo',
      desc: '',
      args: [],
    );
  }

  /// `密码将作为该账户的登录密码和交易密码，为了你的账户安全，我们建议你设置一个高强度的密码。`
  String get walletCreateAccountTip {
    return Intl.message(
      '密码将作为该账户的登录密码和交易密码，为了你的账户安全，我们建议你设置一个高强度的密码。',
      name: 'walletCreateAccountTip',
      desc: '',
      args: [],
    );
  }

  /// `开始创建`
  String get startCreate {
    return Intl.message(
      '开始创建',
      name: 'startCreate',
      desc: '',
      args: [],
    );
  }

  /// `创建钱包`
  String get createWallet {
    return Intl.message(
      '创建钱包',
      name: 'createWallet',
      desc: '',
      args: [],
    );
  }

  /// `你的钱包助记词`
  String get yourWalletMnemonic {
    return Intl.message(
      '你的钱包助记词',
      name: 'yourWalletMnemonic',
      desc: '',
      args: [],
    );
  }

  /// `助记词用于恢复你的钱包，丢失他们你将永远失去钱包。`
  String get yourWalletMnemonicTip {
    return Intl.message(
      '助记词用于恢复你的钱包，丢失他们你将永远失去钱包。',
      name: 'yourWalletMnemonicTip',
      desc: '',
      args: [],
    );
  }

  /// `长按助记词可以复制`
  String get longPressedMnemonicCopy {
    return Intl.message(
      '长按助记词可以复制',
      name: 'longPressedMnemonicCopy',
      desc: '',
      args: [],
    );
  }

  /// `强烈建议你将助记词抄写在纸上并保存在安全地方，任何人得到助记词都可以拿走你的数字资产`
  String get walletMnemonicTip {
    return Intl.message(
      '强烈建议你将助记词抄写在纸上并保存在安全地方，任何人得到助记词都可以拿走你的数字资产',
      name: 'walletMnemonicTip',
      desc: '',
      args: [],
    );
  }

  /// `确认你的钱包助记词`
  String get walletConfirmMnemonic {
    return Intl.message(
      '确认你的钱包助记词',
      name: 'walletConfirmMnemonic',
      desc: '',
      args: [],
    );
  }

  /// `请按顺序点击助记词，验证您备份得助记词是否正确`
  String get walletMnemonicInputTip {
    return Intl.message(
      '请按顺序点击助记词，验证您备份得助记词是否正确',
      name: 'walletMnemonicInputTip',
      desc: '',
      args: [],
    );
  }

  /// `全部`
  String get all {
    return Intl.message(
      '全部',
      name: 'all',
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

  /// `请输入`
  String get hintPleaseInput {
    return Intl.message(
      '请输入',
      name: 'hintPleaseInput',
      desc: '',
      args: [],
    );
  }

  /// `地址/交易号`
  String get addrOrTxId {
    return Intl.message(
      '地址/交易号',
      name: 'addrOrTxId',
      desc: '',
      args: [],
    );
  }

  /// `确认转出`
  String get transferConfirm {
    return Intl.message(
      '确认转出',
      name: 'transferConfirm',
      desc: '',
      args: [],
    );
  }

  /// `公开信息（可选填）`
  String get transferLabelTitle {
    return Intl.message(
      '公开信息（可选填）',
      name: 'transferLabelTitle',
      desc: '',
      args: [],
    );
  }

  /// `限500字符内，此信息会显示在交易中。\r\n请不要输入私密信息。`
  String get transferLabelTip {
    return Intl.message(
      '限500字符内，此信息会显示在交易中。\r\n请不要输入私密信息。',
      name: 'transferLabelTip',
      desc: '',
      args: [],
    );
  }

  /// `手续费`
  String get fee {
    return Intl.message(
      '手续费',
      name: 'fee',
      desc: '',
      args: [],
    );
  }

  /// `发送地址`
  String get addrSend {
    return Intl.message(
      '发送地址',
      name: 'addrSend',
      desc: '',
      args: [],
    );
  }

  /// `请输入转账数量（最小单位为小数点后6位）`
  String get transferCountTip {
    return Intl.message(
      '请输入转账数量（最小单位为小数点后6位）',
      name: 'transferCountTip',
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

  /// `万物互联，处处皆价值  `
  String get tabComSubTitle8 {
    return Intl.message(
      '万物互联，处处皆价值  ',
      name: 'tabComSubTitle8',
      desc: '',
      args: [],
    );
  }

  /// `万物互联，处处皆价值  `
  String get tabComSubTitle9 {
    return Intl.message(
      '万物互联，处处皆价值  ',
      name: 'tabComSubTitle9',
      desc: '',
      args: [],
    );
  }

  /// `地址薄`
  String get Addresses {
    return Intl.message(
      '地址薄',
      name: 'Addresses',
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

  /// `充币`
  String get Charge {
    return Intl.message(
      '充币',
      name: 'Charge',
      desc: '',
      args: [],
    );
  }

  /// `收款`
  String get Charge1 {
    return Intl.message(
      '收款',
      name: 'Charge1',
      desc: '',
      args: [],
    );
  }

  /// `提币`
  String get WithDraw {
    return Intl.message(
      '提币',
      name: 'WithDraw',
      desc: '',
      args: [],
    );
  }

  /// `跨链资产管理`
  String get assetManagerTitle {
    return Intl.message(
      '跨链资产管理',
      name: 'assetManagerTitle',
      desc: '',
      args: [],
    );
  }

  /// `选择币种`
  String get ChooseCoin {
    return Intl.message(
      '选择币种',
      name: 'ChooseCoin',
      desc: '',
      args: [],
    );
  }

  /// `地址薄`
  String get AddressManagerTitle {
    return Intl.message(
      '地址薄',
      name: 'AddressManagerTitle',
      desc: '',
      args: [],
    );
  }

  /// `名称`
  String get AddressTitle {
    return Intl.message(
      '名称',
      name: 'AddressTitle',
      desc: '',
      args: [],
    );
  }

  /// `请输入账户名称`
  String get AddressTitleInput {
    return Intl.message(
      '请输入账户名称',
      name: 'AddressTitleInput',
      desc: '',
      args: [],
    );
  }

  /// `地址`
  String get AddAddress {
    return Intl.message(
      '地址',
      name: 'AddAddress',
      desc: '',
      args: [],
    );
  }

  /// `请输入地址`
  String get AddAddressInput {
    return Intl.message(
      '请输入地址',
      name: 'AddAddressInput',
      desc: '',
      args: [],
    );
  }

  /// `备注`
  String get AddressNote {
    return Intl.message(
      '备注',
      name: 'AddressNote',
      desc: '',
      args: [],
    );
  }

  /// `请输入备注`
  String get AddressNoteInput {
    return Intl.message(
      '请输入备注',
      name: 'AddressNoteInput',
      desc: '',
      args: [],
    );
  }

  /// `账户管理`
  String get WalletListTitle {
    return Intl.message(
      '账户管理',
      name: 'WalletListTitle',
      desc: '',
      args: [],
    );
  }

  /// `点击账户进行切换`
  String get SwitchWalletTitle {
    return Intl.message(
      '点击账户进行切换',
      name: 'SwitchWalletTitle',
      desc: '',
      args: [],
    );
  }

  /// `充币地址`
  String get ChargeAddress {
    return Intl.message(
      '充币地址',
      name: 'ChargeAddress',
      desc: '',
      args: [],
    );
  }

  /// `收款地址`
  String get ChargeAddressLocal {
    return Intl.message(
      '收款地址',
      name: 'ChargeAddressLocal',
      desc: '',
      args: [],
    );
  }

  /// `复制`
  String get Copy {
    return Intl.message(
      '复制',
      name: 'Copy',
      desc: '',
      args: [],
    );
  }

  /// `保存`
  String get Save {
    return Intl.message(
      '保存',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `保存成功`
  String get SaveSuccess {
    return Intl.message(
      '保存成功',
      name: 'SaveSuccess',
      desc: '',
      args: [],
    );
  }

  /// `复制成功`
  String get CopySuccess {
    return Intl.message(
      '复制成功',
      name: 'CopySuccess',
      desc: '',
      args: [],
    );
  }

  /// `请勿向上述地址充值任何非ERC20_USDT资产，否则资产将不可找回。\n您充值至上述地址后，需要整个网络节点得确认，12次网络确认后到账。\n最小充值金额：1USDT，小于最小金额得充值将不会上涨且无法退回。\n您的充值地址不会经常改变，可以重复充提；如有更改，我们会尽量通过网站公告或邮寄通知您。\n请务必确认设备或浏览器安全，防止信息被篡改或泄露。`
  String get ChargeTip {
    return Intl.message(
      '请勿向上述地址充值任何非ERC20_USDT资产，否则资产将不可找回。\n您充值至上述地址后，需要整个网络节点得确认，12次网络确认后到账。\n最小充值金额：1USDT，小于最小金额得充值将不会上涨且无法退回。\n您的充值地址不会经常改变，可以重复充提；如有更改，我们会尽量通过网站公告或邮寄通知您。\n请务必确认设备或浏览器安全，防止信息被篡改或泄露。',
      name: 'ChargeTip',
      desc: '',
      args: [],
    );
  }

  /// `如需充值USDT/ETH等跨链资产，请至“生态”>“跨链资产管理”中进行充提操作。`
  String get ChargeTip1 {
    return Intl.message(
      '如需充值USDT/ETH等跨链资产，请至“生态”>“跨链资产管理”中进行充提操作。',
      name: 'ChargeTip1',
      desc: '',
      args: [],
    );
  }

  /// `创建X-Code`
  String get CreateXcode {
    return Intl.message(
      '创建X-Code',
      name: 'CreateXcode',
      desc: '',
      args: [],
    );
  }

  /// `输入X-1码/X-2码-Code`
  String get CreateXcodeInput {
    return Intl.message(
      '输入X-1码/X-2码-Code',
      name: 'CreateXcodeInput',
      desc: '',
      args: [],
    );
  }

  /// `创建`
  String get Create {
    return Intl.message(
      '创建',
      name: 'Create',
      desc: '',
      args: [],
    );
  }

  /// `复制公钥`
  String get CopyPublicKey {
    return Intl.message(
      '复制公钥',
      name: 'CopyPublicKey',
      desc: '',
      args: [],
    );
  }

  /// `导出keystore`
  String get ExportKeyStore {
    return Intl.message(
      '导出keystore',
      name: 'ExportKeyStore',
      desc: '',
      args: [],
    );
  }

  /// `导出私钥`
  String get ExportPrivateKey {
    return Intl.message(
      '导出私钥',
      name: 'ExportPrivateKey',
      desc: '',
      args: [],
    );
  }

  /// `修改密码`
  String get ChangePWD {
    return Intl.message(
      '修改密码',
      name: 'ChangePWD',
      desc: '',
      args: [],
    );
  }

  /// `删除账户`
  String get DelAccount {
    return Intl.message(
      '删除账户',
      name: 'DelAccount',
      desc: '',
      args: [],
    );
  }

  /// `管理`
  String get Manager {
    return Intl.message(
      '管理',
      name: 'Manager',
      desc: '',
      args: [],
    );
  }

  /// `原密码`
  String get oldPWd {
    return Intl.message(
      '原密码',
      name: 'oldPWd',
      desc: '',
      args: [],
    );
  }

  /// `请输入原密码`
  String get oldPWdInput {
    return Intl.message(
      '请输入原密码',
      name: 'oldPWdInput',
      desc: '',
      args: [],
    );
  }

  /// `新密码`
  String get newPWd {
    return Intl.message(
      '新密码',
      name: 'newPWd',
      desc: '',
      args: [],
    );
  }

  /// `请输入新密码`
  String get newPWdInput {
    return Intl.message(
      '请输入新密码',
      name: 'newPWdInput',
      desc: '',
      args: [],
    );
  }

  /// `确认新密码`
  String get comfirmPWd {
    return Intl.message(
      '确认新密码',
      name: 'comfirmPWd',
      desc: '',
      args: [],
    );
  }

  /// `请再次输入确认`
  String get comfirmPWdInput {
    return Intl.message(
      '请再次输入确认',
      name: 'comfirmPWdInput',
      desc: '',
      args: [],
    );
  }

  /// `确认`
  String get comfirm {
    return Intl.message(
      '确认',
      name: 'comfirm',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get cannel {
    return Intl.message(
      '取消',
      name: 'cannel',
      desc: '',
      args: [],
    );
  }

  /// `请输入账户名称`
  String get NoNameInputTip {
    return Intl.message(
      '请输入账户名称',
      name: 'NoNameInputTip',
      desc: '',
      args: [],
    );
  }

  /// `请输入密码`
  String get NoPWDInputTip {
    return Intl.message(
      '请输入密码',
      name: 'NoPWDInputTip',
      desc: '',
      args: [],
    );
  }

  /// `请再次输入密码`
  String get NoComfirmPWDInputTip {
    return Intl.message(
      '请再次输入密码',
      name: 'NoComfirmPWDInputTip',
      desc: '',
      args: [],
    );
  }

  /// `两次密码输入不一致`
  String get PWDDiffentInputTip {
    return Intl.message(
      '两次密码输入不一致',
      name: 'PWDDiffentInputTip',
      desc: '',
      args: [],
    );
  }

  /// `助记词错误`
  String get mnemonicWrong {
    return Intl.message(
      '助记词错误',
      name: 'mnemonicWrong',
      desc: '',
      args: [],
    );
  }

  /// `请输入助记词`
  String get mnemonicInputTip {
    return Intl.message(
      '请输入助记词',
      name: 'mnemonicInputTip',
      desc: '',
      args: [],
    );
  }

  /// `第三方钱包牵引`
  String get libWallet {
    return Intl.message(
      '第三方钱包牵引',
      name: 'libWallet',
      desc: '',
      args: [],
    );
  }

  /// `牵引手续费(HT/OKB/ZB/MX/AQ/BIKI)0.01`
  String get libWalletFeeTitle {
    return Intl.message(
      '牵引手续费(HT/OKB/ZB/MX/AQ/BIKI)0.01',
      name: 'libWalletFeeTitle',
      desc: '',
      args: [],
    );
  }

  /// `0.01`
  String get libWalletFee {
    return Intl.message(
      '0.01',
      name: 'libWalletFee',
      desc: '',
      args: [],
    );
  }

  /// `平台币资产价值≥100USDT`
  String get libWalletAsset {
    return Intl.message(
      '平台币资产价值≥100USDT',
      name: 'libWalletAsset',
      desc: '',
      args: [],
    );
  }

  /// `将持有HT、OKB、ZB、MX、AQ、BIKI的第三方钱包与X钱包进行牵引，牵引后并保持锁仓（无转出行为），即可参与引力挖矿。最小锁仓数值为钱包内平台币资产价值≥100USDT的个HT、OKB、ZB、MX、AQ、BIKI，签约手续费0.01，一周续签一次，D+2发放挖矿收益。`
  String get libWalletTip {
    return Intl.message(
      '将持有HT、OKB、ZB、MX、AQ、BIKI的第三方钱包与X钱包进行牵引，牵引后并保持锁仓（无转出行为），即可参与引力挖矿。最小锁仓数值为钱包内平台币资产价值≥100USDT的个HT、OKB、ZB、MX、AQ、BIKI，签约手续费0.01，一周续签一次，D+2发放挖矿收益。',
      name: 'libWalletTip',
      desc: '',
      args: [],
    );
  }

  /// `总奖励`
  String get rewardTotal {
    return Intl.message(
      '总奖励',
      name: 'rewardTotal',
      desc: '',
      args: [],
    );
  }

  /// `邀请奖励`
  String get inviteTitle {
    return Intl.message(
      '邀请奖励',
      name: 'inviteTitle',
      desc: '',
      args: [],
    );
  }

  /// `地址`
  String get address {
    return Intl.message(
      '地址',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `时间`
  String get time {
    return Intl.message(
      '时间',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `类型`
  String get type {
    return Intl.message(
      '类型',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `个人总算力`
  String get personPower {
    return Intl.message(
      '个人总算力',
      name: 'personPower',
      desc: '',
      args: [],
    );
  }

  /// `今日挖矿奖励（X）`
  String get PowerrewardToday {
    return Intl.message(
      '今日挖矿奖励（X）',
      name: 'PowerrewardToday',
      desc: '',
      args: [],
    );
  }

  /// `个人算力占比`
  String get PowerPpercentage {
    return Intl.message(
      '个人算力占比',
      name: 'PowerPpercentage',
      desc: '',
      args: [],
    );
  }

  /// `查看更多数据 >`
  String get moreData {
    return Intl.message(
      '查看更多数据 >',
      name: 'moreData',
      desc: '',
      args: [],
    );
  }

  /// `个人动力值`
  String get personPow {
    return Intl.message(
      '个人动力值',
      name: 'personPow',
      desc: '',
      args: [],
    );
  }

  /// `个人动力占比`
  String get Powpercentage {
    return Intl.message(
      '个人动力占比',
      name: 'Powpercentage',
      desc: '',
      args: [],
    );
  }

  /// `基础动力`
  String get PowBase {
    return Intl.message(
      '基础动力',
      name: 'PowBase',
      desc: '',
      args: [],
    );
  }

  /// `邀请动力`
  String get PowInvite {
    return Intl.message(
      '邀请动力',
      name: 'PowInvite',
      desc: '',
      args: [],
    );
  }

  /// `今日空投奖励（X）`
  String get PowrewardToday {
    return Intl.message(
      '今日空投奖励（X）',
      name: 'PowrewardToday',
      desc: '',
      args: [],
    );
  }

  /// `激活动力`
  String get PowActivate {
    return Intl.message(
      '激活动力',
      name: 'PowActivate',
      desc: '',
      args: [],
    );
  }

  /// `请输入私钥`
  String get PrivateKeyInput {
    return Intl.message(
      '请输入私钥',
      name: 'PrivateKeyInput',
      desc: '',
      args: [],
    );
  }

  /// `私钥错误`
  String get PrivateKeyWrong {
    return Intl.message(
      '私钥错误',
      name: 'PrivateKeyWrong',
      desc: '',
      args: [],
    );
  }

  /// `创建失败，Keystore文件或密码错误`
  String get KeystoreWrong {
    return Intl.message(
      '创建失败，Keystore文件或密码错误',
      name: 'KeystoreWrong',
      desc: '',
      args: [],
    );
  }

  /// `删除账户`
  String get delAccount {
    return Intl.message(
      '删除账户',
      name: 'delAccount',
      desc: '',
      args: [],
    );
  }

  /// `温馨提示`
  String get tip {
    return Intl.message(
      '温馨提示',
      name: 'tip',
      desc: '',
      args: [],
    );
  }

  /// `确认删除该地址？`
  String get IsdelAccount {
    return Intl.message(
      '确认删除该地址？',
      name: 'IsdelAccount',
      desc: '',
      args: [],
    );
  }

  /// `充币记录`
  String get ChargeRecord {
    return Intl.message(
      '充币记录',
      name: 'ChargeRecord',
      desc: '',
      args: [],
    );
  }

  /// `提币记录`
  String get WithDrawRecord {
    return Intl.message(
      '提币记录',
      name: 'WithDrawRecord',
      desc: '',
      args: [],
    );
  }

  /// `交易记录`
  String get TransRecord {
    return Intl.message(
      '交易记录',
      name: 'TransRecord',
      desc: '',
      args: [],
    );
  }

  /// `密码错误`
  String get PWDWrong {
    return Intl.message(
      '密码错误',
      name: 'PWDWrong',
      desc: '',
      args: [],
    );
  }

  /// `成功`
  String get Succsee {
    return Intl.message(
      '成功',
      name: 'Succsee',
      desc: '',
      args: [],
    );
  }

  /// `奖励记录`
  String get rewardRecord {
    return Intl.message(
      '奖励记录',
      name: 'rewardRecord',
      desc: '',
      args: [],
    );
  }

  /// `立即分裂`
  String get CoinSplitNow {
    return Intl.message(
      '立即分裂',
      name: 'CoinSplitNow',
      desc: '',
      args: [],
    );
  }

  /// `兑换记录 >`
  String get CoinSplitRecordButton {
    return Intl.message(
      '兑换记录 >',
      name: 'CoinSplitRecordButton',
      desc: '',
      args: [],
    );
  }

  /// `请输入金额`
  String get InputMoney {
    return Intl.message(
      '请输入金额',
      name: 'InputMoney',
      desc: '',
      args: [],
    );
  }

  /// `粒子分裂规则：每阶段USDT兑换完毕之后将以下一层的兑换比例兑换X，此过程不可逆转，在粒子分裂的体系内X将获得持续上升的兑换价值，分裂所得X将于5.0H后分配到账，分裂所得以最终结果为准。`
  String get coinSplitRule {
    return Intl.message(
      '粒子分裂规则：每阶段USDT兑换完毕之后将以下一层的兑换比例兑换X，此过程不可逆转，在粒子分裂的体系内X将获得持续上升的兑换价值，分裂所得X将于5.0H后分配到账，分裂所得以最终结果为准。',
      name: 'coinSplitRule',
      desc: '',
      args: [],
    );
  }

  /// `可用余额(USDT)`
  String get canUse {
    return Intl.message(
      '可用余额(USDT)',
      name: 'canUse',
      desc: '',
      args: [],
    );
  }

  /// `需要支付总额`
  String get willPay {
    return Intl.message(
      '需要支付总额',
      name: 'willPay',
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