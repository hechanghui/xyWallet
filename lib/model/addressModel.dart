// import 'package:bitcoin_flutter/bitcoin_flutter.dart';
// import 'package:web3dart/credentials.dart';

class AddressModel {
  String name;

  String address;

  String note;

  AddressModel({this.name, this.address, this.note});

  AddressModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['address'],
        note = json['note'];


  Map<String,dynamic> toJson() => {
        'name': name,
        'address': address,
        'note': note,
      };

  
}
