import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'page_route_anim.dart';

import 'package:xy_wallet/ui/pages/tabbars.dart';
import 'package:xy_wallet/ui/pages/splash/splash.dart';
import 'package:xy_wallet/ui/pages/wallet/create_or_restore.dart';

class RouteName {
  static const String splash = 'splash';
  static const String tab = '/';
  static const String WALLET_CREATE_RESTORE = 'wallet/createOrRestore';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());
      case RouteName.tab:
        return CupertinoPageRoute(builder: (_) =>TabsPage());
      case RouteName.WALLET_CREATE_RESTORE:
        return CupertinoPageRoute(fullscreenDialog: true, builder: (_) => CreateOrRestorePage());

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
