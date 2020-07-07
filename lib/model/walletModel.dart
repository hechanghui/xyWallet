// import 'package:bitcoin_flutter/bitcoin_flutter.dart';
// import 'package:web3dart/credentials.dart';

class WalletModel {
  String name;

  String address;

  String keystore;

  String icon;

  String mnemonic;

  String publicKey;

  String privateKey;

  String password;

  WalletModel({this.name, this.address, this.keystore, this.icon, this.mnemonic,this.publicKey,this.privateKey,this.password});

  WalletModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['address'],
        keystore = json['keystore'],
        icon = json['icon'],
        mnemonic = json['mnemonic'],
        publicKey = json['publicKey'],
        privateKey = json['privateKey'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'keystore': keystore,
        'icon': icon,
        'mnemonic': mnemonic,
        'publicKey': publicKey,
        'privateKey': privateKey,
        'password': password,
      };
}
