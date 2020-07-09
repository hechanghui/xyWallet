// import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:flutter/cupertino.dart';
import 'package:xy_wallet/common/worker/worker.dart';
import 'package:xy_wallet/model/walletModel.dart';
import 'package:xy_wallet/tool/Sp_utils.dart';
import 'package:hex/hex.dart';
import 'EthWallet.dart';
// ignore: implementation_imports

// import 'package:hex/hex.dart';

enum CreateType {
  Mnemonic,
  KeyStore,
  PrivateKey,
}

generateMnemonic() {
  return bip39.generateMnemonic();
}

//校验助记词
bool validateMnemonic(String mnemonic) {
  return bip39.validateMnemonic(mnemonic);
}

//助记词创建
createWalletMnemonic(
  String randomMnemonic, String name, String password) async {
  final createTask = WalletCreateTask(randomMnemonic, name, password,CreateType.Mnemonic);
  final worker = Worker(poolSize: 1);
  final result = await worker.handle(createTask);

  final saveData = result.toJson();
  debugPrint("wallet:${saveData}");
  SpUtils.putObject('wallet', saveData);

  return result;
}

class WalletCreateTask implements Task<Future<WalletModel>> {
  final String createData;
  final String name;
  final String password;
  final CreateType type;
  const WalletCreateTask(
    this.createData,
    this.name,
    this.password,
    this.type
  );

  @override
  Future<WalletModel> execute() async {


    switch (type) {
      case CreateType.Mnemonic:
        WalletModel model = await createWithMnemonic();
        return model;
        break;
      case CreateType.KeyStore:
        createWithKeyStore();
        break;
      default:
      
    }
  }


  createWithMnemonic()async {
    var seed = bip39.mnemonicToSeed(createData);
    // createBTCWallet(seed);
    bip32.BIP32 node = bip32.BIP32.fromSeed(seed);
    // bip32.BIP32 btc = node.derivePath("m/44'/60'/0'/0/0");
    // print(HEX.encode(btc.privateKey));

    bip32.BIP32 child = node.derivePath("m/44'/60'/0'/0/0");

    debugPrint("privateKey:${HEX.encode(child.privateKey)}");
    debugPrint("publicKey:${HEX.encode(child.publicKey)}");
    final model = await createETH(HEX.encode(child.privateKey), password);
    model.publicKey = HEX.encode(child.publicKey);
    model.name = name;
    model.mnemonic = createData;
    return model;   
  }


    createWithKeyStore()async {
    var seed = bip39.mnemonicToSeed(createData);
    // createBTCWallet(seed);
    bip32.BIP32 node = bip32.BIP32.fromSeed(seed);
    // bip32.BIP32 btc = node.derivePath("m/44'/60'/0'/0/0");
    // print(HEX.encode(btc.privateKey));

    bip32.BIP32 child = node.derivePath("m/44'/60'/0'/0/0");

    debugPrint("privateKey:${HEX.encode(child.privateKey)}");
    debugPrint("publicKey:${HEX.encode(child.publicKey)}");
    final model = await createETH(HEX.encode(child.privateKey), password);
    model.publicKey = HEX.encode(child.publicKey);
    model.name = name;
    model.mnemonic = createData;
    return model;   
  }

  createWithPrivateKey()async {

    final model = await createETH(createData, password);
    model.publicKey = createData;
    model.name = name;
    model.mnemonic = createData;
    return model;   
  }
}
