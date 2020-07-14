import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xy_wallet/ui/pages/community/AssetManger.dart';
import 'package:xy_wallet/ui/pages/community/CoinDetails.dart';
import 'package:xy_wallet/ui/pages/community/CoinSplit.dart';
import 'package:xy_wallet/ui/pages/community/CoinSplitBuy.dart';
import 'package:xy_wallet/ui/pages/community/CoinSplitRank.dart';
import 'package:xy_wallet/ui/pages/community/CoinSplitRecord.dart';
import 'package:xy_wallet/ui/pages/community/withDraw.dart';
import 'package:xy_wallet/ui/pages/finance/transaction_details.dart';
import 'package:xy_wallet/ui/pages/finance/transaction_record.dart';
import 'package:xy_wallet/ui/pages/finance/transfer_page.dart';
import 'package:xy_wallet/ui/pages/home/PowByAttraction.dart';
import 'package:xy_wallet/ui/pages/home/PowByAttractionMoreData.dart';
import 'package:xy_wallet/ui/pages/home/PowByAttractionTraction.dart';
import 'package:xy_wallet/ui/pages/home/PowByPower.dart';
import 'package:xy_wallet/ui/pages/home/PowBySplit.dart';
import 'package:xy_wallet/ui/pages/home/PowBySplitInfo.dart';
import 'package:xy_wallet/ui/pages/home/createXCode.dart';
import 'package:xy_wallet/ui/pages/home/inViteInfo.dart';
import 'package:xy_wallet/ui/pages/me/about_page.dart';
import 'package:xy_wallet/ui/pages/me/changePWD.dart';
import 'package:xy_wallet/ui/pages/me/meWalletManager.dart';
import 'package:xy_wallet/ui/pages/wallet/create_with_account.dart';
import 'package:xy_wallet/ui/pages/wallet/create_with_mnemonic_generate.dart';
import 'package:xy_wallet/ui/pages/wallet/create_with_mnemonic_input.dart';
import 'package:xy_wallet/ui/pages/wallet/test.dart';

import 'page_route_anim.dart';

import 'package:xy_wallet/ui/pages/tabbars.dart';
import 'package:xy_wallet/ui/pages/splash/splash.dart';
import 'package:xy_wallet/ui/pages/wallet/create_or_restore.dart';
import 'package:xy_wallet/ui/pages/wallet/restore_container.dart';

class RouteName {
  static const String splash = 'splash';
  static const String tab = '/';
  static const String WALLET_CREATE_RESTORE = 'wallet/createOrRestore';
  static const String WALLET_CREATE = 'wallet/create';
  static const String WALLET_CREATE_WITH_MNEMONIC_GENERATE = 'wallet/createWithMnemonicGenerate';
  static const String WALLET_CREATE_WITH_MNEMONIC_INPUT = 'wallet/createWithMnemonicInput';
  static const String WALLET_RESTORE = 'wallet/restore';
  static const String TRANSFER = 'wallet/transfer';
  static const String TRANSACTION_RECOR = 'wallet/transactionRecor';
  static const String TRANSACTION_DETAILS = "wallet/transactionDetails";
  static const String COMMUNITY_ASSETMANAGER = 'community/assetManager';
  static const String ABOUT = 'me/about';
  static const String CREATEXCODE = 'wallet/createXcode';
  static const String INVITEINFO = 'wallet/InviteInfo';
  static const String POWBYATTRACTION = 'wallet/PowByAttraction';
  static const String POWBYATTRACTION_TRACTION = 'home/PowByAttractionTraction';
  static const String POWBYATTRACTION_MOREDATA = 'home/PowByAttractionMoreData';

  static const String POWBYSPLIT = 'wallet/PowBySplit';
  static const String POWBYPOWER = 'wallet/PowByPower';
  static const String WalletManger = 'wallet/WalletManger';
  static const String ChangePWD = 'wallet/ChangePWD';
  static const String CoinDetails = 'community/ChangePWD';
  static const String WithDraw = 'community/withDraw';
  static const String PowBySplitInfo = 'wallet/PowBySplitInfo';
  static const String CoinSplit = 'community/CoinSplit';
  static const String CoinSplitRecord = 'community/CoinSplitRecord';
  static const String CoinSplitBuy = 'community/CoinSplitBuy';

  static const String CoinSplitRank = 'community/CoinSplitRank';

}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());
      case RouteName.tab:
        return CupertinoPageRoute(builder: (_) => TabsPage());
      case RouteName.WALLET_CREATE_RESTORE:
        return CupertinoPageRoute(builder: (_) => CreateOrRestorePage());
      case RouteName.WALLET_RESTORE:
        return CupertinoPageRoute(builder: (_) => RestoreContainerPage());
      case RouteName.WALLET_CREATE:
        return CupertinoPageRoute(builder: (_) => CreateWithAccountPage());
      case RouteName.WALLET_CREATE_WITH_MNEMONIC_GENERATE:
        return CupertinoPageRoute(builder: (_) => CreateWithMnemonicGeneratePage(settings.arguments));
      case RouteName.WALLET_CREATE_WITH_MNEMONIC_INPUT:
        return CupertinoPageRoute(builder: (_) => CreateWithMnemonicInputPage(settings.arguments));
      case RouteName.TRANSFER:
        return CupertinoPageRoute(builder: (_) => TransferPage());
      case RouteName.TRANSACTION_RECOR:
        return CupertinoPageRoute(builder: (_) => TransactionRecordPage());
      case RouteName.TRANSACTION_DETAILS:
        return CupertinoPageRoute(builder: (_) => TransactionDetailsPage(settings.arguments));
      case RouteName.ABOUT:
        return CupertinoPageRoute(builder: (_) => AboutPage());

      case RouteName.WALLET_RESTORE:
        return CupertinoPageRoute(builder: (_) => AssetManger());

      case RouteName.CREATEXCODE:
        return CupertinoPageRoute(builder: (_) => CreateXcode());

      case RouteName.INVITEINFO:
        return CupertinoPageRoute(builder: (_) => InviteInfo());

      case RouteName.POWBYATTRACTION:
        return CupertinoPageRoute(builder: (_) => PowByAttraction());

      case RouteName.POWBYATTRACTION_TRACTION:
        return CupertinoPageRoute(builder: (_) => PowByAttractionTractionPage());

      case RouteName.POWBYATTRACTION_MOREDATA:
        return CupertinoPageRoute(builder: (_) => PowByAttractionMoreDataPage());

      case RouteName.POWBYSPLIT:
        return CupertinoPageRoute(builder: (_) => PowBySplit());

      case RouteName.POWBYPOWER:
        return CupertinoPageRoute(builder: (_) => PowByPower());

      case RouteName.WalletManger:
        return CupertinoPageRoute(builder: (_) => WalletManager(settings.arguments));

      case RouteName.ChangePWD:
        return CupertinoPageRoute(builder: (_) => ChangePWD(settings.arguments));

      case RouteName.CoinDetails:
        return CupertinoPageRoute(builder: (_) => CoinDetails());

      case RouteName.WithDraw:
        return CupertinoPageRoute(builder: (_) => WithDrawPage());

      case RouteName.PowBySplitInfo:
        return CupertinoPageRoute(builder: (_) => PowBySplitInfo());
      case RouteName.CoinSplit:
        return CupertinoPageRoute(builder: (_) => CoinSplit());
      case RouteName.CoinSplitRecord:
        return CupertinoPageRoute(builder: (_) => CoinSplitRecord());
      case RouteName.CoinSplitBuy:
        return CupertinoPageRoute(builder: (_) => CoinSplitBuy());
      case RouteName.CoinSplitRank:
        return CupertinoPageRoute(builder: (_) => CoinSplitRank());


      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

/// Pop路由
class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}

// final routes = {
//   '/': (BuildContext context) => TabsPage(),

// //  "tabs": (context) => new ContainerPage()
// };

// var onGenerateRoute = (RouteSettings settings) { // 统一处理
//   final String name = settings.name;
//   final Function pageContentBuilder = routes[name];
//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//        final Route route = MaterialPageRoute(
//           builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
//        );
//        return route;
//     }else{
//       final Route route = MaterialPageRoute(
//           builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   }
// };
