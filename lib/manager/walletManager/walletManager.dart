import 'dart:typed_data';

// import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:web3dart/web3dart.dart';
import 'package:xy_wallet/model/walletModel.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/tool/Sp_utils.dart';
import 'BTCWallet.dart';
import 'package:hex/hex.dart';
import 'EthWallet.dart';
// ignore: implementation_imports

// import 'package:hex/hex.dart';

generateMnemonic() {
  return bip39.generateMnemonic();
}

//助记词创建
Future<WalletModel> createWalletMnemonic(
    String randomMnemonic, String name, String password)async {
      print("11111");
  // var rrr = Future(() async{
    var seed = bip39.mnemonicToSeed(randomMnemonic);
    // createBTCWallet(seed);
    bip32.BIP32 node = bip32.BIP32.fromSeed(seed);
    // bip32.BIP32 btc = node.derivePath("m/44'/60'/0'/0/0");
    // print(HEX.encode(btc.privateKey));

    bip32.BIP32 child = node.derivePath("m/44'/60'/0'/0/0");

    print(HEX.encode(child.privateKey));
    print(HEX.encode(child.publicKey));
print("2222");
    var model = await createETH(HEX.encode(child.privateKey), password);
    model.publicKey = HEX.encode(child.publicKey);
    model.name = name;
    model.mnemonic = randomMnemonic;
    SpUtils.putObject('wallet', model.toJson());
    eventBus.fire(MnemonicCreate(randomMnemonic));
    SpUtils.getObj("wallet", (v) => print(v));
    return model;
  // });
  print("33333");
  // return rrr;

  // return model;
}
