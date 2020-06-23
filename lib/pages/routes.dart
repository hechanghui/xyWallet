import 'package:flutter/material.dart';
import 'package:xy_wallet/pages/tabbars.dart';


final routes = {
  '/': (BuildContext context) => TabsPage(),

//  "tabs": (context) => new ContainerPage()
};


var onGenerateRoute = (RouteSettings settings) { // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
       final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
       );
       return route;
    }else{
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
