import 'dart:math';
import 'dart:typed_data';

import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;



createBTCWallet(Uint8List seed) {


  var hdWallet = new HDWallet.fromSeed(seed).derivePath("m/44'/0'/0'/0/0");
  print(hdWallet.address);
  print(hdWallet.wif);
  print(hdWallet.pubKey);
  

}
//1对1交易
transaction(String wif, String toAddress, int satoshis){

      final alice = ECPair.fromWIF(wif);
      final txb = new TransactionBuilder();

      txb.setVersion(1);
      //获取交易txid
      txb.addInput(
          '61d520ccb74288c96bc1a2b20ea1c0d5a704776dd0164a396efec3ea7040349d',
          0); // Alice's previous transaction output, has 15000 satoshis
      txb.addOutput(toAddress, satoshis);
      // (in)15000 - (out)12000 = (fee)3000, this is the miner fee

      txb.sign(vin: 0, keyPair: alice);

      txb.build().toHex();
}


//隔离见证交易
transactionWithP2WPKH(String wif,String toAddress,int satoshis, String toAddress1,int satoshis1,){
        final alice = ECPair.fromWIF(wif);
      final p2wpkh = new P2WPKH(
              data: new PaymentData(pubkey: alice.publicKey),)
          .data;
      final txb = new TransactionBuilder();
      txb.setVersion(1);
      //获取交易txid
      txb.addInput(
          '53676626f5042d42e15313492ab7e708b87559dc0a8c74b7140057af51a2ed5b',
          0,
          null,
          p2wpkh
              .output); // Alice's previous transaction output, has 200000 satoshis
      txb.addOutput(toAddress, satoshis);
      txb.addOutput(toAddress1, satoshis1);

      txb.sign(vin: 0, keyPair: alice, witnessValue: 10000000);
      txb.build().toHex();

}