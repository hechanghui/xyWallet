import 'package:http/http.dart';
import 'dart:math';

import 'package:web3dart/web3dart.dart';
import 'package:xy_wallet/model/walletModel.dart';

Future<WalletModel> createETH(String privateKey, String passWord) {
  Random random = new Random.secure();
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  Wallet wallet = Wallet.createNew(credentials, passWord, random);

  String keystore = wallet.toJson();

  return Future<WalletModel>(() async {
    var walletModel = WalletModel();
    walletModel.keystore = keystore;
    walletModel.password = passWord;
    walletModel.privateKey = privateKey;
    walletModel.address = (await credentials.extractAddress()).toString();
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
