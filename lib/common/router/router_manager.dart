import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xy_wallet/ui/pages/community/AssetManger.dart';
import 'package:xy_wallet/ui/pages/finance/transaction_record.dart';
import 'package:xy_wallet/ui/pages/finance/transfer_page.dart';
import 'package:xy_wallet/ui/pages/wallet/create_with_account.dart';
import 'package:xy_wallet/ui/pages/wallet/create_with_mnemonic_generate.dart';
import 'package:xy_wallet/ui/pages/wallet/create_with_mnemonic_input.dart';

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
  static const String WALLET_CREATE_WITH_MNEMONIC_GENERATE =
      'wallet/createWithMnemonicGenerate';
  static const String WALLET_CREATE_WITH_MNEMONIC_INPUT =
      'wallet/createWithMnemonicInput';
  static const String WALLET_RESTORE = 'wallet/restore';
  static const String TRANSFER = 'wallet/transfer';
  static const String TRANSACTION_RECOR = 'wallet/transactionRecor';
  static const String TRANSACTION_DETAILS = "wallet/transactionDetails";
  static const String COMMUNITY_ASSETMANAGER = 'community/assetManager';
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
        return CupertinoPageRoute(
            builder: (_) => CreateWithMnemonicGeneratePage(settings.arguments));
      case RouteName.WALLET_CREATE_WITH_MNEMONIC_INPUT:
        return CupertinoPageRoute(
            builder: (_) => CreateWithMnemonicInputPage(settings.arguments));
      case RouteName.TRANSFER:
        return CupertinoPageRoute(builder: (_) => TransferPage());
      case RouteName.TRANSACTION_RECOR:
        return CupertinoPageRoute(builder: (_) => TransactionRecordPage());

      case RouteName.WALLET_RESTORE:
        return CupertinoPageRoute(builder: (_) => AssetManger());
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
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
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
