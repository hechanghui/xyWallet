// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "accountName" : MessageLookupByLibrary.simpleMessage("账户名称"),
    "actionCancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "actionConfirm" : MessageLookupByLibrary.simpleMessage("确认"),
    "appName" : MessageLookupByLibrary.simpleMessage("X钱包"),
    "autoBySystem" : MessageLookupByLibrary.simpleMessage("跟随系统"),
    "confirmPwd" : MessageLookupByLibrary.simpleMessage("确认密码"),
    "hintInputAccountName" : MessageLookupByLibrary.simpleMessage("请输入账户名称"),
    "hintInputKeystore" : MessageLookupByLibrary.simpleMessage("复制粘贴官方钱包的Keystore文件内容至输入框"),
    "hintInputMnemonic" : MessageLookupByLibrary.simpleMessage("请输入账户助记词（12个英文单词），按空格分离"),
    "hintInputPrivateKey" : MessageLookupByLibrary.simpleMessage("粘贴私钥(Private Key)内容至输入框"),
    "hintInputPwd" : MessageLookupByLibrary.simpleMessage("请输入密码"),
    "keystore" : MessageLookupByLibrary.simpleMessage("Keystore"),
    "keystorePwd" : MessageLookupByLibrary.simpleMessage("Keystore密码"),
    "mnemonic" : MessageLookupByLibrary.simpleMessage("助记词"),
    "privateKey" : MessageLookupByLibrary.simpleMessage("私钥"),
    "refreshTwoLevel" : MessageLookupByLibrary.simpleMessage("欢迎光临,我的空中楼阁"),
    "retry" : MessageLookupByLibrary.simpleMessage("重试"),
    "setPwd" : MessageLookupByLibrary.simpleMessage("设置密码"),
    "splashSkip" : MessageLookupByLibrary.simpleMessage("跳过"),
    "viewStateButtonLogin" : MessageLookupByLibrary.simpleMessage("Sign In"),
    "viewStateButtonRefresh" : MessageLookupByLibrary.simpleMessage("刷新一下"),
    "viewStateButtonRetry" : MessageLookupByLibrary.simpleMessage("重试"),
    "viewStateMessageEmpty" : MessageLookupByLibrary.simpleMessage("空空如也"),
    "viewStateMessageError" : MessageLookupByLibrary.simpleMessage("加载失败"),
    "viewStateMessageNetworkError" : MessageLookupByLibrary.simpleMessage("网络连接异常,请检查网络或稍后重试"),
    "viewStateMessageUnAuth" : MessageLookupByLibrary.simpleMessage("未登录"),
    "walletCreate" : MessageLookupByLibrary.simpleMessage("创建新账户"),
    "walletRestore" : MessageLookupByLibrary.simpleMessage("导入账户"),
    "whatIsKeystore" : MessageLookupByLibrary.simpleMessage("什么是Keystore"),
    "whatIsMnemonic" : MessageLookupByLibrary.simpleMessage("什么是助记词"),
    "whatIsPrivateKey" : MessageLookupByLibrary.simpleMessage("什么是私钥")
  };
}
