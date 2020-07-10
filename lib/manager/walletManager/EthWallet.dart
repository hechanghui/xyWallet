import 'package:http/http.dart';
import 'package:web3dart/crypto.dart';
import 'dart:math';

import 'package:web3dart/web3dart.dart';
import 'package:xy_wallet/model/walletModel.dart';
import 'package:hex/hex.dart';

Future<WalletModel> createETH(String privateKey, String passWord) {
  Random random = new Random.secure();
  EthPrivateKey credentials;
  WalletModel walletModel = WalletModel();
  try {
    credentials = EthPrivateKey.fromHex(privateKey);
  } catch (e)  {
    walletModel.errer = ErrerType.PrivateKeyErrer;
    return Future<WalletModel>(() {
      return walletModel;
    });

  }
  Wallet wallet = Wallet.createNew(credentials, passWord, random);
  
  String keystore = wallet.toJson();

  return Future<WalletModel>(() async {
    
    walletModel.keystore = keystore;
    walletModel.password = passWord;
    walletModel.privateKey = privateKey;
    walletModel.publicKey = HEX.encode(privateKeyBytesToPublic(wallet.privateKey.privateKey));
    walletModel.address = (await credentials.extractAddress()).toString();
    return walletModel;
  });
}

Future<WalletModel> createETHFormKeyStore(String keyStore, String passWord) async{
  // Random random = new Random.secure();
  // EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  Wallet wallet ;
  var walletModel = WalletModel();
  // String keystore = wallet.toJson();
  try {
    wallet = Wallet.fromJson(keyStore, passWord);
  } catch (e) {
    walletModel.errer = ErrerType.KeyStoreErrer;
        return Future<WalletModel>(() {
      return walletModel;
    });
  }


  print(HEX.encode(wallet.privateKey.privateKey));
  var adddress = (await wallet.privateKey.extractAddress()).toString();

  print(adddress);
  return Future<WalletModel>(() async {
    
    walletModel.keystore = keyStore;
    walletModel.password = passWord;

    walletModel.publicKey = HEX.encode(privateKeyBytesToPublic(wallet.privateKey.privateKey));
    walletModel.privateKey = HEX.encode(wallet.privateKey.privateKey);
    walletModel.address = (await wallet.privateKey.extractAddress()).toString();
    return walletModel;
  });
}

//交易
transaction(String privateKey, String toAddress, EtherAmount amount) async {
  // final client = Web3Client(rpcUrl, Client());

  final credentials = EthPrivateKey.fromHex(privateKey);
  final transaction = Transaction(
    from: await credentials.extractAddress(),
    to: EthereumAddress.fromHex(toAddress),
    // nonce: 0,
    gasPrice: EtherAmount.inWei(BigInt.one),
    maxGas: 100,
    value: amount,
  );

  final client = Web3Client('http:xxxxxxxxxxxx', Client());
  final signature = await client.signTransaction(credentials, transaction);
}
