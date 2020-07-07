import 'dart:typed_data';

// import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:web3dart/web3dart.dart';
import 'BTCWallet.dart';
import 'package:hex/hex.dart';
import 'EthWallet.dart';
// ignore: implementation_imports

// import 'package:hex/hex.dart';
class WalletManager {
 
}
   String generateMnemonic(String name, String password) {
    String randomMnemonic = bip39.generateMnemonic();
    
    var seed = bip39.mnemonicToSeed('abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about');
    createBTCWallet(seed);
    bip32.BIP32 node = bip32.BIP32.fromSeed(seed);
    bip32.BIP32 btc = node.derivePath("m/44'/60'/0'/0/0");
    print(HEX.encode(btc.privateKey));
    

    bip32.BIP32 child = node.derivePath("m/44'/60'/0'/0/0");
    print(HEX.encode(child.privateKey));
    print(HEX.encode(child.publicKey));



    createETH(HEX.encode(child.privateKey),password);


    return randomMnemonic;
  }

