import 'dart:isolate';
import 'dart:typed_data';

// import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:flutter/cupertino.dart';
import 'package:web3dart/web3dart.dart';
import 'package:xy_wallet/model/walletModel.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/tool/Sp_utils.dart';
import 'BTCWallet.dart';
import 'package:hex/hex.dart';
import 'EthWallet.dart';
// ignore: implementation_imports

// import 'package:hex/hex.dart';

//生成助记词
generateMnemonic() {
  return bip39.generateMnemonic();
}
//校验助记词
bool validateMnemonic(String mnemonic) {
  return bip39.validateMnemonic(mnemonic);
}

//助记词创建
// Future<WalletModel> createWalletMnemonic(
//     String randomMnemonic, String name, String password)async {
//       print("11111");
//   // var rrr = Future(() async{
//     var seed = bip39.mnemonicToSeed(randomMnemonic);
//     // createBTCWallet(seed);
//     bip32.BIP32 node = bip32.BIP32.fromSeed(seed);
//     // bip32.BIP32 btc = node.derivePath("m/44'/60'/0'/0/0");
//     // print(HEX.encode(btc.privateKey));

//     bip32.BIP32 child = node.derivePath("m/44'/60'/0'/0/0");

//     print(HEX.encode(child.privateKey));
//     print(HEX.encode(child.publicKey));
//     print("2222");
//     var model = await createETH(HEX.encode(child.privateKey), password);
//     model.publicKey = HEX.encode(child.publicKey);
//     model.name = name;
//     model.mnemonic = randomMnemonic;
//     SpUtils.putObject('wallet', model.toJson());
//     eventBus.fire(MnemonicCreate(randomMnemonic));
//     SpUtils.getObj("wallet", (v) => print(v));
//     return model;
//   }
    
  // return rrr;

  // return model;
createWalletMnemonic(
    String randomMnemonic, String name, String password) async {
  print("createWalletMnemonic:11");
  ReceivePort receivePort = ReceivePort();
  var isolate = await Isolate.spawn(threadTask, receivePort.sendPort);
  print("22222222-2");
  // 获取新isolate的监听port
  var sendPort = await receivePort.first as SendPort;
  print("22222222-3");
  final answer = ReceivePort();
  sendPort.send([randomMnemonic, name, password, answer.sendPort]);
  var result = await answer.first;
  final saveData = result.toJson();
  debugPrint("wallet:${saveData}");
  SpUtils.putObject('wallet', saveData);
  // SpUtils.getObj("wallet")
  // eventBus.fire(MnemonicCreate(randomMnemonic));
  SpUtils.getObj("wallet", (v) => debugPrint("wallet::get:${v}"));
  answer.close();
  receivePort.close();
  isolate.kill();
  return result;
}

// isolate的绑定方法
threadTask(SendPort sendPort) async {
  ReceivePort port = ReceivePort();
  sendPort.send(port.sendPort);

  var data = await port.first as List;
  print("data:$data");
  final callBacl = data.last as SendPort;
  final randomMnemonic = data[0];
  final name = data[1];
  final password = data[2];
  port.close();

  var seed = bip39.mnemonicToSeed(randomMnemonic);
  // createBTCWallet(seed);
  bip32.BIP32 node = bip32.BIP32.fromSeed(seed);
  // bip32.BIP32 btc = node.derivePath("m/44'/60'/0'/0/0");
  // print(HEX.encode(btc.privateKey));

  bip32.BIP32 child = node.derivePath("m/44'/60'/0'/0/0");

  debugPrint("privateKey:${HEX.encode(child.privateKey)}");
  debugPrint("publicKey:${HEX.encode(child.publicKey)}");
  print("createWalletMnemonic:22");
  var model = await createETH(HEX.encode(child.privateKey), password);
  print("createWalletMnemonic:33");
  model.publicKey = HEX.encode(child.publicKey);
  model.name = name;
  model.mnemonic = randomMnemonic;
  print("createWalletMnemonic:44");
  callBacl.send(model);
}
    