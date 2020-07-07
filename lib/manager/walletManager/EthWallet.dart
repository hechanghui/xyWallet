import 'package:http/http.dart';
import 'dart:math';

import 'package:web3dart/web3dart.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;



createETH(String privateKey, String passWord) async{

  Random random = new Random.secure();
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  Wallet wallet = Wallet.createNew(credentials, "password", random);
  
  String keystore = wallet.toJson();
  var address = await credentials.extractAddress();
  print(keystore);
  print(address);
}


//交易
transaction(String privateKey,String toAddress,EtherAmount amount)async{

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
